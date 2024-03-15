
-- ����� ���� Ȯ��
SELECT * FROM all_users;

-- ���� ���� ���
CREATE USER user1 IDENTIFIED BY user1;

/*
DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)

CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE...

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]
*/

GRANT CREATE SESSION TO user1; -- SESSION LOGIN ���� �ִ¹�

GRANT SELECT ON hr.departments TO user1; -- SELECT ���� �ִ¹� 
GRANT INSERT ON hr.departments TO user1; -- INSERT ���� �ִ¹�

INSERT INTO departments
VALUES(300, 'test', 100, 1800);

GRANT CREATE TABLE TO user1; -- TABLE ���� ���Ѹ�

GRANT RESOURCE, CONNECT, DBA TO user1; -- ��� ���� �ִ¹�

REVOKE RESOURCE, CONNECT, DBA FROM user1; -- ��� ���� ���¹�

-- ���̺��� ����Ǵ� ����� ���̺� �����̽��� �����ϴ� �ڵ�
-- �⺻������ �����Ǵ� users ���̺� �����̽��� ��뷮�� ���������� ����.
ALTER USER user1
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;

-- ����� ���� ����
-- DROP USER [�����̸�] CASCADE;
-- CASCADE ���� �� -> ���̺� or ������ �� ��ü�� �����Ѵٸ� ���� ���� �ȵ�.
-- If you don't write CASCADE then you have to organize anything that was made inside the user
-- If you don't organize it then it will not be able to delete the user.
-- However, if you use CASCADE then the USER will get deleted by force and delete all the files or anything that was made inside the deleted user.
DROP USER user1 CASCADE; -- TO DELETE A USER 










































