--Jackson Ross jrr4557
--HW 6
--11/25/2017

---#1
SELECT category_name
FROM categories c
WHERE c.category_id IN (SELECT DISTINCT category_id FROM products)
ORDER BY category_name;

---#2
SELECT product_name, list_price
FROM products
WHERE list_price > (SELECT AVG(list_price) FROM products)
ORDER BY list_price DESC;

---#3
SELECT p.product_name, p.discount_percent
FROM products p
WHERE p.discount_percent NOT IN 
    (SELECT ps.discount_percent 
    FROM products ps 
    WHERE p.product_name <> ps.product_name)
ORDER BY product_name;

---#4
SELECT vendor_name, vendor_city, vendor_state
FROM vendors v
WHERE vendor_city || vendor_state NOT IN 
    (SELECT vendor_city || vendor_state FROM vendors vs GROUP BY vendor_city || vendor_state HAVING COUNT(*) > 1)
ORDER BY vendor_city ASC, vendor_state ASC;