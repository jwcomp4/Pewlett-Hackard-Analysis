-- Refactoring retirement_info code to add emp_no to the retirement_info table

SELECT emp_no, first_name, last_name

INTO retirement_info

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Checking the table

SELECT * FROM retirement_info

-- Joining departments and dept_manager tables

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables

SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no;

-- Joining retirement_info and dept emp and putting into a new table

SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number

SELECT COUNT(ce.emp_no), de.dept_no

INTO count_emp

FROM current_emp AS ce

LEFT JOIN dept_emp AS de

ON ce.emp_no = de.emp_no

GROUP BY de.dept_no

ORDER BY de.dept_no;