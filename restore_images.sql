-- Restore image and video URLs for exercises that were missing them
UPDATE exercises 
SET video_url = 'https://www.youtube.com/watch?v=1uTEhuZgMVk', 
    image_url = '/images/exercises/supported_split_squat.png' 
WHERE name = 'Supported Split Squat';

UPDATE exercises 
SET video_url = 'https://www.youtube.com/watch?v=VmB1G1K7v94', 
    image_url = '/images/exercises/dumbbell_chest_press.png' 
WHERE name = 'Dumbbell Chest Press';

UPDATE exercises 
SET video_url = 'https://www.youtube.com/watch?v=4XLEnwUr1d8', 
    image_url = '/images/exercises/dead_bug.png' 
WHERE name = 'Dead Bug';

UPDATE exercises 
SET video_url = 'https://www.youtube.com/watch?v=t_uQV_1I0jE', 
    image_url = '/images/exercises/bear_crawl.png' 
WHERE name = 'Bear Crawl';
