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
