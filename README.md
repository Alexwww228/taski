# Taski

Taski is a task-planning application—a full-stack web app featuring a React frontend, a Django REST backend, and PostgreSQL as the database.  
This version runs locally without Docker, making it a straightforward environment for development and study.

## Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Architecture](#architecture)  
- [Getting Started](#getting-started)  
  - [Prerequisites](#prerequisites)  
  - [Backend Setup](#backend-setup)  
  - [Frontend Setup](#frontend-setup)  
- [Configuration](#configuration)  
- [License](#license)  
- [Contributing](#contributing)  
- [Author](#author)

---

## Overview

Taski is an organizer app that allows users to create, update, and manage tasks—marking them as completed or pending.  
This repository contains the **non-Dockerized version**, designed to run with a standard local development setup.

## Features

- Backend built with **Django** and **Django REST Framework**  
- Frontend powered by **React (SPA)**  
- **PostgreSQL** database integration  
- RESTful API endpoints for task management  
- User-friendly task creation, update, and completion tracking  

## Architecture

[User] ←→ React Frontend (SPA)  
↓  
Django REST API ←→ PostgreSQL  

Components:

- **frontend** (React SPA)  
- **backend** (Django REST API)  
- **db** (PostgreSQL database)  

---

## Getting Started

### Prerequisites

- Python 3.10+  
- Node.js & npm  
- PostgreSQL  

---

### Backend Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/salahamran/taski.git
   cd taski/backend
   python -m venv venv
   source venv/bin/activate   # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   python manage.py migrate
   python manage.py runserver

- API will be available at: http://localhost:8000/api/

  
2. Frontend Setup
```bash
  cd ../frontend
  npm install
  npm start

Frontend will be available at: http://localhost:3000
http://localhost:3000

## License

This project is licensed under the MIT License. See the LICENSE file for details.

