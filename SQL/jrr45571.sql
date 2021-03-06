--column-level constraints
/*CREATE TABLE invoices_test2
(
    invoice_id      NUMBER      PRIMARY KEY,
    vendor_id       NUMBER      REFERENCES vendors (vendor_id),
    invoice_number  VARCHAR(50)         NOT NULL        UNIQUE
)


--table-level constraints after columns created
CREATE TABLE invoices_test5
(
    invoice_id      NUMBER          PRIMARY KEY,
    invoice_total   NUMBER(9,2)     NOT NULL,
    payment_total   NUMBER(9,2)     DEFAULT 0,
    CONSTRAINT invoices_ck_test5 CHECK (invoice_total >= 0 AND payment_total >= 0)
)


--violates parameters from above
INSERT INTO invoices_test5
VALUES (1, 99.99, -10)


--adding columns
ALTER TABLE vendors_test1
ADD last_transaction_date DATE;


--dropping columns
ALTER TABLE vendors_test1
DROP COLUMN last_transaction_date;


--modifying columns
--change length of VARCHAR2
ALTER TABLE ve2ndors_test1
MODIFY vendor_name VARCHAR2(100);
--change type of data to CHAR
ALTER TABLE vendors_test1
MODIFY vendor_name CHAR(100);
--change/add a DEFAULT value
ALTER TABLE vendors_test1
MODIFY vendor_name DEFAULT 'New Vendor';


--modifying constraints

--adding a constraint
ALTER TABLE invoices_test1
ADD CONSTRAINT invoice_total_ck_test
        CHECK (invoice_total >= 0);
        
--dropping constraint
ALTER TABLE invoices_test1
DROP CONSTRAINT invoice_total_ck_test;

--adding a disabled constraint
INSERT INTO invoices_test1
VALUES(2, 1, -5, 0);

ALTER TABLE invoices_test1
ADD CONSTRAINT invoice_total_ck_test
        CHECK (invoice_total >= 1) DISABLE;

INSERT INTO invoices_test1
VALUES(3, 1, -10, 0);

--enable contraint with new values only (using the disabled constraint from previous step)
ALTER TABLE invoices_test1
ENABLE NOVALIDATE CONSTRAINT invoice_total_ck_test;

INSERT INTO invoices_test1
VALUES(4, 1, -20, 0);

ALTER TABLE invoices_test1
ENABLE CONSTRAINT invoice_total_ck_test;

--disable constraint
ALTER TABLE invoices_test1
DISABLE CONSTRAINT invoice_total_ck_test;*/


