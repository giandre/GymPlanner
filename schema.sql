-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    fitness_level TEXT NOT NULL CHECK(fitness_level IN ('beginner', 'intermediate', 'advanced')),
    health_notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Exercise library table
CREATE TABLE IF NOT EXISTS exercises (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    muscle_group TEXT NOT NULL,
    difficulty TEXT NOT NULL CHECK(difficulty IN ('beginner', 'intermediate', 'advanced')),
    equipment_required BOOLEAN NOT NULL DEFAULT 0,
    video_url TEXT,
    image_url TEXT,
    instructions TEXT,
    contraindications TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Workout templates table
CREATE TABLE IF NOT EXISTS workout_templates (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    fitness_level TEXT NOT NULL CHECK(fitness_level IN ('beginner', 'intermediate', 'advanced')),
    duration_minutes INTEGER NOT NULL,
    equipment_required BOOLEAN NOT NULL DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Workout template exercises (many-to-many relationship)
CREATE TABLE IF NOT EXISTS workout_template_exercises (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_template_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    sets INTEGER NOT NULL DEFAULT 3,
    reps INTEGER NOT NULL DEFAULT 10,
    duration_seconds INTEGER,
    rest_seconds INTEGER DEFAULT 60,
    order_index INTEGER NOT NULL,
    FOREIGN KEY (workout_template_id) REFERENCES workout_templates(id) ON DELETE CASCADE,
    FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE
);

-- Scheduled workouts table
CREATE TABLE IF NOT EXISTS scheduled_workouts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    workout_template_id INTEGER NOT NULL,
    scheduled_date DATE NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT 0,
    completed_at DATETIME,
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (workout_template_id) REFERENCES workout_templates(id) ON DELETE CASCADE
);

-- Exercise completion tracking
CREATE TABLE IF NOT EXISTS exercise_completions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    scheduled_workout_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    sets_completed INTEGER NOT NULL DEFAULT 0,
    reps_completed INTEGER NOT NULL DEFAULT 0,
    weight_used REAL,
    duration_seconds INTEGER,
    completed BOOLEAN NOT NULL DEFAULT 0,
    notes TEXT,
    completed_at DATETIME,
    FOREIGN KEY (scheduled_workout_id) REFERENCES scheduled_workouts(id) ON DELETE CASCADE,
    FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE
);

-- User preferences table
CREATE TABLE IF NOT EXISTS user_preferences (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL UNIQUE,
    preferred_workout_days TEXT, -- JSON array of days (e.g., ["Monday", "Wednesday", "Friday"])
    preferred_equipment BOOLEAN NOT NULL DEFAULT 1,
    workout_duration_preference INTEGER DEFAULT 45,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_scheduled_workouts_user_date ON scheduled_workouts(user_id, scheduled_date);
CREATE INDEX IF NOT EXISTS idx_scheduled_workouts_date ON scheduled_workouts(scheduled_date);
CREATE INDEX IF NOT EXISTS idx_exercises_difficulty ON exercises(difficulty);
CREATE INDEX IF NOT EXISTS idx_exercises_equipment ON exercises(equipment_required);
CREATE INDEX IF NOT EXISTS idx_workout_templates_fitness ON workout_templates(fitness_level);
