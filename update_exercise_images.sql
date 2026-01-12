-- Update exercises with local image URLs
-- Images are served from /images/exercises/ via Cloudflare Pages

-- Warm-up exercises
UPDATE exercises SET image_url = '/images/exercises/jumping_jacks.png' WHERE name = 'Jumping Jacks';
UPDATE exercises SET image_url = '/images/exercises/arm_circles.png' WHERE name = 'Arm Circles';
UPDATE exercises SET image_url = '/images/exercises/bodyweight_squats.png' WHERE name = 'Bodyweight Squats';
UPDATE exercises SET image_url = '/images/exercises/high_knees.png' WHERE name = 'High Knees';

-- Lower body (no equipment)
UPDATE exercises SET image_url = '/images/exercises/lunges.png' WHERE name = 'Lunges';
UPDATE exercises SET image_url = '/images/exercises/glute_bridges.png' WHERE name = 'Glute Bridges';
UPDATE exercises SET image_url = '/images/exercises/wall_sits.png' WHERE name = 'Wall Sits';
UPDATE exercises SET image_url = '/images/exercises/calf_raises.png' WHERE name = 'Calf Raises';
UPDATE exercises SET image_url = '/images/exercises/step_ups.png' WHERE name = 'Step-Ups';

-- Upper body (no equipment)
UPDATE exercises SET image_url = '/images/exercises/push_ups.png' WHERE name = 'Push-Ups';
UPDATE exercises SET image_url = '/images/exercises/incline_push_ups.png' WHERE name = 'Incline Push-Ups';
UPDATE exercises SET image_url = '/images/exercises/diamond_push_ups.png' WHERE name = 'Diamond Push-Ups';
UPDATE exercises SET image_url = '/images/exercises/tricep_dips.png' WHERE name = 'Tricep Dips';
UPDATE exercises SET image_url = '/images/exercises/plank_shoulder_taps.png' WHERE name = 'Plank Shoulder Taps';

-- Core exercises
UPDATE exercises SET image_url = '/images/exercises/plank.png' WHERE name = 'Plank';
UPDATE exercises SET image_url = '/images/exercises/bird_dog.png' WHERE name = 'Bird Dog';
UPDATE exercises SET image_url = '/images/exercises/dead_bug.png' WHERE name = 'Dead Bug';
UPDATE exercises SET image_url = '/images/exercises/side_plank.png' WHERE name = 'Side Plank';
UPDATE exercises SET image_url = '/images/exercises/mountain_climbers.png' WHERE name = 'Mountain Climbers';
UPDATE exercises SET image_url = '/images/exercises/bicycle_crunches.png' WHERE name = 'Bicycle Crunches';

-- Lower body (with equipment)
UPDATE exercises SET image_url = '/images/exercises/goblet_squats.png' WHERE name = 'Goblet Squats';
UPDATE exercises SET image_url = '/images/exercises/romanian_deadlifts.png' WHERE name = 'Romanian Deadlifts';
UPDATE exercises SET image_url = '/images/exercises/dumbbell_lunges.png' WHERE name = 'Dumbbell Lunges';
UPDATE exercises SET image_url = '/images/exercises/leg_press.png' WHERE name = 'Leg Press';
UPDATE exercises SET image_url = '/images/exercises/leg_curls.png' WHERE name = 'Leg Curls';
UPDATE exercises SET image_url = '/images/exercises/leg_extensions.png' WHERE name = 'Leg Extensions';

-- Upper body (with equipment)
UPDATE exercises SET image_url = '/images/exercises/dumbbell_chest_press.png' WHERE name = 'Dumbbell Chest Press';
UPDATE exercises SET image_url = '/images/exercises/dumbbell_rows.png' WHERE name = 'Dumbbell Rows';
UPDATE exercises SET image_url = '/images/exercises/lat_pulldowns.png' WHERE name = 'Lat Pulldowns';
UPDATE exercises SET image_url = '/images/exercises/overhead_press.png' WHERE name = 'Overhead Press';
UPDATE exercises SET image_url = '/images/exercises/bicep_curls.png' WHERE name = 'Bicep Curls';
UPDATE exercises SET image_url = '/images/exercises/tricep_rope_pushdowns.png' WHERE name = 'Tricep Rope Pushdowns';
UPDATE exercises SET image_url = '/images/exercises/face_pulls.png' WHERE name = 'Face Pulls';

-- Cardio
UPDATE exercises SET image_url = '/images/exercises/treadmill_walking.png' WHERE name = 'Treadmill Walking';
UPDATE exercises SET image_url = '/images/exercises/elliptical.png' WHERE name = 'Elliptical';
UPDATE exercises SET image_url = '/images/exercises/stationary_bike.png' WHERE name = 'Stationary Bike';
UPDATE exercises SET image_url = '/images/exercises/rowing_machine.png' WHERE name = 'Rowing Machine';
UPDATE exercises SET image_url = '/images/exercises/burpees.png' WHERE name = 'Burpees';

-- Flexibility and recovery
UPDATE exercises SET image_url = '/images/exercises/cat_cow_stretch.png' WHERE name = 'Cat-Cow Stretch';
UPDATE exercises SET image_url = '/images/exercises/childs_pose.png' WHERE name = 'Child''s Pose';
UPDATE exercises SET image_url = '/images/exercises/hip_flexor_stretch.png' WHERE name = 'Hip Flexor Stretch';
UPDATE exercises SET image_url = '/images/exercises/hamstring_stretch.png' WHERE name = 'Hamstring Stretch';
UPDATE exercises SET image_url = '/images/exercises/foam_rolling.png' WHERE name = 'Foam Rolling';
