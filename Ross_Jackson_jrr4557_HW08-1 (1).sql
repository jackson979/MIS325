---#1
SET SERVEROUTPUT ON;

DECLARE
    product_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO product_count
    FROM products;
    IF product_count >= 7 THEN
        DBMS_OUTPUT.PUT_LINE('The number of products is greater than or equal to 7.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number of products is less than 7.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;


---#2
SET SERVEROUTPUT ON;

DECLARE
    product_count NUMBER;
    list_price_avg NUMBER (9,3);
BEGIN
    SELECT COUNT(*), AVG(list_price)
    INTO product_count,list_price_avg
    FROM products;
    IF product_count >= 7 THEN
        DBMS_OUTPUT.PUT_LINE('Product count: ' || product_count);
        DBMS_OUTPUT.PUT_LINE('List price average: ' || list_price_avg);
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number of products is less than 7.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;


---#3
SET SERVEROUTPUT ON;

BEGIN
    INSERT INTO categories
    VALUES(1,'Guitars');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Row was not inserted - duplicate entry.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;