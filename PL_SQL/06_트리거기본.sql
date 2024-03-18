
/*
trigger�� ���̺� ������ ���·ν�, INSERT, UPDATE, DELETE �۾��� ����� ��
Ư�� �ڵ尡 �۵��ǵ��� �ϴ� �����Դϴ�.
VIEW���� ������ �Ұ����մϴ�.

Ʈ���Ÿ� ���� �� ���� �����ϰ� F5��ư���� �κ� �����ؾ� �մϴ�.
�׷��� ������ �ϳ��� �������� �νĵǾ� ���� �������� �ʽ��ϴ�.
*/

CREATE TABLE tb1_test (
    id NUMBER(10),
    text VARCHAR2 (20)
);

CREATE OR REPLACE TRIGGER trg_test
    AFTER DELETE OR UPDATE -- Ʈ������ ���� ���� (���� Ȥ�� ���� ���Ŀ� ����)
    ON tb1_test -- Ʈ���Ÿ� ������ ���̺�
    FOR EACH ROW -- �� �࿡ ��� ���� (���� ����. ���� �� �� ���� ����)
-- DECLARE�� ���� ����
BEGIN
    dbms_output.put_line('Ʈ���Ű� ������'); -- �����ϰ��� �ϴ� �ڵ带 begin ~ end ���̿� ����.
END;

INSERT INTO tb1_test VALUES(1, '�����');
INSERT INTO tb1_test VALUES(2, 'ȫ�浿');
INSERT INTO tb1_test VALUES(3, '�ڿ���'); -- Ʈ���� ���� X
SELECT * FROM tb1_test;
UPDATE tb1_test SET text = '�谳��' WHERE id = 1;
DELETE FROM tb1_test WHERE id = 1;

















































