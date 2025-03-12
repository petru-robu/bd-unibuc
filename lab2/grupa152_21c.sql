--Ex5
SELECT job_id FROM employees;
SELECT DISTINCT job_id FROM employees;
SELECT UNIQUE job_id FROM employees;

SELECT * from jobs;

--Ex6
SELECT last_name || ', ' || first_name || ', ' || job_id "Detalii"
FROM employees;

--Ex7
SELECT last_name, salary
FROM employees
WHERE salary > 2850;

SELECT last_name, department_id, employee_id
FROM employees
WHERE employee_id = 104;

--Ex8
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 14000 and 24000;

SELECT salary
FROM employees;

--Ex9
SELECT last_name, first_name, salary
FROM employees
WHERE salary >= 3000 and salary <= 7000
ORDER BY salary;

--Ex10
SELECT first_name, last_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN '20-FEB-1987' AND '01-MAY-1989'
ORDER BY hire_date;

--Ex11
SELECT last_name, department_id
FROM employees
WHERE department_id IN (10, 30)
ORDER BY last_name;

--Ex12
SELECT last_name AS "Angajat", salary AS "Salariu", department_id
FROM employees
WHERE department_id IN (10, 30) AND salary > 1500
ORDER BY salary, last_name;

--Ex13
SELECT SYSDATE
FROM dual;

SELECT *
FROM dual;

DESC dual;

--Ex14
--v1:
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE ('%87%');

--v2:
SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY')='1987';

--Ex15
SELECT last_name
FROM employees 
WHERE upper(last_name) LIKE '__A%';

--Ex16
SELECT first_name
FROM employees
WHERE (upper(last_name) LIKE '%L%L%' AND department_id = 30) OR manager_id = 102;

--Ex20
SELECT first_name || ' ' || last_name "Nume complet", hire_date "Data angajarii"
FROM employees
WHERE (salary>=5000 AND salary<=9000) 
AND (lower(first_name) LIKE 'a%' OR lower(first_name) LIKE 'm%')
AND MOD(TO_CHAR(hire_date, 'YY'), 2) = 1
AND TO_CHAR(hire_date, 'MM') = TO_CHAR(SYSDATE, 'MM');

--Ex21
SELECT last_name, salary, job_id, TO_CHAR(hire_date, 'YYYY') "Anul angajarii"
FROM employees
WHERE job_id LIKE '%CLERK';





