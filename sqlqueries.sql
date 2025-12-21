--register new student--
CREATE PROCEDURE register_student (
    p_student_id INT,
    p_full_name VARCHAR(100),
    p_date_of_birth DATE,
    p_nationality VARCHAR(50),
    p_phone_number VARCHAR(20),
    p_email VARCHAR(100),
    p_bachelor_degree VARCHAR(100),
    p_university_attended VARCHAR(100),
    p_year_graduated INT,
    p_program_id INT,
    p_semester_id INT
)
BEGIN
    INSERT INTO students (
        student_id, full_name, date_of_birth, nationality,
        phone_number, email, bachelor_degree,
        university_attended, year_graduated,
        program_id, semester_id
    )
    VALUES (
        p_student_id, p_full_name, p_date_of_birth, p_nationality,
        p_phone_number, p_email, p_bachelor_degree,
        p_university_attended, p_year_graduated,
        p_program_id, p_semester_id
    );
END;

--register lecturer--
CREATE PROCEDURE register_lecturer (
    p_lecturer_id INT,
    p_full_name VARCHAR(100),
    p_date_of_birth DATE,
    p_gender VARCHAR(10),
    p_phone_number VARCHAR(20),
    p_email VARCHAR(100),
    p_academic_rank VARCHAR(50)
)
BEGIN
    INSERT INTO lecturers (
        lecturer_id, full_name, date_of_birth,
        gender, phone_number, email, academic_rank
    )
    VALUES (
        p_lecturer_id, p_full_name, p_date_of_birth,
        p_gender, p_phone_number, p_email, p_academic_rank
    );
END;


--get student dashboard info--
SELECT s.student_id,
       s.full_name,
       p.program_name,
       se.name AS semester
FROM students s
JOIN programs p ON s.program_id = p.program_id
JOIN semesters se ON s.semester_id = se.semester_id
WHERE s.student_id = 1001;

--display student courses for current semester--
SELECT c.course_code,
       c.course_name
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
JOIN students s ON e.student_id = s.student_id
WHERE s.student_id = 1001
  AND e.semester_id = s.semester_id;

--lecturer viewing students in theri courses--
SELECT s.student_id,
       s.full_name,
       c.course_name
FROM teaching_assignments ta
JOIN courses c ON ta.course_id = c.course_id
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
WHERE ta.lecturer_id = 1
  AND ta.semester_id = 1;

--management seeing number of students per semester--
SELECT se.name AS semester,
       COUNT(s.student_id) AS total_students
FROM semesters se
LEFT JOIN students s ON se.semester_id = s.semester_id
GROUP BY se.name
ORDER BY se.name;

--management seeing total number of student per program--
SELECT p.program_name,
       COUNT(s.student_id) AS total_students
FROM programs p
LEFT JOIN students s ON p.program_id = s.program_id
GROUP BY p.program_name
ORDER BY total_students DESC;


--management seeing most popular programs taken by students--
SELECT p.program_name,
       COUNT(s.student_id) AS total_students
FROM programs p
JOIN students s ON p.program_id = s.program_id
GROUP BY p.program_name
ORDER BY total_students DESC;
--management seeing student per semester--
SELECT se.name AS semester,
       COUNT(s.student_id) AS total_students
FROM semesters se
JOIN students s ON se.semester_id = s.semester_id
GROUP BY se.name;

--lecturer assigning grades--
CREATE PROCEDURE assign_grade (
    p_exam_id INT,
    p_student_id INT,
    p_score DECIMAL(5,2)
)
BEGIN
    INSERT INTO exam_results (exam_id, student_id, score)
    VALUES (p_exam_id, p_student_id, p_score);
END;

--admin assigning lectureurs to courses--
CREATE PROCEDURE assign_lecturer_to_course (
    p_assignment_id INT,
    p_lecturer_id INT,
    p_course_id INT,
    p_semester_id INT
)
BEGIN
    INSERT INTO teaching_assignments
    VALUES (p_assignment_id, p_lecturer_id, p_course_id, p_semester_id);
END;

--admin adding new courses--
CREATE PROCEDURE add_course (
    p_course_id INT,
    p_course_code VARCHAR(20),
    p_course_name VARCHAR(100),
    p_program_id INT,
    p_semester_id INT
)

BEGIN
    INSERT INTO courses
    VALUES (p_course_id, p_course_code, p_course_name,
            p_program_id, p_semester_id);
END;

--admin deleting a course--
CREATE PROCEDURE delete_course (
    p_course_id INT
)
BEGIN
    DELETE FROM courses
    WHERE course_id = p_course_id;
END;

--FUNCTION TO GET TOTAL NUMBER OF STUDENTS IN A PROGRAM--
CREATE FUNCTION get_student_count_by_program (
    p_program_id INT
)
RETURNS INT
LANGUAGE SQL
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM students
        WHERE program_id = p_program_id
    );
END;
--FUNCTION FOR GET AVERAGE SCORE IN A COURSE--
CREATE FUNCTION get_average_score_for_course (
    p_course_id INT
)
RETURNS DECIMAL(5,2)
LANGUAGE SQL
BEGIN
    RETURN (
        SELECT AVG(er.score)
        FROM exam_results er
        JOIN exam_schedule es ON er.exam_id = es.exam_id
        WHERE es.course_id = p_course_id
    );
END;

