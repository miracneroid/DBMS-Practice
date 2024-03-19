-- Show Database --
SHOW DATABASES;

-- Create a database for the MySQL version
DROP DATABASE IF EXISTS DBMS_LAB;

-- Create a database for the MySQL version
CREATE DATABASE DBMS_LAB;

-- Switch to the newly created database
USE DBMS_LAB;

-- Create tables
CREATE TABLE student (
    studentid CHAR(6) PRIMARY KEY,
    lname VARCHAR(30) NOT NULL,
    fname VARCHAR(30) NOT NULL,
    street VARCHAR(50),
    city VARCHAR(30),
    state VARCHAR(2) DEFAULT 'nj',
    zip VARCHAR(5),
    startterm CHAR(4),
    birthday DATE,
    facultyid INT(10),
    majorid INT(10),
    phone CHAR(10)
);

CREATE TABLE faculty (
    facultyid INT(10) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    roomid INT(10),
    phone CHAR(3) UNIQUE,
    deptid INT(10)
);

CREATE TABLE crssection (
    csid INT(10) PRIMARY KEY,
    courseid VARCHAR(12) NOT NULL,
    section CHAR(2) NOT NULL,
    termid CHAR(4) NOT NULL,
    facultyid INT(10),
    day VARCHAR(4),
    starttime VARCHAR(10),
    endtime VARCHAR(10),
    roomid INT(10),
    maxcount INT(10) CHECK (maxcount > 0)
);

CREATE TABLE course (
    courseid VARCHAR(12) PRIMARY KEY,
    title VARCHAR(40) UNIQUE,
    credits INT(10) CHECK (credits >= 0 AND credits <= 4),
    prereq VARCHAR(12)
);

CREATE TABLE registration (
    studentid CHAR(5) PRIMARY KEY,
    csid INT(10),
    midterm CHAR CHECK (midterm IN ('A', 'B', 'C', 'D', 'F', 'W')),
    final CHAR CHECK (final IN ('A', 'B', 'C', 'D', 'I', 'F', 'W')),
    regstatus CHAR CHECK (regstatus IN ('X', 'R', 'W'))
);

CREATE TABLE room (
    roomtype CHAR PRIMARY KEY,
    roomdesc VARCHAR(18)
);

CREATE TABLE location (
    roomid INT(10) PRIMARY KEY,
    building VARCHAR(14) NOT NULL,
    roomno CHAR(3) NOT NULL,
    capacity INT(10) CHECK (capacity > 0),
    roomtype CHAR
);

CREATE TABLE term (
    termid CHAR(4) PRIMARY KEY,
    termdesc VARCHAR(22),
    startdate DATE,
    enddate DATE
);

CREATE TABLE department (
    deptid INT(10) PRIMARY KEY,
    deptname VARCHAR(40),
    facultyid INT(10)
);

CREATE TABLE major (
    majorid INT(10) PRIMARY KEY,
    majordesc VARCHAR(50)
);

-- Insert data into tables
-- Insert data into tables
-- Insert into Course table
INSERT INTO course (courseid, title, credits, prereq)
VALUES
    ('EN100', 'Basic English', 0, NULL),
    ('LA123', 'English Literature', 3, 'EN100'),
    ('CIS253', 'Database Systems', 3, NULL),
    ('CIS265', 'Systems Analysis', 3, 'CIS253'),
    ('MA150', 'College Algebra', 3, NULL),
    ('AC101', 'Accounting', 3, NULL);

-- Insert into Room table
INSERT INTO room (roomtype, roomdesc)
VALUES
    ('L', 'Lab'),
    ('C', 'Classroom'),
    ('O', 'Office');

-- Insert into Term table
INSERT INTO term (termid, termdesc, startdate, enddate)
VALUES
    ('SP02', 'Spring 2002', '2002-04-28', '2002-08-16'),
    ('FL02', 'Fall 2002', '2002-09-08', '2002-12-20'),
    ('WN03', 'Winter 2003', '2003-01-05', '2003-04-18'),
    ('SP03', 'Spring 2003', '2003-04-27', '2003-08-15'),
    ('FL03', 'Fall 2003', '2003-09-07', '2003-12-19');

-- Insert into Major table
INSERT INTO major (majorid, majordesc)
VALUES
    (100, 'AAS-Accounting'),
    (200, 'AAS-Computer Science'),
    (300, 'AAS-Telecommunications'),
    (400, 'BS-Accounting'),
    (500, 'BS-Computer Science'),
    (600, 'BS-Telecommunications');

-- Insert into Department table
INSERT INTO department (deptid, deptname, facultyid)
VALUES
    (1, 'Computer Science', 111),
    (2, 'Telecommunications', 222),
    (3, 'Accounting', 333),
    (4, 'Math and Science', 444),
    (5, 'Liberal Arts', 555);

-- Insert into Location table
INSERT INTO location (roomid, building, roomno, capacity, roomtype)
VALUES
    (11, 'Gandhi', '101', 2, 'O'),
    (12, 'Gandhi', '103', 2, 'O'),
    (13, 'Kennedy', '202', 35, 'L'),
    (14, 'Kennedy', '204', 50, 'L'),
    (15, 'Nehru', '301', 50, 'C'),
    (16, 'Nehru', '309', 45, 'C'),
    (17, 'Gandhi', '105', 2, 'O'),
    (18, 'Kennedy', '206', 40, 'L'),
    (19, 'Kennedy', '210', 30, 'L'),
    (20, 'Gandhi', '107', 2, 'O'),
    (21, 'Gandhi', '109', 2, 'O');

-- Insert into Faculty table
INSERT INTO faculty (facultyid, name, roomid, phone, deptid)
VALUES
    (111, 'Jones', 11, '525', 1),
    (222, 'Williams', 20, '533', 2),
    (123, 'Mobley', 11, '529', 1),
    (235, 'Vajpayee', 12, '577', 2),
    (345, 'Sen', 12, '579', 3),
    (444, 'Rivera', 21, '544', 4),
    (555, 'Chang', 17, '587', 5),
    (333, 'Collins', 17, '599', 3);

-- Insert into Student table
INSERT INTO student (studentid, lname, fname, street, city, state, zip, startterm, birthday, facultyid, majorid, phone)
VALUES
    ('00100', 'Diaz', 'Jose', '1 Ford Avenue #7', 'Hill', 'NJ', '08863', 'WN03', '1983-02-12', 123, 100, '9735551111'),
    ('00101', 'Tyler', 'Mickey', '12 Morris Avenue', 'Bronx', 'NY', '10468', 'SP03', '1984-03-18', 555, 500, '7185552222'),
    ('00102', 'Patel', 'Rajesh', '25 River Road #3', 'Edison', 'NJ', '08837', 'WN03', '1985-12-12', 111, 400, '7325553333'),
    ('00103', 'Rickles', 'Deborah', '100 Main Street', 'Iselin', 'NJ', '08838', 'FL02', '1970-10-20', 555, 500, '7325554444'),
    ('00104', 'Lee', 'Brian', '2845 First Lane', 'Hope', 'NY', '11373', 'WN03', '1985-11-28', 345, 600, '2125555555'),
    ('00105', 'Khan', 'Amir', '213 Broadway', 'Clifton', 'NJ', '07222', 'WN03', '1984-07-07', 222, 200, '2015556666');

-- Insert into Crssection table
INSERT INTO crssection (csid, courseid, section, termid, facultyid, day, starttime, endtime, roomid, maxcount)
VALUES
    (1101, 'CIS265', '01', 'WN03', 111, 'MW', '09:00', '10:30', 13, 30),
    (1102, 'CIS253', '01', 'WN03', 123, 'TR', '09:00', '10:30', 18, 40),
    (1103, 'MA150', '02', 'WN03', 444, 'F', '09:00', '12:00', 15, 25),
    (1104, 'AC101', '10', 'WN03', 345, 'MW', '10:30', '12:00', 16, 35),
    (1205, 'CIS265', '01', 'SP03', NULL, 'MW', '09:00', '10:30', 14, 35),
    (1206, 'CIS265', '02', 'SP03', 111, 'TR', '09:00', '10:30', 18, 30),
    (1207, 'LA123', '05', 'SP03', NULL, 'MW', '09:00', '10:30', 15, 30),
    (1208, 'CIS253', '21', 'SP03', 123, 'TR', '09:00', '10:30', 14, 40),
    (1209, 'CIS253', '11', 'SP03', 111, 'MW', '09:00', '10:30', 18, 40),
    (1210, 'CIS253', '31', 'SP03', 123, 'F', 'TBA', 'TBA', 19, 2);

-- Update data in the Registration table
UPDATE registration
SET
    midterm = CASE
        WHEN studentid = '00100' AND csid = 1103 THEN 'C'
        WHEN studentid = '00100' AND csid = 1102 THEN 'B'
        WHEN studentid = '00100' AND csid = 1104 THEN 'B'
        WHEN studentid = '00102' AND csid = 1102 THEN 'F'
        WHEN studentid = '00102' AND csid = 1103 THEN 'A'
        WHEN studentid = '00103' AND csid = 1101 THEN 'F'
        WHEN studentid = '00103' AND csid = 1104 THEN 'D'
    END,
    final = CASE
        WHEN studentid = '00100' AND csid = 1103 THEN 'F'
        WHEN studentid = '00100' AND csid = 1102 THEN 'B'
        WHEN studentid = '00100' AND csid = 1104 THEN 'A'
        WHEN studentid = '00102' AND csid = 1102 THEN 'D'
        WHEN studentid = '00102' AND csid = 1103 THEN 'A'
        -- Add similar cases for other records
    END,
    regstatus = CASE
        WHEN studentid = '00100' AND csid = 1207 THEN 'X'
        WHEN studentid = '00103' AND csid = 1206 THEN 'W'
        WHEN studentid = '00104' AND csid = 1206 THEN 'X'
        WHEN studentid = '00104' AND csid = 1207 THEN 'R'
        WHEN studentid = '00104' AND csid = 1210 THEN 'R'
        WHEN studentid = '00105' AND csid = 1208 THEN 'R'
        WHEN studentid = '00105' AND csid = 1209 THEN 'X'
        WHEN studentid = '00101' AND csid = 1205 THEN 'X'
        WHEN studentid = '00102' AND csid = 1210 THEN 'R'
        WHEN studentid = '00102' AND csid = 1207 THEN 'R'
        WHEN studentid = '00102' AND csid = 1206 THEN 'X'
        -- Add similar cases for other records
    END
WHERE (studentid, csid) IN (('00100', 1103), ('00100', 1102), ('00100', 1104), ('00102', 1102), ('00102', 1103), ('00103', 1101), ('00103', 1104), ('00100', 1207), ('00103', 1206), ('00104', 1206), ('00104', 1207), ('00104', 1210), ('00105', 1208), ('00105', 1209), ('00101', 1205), ('00102', 1210), ('00102', 1207), ('00102', 1206));

-- (Insert statements remain the same)

-- Add foreign key constraints
ALTER TABLE student
ADD CONSTRAINT fk_student_startterm FOREIGN KEY (startterm) REFERENCES term(termid);

ALTER TABLE student
ADD CONSTRAINT fk_student_facultyid FOREIGN KEY (facultyid) REFERENCES faculty(facultyid) ON DELETE RESTRICT;

ALTER TABLE student
ADD CONSTRAINT fk_student_majorid FOREIGN KEY (majorid) REFERENCES major(majorid) ON DELETE RESTRICT;

ALTER TABLE faculty
ADD CONSTRAINT fk_faculty_roomid FOREIGN KEY (roomid) REFERENCES location(roomid);

ALTER TABLE faculty
ADD CONSTRAINT fk_faculty_deptid FOREIGN KEY (deptid) REFERENCES department(deptid) ON DELETE RESTRICT;

ALTER TABLE crssection
ADD FOREIGN KEY (courseid) REFERENCES course(courseid);

ALTER TABLE crssection
ADD CONSTRAINT fk_crssection_termid FOREIGN KEY (termid) REFERENCES term(termid);

ALTER TABLE crssection
ADD CONSTRAINT fk_crssection_facultyid FOREIGN KEY (facultyid) REFERENCES faculty(facultyid);

ALTER TABLE crssection
ADD CONSTRAINT fk_crssection_roomid FOREIGN KEY (roomid) REFERENCES location(roomid);

ALTER TABLE course
ADD CONSTRAINT fk_course_prereq FOREIGN KEY (prereq) REFERENCES course(courseid);

ALTER TABLE registration
ADD CONSTRAINT fk_registration_studentid FOREIGN KEY (studentid) REFERENCES student(studentid);

ALTER TABLE registration
ADD CONSTRAINT fk_registration_csid FOREIGN KEY (csid) REFERENCES crssection(csid);

ALTER TABLE location
ADD CONSTRAINT fk_location_roomtype FOREIGN KEY (roomtype) REFERENCES room(roomtype);

ALTER TABLE department
ADD CONSTRAINT fk_department_facultyid FOREIGN KEY (facultyid) REFERENCES faculty(facultyid);

-- Queries (for question 3)
-- 3.1 Display unique building names from LOCATION table
SELECT DISTINCT Building
FROM location;

-- 3.2 Display all course sections offered in Winter 2003
SELECT CourseID, Section, TermID
FROM crssection
WHERE TermID = 'WN03';

-- 3.3 Display names of faculty members who work in department 1 or 2
SELECT *
FROM faculty
WHERE DeptID IN (1, 2)
ORDER BY DeptID DESC, Name;

-- 3.4 Find all New York and New Jersey students
SELECT StudentID, LName, FName, State
FROM student
WHERE State IN ('NY', 'NJ');

-- 3.5 For each course ID, display the maximum count in descending order
SELECT CourseID, Section, MAX(MaxCount) AS MaxCount
FROM crssection
GROUP BY CourseID, Section
ORDER BY MaxCount DESC;

-- 3.6 Find courses with no required prerequisite
SELECT courseid, title, IFNULL(prereq, 'None') AS Prerequisite
FROM course;

-- 3.7 Display faculty names in descending order by their department, but in alphabetical order by their name within each department
SELECT *
FROM faculty
ORDER BY DeptID DESC, Name;

-- 3.8 Find students who started in year 2003. Use start term column and wildcard.
SELECT StudentID, LName, FName, StartTerm
FROM student
WHERE StartTerm LIKE '20__';

-- 3.9 Count the total number of rooms in LOCATION
SELECT COUNT(*) AS TotalRooms
FROM location;

-- 3.10 Find the average, highest, and lowest age for students
SELECT AVG(YEAR(NOW()) - YEAR(Birthday)) AS AverageAge,
       MAX(YEAR(NOW()) - YEAR(Birthday)) AS HighestAge,
       MIN(YEAR(NOW()) - YEAR(Birthday)) AS LowestAge
FROM student;

-- 3.11 Display courses and prerequisites. If there is no prerequisite, display ‘none’ else display ‘one’
SELECT c.courseid, c.title, IFNULL(p.title, 'None') AS Prerequisite
FROM course c
LEFT JOIN course p ON c.prereq = p.courseid;

-- 3.12 Find students who are born in the month of July
SELECT CONCAT(FName, ' ', LName) AS StudentName, DATE_FORMAT(Birthday, '%m-%d-%y') AS Birthdate
FROM student
WHERE MONTH(Birthday) = 7;

-- Queries (for question 4)
-- 4.1 Find sum of Maximum count by term by course. (GROUP BY two columns)
SELECT TermID, CourseID, MAX(MaxCount) AS SumMaxCount
FROM crssection
GROUP BY TermID, CourseID;

-- 4.2 Display a student’s full name along with his/her major’s description.
SELECT CONCAT(LName, ' ', FName) AS StudentName, major.majordesc AS MajorDescription
FROM student
JOIN major ON student.majorid = major.majorid;

-- 4.3 Get names of students who received a final grade ‘F’ in Winter 2003.
SELECT CONCAT(LName, ' ', FName) AS StudentName, course.title AS CourseTitle, crssection.section, registration.final
FROM student
JOIN registration ON student.studentid = registration.studentid
JOIN crssection ON registration.csid = crssection.csid
JOIN course ON crssection.courseid = course.courseid
WHERE registration.final = 'F' AND crssection.termid = 'WN03';

-- 4.4 Display student names, their faculty advisors' names, and faculty’s office location.
SELECT CONCAT(student.LName, ', ', student.FName) AS StudentName, faculty.name AS AdvisorName, location.building, location.roomno
FROM student
JOIN faculty ON student.facultyid = faculty.facultyid
JOIN location ON faculty.roomid = location.roomid;

-- 4.5 Display course titles along with their prerequisite names. Display courses without prerequisites also.
SELECT c.title AS CourseTitle, IFNULL(p.title, 'None') AS Prerequisite
FROM course c
LEFT JOIN course p ON c.prereq = p.courseid;

-- 4.6 Get Spring 2003 course sections with the faculty member assigned to teach the class.
-- Include course sections without any faculty assigned to them.
SELECT cs.courseid, cs.section, COALESCE(faculty.name, 'No Faculty Assigned') AS FacultyName
FROM crssection cs
LEFT JOIN faculty ON cs.facultyid = faculty.facultyid
WHERE cs.termid = 'SP03';

-- Queries (for question 5)
-- 5.1 Display student Jose Diaz’s faculty advisor’s name and phone number.
SELECT faculty.name AS AdvisorName, faculty.phone
FROM student
JOIN faculty ON student.facultyid = faculty.facultyid
WHERE CONCAT(student.LName, ' ', student.FName) = 'Diaz Jose';

-- 5.2 Find rooms with bottom-2 capacities. Do not include office rooms.
SELECT *
FROM location
WHERE roomtype != 'O'
ORDER BY capacity
LIMIT 2;

-- 5.3 Find Spring 2003 course sections with the top three maximum count numbers.
SELECT courseid, section, maxcount
FROM crssection
WHERE termid = 'SP03'
ORDER BY maxcount DESC
LIMIT 3;

-- 5.4 Find all information regarding classrooms (RoomType = ‘C’).
SELECT *
FROM location
WHERE roomtype = 'C';

-- 5.5 Create a new table, SP03SECT, for Spring 2003 semester course sections using a subquery.
-- Include CourseId, Section, FacultyId, and RoomId columns only.
CREATE TABLE SP03SECT AS
SELECT CourseId, Section, FacultyId, RoomId
FROM crssection
WHERE termid = 'SP03';

-- 5.6 Find details of SP03SECT.
SELECT *
FROM SP03SECT;

-- 5.7 Delete rows from SP03SECT table for faculty Mobley.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM SP03SECT
WHERE FacultyId IN (SELECT facultyid FROM faculty WHERE name = 'Mobley');

-- Queries (for question 6)

-- 6.1 Create a view for the studentid, first name, last name, and phone no.
CREATE VIEW StudentDetails AS
SELECT StudentID, FName, LName, Phone
FROM student;
-- Output: View created

-- 6.2 Create a view for the details of crssection for section 02.
CREATE VIEW Section02Details AS
SELECT *
FROM crssection
WHERE Section = '02';
-- Output: View created

-- 6.3 Create a view for faculty name, phone, deptname, and building name.
CREATE VIEW FacultyDetails AS
SELECT faculty.name AS FacultyName, faculty.phone, department.deptname, location.building
FROM faculty
JOIN department ON faculty.deptid = department.deptid
JOIN location ON faculty.roomid = location.roomid;
-- Output: View created

-- 6.4 Create a view for Room details.
CREATE VIEW RoomDetails AS
SELECT
    RoomID,
    RoomType,
    Building,
    RoomNo,
    Capacity
FROM location;
-- Output: View created

-- Insert a new room through the view
INSERT INTO RoomDetails (RoomType, Building, RoomNo, Capacity)
VALUES ('C', 'NewBuilding', '001', 50);

-- Note: Adjust the column names accordingly based on your LOCATION table structure
-- Output: New room inserted through the view

-- Verify the new row in the actual LOCATION table
SELECT *
FROM location
ORDER BY RoomID DESC
LIMIT 1;

-- 6.5 Create an index to search students faster based on their major ID.
CREATE INDEX idx_majorid ON student (majorid);
-- Output: Index created

-- 6.6 Create a sequence to add room IDs and then insert a new room into LOCATION table
-- using the newly created sequence. What is the CURRVAL after the new row is inserted?
CREATE SEQUENCE room_sequence START WITH 1 INCREMENT BY 1;
-- Output: Sequence created

-- Insert a new room using the sequence
INSERT INTO location (RoomID, RoomType, RoomDesc, Building, RoomNo, Capacity)
VALUES (NEXTVAL(room_sequence), 'L', 'Lab', 'NewBuilding', '002', 40);
-- Note: Adjust the column names accordingly based on your LOCATION table structure

-- Retrieve the current value of the sequence
SELECT CURRVAL(room_sequence) AS CurrentValue;

-- 6.7 GRANT only SELECT privilege to another user on your TERM table.
GRANT SELECT ON DBMS_LAB.term TO 'another_user'@'localhost';
-- Output: Grant succeeded.

-- Queries (for question 7)
-- Queries (for question 8)
-- Queries (for question 9)
-- Queries (for question 10)
-- Queries (for question 11)
-- (Queries remain the same)
