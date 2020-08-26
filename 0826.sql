-- 1. ��� row�� ��� column ��ȸ�ϱ�
SELECT ALL *
FROM salgrade;

-- 2. ahems row�� Ư�� column ��ȸ�ϱ�
SELECT job, sal, empno, ename
FROM emp;

-- 3. �μ� ���̺��� �μ���ȣ�� �μ��� ��ȸ�ϱ�
SELECT DEPTNO, DNAME
FROM dept;

-- ������̺��� �����ȣ�� �μ���ȣ ��ȸ�ϱ�
SELECT EMPNO, DEPTNO
FROM EMP;

-- ������̺��� ������ ��ȸ�ϱ�
SELECT DISTINCT job
FROM emp;

-- ������̺��� ������� �����ִ� �μ��� ��� �� �����Դϱ�?
SELECT DISTINCT deptno 
FROM emp;

-- 3. ��Ī ����ϱ�   ��Ī�� Ư�����ڸ� ���ų� ������ ������ �ݵ�� �ֵ���ǥ("")�� ���´�
SELECT empno  as "��� ��ȣ"    , ename   as "��� �̸�"        
FROM   emp;

-- DB������ null�� �����ͳ� ������ ����� �ȉ´�(empty ����)  / 0�� ������ ������
-- ���⿡���� �̸��� ���� ���� ������ AS " "�� �̸��� �����ش�
-- NVL(comm, 0) : comm�� null�̸� 0���� �ٲ��ش� 
SELECT sal * 12 + NVL(COMM, 0) AS "����"    
FROM emp;

-- ������̺��� ���, ����� �̸�, ����, ����, ���ʽ�, ������ ��ȸ�Ͻÿ�
SELECT empno AS "���", ename AS "���", job as "����", 
       sal AS "����", comm AS "���ʽ�", sal * 12 + NVL(comm, 0) AS "����" 
FROM emp;

-- ORDER BY ������ ���� column�� ���ĵ� �����ϴ�
-- 4. �����ϱ�
-- ������̺��� �μ���ȣ�� �������� ���� ������ ������������ �����Ͻÿ�
SELECT deptno, sal
FROM emp
ORDER BY deptno asc, sal desc; 


-- ������̺��� ���, ����� �̸�, ����, ����, ���ʽ�, ������ ��ȸ�Ͻÿ�
-- ��, ������ ������������ ����Ͻÿ�
SELECT empno AS "���", ename AS "���", job as "����", 
       sal AS "����", comm AS "���ʽ�", sal * 12 + NVL(comm, 0) AS "����" 
FROM emp
ORDER BY "����" DESC;

--SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO
--FROM EMP
--ORDER BY DEPTNO DESC, ENAME ASC;


-- 5. NULL ó��
-- NVL()�Լ�
--SELECT  NVL(comm, 100) -- NVL(1, 2) NVL���� ���� Ÿ���� ���ƾ��Ѵ� ex) NVL(comm, 100) 
--FROM emp;

SELECT NVL(mgr, 0)
FROM emp;

-- ���ڿ��� �������� '||' �� ���ش�
-- 6. ���ڿ� �����ϱ�
SELECT 'Hello' || ', World'
FROM dual;

SELECT '�����ȣ ' || empno || '�� ' || ename || '�Դϴ�'
FROM emp;

-- 7. ������
SELECT ename, job, sal
FROM emp
WHERE deptno = 10;

SELECT SAL
FROM EMP
WHERE EMPNO = 7782;

-- ������̺��� �μ���ȣ�� 20�� �μ��� �����ִ� ��� �߿� ������ 1000�� ������ ����� ������ ��ȸ�Ͻÿ�
SELECT ename
FROM emp
WHERE deptno = 20 and sal <= 1000;


SELECT sal
FROM EMP
WHERE EMPNO = 7369;

-- ������̺��� �μ���ȣ�� 10���̰ų� ������ 3000�ҿ��� 5000�� ������ �����
-- ���, �̸�, ����, �μ���ȣ�� ��ȸ�Ͻÿ�
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10 OR (SAL >= 3000 AND SAL <= 5000); 

-- ������������ NOT
SELECT deptno, dname, loc
FROM dept
--WHERE NOT (deptno = 10 OR deptno = 20);
WHERE deptno NOT IN(10,20);  -- IN�� OR�� ��ü

-- ������̺��� ������ SALESMAN�̰ų� MANAGER�̰ų� PRESIDENT�� ����� 
-- ����̸�, ������ ��ȸ�Ͻÿ�

SELECT ename, job
FROM EMP
WHERE job IN('SALESMAN', 'MANAGER', 'PRESIDENT');