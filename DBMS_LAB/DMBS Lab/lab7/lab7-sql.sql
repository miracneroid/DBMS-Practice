-- 7.1
SET SERVEROUTPUT ON;

DECLARE
    input_number NUMBER := 3; -- Set the input number here
    square NUMBER;
    cube NUMBER;
    double_value NUMBER;
BEGIN
    square := input_number * input_number;
    cube := input_number * input_number * input_number;
    double_value := 2 * input_number;

    DBMS_OUTPUT.PUT_LINE('number is ' || input_number);
    DBMS_OUTPUT.PUT_LINE('square is ' || square);
    DBMS_OUTPUT.PUT_LINE('cube is ' || cube);
    DBMS_OUTPUT.PUT_LINE('double is ' || double_value);
END;
/

-- 7.2
SET SERVEROUTPUT ON;

DECLARE
    num1 NUMBER := 5; -- Initialize num1 with a value
    num2 NUMBER := 10; -- Initialize num2 with a value
    temp NUMBER; -- Temporary variable for swapping
BEGIN
    -- Print variables before swapping
    DBMS_OUTPUT.PUT_LINE('Before swap, num1=' || num1 || ' and num2=' || num2);
    
    -- Swap the values
    temp := num1;
    num1 := num2;
    num2 := temp;
    
    -- Print variables after swapping
    DBMS_OUTPUT.PUT_LINE('After swap, num1=' || num1 || ' and num2=' || num2);
END;
/

-- 7.3
SET SERVEROUTPUT ON;

DECLARE
    i NUMBER; -- Loop counter
BEGIN
    -- Loop from 10 to 1 in reverse order
    FOR i IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 7.4
SELECT '5*' || LEVEL || '=' || (5 * LEVEL) AS Result
FROM DUAL
CONNECT BY LEVEL <= 10;

-- 7.5
DECLARE
    year_value INT;
BEGIN
    -- Input
    year_value := 2000;

    -- Check if the year is a leap year
    IF (MOD(year_value, 4) = 0 AND MOD(year_value, 100) != 0) OR (MOD(year_value, 400) = 0) THEN
        DBMS_OUTPUT.PUT_LINE(year_value || ' is a leap year');
    ELSE
        DBMS_OUTPUT.PUT_LINE(year_value || ' is not a leap year');
    END IF;
END;
