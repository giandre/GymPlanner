-- Add alternative exercise column to exercises table
ALTER TABLE exercises ADD COLUMN alternative_exercise_id INTEGER REFERENCES exercises(id);

-- Update exercises with their alternatives (equipment exercises get no-equipment alternatives)

-- Goblet Squats (21) -> Bodyweight Squats (3)
UPDATE exercises SET alternative_exercise_id = 3 WHERE id = 21;

-- Romanian Deadlifts (22) -> Glute Bridges (6)
UPDATE exercises SET alternative_exercise_id = 6 WHERE id = 22;

-- Dumbbell Lunges (23) -> Lunges (5)
UPDATE exercises SET alternative_exercise_id = 5 WHERE id = 23;

-- Leg Press (24) -> Bodyweight Squats (3)
UPDATE exercises SET alternative_exercise_id = 3 WHERE id = 24;

-- Leg Curls (25) -> Glute Bridges (6)
UPDATE exercises SET alternative_exercise_id = 6 WHERE id = 25;

-- Leg Extensions (26) -> Bodyweight Squats (3)
UPDATE exercises SET alternative_exercise_id = 3 WHERE id = 26;

-- Dumbbell Chest Press (27) -> Push-Ups (10)
UPDATE exercises SET alternative_exercise_id = 10 WHERE id = 27;

-- Dumbbell Rows (28) -> Plank (15)
UPDATE exercises SET alternative_exercise_id = 15 WHERE id = 28;

-- Lat Pulldowns (29) -> Push-Ups (10)
UPDATE exercises SET alternative_exercise_id = 10 WHERE id = 29;

-- Overhead Press (30) -> Pike Push-Ups (would need to add)
UPDATE exercises SET alternative_exercise_id = 10 WHERE id = 30;

-- Bicep Curls (31) -> Diamond Push-Ups (12)
UPDATE exercises SET alternative_exercise_id = 12 WHERE id = 31;

-- Tricep Rope Pushdowns (32) -> Tricep Dips (13)
UPDATE exercises SET alternative_exercise_id = 13 WHERE id = 32;

-- Face Pulls (33) -> Plank Shoulder Taps (14)
UPDATE exercises SET alternative_exercise_id = 14 WHERE id = 33;

-- Treadmill Walking (34) -> Jumping Jacks (1)
UPDATE exercises SET alternative_exercise_id = 1 WHERE id = 34;

-- Elliptical (35) -> High Knees (4)
UPDATE exercises SET alternative_exercise_id = 4 WHERE id = 35;

-- Stationary Bike (36) -> High Knees (4)
UPDATE exercises SET alternative_exercise_id = 4 WHERE id = 36;

-- Rowing Machine (37) -> Burpees (41)
UPDATE exercises SET alternative_exercise_id = 36 WHERE id = 37;

-- Also add reverse mappings (no-equipment exercises can be upgraded to equipment)

-- Bodyweight Squats (3) -> Goblet Squats (21)
UPDATE exercises SET alternative_exercise_id = 21 WHERE id = 3;

-- Lunges (5) -> Dumbbell Lunges (23)
UPDATE exercises SET alternative_exercise_id = 23 WHERE id = 5;

-- Push-Ups (10) -> Dumbbell Chest Press (27)
UPDATE exercises SET alternative_exercise_id = 27 WHERE id = 10;

-- Tricep Dips (13) -> Tricep Rope Pushdowns (32)
UPDATE exercises SET alternative_exercise_id = 32 WHERE id = 13;

-- Jumping Jacks (1) -> Treadmill Walking (34)
UPDATE exercises SET alternative_exercise_id = 34 WHERE id = 1;

-- High Knees (4) -> Stationary Bike (36)
UPDATE exercises SET alternative_exercise_id = 36 WHERE id = 4;
