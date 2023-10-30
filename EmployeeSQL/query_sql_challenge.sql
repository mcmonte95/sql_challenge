-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    employees.sex AS "Sex",
    salaries.salary AS "Salary"
FROM 
    employees
JOIN 
    salaries ON employees.emp_no = salaries.emp_no;
	
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
From
	employees
WHERE
	date_part('year', hire_date) = '1986';
	
-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    departments.dept_no AS "Department Number",
    departments.dept_name AS "Department Name",
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name"
FROM 
    departments 
JOIN 
    dept_manager dm ON departments.dept_no = dm.dept_no
JOIN 
    employees ON dm.emp_no = employees.emp_no;
	
-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
    dept_emp.dept_no AS "Department Number",
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    departments.dept_name AS "Department Name"
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no;
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
    first_name AS "First Name",
    last_name AS "Last Name",
    sex AS "Sex"
FROM
    employees
WHERE
    first_name = 'Hercules'
AND
    last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
    employees.first_name AS "First Name"
FROM
	employees
JOIN
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_name = 'Sales';
	
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM
	employees
JOIN
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name as "Last Name",
    COUNT(last_name) AS Frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC;
	
	
	