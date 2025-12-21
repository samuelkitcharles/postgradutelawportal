-- =========================================
-- Postgraduate Law School Database Schema
-- =========================================

-- ---------- PROGRAMS ----------
CREATE TABLE programs (
    program_id INT PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL
);

-- ---------- SEMESTERS ----------
CREATE TABLE semesters (
    semester_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- ---------- STUDENTS ----------
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    nationality VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    bachelor_degree VARCHAR(100),
    university_attended VARCHAR(100),
    year_graduated INT,
    program_id INT NOT NULL,
    semester_id INT NOT NULL,
    CONSTRAINT fk_student_program
        FOREIGN KEY (program_id)
        REFERENCES programs(program_id),
    CONSTRAINT fk_student_semester
        FOREIGN KEY (semester_id)
        REFERENCES semesters(semester_id)
);

-- ---------- LECTURERS ----------
CREATE TABLE lecturers (
    lecturer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    academic_rank VARCHAR(50)
);

-- ---------- COURSES ----------
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    program_id INT NOT NULL,
    semester_id INT NOT NULL,
    CONSTRAINT fk_course_program
        FOREIGN KEY (program_id)
        REFERENCES programs(program_id),
    CONSTRAINT fk_course_semester
        FOREIGN KEY (semester_id)
        REFERENCES semesters(semester_id)
);


-- ---------- TEACHING ASSIGNMENTS ----------
CREATE TABLE teaching_assignments (
    assignment_id INT PRIMARY KEY,
    lecturer_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    CONSTRAINT fk_ta_lecturer
        FOREIGN KEY (lecturer_id)
        REFERENCES lecturers(lecturer_id),
    CONSTRAINT fk_ta_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),
    CONSTRAINT fk_ta_semester
        FOREIGN KEY (semester_id)
        REFERENCES semesters(semester_id)
);

-- ---------- ENROLLMENTS ----------
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    status VARCHAR(20),
    CONSTRAINT fk_enroll_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),
    CONSTRAINT fk_enroll_semester
        FOREIGN KEY (semester_id)
        REFERENCES semesters(semester_id)
);
-- ---------- ADMINISTRATORS ----------
CREATE TABLE administrators (
    admin_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(50)
);


-- ---------- ATTENDANCE ----------
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(20),
    CONSTRAINT fk_attendance_enrollment
        FOREIGN KEY (enrollment_id)
        REFERENCES enrollments(enrollment_id)
);

-- ---------- EXAM SCHEDULE ----------
CREATE TABLE exam_schedule (
    exam_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    exam_type VARCHAR(20),
    exam_date DATE NOT NULL,
    exam_start_time TIME,
    exam_end_time TIME,
    invigilator_lecturer_id INT,
    CONSTRAINT fk_exam_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),
    CONSTRAINT fk_exam_semester
        FOREIGN KEY (semester_id)
        REFERENCES semesters(semester_id),
    CONSTRAINT fk_exam_invigilator
        FOREIGN KEY (invigilator_lecturer_id)
        REFERENCES lecturers(lecturer_id));
-- ---------- EXAM RESULTS ----------
CREATE TABLE exam_results (
    result_id INT PRIMARY KEY,
    exam_id INT NOT NULL,
    student_id INT NOT NULL,
    score DECIMAL(5,2),
    CONSTRAINT fk_result_exam
        FOREIGN KEY (exam_id)
        REFERENCES exam_schedule(exam_id),
    CONSTRAINT fk_result_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);


-- ---------- ANNOUNCEMENTS ----------
CREATE TABLE announcements (
    announcement_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    posted_by_admin INT NOT NULL,
    posted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_announcement_admin
        FOREIGN KEY (posted_by_admin)
        REFERENCES administrators(admin_id)
);
