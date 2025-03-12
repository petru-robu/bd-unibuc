-- LABORATOR 2 - SAPTAMANA 3

-- APLICARE FUNCTII

SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY')
FROM DUAL;

SELECT TO_DATE('18-MAR-2025','dd-mon-yyyy')
FROM DUAL;

/*
DIMENSIUNI:

Char -> Maximum size: 2000 bytes;
Varchar, Varchar2  -> Maximum size: 4000 bytes;
Number -> 999...(38 9's) x10125 maximum value
                  -999...(38 9's) x10125 minimum value (precizie: 38 de cifre);
                  
*/

SELECT LTRIM ('     info')
FROM DUAL;

SELECT RTRIM ('infoXXXX', 'X')  
FROM DUAL;

-- ANALIZATI CU ATENTIE URMATOARELE DOUA EXEMPLE!

SELECT TRIM (BOTH 'X' FROM 'XinfoXxX')
FROM DUAL;

SELECT RTRIM ('XinfoXxXabc', 'bacX')
FROM DUAL;

-- RULATI SI ANALIZATI EXEMPLELE:

SELECT TRANSLATE('$a$aaa','$a','b')
FROM DUAL;

SELECT TRANSLATE('$a$aaa','$a','bac')
FROM DUAL;

SELECT TRANSLATE('cerc','ce','d')
FROM DUAL;

SELECT TRANSLATE('$a$aaa','aa','bc')
FROM DUAL;

SELECT TRANSLATE('$a$aaa','ac','cd')
FROM DUAL;



-- CUM SE TESTEAZA URMATOAREA OPERATIE?

-- FORMA GENERALA: expr_date -/+ expr_number

SELECT '07-03-2023' + 3
FROM dual; 

-- DE CE NU ESTE CORECTA VARIANTA ANTERIOARA? 

_____;


-- FORMA GENERALA: expr_date1 – expr_date2

SELECT SYSDATE - TO_DATE ('10-07-2000', 'DD-MM-YYYY')
FROM dual; 

-- CUM ROTUNJIM? 

___;


-- ANALIZATI:

SELECT NVL (1, 'a')
FROM dual; 


-- EXERCITII - FUNCTII PE SIRURI DE CARACTERE

1.	Scrieţi o cerere care are următorul rezultat pentru fiecare angajat: 

<prenume angajat> <nume angajat> castiga <salariu> lunar dar doreste 
<salariu de 3 ori mai mare>. Etichetati coloana “Salariu ideal”. 

Pentru concatenare, utilizaţi atât funcţia CONCAT cât şi operatorul “||”.

SELECT concat(first_name,' ') || last_name || ' castiga ' || salary 
                              || ' lunar dar doreste ' || salary * 3 "Salariu ideal"
FROM employees;


2.	Scrieţi o cerere prin care să se afişeze prenumele salariatului 
cu prima litera majusculă şi toate celelalte litere minuscule, 
numele acestuia cu majuscule şi lungimea numelui, 
pentru angajaţii al căror nume începe cu J sau M sau care au a treia literă din nume A. 
Rezultatul va fi ordonat descrescător după lungimea numelui. 
Se vor eticheta coloanele corespunzător. 
Se cer 2 soluţii (cu operatorul LIKE şi funcţia SUBSTR).

--LIKE
SELECT INITCAP(first_name) AS "Prenume", 
UPPER(last_name) AS "Nume", 
length(last_name) AS "Lungime Nume"
FROM employees
WHERE UPPER(last_name) LIKE 'M%' OR
      UPPER(last_name) LIKE 'J%' OR
      UPPER(last_name) LIKE '__A%'
ORDER BY length(last_name) desc;


--SUBSTR
--SUBSTR(string, start [,n])


3.	Să se afişeze, pentru angajaţii cu prenumele „Steven”, 
codul şi numele acestora, precum şi codul departamentului în care lucrează. 
Căutarea trebuie să nu fie case-sensitive, iar eventualele blank-uri care preced 
sau urmează numelui trebuie ignorate.

--Varianta 1:
SELECT employee_id, last_name, department_id
FROM employees
WHERE LTRIM(RTRIM(UPPER(first_name)))='STEVEN';

--Varianta 2:
SELECT employee_id, last_name, department_id
FROM employees
WHERE TRIM(BOTH FROM UPPER(first_name))='STEVEN';


4. Să se afişeze pentru toţi angajaţii al căror nume se termină cu litera 'e', 
codul, numele, lungimea numelui şi poziţia din nume în care apare 
prima data litera 'A'. 
Utilizaţi alias-uri corespunzătoare pentru coloane;

SELECT employee_id "Id Ang", last_name "Nume", length(last_name) "Lung Nume",
       instr(upper(last_name),'A',1,1) "Pozitie litera in nume"
FROM employees
WHERE substr(lower(last_name), -1) = 'e';



-- FUNCTII ARITMETICE

5.	Să se afişeze detalii despre salariaţii care au lucrat un număr 
întreg de săptămâni până la data curentă. 
Obs: Soluția necesită rotunjirea diferenței celor două date calendaristice. 

SELECT *
FROM employees
WHERE ___  ;


6.	Să se afişeze codul salariatului, numele, salariul, salariul mărit cu 15%, 
exprimat cu două zecimale şi numărul de sute al salariului nou 
rotunjit la 2 zecimale. 
Etichetaţi ultimele două coloane “Salariu nou”, respectiv “Numar sute”. 
Se vor lua în considerare salariaţii al căror salariu nu este divizibil cu 1000. 

SELECT employee_id, last_name, salary, 
       round(salary + 0.15 * salary, 2)  "Salariu Nou",  
       round((salary + 0.15 * salary) / 100, 2)  "Numar sute" 
FROM employees
WHERE MOD(salary, 1000) != 0;  


7.	Să se listeze numele şi data angajării salariaţilor care câştigă comision. 
Să se eticheteze coloanele „Nume angajat”, „Data angajarii”. 
Utilizaţi funcţia RPAD pentru a determina ca data angajării să aibă 
lungimea de 20 de caractere.

SELECT last_name  AS "Nume angajat" , RPAD(to_char(hire_date),20,'X')  "Data angajarii"
FROM employees
WHERE  commission_pct ___;


-- FUNCTII SI OPERATII CU DATE CALENDARISTICE

8. Să se afişeze data (numele lunii, ziua, anul, ora, minutul si secunda) 
de peste 30 zile.

SELECT _____(SYSDATE + 30, 'MONTH DD YYYY HH24:MI:SS') "Data"
FROM DUAL;

9. Să se afişeze numărul de zile rămase până la sfârşitul anului.

SELECT to_date('31-12-2025','dd-mm-yyyy') - sysdate
FROM dual;

10. a) Să se afişeze data de peste 12 ore.

SELECT TO_CHAR(SYSDATE + 12/24, 'DD/MM HH24:MI:SS') "Data"
FROM DUAL;

b) Să se afişeze data de peste 5 minute
Obs: Cât reprezintă 5 minute dintr-o zi?


SELECT TO_CHAR(SYSDATE + _____, 'DD/MM HH24:MI:SS') "Data"
FROM DUAL;


11.	Să se afişeze numele şi prenumele angajatului (într-o singură coloană), 
data angajării şi data negocierii salariului, care este prima zi de Luni 
după 6 luni de serviciu. Etichetaţi această coloană “Negociere”.

SELECT concat(last_name, first_name), hire_date,
       NEXT_DAY(ADD_MONTHS(hire_date, 6), 'monday') "Negociere"
FROM employees;


12.	Pentru fiecare angajat să se afişeze numele şi numărul de luni 
de la data angajării. Etichetaţi coloana “Luni lucrate”. 
Să se ordoneze rezultatul după numărul de luni lucrate. 
Se va rotunji numărul de luni la cel mai apropiat număr întreg.

 -- prima varianta de ordonare

SELECT last_name, round(months_between(sysdate, hire_date)) "Luni lucrate"
FROM employees
ORDER BY MONTHS_BETWEEN(SYSDATE, hire_date);


-- a doua varianta de ordonare

SELECT last_name, round(months_between(sysdate, hire_date)) "Luni lucrate"
FROM employees
ORDER BY 2;


-- a treia varianta de ordonare

SELECT last_name, round(months_between(sysdate, hire_date)) "Luni lucrate"
FROM employees
ORDER BY "Luni lucrate";


-- FUNCTII DIVERSE

13.	Să se afişeze numele angajaţilor şi comisionul. Dacă un angajat 
nu câştigă comision, să se scrie “Fara comision”. Etichetaţi coloana “Comision”.

SELECT last_name, ___
FROM employees; 


14.	Să se listeze numele, salariul şi comisionul tuturor angajaţilor 
al căror venit lunar (salariu + valoare comision) depăşeşte 10 000. 

SELECT  last_name, salary, commission_pct
FROM  employees 
WHERE  ________;



