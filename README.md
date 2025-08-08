# ToothBrush Hero - Laravel 11 + React.js App

## 📖 Overview
ToothBrush Hero is a fun and engaging web app for parents to track and reward their kids' brushing habits.  
Children interact with a **2-minute brushing timer** that plays sounds and records their brushing sessions.  
Parents (admins) can log in to monitor statistics and even assign **monetary rewards** like $3 for consistent brushing.

---

## ✨ Features
- 🕒 **2-minute React-based brushing timer** with sound effects.
- 🔑 **Admin (parent) login** via Laravel Sanctum.
- 👦 **Child user creation** and brushing session logging.
- 📊 **Admin dashboard** to view brushing stats and issue rewards.
- 💰 **Monetization logic** — e.g., $3 per completed session.

---

## 🛠 Tech Stack
- **Backend:** Laravel 11, PHP 8.3, Sanctum Auth
- **Frontend:** React.js
- **Database:** MySQL
- **Containerization:** Docker

---

## 🚀 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Bishopafl/toothbrush-hero
cd toothbrush-hero
```

## Follow Makefile commands for startup

### 2. Start the Application with Docker
```bash
make up
```

### 3. Initialize Laravel Environment
```bash
make install
```

### 4. Create Admin User
```bash
make create-admin
```

## 🎨 Frontend Setup (React)
React components will be placed in /resources/js.

Create BrushingTimer.jsx

Integrate with /start-brushing endpoint to log session

Use sound effects (e.g. bell) at start, halfway, and end

## Run frontend:
```bash
npm install
npm run dev
```

## 📡 API Routes

| Method | Endpoint             | Description            |
|--------|----------------------|------------------------|
| POST   | `/api/login`         | Admin login (Sanctum)  |
| GET    | `/api/kids`          | List all children      |
| POST   | `/api/kids/{id}/log` | Log a brushing session |
| GET    | `/api/kids/{id}/log` | View brushing history  |

## 🎯 Stretch Goals
- Add brushing streaks & badges
- Gamify with toothbrush avatar leveling
- Notifications/reminders

## 📄 License
MIT

## 🧰 Developer Shortcuts

To make development faster, the `Makefile` includes commands for generating Laravel classes without having to type long `docker exec` commands.

## Artisan Make commands

### Create a Model (with migration)
```bash
make model NAME=BrushingSession
```
This will run:
```bash
php artisan make:model BrushingSessionModel -m
```

### Create a Controller
```bash
make controller NAME=BrushingSessionController
```
This will run:
```bash
php artisan make:controller BrushingSessionController
```

### Create a Form Request
```bash
make request NAME=StoreBrushingSessionRequest
```
This will run:
```bash
php artisan make:request StoreBrushingSessionRequest
```

### SSH into the Container
```bash
make ssh
```
This drops you into a shell inside the running container so you can run artisan, composer, npm, etc.


## With this setup:
- You don’t have to remember the container name every time  
- All artisan commands can be called via `make` shortcuts  
- You can generate models, controllers, and requests directly from your host terminal  