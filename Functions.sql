CREATE OR REPLACE FUNCTION get_student_count_by_program(pid INT)
RETURNS INT AS $$
DECLARE total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM students WHERE program_id = pid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_course_count_by_semester(sid INT)
RETURNS INT AS $$
DECLARE total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM courses WHERE semester_id = sid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_student_age(sid INT)
RETURNS INT AS $$
DECLARE age_years INT;
BEGIN
    SELECT EXTRACT(YEAR FROM age(date_of_birth)) INTO age_years
    FROM students WHERE student_id = sid;
    RETURN age_years;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_average_score(eid INT)
RETURNS DECIMAL AS $$
DECLARE avg_score DECIMAL;
BEGIN
    SELECT AVG(score) INTO avg_score FROM exam_results WHERE exam_id = eid;
    RETURN avg_score;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_student_enrolled(sid INT, cid INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1 FROM enrollments
        WHERE student_id = sid AND course_id = cid
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_attendance_count(eid INT)
RETURNS INT AS $$
DECLARE total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM attendance WHERE enrollment_id = eid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_exam_count_by_course(cid INT)
RETURNS INT AS $$
DECLARE total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM exam_schedule WHERE course_id = cid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_student_email(sid INT)
RETURNS VARCHAR AS $$
DECLARE email_val VARCHAR;
BEGIN
    SELECT email INTO email_val FROM students WHERE student_id = sid;
    RETURN email_val;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_lecturer_course_count(lid INT)
RETURNS INT AS $$
DECLARE total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM teaching_assignments WHERE lecturer_id = lid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_announcements_by_admin(aid INT)
RETURNS INT AS $$
DECLARE total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM announcements WHERE posted_by_admin = aid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;
