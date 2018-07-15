--Jackson Ross jrr4557
--HW 5
--11/19/2017

--#1
SELECT COUNT(*) AS order_count, SUM(tax_amount), MAX(tax_amount)
FROM orders_mgs;

--#2
SELECT category_name, COUNT(*) AS product_count, MAX(list_price) AS most_expensive_product
FROM products JOIN categories USING (category_id)
GROUP BY category_name
ORDER BY product_count DESC;

--#3
SELECT email_address, SUM(item_price * quantity) AS item_price_total, SUM(discount_amount * quantity) AS discount_amount_total
FROM order_items JOIN orders_mgs USING (order_id)
    JOIN customers_mgs USING (customer_id)
GROUP BY email_address
ORDER BY item_price_total DESC;

--#4
SELECT email_address, COUNT(om.order_id) AS order_count, SUM((item_price - discount_amount) * quantity) AS order_total
FROM order_items oi JOIN orders_mgs om ON oi.order_id = om.order_id
    JOIN customers_mgs cm ON om.customer_id = cm.customer_id 
GROUP BY email_address
HAVING COUNT(om.order_id) > 1
ORDER BY order_total DESC;

--#5
SELECT email_address, COUNT(om.order_id) AS order_count, SUM((item_price - discount_amount) * quantity) AS order_total
FROM order_items oi JOIN orders_mgs om ON oi.order_id = om.order_id
    JOIN customers_mgs cm ON om.customer_id = cm.customer_id
WHERE item_price > 400
GROUP BY email_address
HAVING COUNT(om.order_id) > 1
ORDER BY order_total DESC;

--#6
SELECT email_address, COUNT(DISTINCT oi.product_id) AS number_of_products
FROM order_items oi JOIN orders_mgs om ON oi.order_id = om.order_id
    JOIN customers_mgs cm ON om.customer_id = cm.customer_id
GROUP BY email_address
HAVING COUNT(DISTINCT oi.product_id) > 1
ORDER BY email_address ASC;