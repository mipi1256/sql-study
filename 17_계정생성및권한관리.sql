
-- 사용자 계정 확인
SELECT * FROM all_users;

-- 계정 생성 명령
CREATE USER user1 IDENTIFIED BY user1;

/*
DCL: GRANT(권한 부여), REVOKE(권한 회수)

CREATE USER -> 데이터베이스 유저 생성 권한
CREATE SESSION -> 데이터베이스 접속 권한
CREATE TABLE -> 테이블 생성 권한
CREATE VIEW -> 뷰 생성 권한
CREATE SEQUENCE -> 시퀀스 생성 권한
ALTER ANY TABLE -> 어떠한 테이블도 수정할 수 있는 권한
INSERT ANY TABLE -> 어떠한 테이블에도 데이터를 삽입하는 권한.
SELECT ANY TABLE...

SELECT ON [테이블 이름] TO [유저 이름] -> 특정 테이블만 조회할 수 있는 권한.
INSERT ON....
UPDATE ON....

- 관리자에 준하는 권한을 부여하는 구문.
RESOURCE, CONNECT, DBA TO [유저 이름]
*/

GRANT CREATE SESSION TO user1; -- SESSION LOGIN 권한 주는법

GRANT SELECT ON hr.departments TO user1; -- SELECT 권한 주는법 
GRANT INSERT ON hr.departments TO user1; -- INSERT 권한 주는법

INSERT INTO departments
VALUES(300, 'test', 100, 1800);

GRANT CREATE TABLE TO user1; -- TABLE 생성 권한만

GRANT RESOURCE, CONNECT, DBA TO user1; -- 모든 권한 주는법

REVOKE RESOURCE, CONNECT, DBA FROM user1; -- 모든 권한 빼는법

-- 테이블이 저장되는 장소인 테이블 스페이스를 설정하는 코드
-- 기본적으로 제공되는 users 테이블 스페이스의 사용량을 무제한으로 지정.
ALTER USER user1
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;

-- 사용자 계정 삭제
-- DROP USER [유저이름] CASCADE;
-- CASCADE 없을 시 -> 테이블 or 시퀀스 등 객체가 존재한다면 계정 삭제 안됨.
-- If you don't write CASCADE then you have to organize anything that was made inside the user
-- If you don't organize it then it will not be able to delete the user.
-- However, if you use CASCADE then the USER will get deleted by force and delete all the files or anything that was made inside the deleted user.
DROP USER user1 CASCADE; -- TO DELETE A USER 










































