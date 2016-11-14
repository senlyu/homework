--Q1 Final
SELECT a.first_name
  ||' '
  ||a.last_name"Employee's name",
  b.first_name
  ||' '
  ||b.last_name "Manager's name",
  b.salary "Manager's salary",
  Job_Grades.Grade_Level "Salary grade of the manager"
FROM employees a,
  employees b,
  Job_Grades
WHERE a.Manager_Id=b.employee_Id
AND b.salary      >12000
AND b.Salary BETWEEN Job_Grades.Lowest_Sal AND Job_Grades.Highest_Sal;




--Q2 final
SELECT First_Name
  ||' '
  ||Last_Name
  ||' has worked in '
  ||Department_Name
  ||' Department for '
  ||ROUND(MONTHS_BETWEEN(SYSDATE,hire_date),0)
  ||' months.' "Employee Tenure"
FROM employees
JOIN Departments USING(Department_id);

--q3 final

SELECT MAX(salary)-MIN(salary) "Salary Difference",
  department_name "Department"
FROM Employees
JOIN departments USING(department_id)
GROUP BY Department_name;

--Q4 final
SELECT manager_id "Manager Number",
  MIN(salary) "Min Salary of Employees"
FROM employees
GROUP BY manager_id
HAVING MIN(salary)  >5000
AND NOT manager_id IS NULL;

--Q5
SELECT last_name "Last Name",
  salary "Salary"
FROM employees
WHERE manager_id=
  (SELECT employee_id
      FROM employees
      WHERE last_name= 'Mourgos'
      AND first_name ='Kevin'
      );


--Q6 final
SELECT department_id "Department Number",
  MIN(salary) "Lowest Salary"
FROM employees
GROUP BY department_id
HAVING AVG(salary)=
  (SELECT MAX(AVG(salary)) FROM employees GROUP BY department_id
      );


--Q7 final
SELECT department_Name "Department Name",
  street_address
  ||city
  ||state_province "Location"
FROM departments
JOIN locations USING(location_id)
WHERE department_name != 'Sales';


--Q8 final
SELECT job_id,
  department_id
FROM employees
WHERE hire_date < '&Date'
ORDER BY job_id DESC;


--Q9 final
SELECT MAX(b.salary) "SalaryMoreThanManager"
FROM employees a,
  employees b
WHERE a.salary    < b.salary
AND a.employee_id = b.manager_id;

--Q10
SELECT department_id "Department Number",
  department_name "Department Name",
  COUNT(employee_id) "NumberOfEmployees"
FROM departments
JOIN employees USING(department_id)
GROUP BY department_id,
  department_name
HAVING COUNT(employee_id)=
  (SELECT MAX(COUNT(employee_id)) FROM employees GROUP BY department_id
      );

--Q11
SELECT first_name
  ||' '
  ||Last_name "Name",
  Hire_date
FROM employees
WHERE hire_date >
  (SELECT hire_date
      FROM employees
      WHERE first_name='Bruce'
      AND Last_name   ='Ernst'
      );

--Q12
SELECT last_name,
  department_id,
  job_id
FROM employees
JOIN departments USING(department_id)
WHERE location_id='&locationId';



