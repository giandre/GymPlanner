-- Update exercises with YouTube video URLs from reputable fitness channels
-- These are demonstration videos from fitness professionals

-- Warm-up exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=c4DAnQ6DtF8' WHERE name = 'Jumping Jacks';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=5FfxdQJ58SA' WHERE name = 'Arm Circles';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=C_VtOYc6j5c' WHERE name = 'Bodyweight Squats';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=Vmo4DXlj-AE' WHERE name = 'High Knees';

-- Lower body (no equipment)
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=QOVaHwm-Q6U' WHERE name = 'Lunges';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=wPM8icPu6H8' WHERE name = 'Glute Bridges';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=y-wV4Venusw' WHERE name = 'Wall Sits';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=AQMF7-mWKY4' WHERE name = 'Calf Raises';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=aajhW7DD1EA' WHERE name = 'Step-Ups';

-- Upper body (no equipment)
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=IODxDxX7oi4' WHERE name = 'Push-Ups';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=PGVoH5xV-sQ' WHERE name = 'Incline Push-Ups';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=J0DnG1_S92I' WHERE name = 'Diamond Push-Ups';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=0326dy_-CzM' WHERE name = 'Tricep Dips';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=DqZNdByb_WE' WHERE name = 'Plank Shoulder Taps';

-- Core exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=pSHjTRCQxIw' WHERE name = 'Plank';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=wiFNA3sqjCA' WHERE name = 'Bird Dog';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=4XLEnwUr1d8' WHERE name = 'Dead Bug';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=K2VljzCC16g' WHERE name = 'Side Plank';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=nmwgirgXLYM' WHERE name = 'Mountain Climbers';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=Iwyvozckjak' WHERE name = 'Bicycle Crunches';

-- Lower body (with equipment)
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=MeIiIdhvXT4' WHERE name = 'Goblet Squats';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=wWs4Pvxhd98' WHERE name = 'Romanian Deadlifts';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=D7KaRcUTQeE' WHERE name = 'Dumbbell Lunges';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=IZxyjW7MPJQ' WHERE name = 'Leg Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=ELOCsoDSmrg' WHERE name = 'Leg Curls';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=YyvSfEjZIho' WHERE name = 'Leg Extensions';

-- Upper body (with equipment)
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=VmB1G1K7v94' WHERE name = 'Dumbbell Chest Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=roCP6wCXPqo' WHERE name = 'Dumbbell Rows';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=CAwf7n6Luuc' WHERE name = 'Lat Pulldowns';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=qEwKCR5JCog' WHERE name = 'Overhead Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=ykJmrZ5v0Oo' WHERE name = 'Bicep Curls';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=vB5OHsJ3EME' WHERE name = 'Tricep Rope Pushdowns';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=HSoHeSjvIdY' WHERE name = 'Face Pulls';

-- Cardio
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=UARMeYG_u10' WHERE name = 'Treadmill Walking';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=oq0fY4dFVP4' WHERE name = 'Elliptical';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=S7zL7NExg08' WHERE name = 'Stationary Bike';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=KvdVMpMucnY' WHERE name = 'Rowing Machine';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=JZQA08SlJnM' WHERE name = 'Burpees';

-- Flexibility and recovery
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=K9bK0jbIXRs' WHERE name = 'Cat-Cow Stretch';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=I9jFUcEJaV0' WHERE name = 'Child''s Pose';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=FQaJsaJy3Hw' WHERE name = 'Hip Flexor Stretch';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=oPCm9hIWz14' WHERE name = 'Hamstring Stretch';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=LFWdEufKp3s' WHERE name = 'Foam Rolling';
