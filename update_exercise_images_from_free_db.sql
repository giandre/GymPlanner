-- Update exercises with images from free-exercise-db GitHub repository
-- Base URL: https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/

-- The free-exercise-db uses format: {exercise-name}/{number}.gif
-- We'll use the animated GIFs as they show the movement better than static images

-- Chest exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/barbell-bench-press/0.gif' WHERE name = 'Barbell Bench Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/dumbbell-bench-press/0.gif' WHERE name = 'Dumbbell Chest Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/incline-dumbbell-press/0.gif' WHERE name = 'Incline Dumbbell Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/push-up/0.gif' WHERE name = 'Push-Ups';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/cable-chest-fly/0.gif' WHERE name = 'Cable Chest Fly';

-- Back exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/pull-up/0.gif' WHERE name = 'Pull-Ups';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/barbell-bent-over-row/0.gif' WHERE name = 'Barbell Rows';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/dumbbell-row/0.gif' WHERE name = 'Dumbbell Rows';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/lat-pulldown/0.gif' WHERE name = 'Lat Pulldowns';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/seated-cable-row/0.gif' WHERE name = 'Cable Rows';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/face-pull/0.gif' WHERE name = 'Face Pulls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/deadlift/0.gif' WHERE name = 'Deadlifts';

-- Shoulder exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/dumbbell-shoulder-press/0.gif' WHERE name = 'Overhead Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/dumbbell-lateral-raise/0.gif' WHERE name = 'Lateral Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/dumbbell-front-raise/0.gif' WHERE name = 'Front Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/arnold-press/0.gif' WHERE name = 'Arnold Press';

-- Leg exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/squat/0.gif' WHERE name = 'Bodyweight Squats';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/goblet-squat/0.gif' WHERE name = 'Goblet Squats';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/lunge/0.gif' WHERE name = 'Lunges';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/dumbbell-lunge/0.gif' WHERE name = 'Dumbbell Lunges';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/romanian-deadlift/0.gif' WHERE name = 'Romanian Deadlifts';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/leg-press/0.gif' WHERE name = 'Leg Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/leg-curl/0.gif' WHERE name = 'Leg Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/leg-extension/0.gif' WHERE name = 'Leg Extensions';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/bulgarian-split-squat/0.gif' WHERE name = 'Bulgarian Split Squats';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/glute-bridge/0.gif' WHERE name = 'Glute Bridges';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/standing-calf-raise/0.gif' WHERE name = 'Calf Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/calf-raise/0.gif' WHERE name = 'Calf Raises Machine';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/hack-squat/0.gif' WHERE name = 'Hack Squat';

-- Arm exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/dumbbell-bicep-curl/0.gif' WHERE name = 'Bicep Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/hammer-curl/0.gif' WHERE name = 'Hammer Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/preacher-curl/0.gif' WHERE name = 'Preacher Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/tricep-dips/0.gif' WHERE name = 'Tricep Dips';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/cable-tricep-pushdown/0.gif' WHERE name = 'Tricep Rope Pushdowns';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/overhead-tricep-extension/0.gif' WHERE name = 'Overhead Tricep Extension';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/close-grip-bench-press/0.gif' WHERE name = 'Close-Grip Bench Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/diamond-push-up/0.gif' WHERE name = 'Diamond Push-Ups';

-- Core exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/plank/0.gif' WHERE name = 'Plank';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/side-plank/0.gif' WHERE name = 'Side Plank';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/mountain-climber/0.gif' WHERE name = 'Mountain Climbers';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/bicycle-crunch/0.gif' WHERE name = 'Bicycle Crunches';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/cable-crunch/0.gif' WHERE name = 'Cable Crunches';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/leg-raise/0.gif' WHERE name = 'Leg Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/russian-twist/0.gif' WHERE name = 'Russian Twists';

-- Cardio/Athletic
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/burpee/0.gif' WHERE name = 'Burpees';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/jumping-jack/0.gif' WHERE name = 'Jumping Jacks';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/high-knee/0.gif' WHERE name = 'High Knees';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/box-jump/0.gif' WHERE name = 'Box Jumps';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/battle-rope/0.gif' WHERE name = 'Battle Ropes';

-- Note: Some exercises may not have exact matches in free-exercise-db
-- Keep existing images for exercises without matches
-- The GIFs are animated and show proper form, making them much better than static images!
