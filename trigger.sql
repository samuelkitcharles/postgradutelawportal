-- Trigger to set enrollment_date to current date upon registering--
CREATE TRIGGER trg_set_enrollment_date
BEFORE INSERT ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.enrollment_date IS NULL THEN
        SET NEW.enrollment_date = CURRENT_DATE;
    END IF;
END;

--and after that, this trigger sets it as acive--
CREATE TRIGGER trg_set_enrollment_status
BEFORE INSERT ON enrollments
FOR EACH ROW
BEGIN
    IF :NEW.status IS NULL THEN
        :NEW.status := 'Active';
    END IF;
END;
/
