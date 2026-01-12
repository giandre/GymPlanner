-- Fix exercise images with correct URLs from free-exercise-db GitHub repository
-- Base URL: https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/
-- Format: {Exercise_Name}/0.jpg (using underscores and proper capitalization)

-- Chest exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Barbell_Bench_Press_-_Medium_Grip/0.jpg' WHERE name = 'Barbell Bench Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Dumbbell_Bench_Press/0.jpg' WHERE name = 'Dumbbell Chest Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Barbell_Incline_Bench_Press_-_Medium_Grip/0.jpg' WHERE name = 'Incline Dumbbell Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Pushups/0.jpg' WHERE name = 'Push-Ups';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Cable_Crossover/0.jpg' WHERE name = 'Cable Chest Fly';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Incline_Push-Up/0.jpg' WHERE name = 'Incline Push-Ups';

-- Back exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Pullups/0.jpg' WHERE name = 'Pull-Ups';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Bent_Over_Barbell_Row/0.jpg' WHERE name = 'Barbell Rows';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/One-Arm_Dumbbell_Row/0.jpg' WHERE name = 'Dumbbell Rows';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Wide-Grip_Lat_Pulldown/0.jpg' WHERE name = 'Lat Pulldowns';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Seated_Cable_Rows/0.jpg' WHERE name = 'Cable Rows';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Face_Pull/0.jpg' WHERE name = 'Face Pulls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Barbell_Deadlift/0.jpg' WHERE name = 'Deadlifts';

-- Shoulder exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Barbell_Shoulder_Press/0.jpg' WHERE name = 'Overhead Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Side_Lateral_Raise/0.jpg' WHERE name = 'Lateral Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Front_Dumbbell_Raise/0.jpg' WHERE name = 'Front Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Arnold_Dumbbell_Press/0.jpg' WHERE name = 'Arnold Press';

-- Leg exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Bodyweight_Squat/0.jpg' WHERE name = 'Bodyweight Squats';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Goblet_Squat/0.jpg' WHERE name = 'Goblet Squats';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Dumbbell_Lunges/0.jpg' WHERE name = 'Lunges';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Dumbbell_Lunges/0.jpg' WHERE name = 'Dumbbell Lunges';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Romanian_Deadlift/0.jpg' WHERE name = 'Romanian Deadlifts';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Leg_Press/0.jpg' WHERE name = 'Leg Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Lying_Leg_Curls/0.jpg' WHERE name = 'Leg Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Leg_Extensions/0.jpg' WHERE name = 'Leg Extensions';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Single-Leg_Press/0.jpg' WHERE name = 'Bulgarian Split Squats';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Barbell_Glute_Bridge/0.jpg' WHERE name = 'Glute Bridges';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Standing_Calf_Raises/0.jpg' WHERE name = 'Calf Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Calf_Press_On_The_Leg_Press_Machine/0.jpg' WHERE name = 'Calf Raises Machine';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Barbell_Hack_Squat/0.jpg' WHERE name = 'Hack Squat';

-- Arm exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Dumbbell_Bicep_Curl/0.jpg' WHERE name = 'Bicep Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Hammer_Curls/0.jpg' WHERE name = 'Hammer Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Preacher_Curl/0.jpg' WHERE name = 'Preacher Curls';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Dips_-_Triceps_Version/0.jpg' WHERE name = 'Tricep Dips';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Triceps_Pushdown/0.jpg' WHERE name = 'Tricep Rope Pushdowns';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Overhead_Triceps/0.jpg' WHERE name = 'Overhead Tricep Extension';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Close-Grip_Barbell_Bench_Press/0.jpg' WHERE name = 'Close-Grip Bench Press';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Diamond_Pushups/0.jpg' WHERE name = 'Diamond Push-Ups';

-- Core exercises
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Plank/0.jpg' WHERE name = 'Plank';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Side_Bridge/0.jpg' WHERE name = 'Side Plank';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Mountain_Climbers/0.jpg' WHERE name = 'Mountain Climbers';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Bicycle_Crunch/0.jpg' WHERE name = 'Bicycle Crunches';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Cable_Crunch/0.jpg' WHERE name = 'Cable Crunches';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Flat_Bench_Lying_Leg_Raise/0.jpg' WHERE name = 'Leg Raises';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Russian_Twist/0.jpg' WHERE name = 'Russian Twists';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Exercise_Ball_Crunch/0.jpg' WHERE name = 'Bird Dog';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Dead_Bug/0.jpg' WHERE name = 'Dead Bug';

-- Cardio/Athletic
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Burpee/0.jpg' WHERE name = 'Burpees';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Jumping_Jacks/0.jpg' WHERE name = 'Jumping Jacks';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/High_Knees/0.jpg' WHERE name = 'High Knees';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Box_Jump_Multiple_Response/0.jpg' WHERE name = 'Box Jumps';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Battling_Ropes/0.jpg' WHERE name = 'Battle Ropes';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Rowing_Stationary/0.jpg' WHERE name = 'Rowing Machine';

-- Flexibility
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Cat_Stretch/0.jpg' WHERE name = 'Cat-Cow Stretch';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Seated_Floor_Hamstring_Stretch/0.jpg' WHERE name = 'Hamstring Stretch';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Kneeling_Hip_Flexor/0.jpg' WHERE name = 'Hip Flexor Stretch';
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Child_Pose/0.jpg' WHERE name = 'Child''s Pose';

-- Functional/Athletic
UPDATE exercises SET image_url = 'https://raw.githubusercontent.com/giandre/free-exercise-db/main/exercises/Farmers_Walk/0.jpg' WHERE name = 'Farmers Walk';
