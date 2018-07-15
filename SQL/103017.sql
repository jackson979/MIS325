--left join
SELECT department_name AS dept_name,
    d.department_number AS dept_no, --must specify which table column came from if column found in both tables
    last_name
FROM departments d
    LEFT JOIN employees e
    ON d.department_number = e.department_number
ORDER BY department_name;

--right join
SELECT department_name AS dept_name,
        e.department_number AS dept_no,
        last_name
FROM departments d     
        RIGHT JOIN employees e
        ON d.department_number = e.department_number
ORDER BY department_name;

--full join
SELECT department_name AS dept_name,
        d.department_number AS d_dept_no,
        e.department_number AS e_dept_no,
        last_name
FROM departments d
        FULL JOIN employees e
        ON d.department_number = e.department_number
ORDER BY department_name;

--left join multiple tables
SELECT department_name, last_name, project_number AS proj_no
FROM departments d
    LEFT JOIN employees e
        ON d.department_number = e.department_number
    LEFT JOIN projects p
        ON e.employee_id =p.employee_id
ORDER BY department_name, last_name, project_number;

--in-class exercise
SELECT g.account_number, account_description, line_item_amt, line_item_description
FROM general_ledger_accounts g INNER JOIN invoice_line_items i
    ON g.account_number = i.account_number
ORDER BY account_number;

SELECT g.account_number, account_description, line_item_amt, line_item_description
FROM general_ledger_accounts g LEFT JOIN invoice_line_items i
    ON g.account_number = i.account_number
ORDER BY g.account_number;

SELECT g.account_number, account_description, line_item_amt, line_item_description
FROM general_ledger_accounts g RIGHT JOIN invoice_line_items i
    ON g.account_number = i.account_number
ORDER BY i.account_number;

SELECT g.account_number, account_description, line_item_amt, line_item_description
FROM general_ledger_accounts g FULL JOIN invoice_line_items i
    ON g.account_number = i.account_number
ORDER BY g.account_number;