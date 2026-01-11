/**
 * Workout Plan Generator
 * Generates personalized workout plans based on user fitness level and preferences
 */

interface User {
	id: number;
	fitness_level: string;
	health_notes: string;
}

interface UserPreferences {
	preferred_workout_days: string;
	preferred_equipment: number;
	workout_duration_preference: number;
}

interface Exercise {
	id: number;
	name: string;
	muscle_group: string;
	difficulty: string;
	equipment_required: number;
}

/**
 * Generate a workout plan for a user for the specified number of days
 */
export async function generateWorkoutPlan(
	db: D1Database,
	userId: number,
	startDate: string,
	days: number = 7
): Promise<any[]> {
	// Get user info
	const user = await db.prepare(
		'SELECT * FROM users WHERE id = ?'
	).bind(userId).first() as User;

	if (!user) {
		throw new Error('User not found');
	}

	// Get user preferences
	const prefs = await db.prepare(
		'SELECT * FROM user_preferences WHERE user_id = ?'
	).bind(userId).first() as UserPreferences | null;

	const preferredEquipment = prefs?.preferred_equipment ?? 1;
	const workoutDuration = prefs?.workout_duration_preference ?? 45;
	const preferredDays = prefs?.preferred_workout_days
		? JSON.parse(prefs.preferred_workout_days)
		: ['Monday', 'Wednesday', 'Friday'];

	// Get exercises appropriate for user's fitness level
	const exercises = await getExercisesForUser(db, user, preferredEquipment);

	// Generate workout templates if they don't exist
	await ensureWorkoutTemplates(db, user.fitness_level, preferredEquipment);

	// Get workout templates for user's fitness level
	const templates = await db.prepare(
		`SELECT * FROM workout_templates
		 WHERE fitness_level = ? AND equipment_required = ?
		 ORDER BY id`
	).bind(user.fitness_level, preferredEquipment).all();

	if (!templates.results || templates.results.length === 0) {
		throw new Error('No workout templates available');
	}

	// Schedule workouts for the specified days
	const scheduledWorkouts: any[] = [];
	const date = new Date(startDate);

	for (let i = 0; i < days; i++) {
		const currentDate = new Date(date);
		currentDate.setDate(date.getDate() + i);
		const dateStr = currentDate.toISOString().split('T')[0];
		const dayName = currentDate.toLocaleDateString('en-US', { weekday: 'long' });

		// Check if this day is a preferred workout day
		if (preferredDays.includes(dayName)) {
			// Rotate through templates
			const template = templates.results[i % templates.results.length];

			// Check if workout already scheduled for this date
			const existing = await db.prepare(
				'SELECT id FROM scheduled_workouts WHERE user_id = ? AND scheduled_date = ?'
			).bind(userId, dateStr).first();

			if (!existing) {
				// Create scheduled workout
				const result = await db.prepare(
					`INSERT INTO scheduled_workouts
					 (user_id, workout_template_id, scheduled_date, completed)
					 VALUES (?, ?, ?, 0)`
				).bind(userId, (template as any).id, dateStr).run();

				scheduledWorkouts.push({
					id: result.meta.last_row_id,
					user_id: userId,
					workout_template_id: (template as any).id,
					workout_name: (template as any).name,
					scheduled_date: dateStr,
					duration_minutes: (template as any).duration_minutes,
					completed: false
				});
			}
		}
	}

	return scheduledWorkouts;
}

/**
 * Get exercises suitable for a user based on fitness level and equipment preference
 */
async function getExercisesForUser(
	db: D1Database,
	user: User,
	preferredEquipment: number
): Promise<Exercise[]> {
	let query = `
		SELECT * FROM exercises
		WHERE difficulty IN (?, ?)
		AND equipment_required = ?
	`;

	// Map fitness levels to appropriate difficulties
	const difficultyMap: Record<string, string[]> = {
		beginner: ['beginner', 'beginner'],
		intermediate: ['beginner', 'intermediate'],
		advanced: ['intermediate', 'advanced']
	};

	const difficulties = difficultyMap[user.fitness_level] || ['beginner', 'intermediate'];

	const result = await db.prepare(query)
		.bind(difficulties[0], difficulties[1], preferredEquipment)
		.all();

	return result.results as Exercise[];
}

/**
 * Ensure workout templates exist for the user's fitness level
 */
async function ensureWorkoutTemplates(
	db: D1Database,
	fitnessLevel: string,
	equipmentRequired: number
): Promise<void> {
	// Check if templates exist
	const existing = await db.prepare(
		`SELECT COUNT(*) as count FROM workout_templates
		 WHERE fitness_level = ? AND equipment_required = ?`
	).bind(fitnessLevel, equipmentRequired).first();

	if ((existing as any)?.count > 0) {
		return;
	}

	// Create default templates based on fitness level and equipment
	const templates = getDefaultTemplates(fitnessLevel, equipmentRequired);

	for (const template of templates) {
		const result = await db.prepare(
			`INSERT INTO workout_templates
			 (name, fitness_level, duration_minutes, equipment_required)
			 VALUES (?, ?, ?, ?)`
		).bind(
			template.name,
			template.fitness_level,
			template.duration_minutes,
			template.equipment_required
		).run();

		const templateId = result.meta.last_row_id;

		// Add exercises to template
		for (let i = 0; i < template.exercises.length; i++) {
			await db.prepare(
				`INSERT INTO workout_template_exercises
				 (workout_template_id, exercise_id, sets, reps, duration_seconds, rest_seconds, order_index)
				 VALUES (?, ?, ?, ?, ?, ?, ?)`
			).bind(
				templateId,
				template.exercises[i].id,
				template.exercises[i].sets,
				template.exercises[i].reps,
				template.exercises[i].duration_seconds || null,
				template.exercises[i].rest_seconds || 60,
				i
			).run();
		}
	}
}

/**
 * Get default workout templates for a fitness level
 */
function getDefaultTemplates(fitnessLevel: string, equipmentRequired: number) {
	if (equipmentRequired === 0) {
		// No equipment workouts
		if (fitnessLevel === 'beginner') {
			return [
				{
					name: 'Beginner Full Body',
					fitness_level: 'beginner',
					duration_minutes: 30,
					equipment_required: 0,
					exercises: [
						{ id: 1, sets: 2, reps: 10, rest_seconds: 60 }, // Jumping Jacks
						{ id: 3, sets: 3, reps: 12, rest_seconds: 60 }, // Bodyweight Squats
						{ id: 10, sets: 2, reps: 8, rest_seconds: 90 }, // Push-Ups (or modified)
						{ id: 6, sets: 3, reps: 12, rest_seconds: 60 }, // Glute Bridges
						{ id: 15, sets: 2, reps: 30, duration_seconds: 30, rest_seconds: 60 }, // Plank
						{ id: 16, sets: 2, reps: 10, rest_seconds: 60 }, // Bird Dog
					]
				},
				{
					name: 'Beginner Core Focus',
					fitness_level: 'beginner',
					duration_minutes: 25,
					equipment_required: 0,
					exercises: [
						{ id: 2, sets: 1, reps: 20, rest_seconds: 30 }, // Arm Circles
						{ id: 15, sets: 3, reps: 1, duration_seconds: 30, rest_seconds: 60 }, // Plank
						{ id: 16, sets: 3, reps: 10, rest_seconds: 45 }, // Bird Dog
						{ id: 17, sets: 3, reps: 10, rest_seconds: 45 }, // Dead Bug
						{ id: 6, sets: 3, reps: 15, rest_seconds: 60 }, // Glute Bridges
					]
				}
			];
		} else if (fitnessLevel === 'intermediate') {
			return [
				{
					name: 'Intermediate Full Body',
					fitness_level: 'intermediate',
					duration_minutes: 45,
					equipment_required: 0,
					exercises: [
						{ id: 4, sets: 2, reps: 30, duration_seconds: 30, rest_seconds: 30 }, // High Knees
						{ id: 5, sets: 3, reps: 12, rest_seconds: 60 }, // Lunges (each leg)
						{ id: 10, sets: 3, reps: 15, rest_seconds: 60 }, // Push-Ups
						{ id: 9, sets: 3, reps: 10, rest_seconds: 90 }, // Step-Ups
						{ id: 18, sets: 3, reps: 1, duration_seconds: 45, rest_seconds: 60 }, // Side Plank
						{ id: 19, sets: 3, reps: 20, rest_seconds: 45 }, // Mountain Climbers
					]
				}
			];
		} else { // advanced
			return [
				{
					name: 'Advanced HIIT Workout',
					fitness_level: 'advanced',
					duration_minutes: 60,
					equipment_required: 0,
					exercises: [
						{ id: 36, sets: 3, reps: 10, rest_seconds: 30 }, // Burpees
						{ id: 12, sets: 4, reps: 12, rest_seconds: 45 }, // Diamond Push-Ups
						{ id: 5, sets: 4, reps: 15, rest_seconds: 45 }, // Lunges
						{ id: 19, sets: 4, reps: 30, rest_seconds: 30 }, // Mountain Climbers
						{ id: 14, sets: 3, reps: 12, rest_seconds: 60 }, // Plank Shoulder Taps
						{ id: 20, sets: 4, reps: 20, rest_seconds: 45 }, // Bicycle Crunches
					]
				}
			];
		}
	} else {
		// Equipment-based workouts
		if (fitnessLevel === 'beginner') {
			return [
				{
					name: 'Beginner Gym Full Body',
					fitness_level: 'beginner',
					duration_minutes: 45,
					equipment_required: 1,
					exercises: [
						{ id: 33, sets: 2, reps: 10, duration_seconds: 600, rest_seconds: 120 }, // Treadmill Walking
						{ id: 21, sets: 3, reps: 12, rest_seconds: 90 }, // Goblet Squats
						{ id: 27, sets: 3, reps: 10, rest_seconds: 90 }, // Dumbbell Chest Press
						{ id: 28, sets: 3, reps: 12, rest_seconds: 90 }, // Dumbbell Rows
						{ id: 24, sets: 3, reps: 12, rest_seconds: 60 }, // Leg Press
						{ id: 31, sets: 3, reps: 12, rest_seconds: 60 }, // Bicep Curls
					]
				}
			];
		} else if (fitnessLevel === 'intermediate') {
			return [
				{
					name: 'Intermediate Strength Training',
					fitness_level: 'intermediate',
					duration_minutes: 50,
					equipment_required: 1,
					exercises: [
						{ id: 35, sets: 1, reps: 1, duration_seconds: 300, rest_seconds: 60 }, // Rowing Machine warmup
						{ id: 22, sets: 4, reps: 10, rest_seconds: 90 }, // Romanian Deadlifts
						{ id: 27, sets: 4, reps: 10, rest_seconds: 90 }, // Dumbbell Chest Press
						{ id: 29, sets: 4, reps: 12, rest_seconds: 90 }, // Lat Pulldowns
						{ id: 23, sets: 3, reps: 12, rest_seconds: 60 }, // Dumbbell Lunges
						{ id: 30, sets: 3, reps: 10, rest_seconds: 90 }, // Overhead Press
					]
				}
			];
		} else { // advanced
			return [
				{
					name: 'Advanced Strength & Power',
					fitness_level: 'advanced',
					duration_minutes: 60,
					equipment_required: 1,
					exercises: [
						{ id: 35, sets: 1, reps: 1, duration_seconds: 600, rest_seconds: 120 }, // Rowing Machine
						{ id: 22, sets: 4, reps: 8, rest_seconds: 120 }, // Romanian Deadlifts
						{ id: 27, sets: 4, reps: 8, rest_seconds: 120 }, // Dumbbell Chest Press
						{ id: 29, sets: 4, reps: 10, rest_seconds: 90 }, // Lat Pulldowns
						{ id: 30, sets: 4, reps: 8, rest_seconds: 120 }, // Overhead Press
						{ id: 33, sets: 4, reps: 10, rest_seconds: 60 }, // Face Pulls
						{ id: 36, sets: 3, reps: 15, rest_seconds: 60 }, // Burpees finisher
					]
				}
			];
		}
	}
}

/**
 * Get workout for a specific date
 */
export async function getWorkoutForDate(
	db: D1Database,
	userId: number,
	date: string
): Promise<any> {
	const workout = await db.prepare(
		`SELECT sw.*, wt.name as workout_name, wt.duration_minutes
		 FROM scheduled_workouts sw
		 JOIN workout_templates wt ON sw.workout_template_id = wt.id
		 WHERE sw.user_id = ? AND sw.scheduled_date = ?`
	).bind(userId, date).first();

	if (!workout) {
		return null;
	}

	// Get exercises for this workout
	const exercises = await db.prepare(
		`SELECT e.*, wte.sets, wte.reps, wte.duration_seconds, wte.rest_seconds
		 FROM workout_template_exercises wte
		 JOIN exercises e ON wte.exercise_id = e.id
		 WHERE wte.workout_template_id = ?
		 ORDER BY wte.order_index`
	).bind((workout as any).workout_template_id).all();

	return {
		...workout,
		exercises: exercises.results
	};
}
