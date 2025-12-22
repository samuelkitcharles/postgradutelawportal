# Postgraduate Law School Management System

## Project Overview
This project is a Postgraduate Law School Management System designed to manage
students, programs, semesters, courses, lecturers, enrollments, exams, and results.

The system supports different user roles:
- Students
- Lecturers
- Administrators
- Management

Each role interacts with the system through specific features relevant to their responsibilities.

---

## System Architecture
The application follows a **three-tier architecture**:

1. **Presentation Layer (Frontend)**
   - HTML/CSS-based user interfaces
   - Dashboards for students, lecturers, and administrators

2. **Application Layer (Backend)**
   - SQL queries
   - Stored procedures
   - Functions and triggers
   - Handles business logic such as grading, enrollment, and reporting

3. **Data Layer (Database)**
   - Relational database
   - Tables, relationships, constraints
   - DDL and DML scripts

---

## Technologies Used
- SQL (DDL, DML, Functions, Procedures, Triggers)
- HTML & CSS (Frontend)
- Git & GitHub (Version Control)

---

## Folder Structure
- `frontend/` – User interface files
- `backend/` – SQL logic (queries, procedures, functions, triggers)
- `database/` – Database schema (DDL), data population (DML), ERD
- `screenshots/` – Screenshots of the application and database outputs

---

## Key Functionalities
### Student
- View enrolled courses for the current semester

### Lecturer
- Assign grades to students
- View courses they are teaching

### Administrator
- Add and delete courses
- Assign lecturers to courses

### Management
- View statistics such as:
  - Average grades per course
  - Student distribution across semesters
  - Course popularity

---

http://localhost:5500/frontend/student/login.html


postgraduate-law-school-system/
│
├── frontend/
│   ├── student/
│   │   ├── dashboard.html ✓ (created)
│   │   ├── registration-supabase.html ✓ (created)
│   │   └── login.html ✓ (created)
│   │
│   └── lecturer/
│   |    └── lecturer_dashboard.html ✓ (created)
│   │
│   └── Management/
│       ├── Management.html
|       └── admin_login.html
│  
├── backend/
│   └── db_connection/
│       └── supabase-config.js ✓ (created)
│   
│
├── database/
│   ├── ddl/
│   │   └── postlawddl.sql
│   │
│   ├── dml/
│   └── postlawdml.sql
│   
│
├── screenshots/
│   ├── frontend/
│   └── database/
│
├── README.md
│
└── sqlqueries.sql ✓ (created)


## Contributors
Each team member contributed to different parts of the system, including frontend,
database design, SQL development, and documentation.
ROLES
Charles Samuel 22213454 – SQL Database, Frontend
Christy Lumbidi 22215889 – SQL Database
Ahmed Noor Mahomed 22217829 - Backend, Frontend
Sekou Brandy 22217709 – Backend, Frontend

