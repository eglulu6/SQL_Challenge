--1. Details of each employee: 
--employee number, last name, first name, sex, salary
CREATE VIEW employee_sal AS
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM employee E, salary S
WHERE E.emp_no = S.emp_no


--2. Employees who were hired in 1986:
--List first name, last name, and hire date
CREATE VIEW employees_1986 AS
SELECT first_name, last_name, hire_date
FROM employee
WHERE EXTRACT (YEAR FROM hire_date ) = 1986


--3. Manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name
CREATE VIEW mrg_dpt AS
SELECT mgr.emp_no, emp.last_name, emp.first_name, dpt.dept_name, mgr.dept_id
FROM dept_manager mgr, department dpt, employee emp
WHERE mgr.emp_no = emp.emp_no 
	AND dpt.dept_id = mgr.dept_id


--4. Each employee with the following information: 
--employee number, last name, first name, and department name
CREATE VIEW emp_dpt AS
SELECT dptE.emp_no, emp.last_name, emp.first_name, dpt.dept_name, dptE.dept_id
FROM dept_emp dptE, department dpt, employee emp
WHERE dptE.emp_no = emp.emp_no 
	AND dpt.dept_id = dptE.dept_id

--5. Employees whose first name is "Hercules" and last names begin with "B":
--List first name, last name, and sex
CREATE VIEW emp_hercules AS
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%'

--6. All employees in the Sales department:
--Employee number, last name, first name, and department name
CREATE VIEW emp_dpt_name AS
SELECT dptE.emp_no, emp.last_name, emp.first_name, dpt.dept_name
FROM dept_emp dptE, department dpt, employee emp
WHERE dptE.emp_no = emp.emp_no 
	AND dptE.dept_id  = 
			(
			SELECT dpt.dept_id 
			WHERE dpt.dept_name = 'Sales'
			)

--7. All employees in the Sales and Development departments:
--Employee number, last name, first name, and department name
SELECT dptE.emp_no, emp.last_name, emp.first_name, dpt.dept_name
FROM dept_emp dptE, department dpt, employee emp
WHERE dptE.emp_no = emp.emp_no 
	AND dptE.dept_id = 
			(
			SELECT dpt.dept_id 
			WHERE dpt.dept_name = 'Sales' 
					OR dpt.dept_name = 'Development'
			)
ORDER BY dpt.dept_name desc

--8. List the frequency count of employee last names in descending order
--i.e., how many employees share each last name
SELECT COUNT(last_name), last_name
FROM employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC


--