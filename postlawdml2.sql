

-- ---------- STUDENTS ----------
INSERT INTO students VALUES
(1, 'Alice Johnson', '1997-04-12', 'Nigerian', '08011111111',
 'alice.johnson@lawschool.edu', 'LLB', 'University of Lagos', 2020, 1, 1),

(2, 'Michael Brown', '1996-09-23', 'Ghanaian', '08022222222',
 'michael.brown@lawschool.edu', 'LLB', 'University of Ghana', 2019, 1, 2),

(3, 'Sarah Williams', '1998-01-15', 'Kenyan', '08033333333',
 'sarah.williams@lawschool.edu', 'LLB', 'University of Nairobi', 2021, 2, 1),

(4, 'Daniel Smith', '1995-06-30', 'British', '08044444444',
 'daniel.smith@lawschool.edu', 'LLB', 'University of London', 2018, 2, 3),

(5, 'Amina Bello', '1997-11-08', 'Nigerian', '08055555555',
 'amina.bello@lawschool.edu', 'LLB', 'Ahmadu Bello University', 2020, 3, 2),

(6, 'James Carter', '1996-02-19', 'American', '08066666666',
 'james.carter@lawschool.edu', 'LLB', 'University of Texas', 2019, 3, 4),

(7, 'Fatima Hassan', '1998-07-25', 'Egyptian', '08077777777',
 'fatima.hassan@lawschool.edu', 'LLB', 'Cairo University', 2021, 4, 1),

(8, 'Lucas Martin', '1995-12-03', 'French', '08088888888',
 'lucas.martin@lawschool.edu', 'LLB', 'Sorbonne University', 2018, 4, 3);

-- ---------- ENROLLMENTS ----------
INSERT INTO enrollments VALUES
(1001, 1, 101, 1, 'Enrolled'),
(1002, 1, 102, 1, 'Enrolled'),
(1003, 1, 103, 1, 'Enrolled'),
(1004, 1, 104, 1, 'Enrolled'),
(1005, 1, 105, 1, 'Enrolled'),

(1006, 2, 106, 2, 'Enrolled'),
(1007, 2, 107, 2, 'Enrolled'),
(1008, 2, 108, 2, 'Enrolled'),
(1009, 2, 109, 2, 'Enrolled'),
(1010, 2, 110, 2, 'Enrolled'),

(1011, 3, 201, 1, 'Enrolled'),
(1012, 3, 202, 1, 'Enrolled'),
(1013, 3, 203, 1, 'Enrolled'),
(1014, 3, 204, 1, 'Enrolled'),
(1015, 3, 205, 1, 'Enrolled'),

(1016, 4, 211, 3, 'Enrolled'),
(1017, 4, 212, 3, 'Enrolled'),
(1018, 4, 213, 3, 'Enrolled'),
(1019, 4, 214, 3, 'Enrolled'),
(1020, 4, 215, 3, 'Enrolled'),

(1021, 5, 306, 2, 'Enrolled'),
(1022, 5, 307, 2, 'Enrolled'),
(1023, 5, 308, 2, 'Enrolled'),
(1024, 5, 309, 2, 'Enrolled'),
(1025, 5, 310, 2, 'Enrolled'),

(1026, 6, 316, 4, 'Enrolled'),
(1027, 6, 317, 4, 'Enrolled'),
(1028, 6, 318, 4, 'Enrolled'),
(1029, 6, 319, 4, 'Enrolled'),
(1030, 6, 320, 4, 'Enrolled'),

(1031, 7, 401, 1, 'Enrolled'),
(1032, 7, 402, 1, 'Enrolled'),
(1033, 7, 403, 1, 'Enrolled'),
(1034, 7, 404, 1, 'Enrolled'),
(1035, 7, 405, 1, 'Enrolled'),

(1036, 8, 411, 3, 'Enrolled'),
(1037, 8, 412, 3, 'Enrolled'),
(1038, 8, 413, 3, 'Enrolled'),
(1039, 8, 414, 3, 'Enrolled'),
(1040, 8, 415, 3, 'Enrolled');


-- ---------- LECTURERS ----------
INSERT INTO lecturers (
    lecturer_id, full_name, date_of_birth, gender,
    phone_number, email, academic_rank
) VALUES
(1, 'Dr. John Miller', '1975-03-12', 'Male', '09011111111', 'john.miller@lawschool.edu', 'Senior Lecturer'),
(2, 'Prof. Linda Adams', '1970-07-22', 'Female', '09022222222', 'linda.adams@lawschool.edu', 'Professor'),
(3, 'Dr. Samuel Okoye', '1980-11-05', 'Male', '09033333333', 'samuel.okoye@lawschool.edu', 'Lecturer'),
(4, 'Dr. Maria Gonzalez', '1978-01-18', 'Female', '09044444444', 'maria.gonzalez@lawschool.edu', 'Senior Lecturer'),
(5, 'Dr. Ahmed Hassan', '1982-09-30', 'Male', '09055555555', 'ahmed.hassan@lawschool.edu', 'Lecturer'),
(6, 'Prof. Emily Carter', '1969-05-14', 'Female', '09066666666', 'emily.carter@lawschool.edu', 'Professor');

INSERT INTO teaching_assignments VALUES
(1, 1, 101, 1),
(2, 1, 102, 1),
(3, 2, 103, 1),
(4, 2, 104, 1),
(5, 1, 105, 1),

(6, 2, 106, 2),
(7, 3, 107, 2),
(8, 3, 108, 2),
(9, 2, 109, 2),
(10, 3, 110, 2),

(11, 1, 111, 3),
(12, 2, 112, 3),
(13, 1, 113, 3),
(14, 2, 114, 3),
(15, 3, 115, 3),

(16, 2, 116, 4),
(17, 1, 117, 4),
(18, 2, 118, 4),
(19, 1, 119, 4),
(20, 2, 120, 4);

INSERT INTO teaching_assignments VALUES
(21, 4, 201, 1),
(22, 4, 202, 1),
(23, 6, 203, 1),
(24, 6, 204, 1),
(25, 4, 205, 1),

(26, 6, 206, 2),
(27, 4, 207, 2),
(28, 6, 208, 2),
(29, 4, 209, 2),
(30, 6, 210, 2),

(31, 4, 211, 3),
(32, 6, 212, 3),
(33, 4, 213, 3),
(34, 6, 214, 3),
(35, 4, 215, 3),

(36, 6, 216, 4),
(37, 4, 217, 4),
(38, 6, 218, 4),
(39, 4, 219, 4),
(40, 6, 220, 4);

INSERT INTO teaching_assignments VALUES
(41, 3, 301, 1),
(42, 3, 302, 1),
(43, 5, 303, 1),
(44, 5, 304, 1),
(45, 3, 305, 1),

(46, 5, 306, 2),
(47, 3, 307, 2),
(48, 5, 308, 2),
(49, 3, 309, 2),
(50, 5, 310, 2),

(51, 3, 311, 3),
(52, 5, 312, 3),
(53, 3, 313, 3),
(54, 5, 314, 3),
(55, 3, 315, 3),

(56, 5, 316, 4),
(57, 3, 317, 4),
(58, 5, 318, 4),
(59, 3, 319, 4),
(60, 5, 320, 4);

INSERT INTO teaching_assignments VALUES
(61, 2, 401, 1),
(62, 2, 402, 1),
(63, 4, 403, 1),
(64, 4, 404, 1),
(65, 2, 405, 1),

(66, 4, 406, 2),
(67, 2, 407, 2),
(68, 4, 408, 2),
(69, 2, 409, 2),
(70, 4, 410, 2),

(71, 2, 411, 3),
(72, 4, 412, 3),
(73, 2, 413, 3),
(74, 4, 414, 3),
(75, 2, 415, 3),

(76, 4, 416, 4),
(77, 2, 417, 4),
(78, 4, 418, 4),
(79, 2, 419, 4),
(80, 4, 420, 4);



-- ---------- ADMINISTRATORS ----------
INSERT INTO administrators (
    admin_id, full_name, email, phone_number, role
) VALUES
(1, 'Grace Mensah', 'admin1@lawschool.edu', '08090000001', 'System Administrator'),
(2, 'David Collins', 'admin2@lawschool.edu', '08090000002', 'Academic Administrator');


-- ---------- ANNOUNCEMENTS ----------
INSERT INTO announcements (
    announcement_id, title, content, posted_by_admin
) VALUES
(1, 'Semester Registration Open',
 'Students are advised to complete course registration before the deadline.',
 1),

(2, 'Examination Timetable Released',
 'The examination timetable for the current semester has been published.',
 2);


-- ---------- EXAM SCHEDULE ----------
INSERT INTO exam_schedule (
    exam_id, course_id, semester_id, exam_type,
    exam_date, exam_start_time, exam_end_time, invigilator_lecturer_id
) VALUES
(1, 101, 1, 'Written', '2025-04-15', '09:00', '12:00', 1),
(2, 102, 1, 'Written', '2025-04-18', '09:00', '12:00', 1),
(3, 103, 2, 'Written', '2025-08-20', '10:00', '13:00', 2),
(4, 105, 1, 'Written', '2025-04-22', '09:00', '12:00', 3);



-- ---------- EXAM RESULTS ----------
INSERT INTO exam_results (
    result_id, exam_id, student_id, score
) VALUES
(1, 1, 1, 74.50),
(2, 2, 1, 68.00),
(3, 3, 2, 71.25),
(4, 4, 3, 66.00);


-- ---------- ATTENDANCE ----------
INSERT INTO attendance (
    attendance_id, enrollment_id, date, status
) VALUES
(1, 1001, '2025-02-03', 'Present'),
(2, 1001, '2025-02-10', 'Absent'),
(3, 1002, '2025-02-03', 'Present'),
(4, 1003, '2025-06-05', 'Present'),
(5, 1005, '2025-02-07', 'Present');
