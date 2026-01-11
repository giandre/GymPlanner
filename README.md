# Gym Planner

A personalized family gym workout planner built with Cloudflare Workers, D1 Database, and React.

## Features

- **Personalized Workout Plans**: Customized workouts based on fitness level and health constraints
- **Family Profiles**: Individual profiles for Gio, Jeannine, Gia, and Nati
- **Exercise Library**: 40+ exercises with equipment and no-equipment options
- **Progress Tracking**: Track completed workouts and exercises
- **Calendar Scheduling**: Schedule workouts by date
- **Exercise Media**: Support for exercise images and videos
- **Equipment Toggle**: Filter workouts by equipment availability

## Tech Stack

- **Backend**: Cloudflare Workers
- **Database**: Cloudflare D1 (SQLite)
- **Frontend**: React with TypeScript
- **Styling**: Tailwind CSS
- **Deployment**: GitHub Actions → Cloudflare Workers

## Getting Started

### Prerequisites

- Node.js 20+
- Wrangler CLI
- Cloudflare account

### Installation

```bash
npm install
```

### Development

```bash
npm run dev
```

This starts the development server at `http://localhost:8787`

### Database Setup

The database is already configured and seeded with:
- Family member profiles
- Exercise library
- User preferences

To re-run migrations:

```bash
# Remote database
wrangler d1 execute gym-planner-db --remote --file=./schema.sql
wrangler d1 execute gym-planner-db --remote --file=./seed.sql
```

## Cloudflare Pages Deployment

This project deploys to Cloudflare Pages (not Workers) for the best full-stack experience.

### Setup via Cloudflare Dashboard

1. Go to https://dash.cloudflare.com/
2. Navigate to **Workers & Pages**
3. Click **Create application** → **Pages** → **Connect to Git**
4. Connect your GitHub account and select the `GymPlanner` repository
5. Configure build settings:
   - **Production branch**: `main`
   - **Framework preset**: None
   - **Build command**: (leave empty)
   - **Build output directory**: `public`
6. Click **Save and Deploy**

That's it! Cloudflare will automatically deploy on every push to main.

### Manual Deployment (Alternative)

```bash
npm run deploy
```

## API Endpoints

### Authentication
- `POST /api/auth/login` - Login with username and password

### Users
- `GET /api/users/:id` - Get user profile
- `GET /api/preferences?userId=:id` - Get user preferences

### Exercises
- `GET /api/exercises` - Get all exercises (filter by `?equipment=true/false&difficulty=beginner/intermediate/advanced`)
- `GET /api/exercises/:id` - Get specific exercise

### Workouts
- `POST /api/workouts/generate` - Generate workout plan
  ```json
  {
    "userId": 1,
    "startDate": "2024-01-12",
    "days": 7
  }
  ```
- `GET /api/workouts/user?userId=:id&date=:date` - Get user's workouts
- `GET /api/workouts/:id` - Get workout with exercises
- `POST /api/workouts/:id/complete` - Mark workout as complete
- `POST /api/workouts/:id/exercises/:exerciseId` - Mark exercise as complete
  ```json
  {
    "sets": 3,
    "reps": 12,
    "weight": 25,
    "notes": "Felt good!"
  }
  ```

## User Profiles

### Gio (ID: 1)
- Age: 47
- Fitness Level: Intermediate
- Health Notes: L4 and L5 herniated disks - avoid heavy spinal loading
- Preferences: Equipment workouts, 45 min, Mon/Wed/Fri

### Jeannine (ID: 2)
- Age: 46
- Fitness Level: Beginner
- Preferences: No equipment, 30 min, Tue/Thu/Sat

### Gia (ID: 3)
- Age: 16
- Fitness Level: Advanced
- Preferences: Equipment workouts, 60 min, Mon/Wed/Fri/Sat

### Nati (ID: 4)
- Age: 18
- Fitness Level: Beginner
- Preferences: No equipment, 30 min, Tue/Thu

## Default Login Credentials

For development/testing, use password: `gym2026` with any username (gio, jeannine, gia, or nati)

## Exercise Alternatives

Every exercise now includes an alternative option! This means:
- **Equipment exercises** have no-equipment alternatives (e.g., Dumbbell Press → Push-Ups)
- **No-equipment exercises** have equipment upgrades (e.g., Bodyweight Squats → Goblet Squats)
- If you arrive at the gym and equipment isn't available, you can switch to the alternative workout on the fly

## Deployment

### Manual Deployment

```bash
npm run deploy
```

### Automatic Deployment

Push to main branch triggers automatic deployment via GitHub Actions.

## Project Structure

```
gym-planner/
├── src/
│   ├── index.ts                    # Main API handler
│   ├── services/
│   │   ├── auth.ts                 # Authentication logic
│   │   └── workout-generator.ts    # Workout plan generator
├── public/                         # Frontend static files
├── schema.sql                      # Database schema
├── seed.sql                        # Initial data
├── wrangler.jsonc                  # Cloudflare Workers config
└── .github/
    └── workflows/
        └── deploy.yml              # GitHub Actions workflow
```

## License

MIT

## Credits

Built with Claude Sonnet 4.5
