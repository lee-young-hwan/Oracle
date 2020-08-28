SELECT ename
FROM emp
WHERE ename LIKE '$_T%' ESCAPE '$'; -- ESCAPE '$'�� $�ڿ� ���ڸ� Ư�����ڰ� �ƴ� �Ϲݵ����ͷ� ģ�� 

--�츮 ȸ�翡�� ���ʽ��� ���� �ʴ� ��� ������ ��ȸ�Ͻÿ�
SELECT *
FROM emp
WHERE comm IS NOT NULL;  -- NULL�� ��ġ�ϴ� �� : IS NULL  / NULL�� ��ġ���� �ʴ� �� : IS NOT NULL

-- �츮 ȸ�翡�� �Ŵ����� ���� ����� ������ ����Ͻÿ�
SELECT *
FROM emp
WHERE mgr IS NULL;

-- ���ʽ� ���� ��������
SELECT *
FROM emp
ORDER BY comm DESC;

CREATE TABLE emp10
AS
SELECT * FROM emp
WHERE deptno = 10;

CREATE TABLE emp20
AS
SELECT * FROM emp
WHERE deptno = 20;


SELECT * FROM emp10;   -- 3��
SELECT * FROM emp20;   -- 5��


CREATE TABLE emp_1020
AS
SELECT empno, ename, deptno
FROM emp10
UNION
SELECT empno, ename, deptno
FROM emp20;


CREATE TABLE emp_clerk
AS
SELECT * FROM emp
WHERE job = 'CLERK';

CREATE TABLE emp_manager
AS
SELECT * FROM emp
WHERE job = 'MANAGER';

--emp_tf ���̺��� �����ϵ� �� ����� ���, �̸�, ���������� ������ �� ���� ���̺��� ��ġ����
-- ������
CREATE TABLE emp_tf
AS
SELECT empno, ename, job
FROM emp_clerk   -- 4��
UNION
SELECT empno, ename, job 
FROM emp_manager; -- 7��

-- ������
SELECT ename, job
FROM emp   -- 14��
MINUS
SELECT ename, job
FROM emp_clerk; -- 4��

-- ������
SELECT ename, job
FROM emp   -- 14��
INTERSECT
SELECT ename, job
FROM emp_clerk; -- 4��


SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM emp
WHERE ENAME LIKE '%S';

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';


SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000;


SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE SAL < 2000 OR SAL > 3000;


SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30;


--SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO (�ٽ��غ���)
--FROM EMP
--WHERE COMM IS NULL AND JOB IN('MANAGER', 'CLERK') OR ENAME LIKE '_L%';



-- 2-1 BASIC SELECT �ǽ� 11��

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= '1983-01-01'; 


-- 2-1 BASIC SELECT �ǽ� 12��
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL <= COMM;


-- 2-1 BASIC SELECT �ǽ� 20��
SELECT ENAME, SAL, COMM, (SAL + COMM)
FROM EMP
ORDER BY (SAL + COMM) ASC; 


-- 2-1 BASIC SELECT �ǽ� 21�� (�ٽ��غ���)
SELECT ENAME, SAL, COMM, DEPTNO
FROM DEPT
WHERE DEPTNO = 10 AND SAL*1.3 = COMM;


-- 2-1 BASIC SELECT �ǽ� 40��
SELECT *
FROM EMP
WHERE ENAME > 'K%';


-- ���� �� �Լ� �ٷ��
-- 1. ���� �Լ� �ٷ��
SELECT *
FROM EMP
--WHERE job = UPPER('SALESMAN');  
WHERE LOWER(job) = 'salesman';

SELECT UPPER('hello, world'), LOWER('HELLO, WORLD'), INITCAP('HELLO, WORLD')
FROM dual;


-- job�� salesman�� ����� ���, ����̸��� �빮�ڷ� ���
SELECT INITCAP(ename)
FROM EMP
WHERE job = UPPER('SALESMAN');

SELECT LENGTH('SCOTT'), LENGTHB('SCOTT'),
LENGTH('�ȳ��ϼ���'), LENGTHB('�ȳ��ϼ���')
FROM dual;

SELECT parameter, value
FROM NLS_SESSION_PARAMETERS;

SELECT ENAME
FROM EMP
WHERE LENGTH(ENAME) > 5;


SELECT job, substr(job, 4, 3), substr(job, 3) 
FROM EMP
WHERE deptno = 10;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- 1987�⿡ �Ի��� ���
--SELECT empno, ename, hiredate
--FROM emp
--WHERE hiredate >= '1987-01-01' AND hiredate <= '1987-12-31';
--WHERE HIREDATE BETWEEN '1987-01-01' AND '1987-12-31';
--WHERE hiredate LIKE '1987%';

-- �̸��� B�� J ������ ��� ����� ��������Ͻÿ�
SELECT *
FROM emp
WHERE SUBSTR(ename, 1, 1) BETWEEN 'B' AND 'J';

SELECT ename, LENGTH(ename),LOWER(ename), SUBSTR(ename, 1, 3), INSTR(ename, 'A')
FROM emp
WHERE deptno = 20;

SELECT *
FROM zipcode
--WHERE dong LIKE '%����%';
WHERE dong LIKE CONCAT(CONCAT('%', '����'), '%');

SELECT 'aaHelloaa', LTRIM('aaHelloaa', 'a'), RTRIM('aaHelloaa', 'a'),
       TRIM(BOTH 'a' FROM 'aaHelloaa')
FROM dual; 

-- CHR(10) �� �ٹٲ����� / CTRL+ENTER ���� F5�� �����ؾ߉�
SELECT 'Hello' || ', World' || CHR(10) || CHR(36) || 'Oracle Programming'
FROM dual;


SELECT GREATEST('������', '������', '������'), LEAST('������', '������', '������')
FROM dual;

 
