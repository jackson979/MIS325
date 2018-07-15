--select all fields
SELECT *
FROM invoices;

--select fields and order them
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
ORDER BY invoice_total;

--select fields and narrow down results
SELECT invoice_id, invoice_total, (credit_total + payment_total) AS total_credits
FROM invoices
WHERE invoice_id = 17;

--checking dates
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_date BETWEEN '01-MAY-2014' AND '31-MAY-2014'
ORDER BY invoice_date;

--concatenation
SELECT first_name || ' ' || last_name AS full_name
FROM vendor_contacts;

--naming columns using AS
SELECT invoice_number AS "Invoice Number",
       invoice_date AS "Date",
       invoice_total AS total
FROM invoices;

--naming columns without using AS
SELECT invoice_number "Invoice Number",
       invoice_date "Date",
       invoice_total total
FROM invoices;

--advanced concatenation
SELECT vendor_name,    
       vendor_city || ', '
                   || vendor_state
                   || ' '                 
                   || vendor_zip_code     
       AS address
FROM vendors;

--concatenations with apostrophes
SELECT vendor_name || '''s address: ',
       vendor_city || ', '                    
       || vendor_state                    
       || ' '                    
       || vendor_zip_code
FROM vendors;