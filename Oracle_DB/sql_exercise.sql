/**********************************************************
*	SQL Query & Function Example1
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

--�μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�

select employee_id �����ȣ, last_name||first_name ����̸�, salary �޿�
from employees;



--�����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ� ��ȣ�� ����϶�.

select last_name||first_name �̸�, hire_date �Ի���, department_id �μ���ȣ
from employees
where employee_id = 7369;


--�̸��� Ellen�� ����� ��� ������ ����϶�.
select * from employees
where first_name ='Ellen';



--�Ի����� 08/04/21�� ����� �̸�, �μ���ȣ, ������ ����϶�.

select last_name||first_name �̸�, department_id �μ���ȣ, salary ����
from employees
where hire_date ='08/04/21';




--������ SA_MAN �ƴ� ����� ��� ������ ����϶�.

SELECT * FROM EMPLOYEES
WHERE JOB_ID <> 'SA_MAN';


--�Ի����� 08/04/21 ���Ŀ� �Ի��� ����� ������ ����϶�.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE > '08/04/21';


--�μ���ȣ�� 20,30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.

SELECT last_name||first_name �̸�, employee_id �����ȣ, DEPARTMENT_ID �μ���ȣ
FROM EMPLOYEES
WHERE DEPARTMENT_ID <>20 AND DEPARTMENT_ID <> 30;


--�̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.

SELECT FIRST_NAME||LAST_NAME �̸�, HIRE_DATE �����ȣ, DEPARTMENT_ID �μ���ȣ
FROM EMPLOYEES
WHERE upper(FIRST_NAME) LIKE 'S%';

--�̸��� s�� �����ϰ� ������ ���ڰ� t�� ����� ������ ����϶�.

SELECT *
FROM EMPLOYEES
WHERE LOWER(FIRST_NAME||LAST_NAME) LIKE 's%t';


/**
employees ���̺��� �̸�, �޿�, ��, �Ѿ��� ���Ͽ� �Ѿ� ���� ������ ����϶� �� �󿩱��� NULL�� ����� ����

*/

SELECT FIRST_NAME||LAST_NAME �̸�, SALARY �޿�, COMMISSION_PCT ��, (SALARY+COMMISSION_PCT) �Ѿ�
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY (SALARY+COMMISSION_PCT) DESC;


/**
10�� �μ��� ��� ����鿡�� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶�.
**/

SELECT FIRST_NAME||LAST_NAME �̸�, SALARY �޿�, (SALARY*0.13) ���ʽ��ݾ�, DEPARTMENT_ID �μ���ȣ
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10

/**
30�� �μ��� ������ ����Ͽ� �̸�, �μ���ȣ, �޿�, ������ ����϶�. �� ������ �޿��� 150%�� ���ʽ��� �����Ѵ�.
   -- ���� = sal*12+(sal*1.5)
**/

SELECT FIRST_NAME||LAST_NAME �̸�, DEPARTMENT_ID �μ���ȣ, SALARY �޿�, (SALARY*12+(SALARY*1.5)) ����
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30


/**
�μ���ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� ����϶�. �� 1���� �ٹ��ϼ��� 12���̰� 1�� �ٹ��ð��� 5�ð��̴�.
��¾���� �̸�, �޿�, �ð��� �ӱ�(�Ҽ����� 1��° �ڸ����� �ݿø�)�� ����϶�.
   -- �ñ� = sal/�ϼ�/�ð�  -> sal/ 12/5 
   -- round(m, n) m�� �Ҽ��� n�ڸ����� �ݿø� 
**/

SELECT FIRST_NAME||LAST_NAME �̸�, SALARY �޿�, (SALARY/12/5) �ð����ӱ�
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20


/**
�޿��� 1500���� 3000������ ����� �޿��� 5%�� ȸ��� �����ϱ�� �Ͽ���. �̸� �̸�, �޿�, ȸ��(-2�ڸ����� �ݿø�)�� ����϶�.
	-- ȸ��  = sal * 0.05	
	-- -2�ڸ����� �ݿø� : ���� 2��° �ڸ����� �ݿø�.. 100������  
**/

SELECT FIRST_NAME||LAST_NAME �̸�, SALARY �޿�, ROUND(SALARY*0.05,2) ȸ��
FROM EMPLOYEES
WHERE SALARY >= 1500 AND SALARY <=3000



/**
�Ի��Ϻ��� ���ݱ����� ��¥���� ����϶�. �μ���ȣ, �̸�, �Ի���, ������, �ٹ��ϼ�(�Ҽ�����������), �ٹ����,
 �ٹ�����(30�� ����)�� ����϶�.
	-- ���� ��¥ : sysdate 
	-- �ٹ� �ϼ� : ���糯¥ - �Ի��� = sysdate - hire_date  -> ��¥ - ��¥ : �ϼ� ����
	-- �ٹ� ��� : to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')
	-- �ٹ� ���� : �ٹ��ϼ� / 1��(30��)
**/

SELECT FIRST_NAME||LAST_NAME �̸�, HIRE_DATE �Ի���, SYSDATE ������,
(SYSDATE-HIRE_DATE) �ٹ��ϼ�,
TO_CHAR(SYSDATE,'YYYY')-TO_CHAR(HIRE_DATE,'YYYY') �ٹ����,
FLOOR((SYSDATE-HIRE_DATE)/30) �ٹ����� 
FROM EMPLOYEES





/**
�Ի��Ϸκ��� ���ñ����� �ϼ��� ���Ͽ� �̸�, �Ի���, �ٹ��ϼ��� ����϶�.
--round(sysdate-hiredate,0) �ٹ��ϼ�
**/

SELECT FIRST_NAME||LAST_NAME �̸�, HIRE_DATE �Ի���, ROUND(SYSDATE-HIRE_DATE,0) �ٹ��ϼ�
FROM EMPLOYEES

/**
�Ի����� 2012�� 7�� 5���� ���·� �̸�, �Ի����� ����϶�.
	-- ��¥ ���� �տ� fm �� ���� '0'�� ǥ������ �ʴ´ٴ� ��.. 
	-- 'fmYYYY"��" MM"��" DD"��' 
**/

SELECT FIRST_NAME||LAST_NAME �̸�, TO_CHAR(HIRE_DATE,'yyyy"��"/fmmm"��"/dd"��"') �Ի���
FROM EMPLOYEES


/**
�̸�(first_name)�� ���ڼ��� 6���̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸����� ����϶�.
	-- substr(str, position, length) : str ���ڸ� positin ���� length���� ��ŭ ǥ��
	-- lower(str)  �ҹ��� ��ȯ
	-- length(str)  str�� ����
**/

SELECT LOWER(SUBSTR(FIRST_NAME,1,3)) �̸� 
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >=6;




/**
10�� �μ� ������ ��դ� �ְ�, ����, �ο����� ���Ͽ� ����϶�
**/

SELECT TRUNC(AVG(SALARY)) ���, MAX(SALARY) �ְ�, MIN(SALARY) ����, COUNT(*) �ο��� 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =10;



/**
�� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
**/


SELECT TRUNC(AVG(SALARY)) ���, MAX(SALARY) �ְ�, MIN(SALARY) ����, COUNT(*) �ο��� 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



/**
�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.
**/

SELECT DEPARTMENT_ID �μ���ȣ, JOB_ID ������, COUNT(*) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ,JOB_ID
ORDER BY DEPARTMENT_ID;



/**
���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
**/


SELECT JOB_ID ������, COUNT(*) �ο���
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(*) >=4; 


/**
�� �μ��� ��տ���, ��ü����, �ְ����, ��������,�� ���Ͽ� ��տ����� ���������� ����϶�.
**/

SELECT DEPARTMENT_ID �μ���ȣ, SALARY ��ü����, MAX(SALARY) �ְ����, MIN(SALARY) ��������, ROUND(AVG(SALARY),1) ��տ��� 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID,SALARY
ORDER BY "��տ���" DESC;


