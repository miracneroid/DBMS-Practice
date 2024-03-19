-- Show Database --
SHOW DATABASES;

-- Create a database for the MySQL version
DROP DATABASE IF EXISTS DBMS_LAB;

-- Create a database for the MySQL version
CREATE DATABASE DBMS_LAB;

-- Switch to the newly created database
USE DBMS_LAB;

-- 7.2
SET @num1 := 5; -- Initialize num1 with a value
SET @num2 := 10; -- Initialize num2 with a value
SET @temp := NULL; -- Temporary variable for swapping

SELECT CONCAT('Before swap, num1=', @num1, ' and num2=', @num2) AS result;

-- Swap the values
SET @temp := @num1;
SET @num1 := @num2;
SET @num2 := @temp;

SELECT CONCAT('After swap, num1=', @num1, ' and num2=', @num2) AS result;