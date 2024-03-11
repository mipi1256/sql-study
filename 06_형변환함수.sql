
-- ����ȯ �Լ� TO_CHAR, TO_NUMBER, TO_DATE

-- ��¥�� ���ڷ� TO_CHAR(��, ����)
-- ��¥ ���ڷ� �� ��ȯ�� �� ���ϴ� �������� ��¥�� ǥ���� �� �ֽ��ϴ�. 
SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DY PM HH:MI:SS') FROM dual; -- Change the current time to the format that the user wants. (YEAR/MONTH/DAY DAY AM/PM HOUR/MINUTE/SEC)
SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:SS') FROM dual;

-- ���Ĺ��ڿ� �Բ� ����ϰ� ���� ���ڸ� ""�� ���μ� �����մϴ�.
SELECT 
    TO_CHAR(sysdate, 'YYYY"��"-MM"��"-DD"��"') -- To write down multiple information use "" to add them
FROM dual;

-- ���ڸ� ���ڷ� TO_CHAR(�� ����)
-- ���Ŀ��� ����ϴ� '9'�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ� ���� ��ȣ�Դϴ�.
SELECT TO_CHAR(20000, '99,999') FROM dual;
SELECT TO_CHAR(20000, 'L99,999') FROM dual;
SELECT TO_CHAR(20000.29, '99999.9') FROM dual; -- �ݿø� ����. Work also for rounding up the number.

SELECT
    first_name,
    TO_CHAR(salary, '$99,999') as salary
FROM employees;
    
-- ���ڸ� ���ڷ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual; -- �ڵ� �� ��ȭ (���� -> ����)
SELECT TO_NUMBER('2000' + 2000) FROM dual; -- ����� �� ��ȯ
SELECT '$3,300' + 2000 FROM dual; -- ���� 
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual; 

-- ���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��, ����)
SELECT TO_DATE('2023-04-13') FROM dual;
-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�. �Ϻθ� ��ȯ�� �� �����ϴ�.
SELECT TO_DATE('2021-03-31 12:23:50', 'YY-MM-DD HH:MI:SS') FROM dual;

SELECT TO_DATE('2021�� 02�� 12��', 'YYYY"��"MM"��"DD"��"') FROM dual;

-- xxxx�� xx�� xx�� -> ���ڿ� �������� ��ȯ �غ�����.
-- ��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�. dual���� ��ȸ�ϼ���
SELECT '20050102' FROM dual;
SELECT TO_CHAR(TO_DATE('20050102', 'YYYYMMDD'), 'YYYY"�� "MM"�� "DD"��"') AS dateInfo FROM dual;

-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL(�÷�, ��ȯ�� Ÿ�ٰ�)
SELECT
    first_name,
    NVL(commission_pct, 0) AS comm_pct -- ALL THE NULL value will turned into 0
FROM employees;

--------------------------------------------------------------------------------

-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL2(�÷�, NULL�� �ƴ� ����� ��, NULL�� ����� ��)
SELECT 
    first_name,
    salary,
    NVL2(
        commission_pct, --  the column you want to select
        salary * commission_pct, -- The value when is not NULL
        salary -- The value when is NULL
    ) AS real_salary
FROM employees;

--------------------------------------------------------------------------------

-- NULL�� ������ ���� �ʽ��ϴ�! 
-- When the value is NULL you wil get NULL as the result when doing any mathematic 
SELECT 
    first_name,
    salary,
    salary + (salary * commission_pct)
FROM employees;

-- DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2, ............. default)
-- ����Ŭ ���� �Լ�. ���� �񱳸� ����
SELECT
    first_name,
    job_id,
    salary,
    DECODE(
        job_id, -- The table you want to select 
        'IT_PROG', salary * 1.1, -- The first value will get this result
        'FI_MGR', salary * 1.2, -- The second value will get this result
        'AD_VP', salary * 1.3, -- The third value will get this result
        salary -- Anything else that is not selected will get this result
    ) AS result
FROM employees;

-- CASE WHEN THEN END
-- ANSIǥ�� ����
SELECT 
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary * 1.1
        WHEN 'FI_MGR' THEN salary * 1.2
        WHEN 'AD_VP' THEN salary * 1.3
        WHEN 'FI_ACCOUNT' THEN salary * 1.4
        ELSE salary
    END) as RESULT
FROM employees;

/*
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/

SELECT
    employee_id AS �����ȣ,
    first_name AS �̸�,
    hire_date AS �Ի�����,
    TRUNC((sysdate - hire_date) / 365) AS �ټӳ��
FROM employees
WHERE ((sysdate - hire_date) /365 >= 17)
ORDER BY �ټӳ�� DESC;


/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/

SELECT 
    first_name, manager_id,
    CASE manager_id
        WHEN 100 THEN '���'
        WHEN 120 THEN '����'
        WHEN 121 THEN '�븮'
        WHEN 122 THEN '����'
        ELSE '�ӿ�'
    END
FROM employees
WHERE department_id = 50;




































