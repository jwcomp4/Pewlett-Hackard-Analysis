-- Sales retirees

SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO sales_info
FROM retirement_info as ri
INNER JOIN dept_emp as de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
WHERE (d.dept_no = 'd007');

-- Mentoring List

SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO mentoring_info
FROM retirement_info as ri
INNER JOIN dept_emp as de
ON ri.emp_no = de.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE d.dept_no IN ('d007', 'd005');