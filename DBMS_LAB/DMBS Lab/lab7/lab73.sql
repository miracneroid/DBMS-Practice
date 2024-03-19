-- Show Database --
SHOW DATABASES;

-- Create a database for the MySQL version
DROP DATABASE IF EXISTS DBMS_LAB;

-- Create a database for the MySQL version
CREATE DATABASE DBMS_LAB;

-- Switch to the newly created database
USE DBMS_LAB;

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