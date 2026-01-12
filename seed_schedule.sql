-- 4. Schedule Workouts (Jan 12 - Jan 18)

-- Monday Jan 12
-- Gio: Upper Body Push
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-12', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'gio' AND t.name = 'Gio: Upper Body Push';

-- Jeannine: Full Body Tone A
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-12', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'jeannine' AND t.name = 'Jeannine: Full Body Tone A';

-- Tuesday Jan 13
-- Gio: Lower Body Safe
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-13', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'gio' AND t.name = 'Gio: Lower Body Safe';

-- Gia: Superhero Training
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-13', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'gia' AND t.name = 'Kids: Superhero Training';

-- Nati: Superhero Training
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-13', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'nati' AND t.name = 'Kids: Superhero Training';

-- Thursday Jan 15
-- Gio: Upper Body Push
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-15', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'gio' AND t.name = 'Gio: Upper Body Push';

-- Jeannine: Full Body Tone A (Repeat for simplicity)
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-15', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'jeannine' AND t.name = 'Jeannine: Full Body Tone A';

-- Friday Jan 16
-- Gio: Lower Body Safe
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-16', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'gio' AND t.name = 'Gio: Lower Body Safe';

-- Gia: Superhero Training
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-16', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'gia' AND t.name = 'Kids: Superhero Training';

-- Nati: Superhero Training
INSERT INTO scheduled_workouts (user_id, workout_template_id, scheduled_date, status)
SELECT u.id, t.id, '2026-01-16', 'scheduled' 
FROM users u, workout_templates t 
WHERE u.username = 'nati' AND t.name = 'Kids: Superhero Training';
