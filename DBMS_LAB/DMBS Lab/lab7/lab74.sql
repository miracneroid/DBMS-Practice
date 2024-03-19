-- Show Database --
SHOW DATABASES;

-- Create a database for the MySQL version
DROP DATABASE IF EXISTS DBMS_LAB;

-- Create a database for the MySQL version
CREATE DATABASE DBMS_LAB;

-- Switch to the newly created database
USE DBMS_LAB;

-- 7.4
DELIMITER //

CREATE PROCEDURE generate_multiplication_table(IN num INT)
BEGIN
    DECLARE counter INT DEFAULT 1;
    
    WHILE counter <= 10 DO
        SELECT CONCAT(num, '*', counter, '=', num * counter) AS Result;
        SET counter := counter + 1;
    END WHILE;
END //

DELIMITER ;