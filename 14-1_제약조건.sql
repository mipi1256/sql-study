-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű) - Doesn't accept NULL as a value
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����) - Does accept NULL as a value but it doesn't let multiple of value with the same name. 
-- NOT NULL: null�� ������� ����. (�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

-- �÷� ���� ���� ���� (�÷� ���𸶴� �������� ����) (COLUMN CONDITIONS)
CREATE TABLE dept2(
    -- dept_no NUMBER(2) PRIMARY KEY, If there is no CONSTRAINT then it will be hard to select it in the future. But for PRIMARY Key its okay to not name it.
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY, -- �������� �ĺ��ڴ� ������ �����մϴ�. (����Ŭ�� �˾Ƽ� �̸� ����)
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id), -- use REFERENCES to show which table PK you are choosing.
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000), -- CHECK use a condition to the column and anything below or over it won't be able to be added.
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
); 

DROP TABLE dept2;

-- ���̺� ���� ���� ���� (��� �� ���� �� ���� ������ ���ϴ� ���)
CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) CONSTRAINT dept_name_notnull NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
); 

-- �ܷ� Ű(FOREING KEY)�� �θ����̺�(�������̺�)�� ���ٸ� INSERT �Ұ���.
INSERT INTO dept2
VALUES(10, 'gg', 6542, 90000, 'M'); -- ERROR -> 6542�� ������ ����!

INSERT INTO dept2
VALUES(10, 'gg', 1900, 90000, 'M'); -- IT CANNOT BE INSERTED AGAIN BECAUSE OF THE A UNIQUE CONSTRAINT (THE PK CANNOT BE ADDED AGAIN)

INSERT INTO dept2
VALUES(20, 'hh', 1900, 90000, 'M');

UPDATE dept2
SET loca = 4000
WHERE dept_no = 10; -- ����(�ܷ�(FK)Ű �������� ����)

UPDATE dept2
SET dept_no = 20
WHERE dept_no = 10; -- ����(�ֿ�(PK)Ű �������� ����)

UPDATE dept2
SET dept_bonus = 9000
WHERE dept_no = 10; -- ���� (CHECK �������� ����)

-- ���̺� ���� ���� �������� �߰� �� ����, ����
-- ���� ������ �߰�, ������ �����մϴ�. ������ �ȵ˴ϴ�.
-- �����Ϸ��� �����ϰ� ���ο� �������� �߰��ؾ� �մϴ�.

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1)
);

-- �ֿ�(PK)Ű �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no);
-- �ܷ�(FK)Ű �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_loca_locid_fk
FOREIGN KEY(loca) REFERENCES locations(location_id);
-- CHECK �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000);
-- UNIQUE �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_ck UNIQUE(dept_name);
-- NOT NULL�� �� �������·� �����մϴ�.
ALTER TABLE dept2 MODIFY dept_bonus NUMBER(10) NOT NULL;

-- ���� ���� Ȯ��
SELECT * FROM user_constraints
WHERE table_name = 'DEPT2';

-- ���� ���� ���� (���� ������ �̸����� -> �̸��� ���� ���� �ʾҴٸ� ����Ŭ�� �ο��� �̸��� ����)
ALTER TABLE dept2 DROP CONSTRAINT dept2_deptno_pk;

--------------------------------------------------------------------------------

-- ���� 1 
CREATE TABLE members(
    m_name VARCHAR2(3) NOT NULL,
    m_num NUMBER(1) CONSTRAINT mem_memnum_pk PRIMARY KEY,
    reg_date DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    gender VARCHAR2(1) CONSTRAINT mem_gender_ck CHECK(gender IN ('M', 'F')), 
    loca NUMBER(4) CONSTRAINT mem_loca_loc_locid_fk REFERENCES locations(location_id)
);

SELECT * FROM user_constraints
WHERE table_name = 'MEMBERS';


INSERT INTO members
VALUES('AAA', 1, '2018-07-01', 'M', 1800);

INSERT INTO members
VALUES('BBB', 2, '2018-07-02', 'F', 1900);

INSERT INTO members
VALUES('CCC', 3, '2018-07-03', 'M', 2000);

INSERT INTO members
VALUES('DDD', 4, '2024-03-15', 'M', 2000);

SELECT * FROM members;
COMMIT;

-- ���� 2
SELECT
    m.m_name, m.m_num, loc.street_address, loc.location_id
FROM members m
INNER JOIN locations loc
ON m.loca = loc.location_id
ORDER BY m.m_num;





























