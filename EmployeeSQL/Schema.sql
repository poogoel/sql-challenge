-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Departments (
    Department_id char(4)   NOT NULL,
    Department_name varchar   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Department_id
     )
);

CREATE TABLE Employees
(
    Employee_id integer NOT NULL,
    Birth_date timestamp without time zone NOT NULL,
    Employee_first_name character varying(45) COLLATE pg_catalog.default,
    Employee_last_name character varying(45) COLLATE pg_catalog.default,
    gender character varying(1) COLLATE pg_catalog.default,
    hire_date date,
    CONSTRAINT Employees_pkey PRIMARY KEY (Employee_id)
);

CREATE TABLE Dept_emp_xref (
    Employee_id int   NOT NULL,
    Department_id char(4)   NOT NULL,
    Begin_dt timestamp without time zone NOT NULL,
    End_dt timestamp without time zone NOT NULL
);

CREATE TABLE Dept_manager (
    Department_id char(4)   NOT NULL,
    Employee_id int   NOT NULL,
    Begin_dt timestamp without time zone NOT NULL,
    End_dt timestamp without time zone NOT NULL
);

CREATE TABLE Emp_salary (
    Employee_id int   NOT NULL,
    Salary int   NOT NULL,
    emp_begin_dt timestamp without time zone NOT NULL,
    emp_end_dt timestamp without time zone NOT NULL
);

CREATE TABLE Emp_titles (
    Employee_id int   NOT NULL,
    Employee_title character varying(45) COLLATE pg_catalog.default,
    Start_dt timestamp without time zone NOT NULL,
    End_dt timestamp without time zone NOT NULL
);

ALTER TABLE Dept_emp_xref ADD CONSTRAINT fk_Dept_emp_xref_Employee_id FOREIGN KEY(Employee_id)
REFERENCES Employees (Employee_id);

ALTER TABLE Dept_emp_xref ADD CONSTRAINT fk_Dept_emp_xref_Department_id FOREIGN KEY(Department_id)
REFERENCES Departments (Department_id);

ALTER TABLE Emp_salary ADD CONSTRAINT fk_Emp_salary_Employee_id FOREIGN KEY(Employee_id)
REFERENCES Employees (Employee_id);

ALTER TABLE Emp_titles ADD CONSTRAINT fk_Emp_titles_Employee_id FOREIGN KEY(Employee_id)
REFERENCES Employees (Employee_id);

