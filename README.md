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

## GitHub Actions Setup

To enable automatic deployment to Cloudflare when pushing to GitHub:

### 1. Create Cloudflare API Token

1. Go to https://dash.cloudflare.com/profile/api-tokens
2. Click "Create Token"
3. Use the "Edit Cloudflare Workers" template
4. Click "Continue to summary" then "Create Token"
5. Copy the token (you'll only see it once!)

### 2. Add GitHub Secrets

Go to your GitHub repository → Settings → Secrets and variables → Actions

Add these secrets:

- **CLOUDFLARE_API_TOKEN**: The token you just created
- **CLOUDFLARE_ACCOUNT_ID**: `71022598bc00bdb7d0f4e79d5a2af0ea`

### 3. Push to GitHub

```bash
git push origin main
```

The GitHub Action will automatically deploy to Cloudflare!

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

For development/testing, use password: `gym2024` with any username (gio, jeannine, gia, or nati)

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
