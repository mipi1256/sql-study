
-- 집합 연산자
-- 서로 다른 쿼리 결과의 행들을 하나로 결합, 비교, 차이를 구할 수 있게 해 주는 연산자
-- UNION(합집합 중복x), UNION ALL(합집합 중복 o), INTERSECT(교집합), MINUS(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 합니다.

-- UNION -> 중복 데이터를 허용하지 않음.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION -- Will connect the two tables also doesn't print value that appear multiple times.
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- UNION ALL -> 중복 데이터 허용.
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






















