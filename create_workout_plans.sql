-- Create 5-day Mon-Fri workout plans starting January 12, 2026
-- All workouts ordered by date

-- ============================================
-- GIO (ID: 1) - Intermediate, Equipment, L4/L5 Herniated Disks
-- Focus: Safe exercises avoiding heavy spinal loading
-- ============================================

-- Create workout templates for Gio
INSERT INTO workout_templates (name, fitness_level, duration_minutes, equipment_required) VALUES
('Upper Body Push - Gio', 'intermediate', 45, 1),
('Lower Body - Gio', 'intermediate', 45, 1),
('Upper Body Pull - Gio', 'intermediate', 45, 1),
('Core & Accessories - Gio', 'intermediate', 40, 1),
('Full Body - Gio', 'intermediate', 45, 1);

-- Monday - Upper Body Push
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Upper Body Push - Gio'),
 (SELECT id FROM exercises WHERE name = 'Dumbbell Chest Press'), 4, 10, 90, 0),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Push - Gio'),
 (SELECT id FROM exercises WHERE name = 'Incline Dumbbell Press'), 3, 12, 75, 1),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Push - Gio'),
 (SELECT id FROM exercises WHERE name = 'Overhead Press'), 3, 10, 90, 2),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Push - Gio'),
 (SELECT id FROM exercises WHERE name = 'Lateral Raises'), 3, 15, 60, 3),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Push - Gio'),
 (SELECT id FROM exercises WHERE name = 'Tricep Rope Pushdowns'), 3, 12, 60, 4);

-- Tuesday - Lower Body
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Lower Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Leg Press'), 4, 12, 90, 0),
((SELECT id FROM workout_templates WHERE name = 'Lower Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Romanian Deadlifts'), 3, 10, 90, 1),
((SELECT id FROM workout_templates WHERE name = 'Lower Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Leg Curls'), 3, 12, 60, 2),
((SELECT id FROM workout_templates WHERE name = 'Lower Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Leg Extensions'), 3, 12, 60, 3),
((SELECT id FROM workout_templates WHERE name = 'Lower Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Calf Raises Machine'), 4, 15, 45, 4);

-- Wednesday - Upper Body Pull
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Upper Body Pull - Gio'),
 (SELECT id FROM exercises WHERE name = 'Lat Pulldowns'), 4, 10, 90, 0),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Pull - Gio'),
 (SELECT id FROM exercises WHERE name = 'Cable Rows'), 4, 12, 75, 1),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Pull - Gio'),
 (SELECT id FROM exercises WHERE name = 'Face Pulls'), 3, 15, 60, 2),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Pull - Gio'),
 (SELECT id FROM exercises WHERE name = 'Bicep Curls'), 3, 12, 60, 3),
((SELECT id FROM workout_templates WHERE name = 'Upper Body Pull - Gio'),
 (SELECT id FROM exercises WHERE name = 'Hammer Curls'), 3, 12, 60, 4);

-- Thursday - Core & Accessories
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Core & Accessories - Gio'),
 (SELECT id FROM exercises WHERE name = 'Bird Dog'), 3, 12, 45, 0),
((SELECT id FROM workout_templates WHERE name = 'Core & Accessories - Gio'),
 (SELECT id FROM exercises WHERE name = 'Dead Bug'), 3, 15, 45, 1),
((SELECT id FROM workout_templates WHERE name = 'Core & Accessories - Gio'),
 (SELECT id FROM exercises WHERE name = 'Plank'), 3, 60, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Core & Accessories - Gio'),
 (SELECT id FROM exercises WHERE name = 'Farmers Walk'), 3, 60, 60, 3),
((SELECT id FROM workout_templates WHERE name = 'Core & Accessories - Gio'),
 (SELECT id FROM exercises WHERE name = 'Cat-Cow Stretch'), 2, 10, 30, 4);

-- Friday - Full Body
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Full Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Goblet Squats'), 3, 12, 75, 0),
((SELECT id FROM workout_templates WHERE name = 'Full Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Dumbbell Chest Press'), 3, 12, 75, 1),
((SELECT id FROM workout_templates WHERE name = 'Full Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Dumbbell Rows'), 3, 12, 75, 2),
((SELECT id FROM workout_templates WHERE name = 'Full Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Overhead Press'), 3, 10, 75, 3),
((SELECT id FROM workout_templates WHERE name = 'Full Body - Gio'),
 (SELECT id FROM exercises WHERE name = 'Plank'), 3, 45, 45, 4);

-- Schedule Gio's workouts - Mon to Fri (Jan 12-16, 2026)
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, completed) VALUES
(1, (SELECT id FROM workout_templates WHERE name = 'Upper Body Push - Gio'), '2026-01-12', 0),
(1, (SELECT id FROM workout_templates WHERE name = 'Lower Body - Gio'), '2026-01-13', 0),
(1, (SELECT id FROM workout_templates WHERE name = 'Upper Body Pull - Gio'), '2026-01-14', 0),
(1, (SELECT id FROM workout_templates WHERE name = 'Core & Accessories - Gio'), '2026-01-15', 0),
(1, (SELECT id FROM workout_templates WHERE name = 'Full Body - Gio'), '2026-01-16', 0);

-- ============================================
-- JEANNINE (ID: 2) - Beginner, No Equipment
-- Focus: Building foundation with bodyweight
-- ============================================

INSERT INTO workout_templates (name, fitness_level, duration_minutes, equipment_required) VALUES
('Beginner Full Body A - Jeannine', 'beginner', 30, 0),
('Beginner Cardio & Core - Jeannine', 'beginner', 25, 0),
('Beginner Full Body B - Jeannine', 'beginner', 30, 0),
('Beginner Lower Body - Jeannine', 'beginner', 25, 0),
('Beginner Upper & Core - Jeannine', 'beginner', 30, 0);

-- Monday - Full Body A
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body A - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Bodyweight Squats'), 3, 12, 60, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body A - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Push-Ups'), 3, 8, 60, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body A - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Glute Bridges'), 3, 15, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body A - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Plank'), 3, 30, 45, 3);

-- Tuesday - Cardio & Core
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Jumping Jacks'), 3, 20, 30, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'High Knees'), 3, 30, 30, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Bird Dog'), 3, 10, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Dead Bug'), 3, 12, 45, 3);

-- Wednesday - Full Body B
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body B - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Lunges'), 3, 10, 60, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body B - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Incline Push-Ups'), 3, 10, 60, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body B - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Wall Sits'), 3, 30, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Full Body B - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Side Plank'), 3, 20, 45, 3);

-- Thursday - Lower Body
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Lower Body - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Bodyweight Squats'), 3, 15, 60, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Lower Body - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Glute Bridges'), 3, 15, 45, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Lower Body - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Lunges'), 3, 12, 60, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Lower Body - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Calf Raises'), 3, 15, 45, 3);

-- Friday - Upper & Core
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Upper & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Push-Ups'), 3, 10, 60, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Upper & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Tricep Dips'), 3, 8, 60, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Upper & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Plank'), 3, 40, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Upper & Core - Jeannine'),
 (SELECT id FROM exercises WHERE name = 'Bicycle Crunches'), 3, 15, 45, 3);

-- Schedule Jeannine's workouts
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, completed) VALUES
(2, (SELECT id FROM workout_templates WHERE name = 'Beginner Full Body A - Jeannine'), '2026-01-12', 0),
(2, (SELECT id FROM workout_templates WHERE name = 'Beginner Cardio & Core - Jeannine'), '2026-01-13', 0),
(2, (SELECT id FROM workout_templates WHERE name = 'Beginner Full Body B - Jeannine'), '2026-01-14', 0),
(2, (SELECT id FROM workout_templates WHERE name = 'Beginner Lower Body - Jeannine'), '2026-01-15', 0),
(2, (SELECT id FROM workout_templates WHERE name = 'Beginner Upper & Core - Jeannine'), '2026-01-16', 0);

-- ============================================
-- GIA (ID: 3) - Advanced, Equipment
-- Focus: Challenging workouts
-- ============================================

INSERT INTO workout_templates (name, fitness_level, duration_minutes, equipment_required) VALUES
('Advanced Push - Gia', 'advanced', 60, 1),
('Advanced Legs - Gia', 'advanced', 60, 1),
('Advanced Pull - Gia', 'advanced', 60, 1),
('Advanced HIIT - Gia', 'advanced', 45, 1),
('Advanced Full Body - Gia', 'advanced', 60, 1);

-- Monday - Push
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Advanced Push - Gia'),
 (SELECT id FROM exercises WHERE name = 'Barbell Bench Press'), 4, 8, 120, 0),
((SELECT id FROM workout_templates WHERE name = 'Advanced Push - Gia'),
 (SELECT id FROM exercises WHERE name = 'Incline Dumbbell Press'), 4, 10, 90, 1),
((SELECT id FROM workout_templates WHERE name = 'Advanced Push - Gia'),
 (SELECT id FROM exercises WHERE name = 'Cable Chest Fly'), 3, 12, 60, 2),
((SELECT id FROM workout_templates WHERE name = 'Advanced Push - Gia'),
 (SELECT id FROM exercises WHERE name = 'Overhead Press'), 4, 8, 90, 3),
((SELECT id FROM workout_templates WHERE name = 'Advanced Push - Gia'),
 (SELECT id FROM exercises WHERE name = 'Lateral Raises'), 3, 15, 45, 4),
((SELECT id FROM workout_templates WHERE name = 'Advanced Push - Gia'),
 (SELECT id FROM exercises WHERE name = 'Tricep Rope Pushdowns'), 4, 12, 60, 5);

-- Tuesday - Legs
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Advanced Legs - Gia'),
 (SELECT id FROM exercises WHERE name = 'Leg Press'), 4, 12, 120, 0),
((SELECT id FROM workout_templates WHERE name = 'Advanced Legs - Gia'),
 (SELECT id FROM exercises WHERE name = 'Bulgarian Split Squats'), 4, 10, 90, 1),
((SELECT id FROM workout_templates WHERE name = 'Advanced Legs - Gia'),
 (SELECT id FROM exercises WHERE name = 'Romanian Deadlifts'), 4, 10, 90, 2),
((SELECT id FROM workout_templates WHERE name = 'Advanced Legs - Gia'),
 (SELECT id FROM exercises WHERE name = 'Leg Curls'), 3, 12, 60, 3),
((SELECT id FROM workout_templates WHERE name = 'Advanced Legs - Gia'),
 (SELECT id FROM exercises WHERE name = 'Leg Extensions'), 3, 12, 60, 4),
((SELECT id FROM workout_templates WHERE name = 'Advanced Legs - Gia'),
 (SELECT id FROM exercises WHERE name = 'Calf Raises Machine'), 4, 20, 45, 5);

-- Wednesday - Pull
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Advanced Pull - Gia'),
 (SELECT id FROM exercises WHERE name = 'Pull-Ups'), 4, 8, 120, 0),
((SELECT id FROM workout_templates WHERE name = 'Advanced Pull - Gia'),
 (SELECT id FROM exercises WHERE name = 'Barbell Rows'), 4, 10, 90, 1),
((SELECT id FROM workout_templates WHERE name = 'Advanced Pull - Gia'),
 (SELECT id FROM exercises WHERE name = 'Lat Pulldowns'), 4, 12, 75, 2),
((SELECT id FROM workout_templates WHERE name = 'Advanced Pull - Gia'),
 (SELECT id FROM exercises WHERE name = 'Cable Rows'), 3, 12, 75, 3),
((SELECT id FROM workout_templates WHERE name = 'Advanced Pull - Gia'),
 (SELECT id FROM exercises WHERE name = 'Face Pulls'), 3, 15, 60, 4),
((SELECT id FROM workout_templates WHERE name = 'Advanced Pull - Gia'),
 (SELECT id FROM exercises WHERE name = 'Bicep Curls'), 4, 12, 60, 5);

-- Thursday - HIIT
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Advanced HIIT - Gia'),
 (SELECT id FROM exercises WHERE name = 'Burpees'), 4, 15, 60, 0),
((SELECT id FROM workout_templates WHERE name = 'Advanced HIIT - Gia'),
 (SELECT id FROM exercises WHERE name = 'Box Jumps'), 4, 12, 60, 1),
((SELECT id FROM workout_templates WHERE name = 'Advanced HIIT - Gia'),
 (SELECT id FROM exercises WHERE name = 'Battle Ropes'), 4, 30, 60, 2),
((SELECT id FROM workout_templates WHERE name = 'Advanced HIIT - Gia'),
 (SELECT id FROM exercises WHERE name = 'Mountain Climbers'), 4, 30, 45, 3),
((SELECT id FROM workout_templates WHERE name = 'Advanced HIIT - Gia'),
 (SELECT id FROM exercises WHERE name = 'Rowing Machine'), 3, 60, 60, 4);

-- Friday - Full Body
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Advanced Full Body - Gia'),
 (SELECT id FROM exercises WHERE name = 'Goblet Squats'), 4, 15, 90, 0),
((SELECT id FROM workout_templates WHERE name = 'Advanced Full Body - Gia'),
 (SELECT id FROM exercises WHERE name = 'Dumbbell Chest Press'), 4, 12, 90, 1),
((SELECT id FROM workout_templates WHERE name = 'Advanced Full Body - Gia'),
 (SELECT id FROM exercises WHERE name = 'Dumbbell Rows'), 4, 12, 90, 2),
((SELECT id FROM workout_templates WHERE name = 'Advanced Full Body - Gia'),
 (SELECT id FROM exercises WHERE name = 'Arnold Press'), 4, 10, 90, 3),
((SELECT id FROM workout_templates WHERE name = 'Advanced Full Body - Gia'),
 (SELECT id FROM exercises WHERE name = 'Plank'), 4, 60, 45, 4);

-- Schedule Gia's workouts
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, completed) VALUES
(3, (SELECT id FROM workout_templates WHERE name = 'Advanced Push - Gia'), '2026-01-12', 0),
(3, (SELECT id FROM workout_templates WHERE name = 'Advanced Legs - Gia'), '2026-01-13', 0),
(3, (SELECT id FROM workout_templates WHERE name = 'Advanced Pull - Gia'), '2026-01-14', 0),
(3, (SELECT id FROM workout_templates WHERE name = 'Advanced HIIT - Gia'), '2026-01-15', 0),
(3, (SELECT id FROM workout_templates WHERE name = 'Advanced Full Body - Gia'), '2026-01-16', 0);

-- ============================================
-- NATI (ID: 4) - Beginner, No Equipment
-- Focus: Similar to Jeannine but slightly varied
-- ============================================

INSERT INTO workout_templates (name, fitness_level, duration_minutes, equipment_required) VALUES
('Beginner Total Body - Nati', 'beginner', 30, 0),
('Beginner Core Focus - Nati', 'beginner', 25, 0),
('Beginner Strength - Nati', 'beginner', 30, 0),
('Beginner Cardio Mix - Nati', 'beginner', 25, 0),
('Beginner Recovery & Stretch - Nati', 'beginner', 30, 0);

-- Monday - Total Body
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Total Body - Nati'),
 (SELECT id FROM exercises WHERE name = 'Bodyweight Squats'), 3, 12, 60, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Total Body - Nati'),
 (SELECT id FROM exercises WHERE name = 'Incline Push-Ups'), 3, 10, 60, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Total Body - Nati'),
 (SELECT id FROM exercises WHERE name = 'Lunges'), 3, 10, 60, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Total Body - Nati'),
 (SELECT id FROM exercises WHERE name = 'Plank'), 3, 30, 45, 3);

-- Tuesday - Core Focus
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Core Focus - Nati'),
 (SELECT id FROM exercises WHERE name = 'Bird Dog'), 3, 12, 45, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Core Focus - Nati'),
 (SELECT id FROM exercises WHERE name = 'Dead Bug'), 3, 12, 45, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Core Focus - Nati'),
 (SELECT id FROM exercises WHERE name = 'Plank'), 3, 35, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Core Focus - Nati'),
 (SELECT id FROM exercises WHERE name = 'Bicycle Crunches'), 3, 12, 45, 3);

-- Wednesday - Strength
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Strength - Nati'),
 (SELECT id FROM exercises WHERE name = 'Push-Ups'), 3, 8, 60, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Strength - Nati'),
 (SELECT id FROM exercises WHERE name = 'Glute Bridges'), 3, 15, 45, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Strength - Nati'),
 (SELECT id FROM exercises WHERE name = 'Wall Sits'), 3, 30, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Strength - Nati'),
 (SELECT id FROM exercises WHERE name = 'Side Plank'), 3, 20, 45, 3);

-- Thursday - Cardio Mix
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio Mix - Nati'),
 (SELECT id FROM exercises WHERE name = 'Jumping Jacks'), 3, 25, 30, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio Mix - Nati'),
 (SELECT id FROM exercises WHERE name = 'High Knees'), 3, 30, 30, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio Mix - Nati'),
 (SELECT id FROM exercises WHERE name = 'Mountain Climbers'), 3, 20, 45, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Cardio Mix - Nati'),
 (SELECT id FROM exercises WHERE name = 'Bodyweight Squats'), 3, 15, 45, 3);

-- Friday - Recovery & Stretch
INSERT INTO workout_template_exercises (workout_template_id, exercise_id, sets, reps, rest_seconds, order_index) VALUES
((SELECT id FROM workout_templates WHERE name = 'Beginner Recovery & Stretch - Nati'),
 (SELECT id FROM exercises WHERE name = 'Cat-Cow Stretch'), 3, 10, 30, 0),
((SELECT id FROM workout_templates WHERE name = 'Beginner Recovery & Stretch - Nati'),
 (SELECT id FROM exercises WHERE name = 'Child''s Pose'), 3, 30, 30, 1),
((SELECT id FROM workout_templates WHERE name = 'Beginner Recovery & Stretch - Nati'),
 (SELECT id FROM exercises WHERE name = 'Hip Flexor Stretch'), 3, 30, 30, 2),
((SELECT id FROM workout_templates WHERE name = 'Beginner Recovery & Stretch - Nati'),
 (SELECT id FROM exercises WHERE name = 'Hamstring Stretch'), 3, 30, 30, 3);

-- Schedule Nati's workouts
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, completed) VALUES
(4, (SELECT id FROM workout_templates WHERE name = 'Beginner Total Body - Nati'), '2026-01-12', 0),
(4, (SELECT id FROM workout_templates WHERE name = 'Beginner Core Focus - Nati'), '2026-01-13', 0),
(4, (SELECT id FROM workout_templates WHERE name = 'Beginner Strength - Nati'), '2026-01-14', 0),
(4, (SELECT id FROM workout_templates WHERE name = 'Beginner Cardio Mix - Nati'), '2026-01-15', 0),
(4, (SELECT id FROM workout_templates WHERE name = 'Beginner Recovery & Stretch - Nati'), '2026-01-16', 0);
