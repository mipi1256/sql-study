
-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

-- UNION -> �ߺ� �����͸� ������� ����.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION -- Will connect the two tables also doesn't print value that appear multiple times.
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- UNION ALL -> �ߺ� ������ ���.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL -- Will connect the two tables and will print the values that are appear twice
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- INTERSECT
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT -- It will print the values that appear multiple times in the both tables.
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- MINUS the table that you input first will be the reference.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS -- It will erase the values that appear multiple times in the table and print the rest of the table.
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS 
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';






















