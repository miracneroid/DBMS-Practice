-- 1.1 Create the database DBMS_LAB
CREATE DATABASE IF NOT EXISTS DBMS_LAB;
USE DBMS_LAB;

-- 1.1 Create the Employee table
CREATE TABLE Employee (
    EmployeeId INT(3),
    Lname VARCHAR(15),
    Fname VARCHAR(15),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

-- Output: Table created

-- 1.2 Insert 5 records to Employee table
INSERT INTO Employee (EmployeeId, Lname, Fname, HireDate, Salary)
VALUES 
    (1, 'Doe', 'John', '2022-01-01', 50000.00),
    (2, 'Smith', 'Jane', '2022-02-15', 60000.00),
    (3, 'Johnson', 'Bob', '2022-03-20', 55000.00),
    (4, 'Williams', 'Alice', '2022-04-10', 65000.00),
    (5, 'Brown', 'Chris', '2022-05-05', 70000.00);

-- Output: 1 row created (5 times)

-- 1.3 Fetch all data from Employee table
SELECT * FROM Employee;

-- Output: 5 rows returned from Employee table

-- 1.4 Modify the Employee table by adding 'city' as an extra column
ALTER TABLE Employee ADD COLUMN city VARCHAR(20);

-- Output: Table altered

-- 1.5 Modify the city value 'BBS' to 'Bhubaneswar'
SET SQL_SAFE_UPDATES = 0;
UPDATE Employee SET city = 'Bhubaneswar' WHERE city = 'BBS';
SET SQL_SAFE_UPDATES = 1;

-- Output: 1 row updated

-- 1.6 Delete the records with city value as 'CTC'
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Employee WHERE city = 'CTC';
SET SQL_SAFE_UPDATES = 1;

-- Output: 1 row deleted

-- 1.7 Remove Employee table
DROP TABLE Employee;

-- Output: Table dropped
