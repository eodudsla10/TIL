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
50�� �μ� ������ ��դ� �ְ�, ����, �ο����� ���Ͽ� ����϶�
**/

SELECT DEPARTMENT_ID �μ�, ROUND(AVG(SALARY),1) ���, MAX(SALARY) �ְ�, MIN(SALARY) ����, COUNT(*) �ο��� 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =50
GROUP BY DEPARTMENT_ID;



/**
�� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
**/


SELECT DEPARTMENT_ID �μ�, ROUND(AVG(SALARY),1) ���, MAX(SALARY) �ְ�, MIN(SALARY) ����, COUNT(*) �ο��� 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



/**
�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.
**/

SELECT DEPARTMENT_ID �μ���ȣ, JOB_ID ������, COUNT(JOB_ID) �ο��� 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;



/**
���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
**/

SELECT JOB_ID ����, COUNT(JOB_ID) 
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(JOB_ID) >=4;



/**
�� �μ��� ��տ���, ��ü����, �ְ����, ��������,�� ���Ͽ� ��տ����� ���������� ����϶�.
**/

SELECT DEPARTMENT_ID �μ�, ROUND(AVG(SALARY),1) ��տ���, SALARY ��ü����, MAX(SALARY) �ְ����, MIN(SALARY) ��������
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, SALARY
ORDER BY "��տ���" DESC;

/**
 �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.
**/

SELECT e.DEPARTMENT_ID �μ���ȣ, d.DEPARTMENT_NAME �μ���, e.FIRST_NAME||e.LAST_NAME �̸�, e.SALARY �޿�
FROM EMPLOYEES e, DEPARTMENTS d

/**
�̸��� adam�� ����� �μ����� ����϶�.
**/

SELECT DEPARTMENT_ID �μ���
FROM EMPLOYEES
WHERE LAST_NAME ='adam';

/**
employees���̺� �ִ� employee_id�� manager_id�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�
'smith'�� �Ŵ����� 'ford'�̴�. -> �ٽ� Ǯ��
**/

SELECT e.EMPLOYEE_ID || '�� �Ŵ�����'||d.MANAGER_ID||'�̴�.' ����
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.EMPLOYEE_ID = d.MANAGER_ID;



/**
Abel�� ������ ���� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.
**/

SELECT e.LAST_NAME �̸�, e.DEPARTMENT_ID �μ���, e.SALARY �޿�, d.DEPARTMENT_NAME ����
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND 
JOB_ID = (SELECT A.JOB_ID
FROM EMPLOYEES a
WHERE a.LAST_NAME ='Abel')

/**
��ü ����� ��� �ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿��� ����϶�.
**/

SELECT E.EMPLOYEE_ID  �����ȣ, LAST_NAME �̸�, D.DEPARTMENT_NAME �μ���, D.LOCATION_ID ����, E.SALARY �޿�
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND e.SALARY > (
SELECT AVG(SALARY) 
FROM EMPLOYEES)


/**
50�� �μ������ �߿��� 30�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի����� ����϶�.
**/ ->�ٽ� Ǯ��

SELECT e.EMPLOYEE_ID  �����ȣ, e.LAST_NAME �̸�, d.DEPARTMENT_NAME �μ���, e.HIRE_DATE �Ի���
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND e.DEPARTMENT_ID =30 AND e.JOB_ID IN (
SELECT JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID =30)

/**
�޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
**/

SELECT e.EMPLOYEE_ID �����ȣ, e.LAST_NAME �̸�, e.SALARY �޿�
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND e.DEPARTMENT_ID =30 AND e.SALARY < (
SELECT MAX(SALARY) 
FROM EMPLOYEES)

