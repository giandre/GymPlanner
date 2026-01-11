-- Insert family member users with correct information
-- Note: In production, passwords should be properly hashed. For demo, using simple hashing placeholder
INSERT INTO users (username, password_hash, name, age, fitness_level, health_notes) VALUES
('gio', 'temp_hash_gio', 'Gio', 47, 'intermediate', 'L4 and L5 herniated disks - avoid heavy spinal loading and excessive twisting'),
('jeannine', 'temp_hash_jeannine', 'Jeannine', 46, 'beginner', 'Starting fitness journey - focus on form and gradual progression'),
('gia', 'temp_hash_gia', 'Gia', 16, 'advanced', 'Very fit - can handle challenging workouts'),
('nati', 'temp_hash_nati', 'Nati', 18, 'beginner', 'Starting fitness journey - focus on building foundation and habit');

-- Insert exercise library with both equipment and no-equipment options

-- Warm-up exercises (no equipment)
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Jumping Jacks', 'Classic cardio warm-up', 'Full Body', 'beginner', 0, 'Stand with feet together, jump while spreading legs and raising arms overhead, return to start', 'Avoid if you have knee or ankle issues'),
('Arm Circles', 'Shoulder warm-up', 'Shoulders', 'beginner', 0, 'Extend arms to sides, make small circles, gradually increase size', 'None'),
('Bodyweight Squats', 'Leg warm-up and strength', 'Legs', 'beginner', 0, 'Feet shoulder-width apart, lower hips back and down, keep chest up, return to standing', 'Be cautious with knee injuries'),
('High Knees', 'Cardio warm-up', 'Legs/Cardio', 'beginner', 0, 'Run in place bringing knees up to hip level', 'Avoid with herniated disks during acute phase');

-- Lower body exercises (no equipment)
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Lunges', 'Single leg strength', 'Legs', 'beginner', 0, 'Step forward, lower back knee toward ground, push back to start', 'Use caution with knee issues'),
('Glute Bridges', 'Hip and glute strength', 'Glutes', 'beginner', 0, 'Lie on back, knees bent, lift hips until body forms straight line from shoulders to knees', 'Safe for most back issues'),
('Wall Sits', 'Isometric leg strength', 'Legs', 'beginner', 0, 'Back against wall, slide down to 90-degree knee angle, hold position', 'Use caution with knee issues'),
('Calf Raises', 'Calf strength', 'Calves', 'beginner', 0, 'Stand on edge of step, rise up on toes, lower heels below step level', 'None'),
('Step-Ups', 'Functional leg strength', 'Legs', 'intermediate', 0, 'Step up onto bench/chair with one foot, drive through heel to stand, step down', 'Use caution with knee issues');

-- Upper body exercises (no equipment)
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Push-Ups', 'Classic upper body strength', 'Chest/Arms', 'beginner', 0, 'Hands shoulder-width, lower chest to ground, push back up. Modify on knees if needed', 'Avoid if shoulder issues'),
('Incline Push-Ups', 'Easier push-up variation', 'Chest/Arms', 'beginner', 0, 'Hands on elevated surface, perform push-up motion', 'Avoid if shoulder issues'),
('Diamond Push-Ups', 'Tricep-focused push-up', 'Triceps/Chest', 'intermediate', 0, 'Hands close together forming diamond shape, perform push-up', 'Avoid if shoulder or wrist issues'),
('Tricep Dips', 'Tricep strength', 'Triceps', 'intermediate', 0, 'Hands on chair/bench behind you, lower body by bending elbows, push back up', 'Avoid if shoulder issues'),
('Plank Shoulder Taps', 'Core and shoulder stability', 'Core/Shoulders', 'intermediate', 0, 'In plank position, tap opposite shoulder while maintaining stable hips', 'Safe for most users');

-- Core exercises (no equipment)
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Plank', 'Core stability', 'Core', 'beginner', 0, 'Forearms on ground, body in straight line from head to heels, hold position', 'Safe for herniated disks when done correctly'),
('Bird Dog', 'Core and back stability', 'Core/Back', 'beginner', 0, 'On hands and knees, extend opposite arm and leg, return to start', 'Excellent for back health'),
('Dead Bug', 'Core control', 'Core', 'beginner', 0, 'Lie on back, extend opposite arm and leg while keeping lower back pressed to floor', 'Safe for herniated disks'),
('Side Plank', 'Oblique strength', 'Core', 'intermediate', 0, 'On side, prop up on forearm, lift hips to create straight line', 'Safe for most back issues'),
('Mountain Climbers', 'Dynamic core and cardio', 'Core/Cardio', 'intermediate', 0, 'In plank position, alternate bringing knees toward chest', 'Use caution with herniated disks'),
('Bicycle Crunches', 'Oblique and ab work', 'Core', 'beginner', 0, 'Lie on back, alternate bringing elbow to opposite knee', 'Avoid excessive twisting with herniated disks');

-- Lower body exercises (with equipment)
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Goblet Squats', 'Squat with weight', 'Legs', 'beginner', 1, 'Hold dumbbell/kettlebell at chest, perform squat', 'Use lighter weight with back issues'),
('Romanian Deadlifts', 'Hamstring and back', 'Hamstrings/Back', 'intermediate', 1, 'Hold dumbbells, hinge at hips keeping back straight, lower weights to shins', 'Use extreme caution with herniated disks - lighter weight only'),
('Dumbbell Lunges', 'Weighted lunges', 'Legs', 'intermediate', 1, 'Hold dumbbells at sides, perform lunges', 'Use caution with knee issues'),
('Leg Press', 'Machine-based leg strength', 'Legs', 'beginner', 1, 'Sit in leg press machine, push weight with legs', 'Safer than squats for back issues'),
('Leg Curls', 'Hamstring isolation', 'Hamstrings', 'beginner', 1, 'Use leg curl machine, curl weight up with heels', 'Safe for most users'),
('Leg Extensions', 'Quad isolation', 'Quadriceps', 'beginner', 1, 'Use leg extension machine, extend legs to straighten', 'Use caution with knee issues');

-- Upper body exercises (with equipment)
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Dumbbell Chest Press', 'Chest strength', 'Chest', 'beginner', 1, 'Lie on bench, press dumbbells up from chest level', 'Avoid if shoulder issues'),
('Dumbbell Rows', 'Back strength', 'Back', 'beginner', 1, 'Bend over, pull dumbbell to hip, keep back straight', 'Good for back health when done correctly'),
('Lat Pulldowns', 'Back and bicep', 'Back', 'beginner', 1, 'Pull bar down to chest level, control return', 'Safe for most users'),
('Overhead Press', 'Shoulder strength', 'Shoulders', 'intermediate', 1, 'Press dumbbells/barbell overhead from shoulder level', 'Use caution with herniated disks - avoid heavy weight'),
('Bicep Curls', 'Bicep isolation', 'Biceps', 'beginner', 1, 'Curl dumbbells from extended to contracted position', 'Safe for most users'),
('Tricep Rope Pushdowns', 'Tricep isolation', 'Triceps', 'beginner', 1, 'Push rope attachment down, extend elbows fully', 'Safe for most users'),
('Face Pulls', 'Rear shoulder and upper back', 'Shoulders/Back', 'intermediate', 1, 'Pull rope to face level, focus on squeezing shoulder blades', 'Excellent for posture');

-- Cardio exercises
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Treadmill Walking', 'Low-impact cardio', 'Cardio', 'beginner', 1, 'Walk at moderate pace, can adjust incline', 'Safe for most users'),
('Elliptical', 'Low-impact cardio', 'Cardio', 'beginner', 1, 'Maintain steady pace on elliptical machine', 'Excellent for those with joint issues'),
('Stationary Bike', 'Low-impact cardio', 'Cardio', 'beginner', 1, 'Cycle at moderate to high intensity', 'Very safe for back issues'),
('Rowing Machine', 'Full body cardio', 'Full Body', 'intermediate', 1, 'Drive with legs, pull handle to chest, maintain good form', 'Use caution with herniated disks'),
('Burpees', 'High-intensity full body', 'Full Body', 'advanced', 0, 'Squat, jump back to plank, push-up, jump forward, jump up', 'Avoid with herniated disks and joint issues');

-- Flexibility and recovery
INSERT INTO exercises (name, description, muscle_group, difficulty, equipment_required, instructions, contraindications) VALUES
('Cat-Cow Stretch', 'Spinal mobility', 'Back', 'beginner', 0, 'On hands and knees, alternate arching and rounding spine', 'Excellent for back health'),
('Child''s Pose', 'Back and hip stretch', 'Back/Hips', 'beginner', 0, 'Kneel, sit back on heels, extend arms forward on ground', 'Very safe for recovery'),
('Hip Flexor Stretch', 'Hip mobility', 'Hips', 'beginner', 0, 'Lunge position, push hips forward gently', 'Safe for most users'),
('Hamstring Stretch', 'Hamstring flexibility', 'Hamstrings', 'beginner', 0, 'Sit with one leg extended, reach toward toes', 'Safe for most users'),
('Foam Rolling', 'Myofascial release', 'Full Body', 'beginner', 1, 'Roll muscle groups over foam roller', 'Avoid directly on spine');

-- Set user preferences
INSERT INTO user_preferences (user_id, preferred_workout_days, preferred_equipment, workout_duration_preference) VALUES
(1, '["Monday", "Wednesday", "Friday"]', 1, 45), -- Gio prefers equipment
(2, '["Tuesday", "Thursday", "Saturday"]', 0, 30), -- Jeannine starts without equipment
(3, '["Monday", "Wednesday", "Friday", "Saturday"]', 1, 60), -- Gia can do longer workouts
(4, '["Tuesday", "Thursday"]', 0, 30); -- Nati starts without equipment
