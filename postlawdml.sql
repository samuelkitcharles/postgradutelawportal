INSERT INTO semesters (semester_id, name, start_date, end_date) VALUES
(1, 'Semester 1', '2025-09-01', '2025-12-20'),
(2, 'Semester 2', '2026-01-15', '2026-05-01'),
(3, 'Semester 3', '2026-09-01', '2026-12-20'),
(4, 'Semester 4', '2027-01-15', '2027-05-01');

INSERT INTO programs (program_id, program_name) VALUES
(1, 'LLM in International Law'),
(2, 'LLM in Commercial Law'),
(3, 'LLM in Criminal Law'),
(4, 'LLM in Human Rights Law');

--program 1 course per semester--
--1st semster--
INSERT INTO courses VALUES
(101, 'INTL101', 'Foundations of International Law', 1, 1),
(102, 'INTL102', 'Treaty Law', 1, 1),
(103, 'INTL103', 'Public International Law', 1, 1),
(104, 'INTL104', 'International Legal Research', 1, 1),
(105, 'INTL105', 'Law of International Organizations', 1, 1);
--2nd semster--
INSERT INTO courses VALUES
(106, 'INTL201', 'International Trade Law', 1, 2),
(107, 'INTL202', 'International Environmental Law', 1, 2),
(108, 'INTL203', 'International Humanitarian Law', 1, 2),
(109, 'INTL204', 'International Dispute Resolution', 1, 2),
(110, 'INTL205', 'Comparative Public Law', 1, 2);

--3rd semster--
INSERT INTO courses VALUES
(111, 'INTL301', 'Law of the Sea', 1, 3),
(112, 'INTL302', 'International Criminal Law', 1, 3),
(113, 'INTL303', 'International Investment Law', 1, 3),
(114, 'INTL304', 'Use of Force in International Law', 1, 3),
(115, 'INTL305', 'State Responsibility', 1, 3);

--4th semester--
INSERT INTO courses VALUES
(116, 'INTL401', 'Advanced International Litigation', 1, 4),
(117, 'INTL402', 'Human Rights in International Law', 1, 4),
(118, 'INTL403', 'International Arbitration', 1, 4),
(119, 'INTL404', 'Global Governance', 1, 4),
(120, 'INTL405', 'LLM Dissertation', 1, 4);



--program 2 courses per semester--
--1st semestser--
INSERT INTO courses VALUES
(201, 'COMM101', 'Principles of Commercial Law', 2, 1),
(202, 'COMM102', 'Contract Law', 2, 1),
(203, 'COMM103', 'Company Law', 2, 1),
(204, 'COMM104', 'Legal Research Methods', 2, 1),
(205, 'COMM105', 'Comparative Commercial Law', 2, 1);

--2nd semester--
INSERT INTO courses VALUES
(206, 'COMM201', 'Corporate Governance', 2, 2),
(207, 'COMM202', 'Banking and Finance Law', 2, 2),
(208, 'COMM203', 'International Commercial Arbitration', 2, 2),
(209, 'COMM204', 'Competition Law', 2, 2),
(210, 'COMM205', 'Sale of Goods', 2, 2);

--3rd semester--
INSERT INTO courses VALUES
(211, 'COMM301', 'Mergers and Acquisitions', 2, 3),
(212, 'COMM302', 'Securities Regulation', 2, 3),
(213, 'COMM303', 'Insolvency Law', 2, 3),
(214, 'COMM304', 'Intellectual Property Law', 2, 3),
(215, 'COMM305', 'Taxation of Business', 2, 3);

--4th semester--
INSERT INTO courses VALUES
(216, 'COMM401', 'Advanced Corporate Law', 2, 4),
(217, 'COMM402', 'Cross-Border Transactions', 2, 4),
(218, 'COMM403', 'Compliance and Risk Management', 2, 4),
(219, 'COMM404', 'Commercial Litigation', 2, 4),
(220, 'COMM405', 'LLM Dissertation', 2, 4);


--program 3 courses per semester--
INSERT INTO courses VALUES
(301, 'CRIM101', 'Foundations of Criminal Law', 3, 1),
(302, 'CRIM102', 'Criminal Procedure', 3, 1),
(303, 'CRIM103', 'Evidence Law', 3, 1),
(304, 'CRIM104', 'Legal Research', 3, 1),
(305, 'CRIM105', 'Comparative Criminal Justice', 3, 1),

(306, 'CRIM201', 'Criminology', 3, 2),
(307, 'CRIM202', 'Cyber Crime Law', 3, 2),
(308, 'CRIM203', 'International Criminal Law', 3, 2),
(309, 'CRIM204', 'Victimology', 3, 2),
(310, 'CRIM205', 'Forensic Evidence', 3, 2),

(311, 'CRIM301', 'White Collar Crime', 3, 3),
(312, 'CRIM302', 'Terrorism Law', 3, 3),
(313, 'CRIM303', 'Sentencing and Punishment', 3, 3),
(314, 'CRIM304', 'Juvenile Justice', 3, 3),
(315, 'CRIM305', 'Penology', 3, 3),

(316, 'CRIM401', 'Advanced Criminal Litigation', 3, 4),
(317, 'CRIM402', 'Human Rights in Criminal Justice', 3, 4),
(318, 'CRIM403', 'Comparative Penal Systems', 3, 4),
(319, 'CRIM404', 'Criminal Policy', 3, 4),
(320, 'CRIM405', 'LLM Dissertation', 3, 4);


--program 4 courses per semester--
INSERT INTO courses VALUES
(401, 'HR101', 'Introduction to Human Rights Law', 4, 1),
(402, 'HR102', 'International Human Rights Instruments', 4, 1),
(403, 'HR103', 'Legal Research', 4, 1),
(404, 'HR104', 'Comparative Human Rights', 4, 1),
(405, 'HR105', 'Public Law Foundations', 4, 1),

(406, 'HR201', 'Regional Human Rights Systems', 4, 2),
(407, 'HR202', 'Refugee and Asylum Law', 4, 2),
(408, 'HR203', 'Minority Rights', 4, 2),
(409, 'HR204', 'Women and the Law', 4, 2),
(410, 'HR205', 'Children’s Rights', 4, 2),

(411, 'HR301', 'Human Rights Litigation', 4, 3),
(412, 'HR302', 'Business and Human Rights', 4, 3),
(413, 'HR303', 'Freedom of Expression', 4, 3),
(414, 'HR304', 'Humanitarian Law', 4, 3),
(415, 'HR305', 'Socio-Economic Rights', 4, 3),

(416, 'HR401', 'Advanced Human Rights Advocacy', 4, 4),
(417, 'HR402', 'Transitional Justice', 4, 4),
(418, 'HR403', 'Human Rights Policy', 4, 4),
(419, 'HR404', 'Global Justice', 4, 4),
(420, 'HR405', 'LLM Dissertation', 4, 4);
