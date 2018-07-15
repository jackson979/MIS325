--Assignment 4
--Jackson Ross jrr4557

--1
SELECT category_name, product_name, list_price
FROM categories c JOIN products p
    ON c.category_id = p.category_id
ORDER BY category_name, product_name;

--2
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers_mgs c JOIN addresses a
    ON c.customer_id = a.customer_id
WHERE email_address = 'allan.sherwood@yahoo.com';

--3
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers_mgs 
    JOIN orders_mgs USING (customer_id)
    JOIN order_items USING (order_id)
    JOIN products USING (product_id)
ORDER BY last_name, order_date, product_name;

--4
SELECT product1.product_name, product1.list_price
FROM products product1 JOIN products product2
    ON product1.list_price = product2.list_price
WHERE product1.product_id <> product2.product_id
ORDER BY 1;

--5
SELECT category_name, product_id
FROM categories c LEFT JOIN products p
    USING (category_id)
WHERE p.product_id IS NULL;

--5 alternative
    SELECT category_name, product_id
    FROM categories c LEFT JOIN products p
        USING (category_id)
MINUS
    SELECT category_name, product_id
    FROM categories c JOIN products p
        USING (category_id);

--6
    SELECT 'SHIPPED' AS ship_status, order_id, order_date
    FROM orders_mgs
    WHERE ship_date IS NOT NULL
UNION
    SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
    FROM orders_mgs
    WHERE ship_date IS NULL
ORDER BY order_date;