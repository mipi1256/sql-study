
-- �����Լ�
-- ROUND(�ݿø�)
-- ���ϴ� �ݿ︲ ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����.
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(����)
-- ������ �Ҽ��� �ڸ������� �߶���ϴ�.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS(���밪)
SELECT 
    ABS(-34) FROM dual;

-- CEIL(�ø�), FLOOR(����)
SELECT CEIL(3.14), FLOOR(3.14) 
FROM dual;

-- MOD(������ ������ ����)
-- 10 % 4 is not a write code. The % doesn't work in SQL
SELECT
    10 / 4, MOD(10, 4)
FROM dual;

--------------------------------------------------------------------------------

-- ��¥�Լ�
-- sysdate: ��ǻ���� ���� ��¥, �ð� ������ �����ͼ� �����ϴ� �Լ� -> �ð� ������ ����!
SELECT sysdate FROM dual; -- This will show the current date (YEAR/MONTH/DAY HOUR/MINUTE/SECOND)
SELECT systimestamp FROM dual; -- This will show more in detail time (+ MILSEC and KOREAN TIME) -> �и���, ǥ�ؽñ��� ����.

-- ��¥�� ������ �����մϴ�
SELECT sysdate + 1 FROM dual; -- ���� ���� ������ ����
SELECT sysdate - 1 FROM dual; -- ���� ������ ������ ����

-- ��¥Ÿ�԰� ��¥ Ÿ���� ���� ������ �����մϴ�.
-- ������ ������� �ʽ��ϴ�.
SELECT
    first_name, sysdate - hire_date
FROM employees; -- ��¥

SELECT
    first_name, 
    (sysdate - hire_date) / 7 AS week
FROM employees; -- �ּ�

SELECT
    first_name, 
    (sysdate - hire_date) / 365 AS year
FROM employees; -- ��� 

-- ��¥ �ݿø�, ����
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual; -- You can round up base on the year // �� �������� �ݿø�.
SELECT ROUND(sysdate, 'month') FROM dual; -- You can round up base on the month // �� �������� �ݿø�.
SELECT ROUND(sysdate, 'day') FROM dual; -- You can round up base on the day but the first day is *SUNDAY* // �� �������� �ݿø�(�ش� ���� �Ͽ��� ��¥)

SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate, 'year') FROM dual; -- You can round up base on the year // �� �������� �ݿø�.
SELECT TRUNC(sysdate, 'month') FROM dual; -- You can round up base on the month // �� �������� �ݿø�.
SELECT TRUNC(sysdate, 'day') FROM dual; -- You can round up base on the day but the first day is *SUNDAY* // �� �������� �ݿø�(�ش� ���� �Ͽ��� ��¥)































