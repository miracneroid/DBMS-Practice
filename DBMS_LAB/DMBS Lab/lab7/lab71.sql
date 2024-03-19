-- Show Database --
SHOW DATABASES;

-- Create a database for the MySQL version
DROP DATABASE IF EXISTS DBMS_LAB;

-- Create a database for the MySQL version
CREATE DATABASE DBMS_LAB;

-- Switch to the newly created database
USE DBMS_LAB;

-- 7.1
SET @input_number := 3; -- Set the input number here
SET @square := @input_number * @input_number;
SET @cube := @input_number * @input_number * @input_number;
SET @double_value := 2 * @input_number;

SELECT CONCAT('number is ', @input_number) AS result UNION
SELECT CONCAT('square is ', @square) AS result UNION
SELECT CONCAT('cube is ', @cube) AS result UNION
SELECT CONCAT('double is ', @double_value) AS result;

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

-- 7.3
DELIMITER //

CREATE PROCEDURE print_reverse_order()
BEGIN
    DECLARE i INT DEFAULT 10; -- Loop counter
    
    WHILE i > 0 DO
        SELECT i;
        SET i := i - 1;
    END WHILE;
END //

DELIMITER ;

CALL print_reverse_order();

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

