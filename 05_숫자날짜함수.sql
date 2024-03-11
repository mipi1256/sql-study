
-- 숫자함수
-- ROUND(반올림)
-- 원하는 반울림 위치를 매개값으로 지정. 음수를 주는 것도 가능.
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수가지 잘라냅니다.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS(절대값)
SELECT 
    ABS(-34) FROM dual;

-- CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14) 
FROM dual;

-- MOD(나머지 나눗셈 연산)
-- 10 % 4 is not a write code. The % doesn't work in SQL
SELECT
    10 / 4, MOD(10, 4)
FROM dual;

--------------------------------------------------------------------------------

-- 날짜함수
-- sysdate: 컴퓨터의 현재 날짜, 시간 정보를 가져와서 제공하는 함수 -> 시간 정보도 있음!
SELECT sysdate FROM dual; -- This will show the current date (YEAR/MONTH/DAY HOUR/MINUTE/SECOND)
SELECT systimestamp FROM dual; -- This will show more in detail time (+ MILSEC and KOREAN TIME) -> 밀리초, 표준시까지 제공.

-- 날짜도 연산이 가능합니다
SELECT sysdate + 1 FROM dual; -- 일자 뎃셈 연산이 가능
SELECT sysdate - 1 FROM dual; -- 일자 나눗셈 연산이 가능

-- 날짜타입과 날짜 타입은 뺄셈 연산을 지원합니다.
-- 뎃셈을 허용하지 않습니다.
SELECT
    first_name, sysdate - hire_date
FROM employees; -- 일짜

SELECT
    first_name, 
    (sysdate - hire_date) / 7 AS week
FROM employees; -- 주수

SELECT
    first_name, 
    (sysdate - hire_date) / 365 AS year
FROM employees; -- 년수 

-- 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual; -- You can round up base on the year // 년 기준으로 반올림.
SELECT ROUND(sysdate, 'month') FROM dual; -- You can round up base on the month // 월 기준으로 반올림.
SELECT ROUND(sysdate, 'day') FROM dual; -- You can round up base on the day but the first day is *SUNDAY* // 주 기준으로 반올림(해당 주의 일요일 날짜)

SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate, 'year') FROM dual; -- You can round up base on the year // 년 기준으로 반올림.
SELECT TRUNC(sysdate, 'month') FROM dual; -- You can round up base on the month // 월 기준으로 반올림.
SELECT TRUNC(sysdate, 'day') FROM dual; -- You can round up base on the day but the first day is *SUNDAY* // 주 기준으로 반올림(해당 주의 일요일 날짜)































