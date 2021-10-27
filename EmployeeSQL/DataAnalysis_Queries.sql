--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM "Employees" AS emp
	LEFT JOIN "Salaries" AS sal ON sal.emp_no = emp.emp_no
ORDER BY emp.last_name ASC, emp.first_name ASC;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date from "Employees"
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Dept_Manager".dept_no, 
	   "Departments".dept_name,
	   "Dept_Manager".emp_no,
	   "Employees".last_name,
	   "Employees".first_name
FROM "Dept_Manager" 
INNER JOIN "Departments" ON
"Dept_Manager".dept_no = "Departments".dept_no
INNER JOIN "Employees" ON
"Dept_Manager".emp_no = "Employees".emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
"Employees".emp_no,
"Employees".last_name,
"Employees".first_name,
"Dept_Emp".dept_no,
"Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_Emp" ON "Employees".emp_no = "Dept_Emp".emp_no
INNER JOIN "Departments" ON "Departments".dept_no = "Dept_Emp".dept_no
order by emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
JOIN "Dept_Emp" ON
e.emp_no = "Dept_Emp".emp_no
INNER JOIN "Departments" AS d ON
"Dept_Emp".dept_no = d.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
JOIN "Dept_Emp" ON
e.emp_no = "Dept_Emp".emp_no
INNER JOIN "Departments" AS d ON
"Dept_Emp".dept_no = d.dept_no
WHERE dept_name = 'Sales' OR 
	  dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM "Employees"
GROUP BY last_name
ORDER BY freq_count DESC;