-- Seed Script for Week of Jan 12 - Jan 18

-- 0. Ensure Users Exist
INSERT OR IGNORE INTO users (username, password_hash, name, age, fitness_level) VALUES 
('gio', 'temp_hash_gio', 'Gio', 47, 'intermediate'),
('jeannine', 'temp_hash_jeannine', 'Jeannine', 45, 'beginner'),
('gia', 'temp_hash_gia', 'Gia', 10, 'beginner'),
('nati', 'temp_hash_nati', 'Nati', 8, 'beginner');

-- 1. Insert New Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, video_url, image_url) VALUES 
('Supported Split Squat', 'Unilateral leg exercise holding onto a support for balance. Keeps spine neutral.', 'Legs', 'intermediate', 0, 'https://www.youtube.com/watch?v=1uTEhuZgMVk', '/images/exercises/supported_split_squat.png'),
('Dumbbell Chest Press', 'Press dumbbells up from chest level while lying on bench or floor.', 'Chest', 'intermediate', 1, 'https://www.youtube.com/watch?v=VmB1G1K7v94', '/images/exercises/dumbbell_chest_press.png'),
('Dead Bug', 'Core stability exercise. Extend opposite arm and leg while keeping back flat.', 'Core', 'beginner', 0, 'https://www.youtube.com/watch?v=4XLEnwUr1d8', '/images/exercises/dead_bug.png'),
('Bear Crawl', 'Crawl on hands and feet like a bear. Great for full body coordination.', 'Full Body', 'beginner', 0, 'https://www.youtube.com/watch?v=t_uQV_1I0jE', '/images/exercises/bear_crawl.png'),
('Face Pulls', 'Pull rope towards face to target rear delts and rotator cuff.', 'Shoulders', 'intermediate', 1, 'https://www.youtube.com/watch?v=rep-qVOkqgk', null),
('Supported Row', 'One arm row with other hand supported on bench to protect lower back.', 'Back', 'beginner', 1, 'https://www.youtube.com/watch?v=pYcpY20QaE8', null),
('Lateral Raises', 'Raise dumbbells to the sides for shoulder width.', 'Shoulders', 'beginner', 1, 'https://www.youtube.com/watch?v=3VcKaXpzqRo', null),
('Glute Bridges', 'Lift hips while lying on back using glute strength.', 'Legs', 'beginner', 0, 'https://www.youtube.com/watch?v=ResGdfFbdC0', null),
('Frog Jumps', 'Jump forward and back like a frog.', 'Full Body', 'beginner', 0, 'https://www.youtube.com/watch?v=cMjwW00f8T0', null);

-- 2. Create Workout Templates
-- Gio: Upper Body Push
INSERT INTO workout_templates (name, description, difficulty_level, duration_minutes) VALUES
('Gio: Upper Body Push', 'Chest and Shoulder focus with supported movements.', 'Intermediate', 45);

-- Gio: Lower Body
INSERT INTO workout_templates (name, description, difficulty_level, duration_minutes) VALUES
('Gio: Lower Body Safe', 'Leg strength without spinal loading.', 'Intermediate', 45);

-- Jeannine: Full Body A
INSERT INTO workout_templates (name, description, difficulty_level, duration_minutes) VALUES
('Jeannine: Full Body Tone A', 'Balanced full body circuit.', 'Beginner', 40);

-- Kids: Superhero Training
INSERT INTO workout_templates (name, description, difficulty_level, duration_minutes) VALUES
('Kids: Superhero Training', 'Fun animal movements and jumps!', 'Beginner', 30);

-- 3. Link Exercises to Templates
-- Gio Push Exercises
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index)
SELECT t.id, e.id, 3, 10, 60, 1 FROM workout_templates t, exercises e WHERE t.name = 'Gio: Upper Body Push' AND e.name = 'Dumbbell Chest Press';

INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index)
SELECT t.id, e.id, 3, 12, 60, 2 FROM workout_templates t, exercises e WHERE t.name = 'Gio: Upper Body Push' AND e.name = 'Lateral Raises';

INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index)
SELECT t.id, e.id, 3, 10, 45, 3 FROM workout_templates t, exercises e WHERE t.name = 'Gio: Upper Body Push' AND e.name = 'Dead Bug';


-- Gio Lower Exercises
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index)
SELECT t.id, e.id, 3, 10, 90, 1 FROM workout_templates t, exercises e WHERE t.name = 'Gio: Lower Body Safe' AND e.name = 'Supported Split Squat';

INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index)
SELECT t.id, e.id, 3, 15, 60, 2 FROM workout_templates t, exercises e WHERE t.name = 'Gio: Lower Body Safe' AND e.name = 'Glute Bridges';


-- Kids Superhero
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index)
SELECT t.id, e.id, 2, 20, 30, 1 FROM workout_templates t, exercises e WHERE t.name = 'Kids: Superhero Training' AND e.name = 'Bear Crawl';

INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index)
SELECT t.id, e.id, 3, 10, 30, 2 FROM workout_templates t, exercises e WHERE t.name = 'Kids: Superhero Training' AND e.name = 'Frog Jumps';


-- 4. Schedule Workouts (Jan 12 - Jan 18)
-- Use IDs 1-4 for users (Gio, Jeannine, Gia, Nati) assuming they exist or creating them.
-- Assuming Gio=1, Jeannine=2, Gia=3, Nati=4 based on previous context.

-- Monday Jan 12
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 1, id, '2026-01-12', 'scheduled' FROM workout_templates WHERE name = 'Gio: Upper Body Push';

INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 2, id, '2026-01-12', 'scheduled' FROM workout_templates WHERE name = 'Jeannine: Full Body Tone A';

-- Tuesday Jan 13
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 1, id, '2026-01-13', 'scheduled' FROM workout_templates WHERE name = 'Gio: Lower Body Safe';

INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 3, id, '2026-01-13', 'scheduled' FROM workout_templates WHERE name = 'Kids: Superhero Training';

INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 4, id, '2026-01-13', 'scheduled' FROM workout_templates WHERE name = 'Kids: Superhero Training';

-- Thursday Jan 15
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 1, id, '2026-01-15', 'scheduled' FROM workout_templates WHERE name = 'Gio: Upper Body Push'; -- Repeating for simplicity of seed

-- Friday Jan 16
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 1, id, '2026-01-16', 'scheduled' FROM workout_templates WHERE name = 'Gio: Lower Body Safe';

INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 3, id, '2026-01-16', 'scheduled' FROM workout_templates WHERE name = 'Kids: Superhero Training';

INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT 4, id, '2026-01-16', 'scheduled' FROM workout_templates WHERE name = 'Kids: Superhero Training';
