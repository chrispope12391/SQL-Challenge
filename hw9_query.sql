-- drop table if exists departments;
-- drop table if exists dept_emp;
-- drop table if exists dept_manager;
-- drop table if exists employees;
-- drop table if exists salaries;
-- drop table if exists titles;

-- created a table to hold the departments csv
create table departments (
	dept_no VARCHAR(255),
	dept_name VARCHAR(255)
);

-- viewed the data
select * from departments;

-- created a table to hold the dept_emp csv data
create table dept_emp(
	emp_no INT,
	dept_no VARCHAR(255)
);

-- viewed dept_emp csv data
select * from dept_emp;

-- created a table to hold the dept_manager csv data
create table dept_manager(
	dept_no VARCHAR(255),
	emp_no INT
);

-- viewed dept_manage csv data
select * from dept_manager;

-- create table to store employees data
create table employees(
	emp_no INT,
	emp_title_id VARCHAR(255),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(255),
	hire_date DATE
);

-- Shows the format for the date columns
show datestyle;

-- view employees csv data
select * from employees;

-- create table to store salaries csv data
create table salaries(
	emp_no INT,
	salary INT
);

-- view salaries csv data
select * from salaries;

-- create table to store titles csv data
create table titles(
	title_id VARCHAR (255),
	title VARCHAR(255)
);


-- Data Analysis #1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
inner join employees on
employees.emp_no=salaries.emp_no;

-- Data Analysis #2
select first_name, last_name, hire_date from employees
where hire_date >= '01-01-1986'
AND hire_date < '01-01-1987';

-- Data Analysis #3
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,employees.first_name
from departments
inner join dept_manager on
departments.dept_no=dept_manager.dept_no
inner join employees on
dept_manager.emp_no=employees.emp_no;

-- Data Analysis #4
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
inner join dept_emp on
employees.emp_no=dept_emp.emp_no
inner join departments on
dept_emp.dept_no=departments.dept_no;

-- Data Analysis #5
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- Data Analysis #6
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
inner join dept_emp on
employees.emp_no=dept_emp.emp_no
inner join departments on
dept_emp.dept_no=departments.dept_no
where dept_name = 'Sales';

-- Data Analysis #7
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
inner join dept_emp on
employees.emp_no=dept_emp.emp_no
inner join departments on
dept_emp.dept_no=departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development';

-- Data Analysis #8
select last_name, count(last_name) As "Last Name Count"
from employees
group by last_name
order by "Last Name Count" desc;

