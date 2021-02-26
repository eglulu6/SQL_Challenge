-- Create table for title first
-- Title is the only record that did not have a dependent refrence
DROP TABLE IF EXISTS title
	CREATE TABLE title
	(
	--COL-------TYPE---------NULL
	title_id 	VARCHAR 	NOT NULL,
	title 		VARCHAR		NOT NULL,
	-- set keys
	PRIMARY KEY (title_id)
	);

-- Create table for EMPLOYEE
-- All other records reference or depend on this table
DROP TABLE IF EXISTS employee
	CREATE TABLE employee
	(
	--COL-----------TYPE--------NULL
	emp_no 			INT			NOT NULL,
	emp_title_id 	VARCHAR		NOT NULL,
	birth_date 		DATE		NOT NULL,
	first_name 		VARCHAR		NOT NULL,
	last_name 		VARCHAR		NOT NULL,
	sex 			CHAR 		NOT NULL,
	hire_date 		DATE		NOT NULL,
		--set keys
		PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_title_id) 
			REFERENCES title (title_id)
	)
	
-- Create table for DEPARMENT
-- Other records refrence this table
DROP TABLE IF EXISTS department
	CREATE TABLE department
	(
	--COL-----------TYPE--------NULL
	dept_id			VARCHAR		NOT NULL,
	dept_name		VARCHAR		NOT NULL,
		--set keys
		PRIMARY KEY (dept_id)
	)
	
-- Create table for DEPARTMENT EMPLOYEE
-- This record refrences other tables
DROP TABLE IF EXISTS dept_emp
	CREATE TABLE dept_emp
	(
	--COL-------TYPE--------NULL
	emp_no 		INT			NOT NULL,
	dept_id		VARCHAR		NOT NULL,
		--set keys
		PRIMARY KEY (emp_no, dept_id),
		FOREIGN KEY (emp_no)
			REFERENCES employee (emp_no),
		FOREIGN KEY (dept_id)
			REFERENCES department (dept_id)
	)
	
-- Create table for DEPARTMENT MANAGER
-- This record refrences other tables
DROP TABLE IF EXISTS dept_manager
	CREATE TABLE dept_manager
	(
	--COL-------TYPE--------NULL
	emp_no		INT			NOT NULL,
	dept_id 	VARCHAR		NOT NULL,
	--set keys
		PRIMARY KEY (emp_no, dept_id),
		FOREIGN KEY (emp_no)
			REFERENCES employee (emp_no),
		FOREIGN KEY (dept_id)
			REFERENCES department (dept_id)
	)	
	
-- Create table for EMPLOYEE SALARY
-- This record refrences other tables
DROP TABLE IF EXISTS salary
	CREATE TABLE salary
	(
	--COL-------TYPE--------NULL
	emp_no	 	INT			NOT NULL,
	salary 		DECIMAL		NOT NULL,
	--set keys
		PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_no)
			REFERENCES employee (emp_no)
	)	