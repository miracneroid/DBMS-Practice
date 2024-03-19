-- Show Database --
SHOW DATABASES;

-- Create a database for the MySQL version
DROP DATABASE IF EXISTS DBMS_LAB;

-- Create a database for the MySQL version
CREATE DATABASE DBMS_LAB;

-- Switch to the newly created database
USE DBMS_LAB;

-- 7.5
DELIMITER //

CREATE PROCEDURE check_leap_year(IN year_value INT)
BEGIN
    IF ((year_value % 4 = 0 AND year_value % 100 != 0) OR (year_value % 400 = 0)) THEN
        SELECT CONCAT(year_value, ' is a leap year') AS Result;
    ELSE
        SELECT CONCAT(year_value, ' is not a leap year') AS Result;
    END IF;
END //

DELIMITER ;