-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT Employee_id, Birth_date, Employee_last_name, Employee_first_name, gender, hire_date
	FROM public.Employees;
-- 2. List employees who were hired in 1986
SELECT Employee_id, Birth_date, Employee_last_name, Employee_first_name, gender, hire_date
	FROM public.Employees where hire_date between '01/01/1986' and '12/31/1986';
-- 3. List the manager of each department with the following information: department number, department name, the managers employee number,
--                                           last name, first name, and start and end employment dates.
SELECT public.Dept_manager.Department_id, public.Departments.Department_name, public.Dept_manager.Employee_id, public.Employees.Employee_last_name,
       public.Employees.Employee_first_name, public.Dept_manager.Begin_dt, public.Dept_manager.End_dt
	FROM public.Dept_manager , public.Departments , public.Employees 
    where public.Dept_manager.Department_id = public.Departments.Department_id
    and public.Dept_manager.Employee_id = public.Employees.Employee_id;
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT public.Employees.Employee_id, public.Employees.Employee_last_name,
       public.Employees.Employee_first_name, public.Departments.department_name
	FROM public.dept_emp_xref , public.Departments , public.Employees 
    where public.dept_emp_xref.Department_id = public.Departments.Department_id
    and public.dept_emp_xref.Employee_id = public.Employees.Employee_id;
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT public.Employees.Employee_id, public.Employees.Employee_last_name,
       public.Employees.Employee_first_name
	FROM public.Employees 
    where public.Employees.Employee_last_name = 'Hercules'
    and public.Employees.Employee_first_name like 'B%';
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT public.Employees.Employee_id, public.Employees.Employee_last_name,
       public.Employees.Employee_first_name, public.Departments.department_name
	FROM public.dept_emp_xref , public.Departments , public.Employees 
    where public.dept_emp_xref.Department_id = public.Departments.Department_id
    and public.dept_emp_xref.Employee_id = public.Employees.Employee_id
	and public.Departments.department_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT public.Employees.Employee_id, public.Employees.Employee_last_name,
       public.Employees.Employee_first_name, public.Departments.department_name
	FROM public.dept_emp_xref , public.Departments , public.Employees 
    where public.dept_emp_xref.Department_id = public.Departments.Department_id
    and public.dept_emp_xref.Employee_id = public.Employees.Employee_id
	and public.Departments.department_name in ('Sales','Development')
	order by public.Departments.department_name asc;
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  e.Employee_last_name,count(*)
	FROM public.Employees as e
    group by e.Employee_last_name
	order by e.Employee_last_name desc;


	