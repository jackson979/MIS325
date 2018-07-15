---#1
INSERT INTO categories
VALUES (5,'Woodwinds');

---#2
UPDATE categories
SET category_name = 'Brass'
WHERE category_id = 5;

---#3
INSERT INTO products
VALUES (11,5,'yas_480','Yamaha YAS-480 Saxophone','Long description to come.',799.99,0,SYSDATE);

---#4
UPDATE products
SET discount_percent = 35
WHERE product_id = 11;

---#5
DELETE FROM products
WHERE product_id = 11;

DELETE FROM categories
WHERE category_id = 5;

COMMIT;