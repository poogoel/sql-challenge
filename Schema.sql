-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Department_id" char(4)   NOT NULL,
    "Department_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_id"
     )
);

CREATE TABLE "Employees" (
    "Employee_id" int   NOT NULL,
    "Birth_date" datetime()   NOT NULL,
    "Employee_last_name" varchar   NOT NULL,
    "Employee_first_name" varchar   NOT NULL,
    "gender" char(1)   NOT NULL,
    "Hire_date" datatime()   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_id"
     )
);

CREATE TABLE "Dept_emp_xref" (
    "Employee_id" int   NOT NULL,
    "Department_id" char(4)   NOT NULL,
    "Begin_dt" datetime()   NOT NULL,
    "End_dt" datetime()   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "Department_id" char(4)   NOT NULL,
    "Employee_id" int   NOT NULL,
    "Begin_dt" datetime   NOT NULL,
    "End_dt" datetime   NOT NULL
);

CREATE TABLE "Emp_salary" (
    "Employee_id" int   NOT NULL,
    "Salary" money()   NOT NULL,
    "emp_begin_dt" datetime()   NOT NULL,
    "emp_end_dt" datetime()   NOT NULL
);

CREATE TABLE "Emp_titles" (
    "Employee_id" int   NOT NULL,
    "Employee_title" varchar   NOT NULL,
    "Start_dt" datetime()   NOT NULL,
    "End_dt" datetime()   NOT NULL
);

ALTER TABLE "Dept_emp_xref" ADD CONSTRAINT "fk_Dept_emp_xref_Employee_id" FOREIGN KEY("Employee_id")
REFERENCES "Employees" ("Employee_id");

ALTER TABLE "Dept_emp_xref" ADD CONSTRAINT "fk_Dept_emp_xref_Department_id" FOREIGN KEY("Department_id")
REFERENCES "Departments" ("Department_id");

ALTER TABLE "Emp_salary" ADD CONSTRAINT "fk_Emp_salary_Employee_id" FOREIGN KEY("Employee_id")
REFERENCES "Employees" ("Employee_id");

ALTER TABLE "Emp_titles" ADD CONSTRAINT "fk_Emp_titles_Employee_id" FOREIGN KEY("Employee_id")
REFERENCES "Employees" ("Employee_id");

