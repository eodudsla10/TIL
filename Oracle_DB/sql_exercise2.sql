/**********************************************************
*	SQL Query & Function Example2
**********************************************************/
/**
-- Employees Table Columns
-- EMPLOYEE_ID
-- FIRST_NAME
-- LAST_NAME
-- EMAIL
-- PHONE_NUMBER
-- HIRE_DATE
-- JOB_ID
-- SALARY
-- COMMISSION_PCT
-- MANAGER_ID
-- DEPARTMENT_ID
**/

/**
--Departments Table Columns
--DEPARTMENT_ID
--DEPARTMENT_NAME
--MANAGER_ID
--LOCATION_ID
**/

/**
50번 부서 월급의 평균ㅡ 최고, 최저, 인원수를 구하여 출력하라
**/

SELECT DEPARTMENT_ID 부서, ROUND(AVG(SALARY),1) 평균, MAX(SALARY) 최고, MIN(SALARY) 최저, COUNT(*) 인원수 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =50
GROUP BY DEPARTMENT_ID;



/**
각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
**/


SELECT DEPARTMENT_ID 부서, ROUND(AVG(SALARY),1) 평균, MAX(SALARY) 최고, MIN(SALARY) 최저, COUNT(*) 인원수 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



/**
각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.
**/

SELECT DEPARTMENT_ID 부서번호, JOB_ID 업무명, COUNT(JOB_ID) 인원수 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;



/**
같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.
**/

SELECT JOB_ID 업무, COUNT(JOB_ID) 
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(JOB_ID) >=4;



/**
각 부서별 평균월급, 전체월급, 최고월급, 최저월급,을 구하여 평균월급이 많은순으로 출력하라.
**/

SELECT DEPARTMENT_ID 부서, ROUND(AVG(SALARY),1) 평균월급, SALARY 전체월급, MAX(SALARY) 최고월급, MIN(SALARY) 최저월급
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, SALARY
ORDER BY "평균월급" DESC;

/**
 부서번호, 부서명, 이름, 급여를 출력하라.
**/

SELECT e.DEPARTMENT_ID 부서번호, d.DEPARTMENT_NAME 부서명, e.FIRST_NAME||e.LAST_NAME 이름, e.SALARY 급여
FROM EMPLOYEES e, DEPARTMENTS d

/**
이름이 adam인 사원의 부서명을 출력하라.
**/

SELECT DEPARTMENT_ID 부서명
FROM EMPLOYEES
WHERE LAST_NAME ='adam';

/**
employees테이블에 있는 employee_id와 manager_id를 이용하여 서로의 관계를 다음과 같이 출력하라
'smith'의 매니저는 'ford'이다. -> 다시 풀것
**/

SELECT e.EMPLOYEE_ID || '의 매니저는'||d.MANAGER_ID||'이다.' 관계
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.EMPLOYEE_ID = d.MANAGER_ID;



/**
Abel의 직무와 같은 직무를 갖는 사람의 이름, 부서명, 급여, 직무를 출력하라.
**/

SELECT e.LAST_NAME 이름, e.DEPARTMENT_ID 부서명, e.SALARY 급여, d.DEPARTMENT_NAME 직무
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND 
JOB_ID = (SELECT A.JOB_ID
FROM EMPLOYEES a
WHERE a.LAST_NAME ='Abel')

/**
전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
**/

SELECT E.EMPLOYEE_ID  사원번호, LAST_NAME 이름, D.DEPARTMENT_NAME 부서명, D.LOCATION_ID 지역, E.SALARY 급여
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND e.SALARY > (
SELECT AVG(SALARY) 
FROM EMPLOYEES)


/**
50번 부서사람들 중에서 30번 부서의 사원과 같은 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일을 출력하라.
**/ ->다시 풀기

SELECT e.EMPLOYEE_ID  사원번호, e.LAST_NAME 이름, d.DEPARTMENT_NAME 부서명, e.HIRE_DATE 입사일
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND e.DEPARTMENT_ID =30 AND e.JOB_ID IN (
SELECT JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID =30)

/**
급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
**/

SELECT e.EMPLOYEE_ID 사원번호, e.LAST_NAME 이름, e.SALARY 급여
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND e.DEPARTMENT_ID =30 AND e.SALARY < (
SELECT MAX(SALARY) 
FROM EMPLOYEES)

