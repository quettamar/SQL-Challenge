--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE EXTRACT(YEAR from hire_date) = 1986
ORDER BY hire_date

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
	employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no

--4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name FROM dept_emp
JOIN employees
ON dept_emp.eemp_no = employees.emp_no
JOIN departments 
ON departments.dept_no = dept_emp.dept_no

--5. List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT dept_emp.eemp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.eemp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007'

--This is where I verified the employee count of 52245 in the Sales dept
SELECT COUNT(*) from dept_emp
WHERE dept_no = 'd007'

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT dept_emp.eemp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.eemp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no IN ('d007', 'd005')
ORDER BY dept_name

--This is where I verified the employee count of 137952 in the Sales and Development departments
SELECT COUNT(*) from dept_emp
WHERE dept_no IN ('d007', 'd005')

--8. In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(DISTINCT(last_name)) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC


