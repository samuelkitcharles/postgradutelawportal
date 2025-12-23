CREATE OR REPLACE FUNCTION trg_set_enrollment_status() RETURNS trigger AS $$
BEGIN
    IF NEW.status IS NULL THEN
        NEW.status := 'ACTIVE';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_enrollment_status
BEFORE INSERT ON enrollments
FOR EACH ROW
EXECUTE FUNCTION trg_set_enrollment_status();

CREATE OR REPLACE FUNCTION trg_check_exam_time() RETURNS trigger AS $$
BEGIN
    IF NEW.exam_end_time <= NEW.exam_start_time THEN
        RAISE EXCEPTION 'Exam end time must be after start time';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_exam_time
BEFORE INSERT ON exam_schedule
FOR EACH ROW
EXECUTE FUNCTION trg_check_exam_time();

CREATE OR REPLACE FUNCTION trg_set_attendance_status() RETURNS trigger AS $$
BEGIN
    IF NEW.status IS NULL THEN
        NEW.status := 'ABSENT';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_attendance
BEFORE INSERT ON attendance
FOR EACH ROW
EXECUTE FUNCTION trg_set_attendance_status();

CREATE OR REPLACE FUNCTION trg_validate_score() RETURNS trigger AS $$
BEGIN
    IF NEW.score < 0 OR NEW.score > 100 THEN
        RAISE EXCEPTION 'Score must be between 0 and 100';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_exam_result
BEFORE INSERT ON exam_results
FOR EACH ROW
EXECUTE FUNCTION trg_validate_score();

CREATE OR REPLACE FUNCTION trg_prevent_duplicate_enrollment() RETURNS trigger AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM enrollments
        WHERE student_id = NEW.student_id
        AND course_id = NEW.course_id
        AND semester_id = NEW.semester_id
    ) THEN
        RAISE EXCEPTION 'Duplicate enrollment';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_enrollment_unique
BEFORE INSERT ON enrollments
FOR EACH ROW
EXECUTE FUNCTION trg_prevent_duplicate_enrollment();

CREATE OR REPLACE FUNCTION trg_update_posted_at() RETURNS trigger AS $$
BEGIN
    NEW.posted_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_announcement
BEFORE INSERT ON announcements
FOR EACH ROW
EXECUTE FUNCTION trg_update_posted_at();

CREATE OR REPLACE FUNCTION trg_validate_semester_dates() RETURNS trigger AS $$
BEGIN
    IF NEW.end_date <= NEW.start_date THEN
        RAISE EXCEPTION 'Semester end date must be after start date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_semester
BEFORE INSERT ON semesters
FOR EACH ROW
EXECUTE FUNCTION trg_validate_semester_dates();

CREATE OR REPLACE FUNCTION trg_check_student_age() RETURNS trigger AS $$
BEGIN
    IF NEW.date_of_birth IS NOT NULL AND age(NEW.date_of_birth) < interval '18 years' THEN
        RAISE EXCEPTION 'Student must be at least 18 years old';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_student_age
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION trg_check_student_age();

CREATE OR REPLACE FUNCTION trg_default_exam_type() RETURNS trigger AS $$
BEGIN
    IF NEW.exam_type IS NULL THEN
        NEW.exam_type := 'FINAL';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_exam_type
BEFORE INSERT ON exam_schedule
FOR EACH ROW
EXECUTE FUNCTION trg_default_exam_type();
