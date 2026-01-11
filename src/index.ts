/**
 * Gym Planner API
 * Cloudflare Workers backend for family gym workout planning
 */

import { generateWorkoutPlan, getWorkoutForDate } from './services/workout-generator';
import { authenticateUser, hashPassword } from './services/auth';

interface Env {
	DB: D1Database;
}

// Helper function to create JSON responses
function jsonResponse(data: any, status = 200) {
	return new Response(JSON.stringify(data), {
		status,
		headers: { 'Content-Type': 'application/json' },
	});
}

// Helper function to parse JSON body
async function parseJSON(request: Request) {
	try {
		return await request.json();
	} catch {
		return null;
	}
}

export default {
	async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
		const url = new URL(request.url);
		const path = url.pathname;
		const method = request.method;

		// Enable CORS
		if (method === 'OPTIONS') {
			return new Response(null, {
				headers: {
					'Access-Control-Allow-Origin': '*',
					'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
					'Access-Control-Allow-Headers': 'Content-Type, Authorization',
				},
			});
		}

		try {
			// Authentication endpoint
			if (path === '/api/auth/login' && method === 'POST') {
				const body = await parseJSON(request);
				if (!body || !body.username || !body.password) {
					return jsonResponse({ error: 'Username and password required' }, 400);
				}

				const user = await authenticateUser(env.DB, body.username, body.password);
				if (!user) {
					return jsonResponse({ error: 'Invalid credentials' }, 401);
				}

				return jsonResponse({
					user: {
						id: user.id,
						username: user.username,
						name: user.name,
						age: user.age,
						fitness_level: user.fitness_level,
						health_notes: user.health_notes
					}
				});
			}

			// Get user profile
			if (path.startsWith('/api/users/') && method === 'GET') {
				const userId = parseInt(path.split('/')[3]);
				const user = await env.DB.prepare(
					'SELECT id, username, name, age, fitness_level, health_notes FROM users WHERE id = ?'
				).bind(userId).first();

				if (!user) {
					return jsonResponse({ error: 'User not found' }, 404);
				}

				return jsonResponse({ user });
			}

			// Get all exercises
			if (path === '/api/exercises' && method === 'GET') {
				const equipmentParam = url.searchParams.get('equipment');
				const difficultyParam = url.searchParams.get('difficulty');

				let query = 'SELECT * FROM exercises WHERE 1=1';
				const params: any[] = [];

				if (equipmentParam !== null) {
					query += ' AND equipment_required = ?';
					params.push(equipmentParam === 'true' ? 1 : 0);
				}

				if (difficultyParam) {
					query += ' AND difficulty = ?';
					params.push(difficultyParam);
				}

				const stmt = env.DB.prepare(query);
				const result = await stmt.bind(...params).all();

				return jsonResponse({ exercises: result.results });
			}

			// Get specific exercise
			if (path.startsWith('/api/exercises/') && method === 'GET') {
				const exerciseId = parseInt(path.split('/')[3]);
				const exercise = await env.DB.prepare(
					'SELECT * FROM exercises WHERE id = ?'
				).bind(exerciseId).first();

				if (!exercise) {
					return jsonResponse({ error: 'Exercise not found' }, 404);
				}

				return jsonResponse({ exercise });
			}

			// Generate workout plan for user
			if (path === '/api/workouts/generate' && method === 'POST') {
				const body = await parseJSON(request);
				if (!body || !body.userId) {
					return jsonResponse({ error: 'User ID required' }, 400);
				}

				const startDate = body.startDate || new Date().toISOString().split('T')[0];
				const days = body.days || 7;

				const workouts = await generateWorkoutPlan(
					env.DB,
					body.userId,
					startDate,
					days
				);

				return jsonResponse({ workouts });
			}

			// Get workouts for a user
			if (path === '/api/workouts/user' && method === 'GET') {
				const userId = url.searchParams.get('userId');
				const date = url.searchParams.get('date');

				if (!userId) {
					return jsonResponse({ error: 'User ID required' }, 400);
				}

				let query = `
					SELECT sw.*, wt.name as workout_name, wt.duration_minutes
					FROM scheduled_workouts sw
					JOIN workout_templates wt ON sw.workout_template_id = wt.id
					WHERE sw.user_id = ?
				`;
				const params: any[] = [parseInt(userId)];

				if (date) {
					query += ' AND sw.scheduled_date = ?';
					params.push(date);
				}

				query += ' ORDER BY sw.scheduled_date DESC';

				const stmt = env.DB.prepare(query);
				const result = await stmt.bind(...params).all();

				return jsonResponse({ workouts: result.results });
			}

			// Get specific workout with exercises
			if (path.startsWith('/api/workouts/') && method === 'GET' && !path.includes('/user')) {
				const workoutId = parseInt(path.split('/')[3]);

				const workout = await env.DB.prepare(
					`SELECT sw.*, wt.name as workout_name, wt.duration_minutes, wt.equipment_required
					 FROM scheduled_workouts sw
					 JOIN workout_templates wt ON sw.workout_template_id = wt.id
					 WHERE sw.id = ?`
				).bind(workoutId).first();

				if (!workout) {
					return jsonResponse({ error: 'Workout not found' }, 404);
				}

				// Get exercises for this workout
				const exercises = await env.DB.prepare(
					`SELECT e.*, wte.sets, wte.reps, wte.duration_seconds, wte.rest_seconds, wte.order_index
					 FROM workout_template_exercises wte
					 JOIN exercises e ON wte.exercise_id = e.id
					 WHERE wte.workout_template_id = ?
					 ORDER BY wte.order_index`
				).bind((workout as any).workout_template_id).all();

				return jsonResponse({
					workout,
					exercises: exercises.results
				});
			}

			// Mark workout as complete
			if (path.startsWith('/api/workouts/') && path.endsWith('/complete') && method === 'POST') {
				const workoutId = parseInt(path.split('/')[3]);
				const body = await parseJSON(request);

				await env.DB.prepare(
					`UPDATE scheduled_workouts
					 SET completed = 1, completed_at = datetime('now'), notes = ?
					 WHERE id = ?`
				).bind(body?.notes || null, workoutId).run();

				return jsonResponse({ success: true });
			}

			// Mark exercise in workout as complete
			if (path.startsWith('/api/workouts/') && path.includes('/exercises/') && method === 'POST') {
				const pathParts = path.split('/');
				const workoutId = parseInt(pathParts[3]);
				const exerciseId = parseInt(pathParts[5]);
				const body = await parseJSON(request);

				// Check if completion record exists
				const existing = await env.DB.prepare(
					`SELECT id FROM exercise_completions
					 WHERE scheduled_workout_id = ? AND exercise_id = ?`
				).bind(workoutId, exerciseId).first();

				if (existing) {
					// Update existing
					await env.DB.prepare(
						`UPDATE exercise_completions
						 SET sets_completed = ?, reps_completed = ?, weight_used = ?,
						     duration_seconds = ?, completed = 1, completed_at = datetime('now'),
						     notes = ?
						 WHERE id = ?`
					).bind(
						body.sets || 0,
						body.reps || 0,
						body.weight || null,
						body.duration || null,
						body.notes || null,
						(existing as any).id
					).run();
				} else {
					// Create new
					await env.DB.prepare(
						`INSERT INTO exercise_completions
						 (scheduled_workout_id, exercise_id, sets_completed, reps_completed,
						  weight_used, duration_seconds, completed, completed_at, notes)
						 VALUES (?, ?, ?, ?, ?, ?, 1, datetime('now'), ?)`
					).bind(
						workoutId,
						exerciseId,
						body.sets || 0,
						body.reps || 0,
						body.weight || null,
						body.duration || null,
						body.notes || null
					).run();
				}

				return jsonResponse({ success: true });
			}

			// Get user preferences
			if (path === '/api/preferences' && method === 'GET') {
				const userId = url.searchParams.get('userId');
				if (!userId) {
					return jsonResponse({ error: 'User ID required' }, 400);
				}

				const prefs = await env.DB.prepare(
					'SELECT * FROM user_preferences WHERE user_id = ?'
				).bind(parseInt(userId)).first();

				return jsonResponse({ preferences: prefs });
			}

			// Serve the frontend for all other routes
			return new Response('Gym Planner API - Frontend coming soon', {
				headers: { 'Content-Type': 'text/html' },
			});

		} catch (error) {
			console.error('API Error:', error);
			return jsonResponse(
				{ error: 'Internal server error', message: (error as Error).message },
				500
			);
		}
	},
} satisfies ExportedHandler<Env>;
