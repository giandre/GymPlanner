-- Add comprehensive gym exercises

-- Additional Chest Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications, video_url) VALUES
('Barbell Bench Press', 'Classic chest builder', 'Chest', 'intermediate', 1, 'Lie on bench, lower barbell to chest, press up', 'Use spotter, avoid with shoulder issues', 'https://www.youtube.com/watch?v=rT7DgCr-3pg'),
('Cable Chest Fly', 'Chest isolation', 'Chest', 'beginner', 1, 'Stand between cables, bring handles together in front of chest', 'Safe for most users', 'https://www.youtube.com/watch?v=Iwe6AmxVf7o'),
('Incline Dumbbell Press', 'Upper chest focus', 'Chest', 'intermediate', 1, 'Press dumbbells on incline bench', 'Avoid if shoulder issues', 'https://www.youtube.com/watch?v=8iPEnn-ltC8');

-- Additional Back Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications, video_url) VALUES
('Pull-Ups', 'Bodyweight back builder', 'Back', 'intermediate', 0, 'Hang from bar, pull chin over bar', 'Modify with resistance band if needed', 'https://www.youtube.com/watch?v=eGo4IYlbE5g'),
('Barbell Rows', 'Back thickness', 'Back', 'intermediate', 1, 'Bend over, pull barbell to stomach', 'Use caution with herniated disks', 'https://www.youtube.com/watch?v=T3N-TO4reLQ'),
('Cable Rows', 'Back width and thickness', 'Back', 'beginner', 1, 'Pull cable handle to torso', 'Safe for most users', 'https://www.youtube.com/watch?v=GZbfZ033f74'),
('Deadlifts', 'Full posterior chain', 'Back/Legs', 'advanced', 1, 'Lift barbell from ground to standing', 'AVOID with herniated disks - very high risk', 'https://www.youtube.com/watch?v=r4MzxtBKyNE');

-- Additional Shoulder Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications, video_url) VALUES
('Lateral Raises', 'Side deltoid isolation', 'Shoulders', 'beginner', 1, 'Raise dumbbells to shoulder height', 'Safe for most users', 'https://www.youtube.com/watch?v=3VcKaXpzqRo'),
('Front Raises', 'Front deltoid isolation', 'Shoulders', 'beginner', 1, 'Raise dumbbells forward to shoulder height', 'Safe for most users', 'https://www.youtube.com/watch?v=k5OLLy8fOlg'),
('Arnold Press', 'Full shoulder development', 'Shoulders', 'intermediate', 1, 'Rotating overhead press', 'Use lighter weight with back issues', 'https://www.youtube.com/watch?v=6Z15_WdXmVw');

-- Additional Leg Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications, video_url) VALUES
('Bulgarian Split Squats', 'Single leg strength', 'Legs', 'intermediate', 0, 'Rear foot elevated lunge', 'Use caution with knee issues', 'https://www.youtube.com/watch?v=2C-uNgKwPLE'),
('Calf Raises Machine', 'Calf development', 'Calves', 'beginner', 1, 'Raise on toes with machine resistance', 'Safe for most users', 'https://www.youtube.com/watch?v=gwLzBJYoWlI'),
('Hack Squat', 'Quad focus', 'Legs', 'intermediate', 1, 'Squat on hack squat machine', 'Safer than barbell squats for back', 'https://www.youtube.com/watch?v=0tn5K9NlCfo');

-- Additional Arm Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications, video_url) VALUES
('Hammer Curls', 'Bicep and forearm', 'Biceps', 'beginner', 1, 'Curl dumbbells with neutral grip', 'Safe for most users', 'https://www.youtube.com/watch?v=zC3nLlEvin4'),
('Preacher Curls', 'Bicep isolation', 'Biceps', 'beginner', 1, 'Curl on preacher bench', 'Safe for most users', 'https://www.youtube.com/watch?v=vnfBeEHfBTA'),
('Overhead Tricep Extension', 'Tricep stretch and strength', 'Triceps', 'beginner', 1, 'Lower weight behind head, extend up', 'Use lighter weight', 'https://www.youtube.com/watch?v=YbX7Wd8jQ-Q'),
('Close-Grip Bench Press', 'Tricep compound', 'Triceps', 'intermediate', 1, 'Bench press with narrow grip', 'Avoid if shoulder issues', 'https://www.youtube.com/watch?v=nEF0bv2FW94');

-- Additional Core Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications, video_url) VALUES
('Cable Crunches', 'Ab isolation', 'Core', 'beginner', 1, 'Crunch with cable resistance', 'Safe for herniated disks', 'https://www.youtube.com/watch?v=Xyd_fa5zoEU'),
('Leg Raises', 'Lower ab focus', 'Core', 'intermediate', 0, 'Raise legs while hanging or lying', 'Safe for most users', 'https://www.youtube.com/watch?v=JB2oyawG9KI'),
('Russian Twists', 'Oblique strength', 'Core', 'beginner', 0, 'Rotate torso side to side', 'Avoid excessive twisting with herniated disks', 'https://www.youtube.com/watch?v=wkD8rjkodUI');

-- Functional/Athletic Exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications, video_url) VALUES
('Box Jumps', 'Explosive power', 'Legs', 'intermediate', 1, 'Jump onto elevated platform', 'Avoid with knee or back issues', 'https://www.youtube.com/watch?v=NBY9-kTuHEk'),
('Battle Ropes', 'Full body cardio', 'Full Body', 'intermediate', 1, 'Wave heavy ropes with both arms', 'Use caution with shoulders', 'https://www.youtube.com/watch?v=40ILxZWJXhY'),
('Farmers Walk', 'Grip and core strength', 'Full Body', 'beginner', 1, 'Walk carrying heavy weights', 'Safe for most users', 'https://www.youtube.com/watch?v=rt17lmnaLSM');
