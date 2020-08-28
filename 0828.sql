REM ���� �Լ�
-- 1. round()
SELECT ROUND(45.925, 2), ROUND(45.925, 0), ROUND(45.925, -1)
FROM DUAL;

-- 2-1 Basic SELECT �ǽ� 23��
SELECT sal, round(sal / 12 / 5, 0)
FROM EMP
WHERE DEPTNO = 20;

-- 2. TRUNC
SELECT TRUNC(45.925, 2), TRUNC(45.925, 0), TRUNC(45.925, -1)
FROM DUAL;

-- 3. CEIL(), FLOOR()
SELECT ROUND(45.925, 2), TRUNC(45.925, 2), CEIL(45.925), FLOOR(45.925)
FROM DUAL;

SELECT ROUND(-45.925, 2), TRUNC(-45.925, 2), CEIL(-45.925), FLOOR(-45.925)
FROM DUAL;

-- 4. MOD()
SELECT 15 / 6, MOD(15,6)        -- �� , ������
FROM DUAL;

-- 5. NVL2()
SELECT deptno, comm, NVL(comm, 0), NVL2(comm, comm*1.1, 0), NULLIF(comm, NULL)
FROM EMP
WHERE deptno IN (10,30)
ORDER BY deptno; 

-- 6. NULLIF()
SELECT NULLIF(sal, 800)
FROM EMP
WHERE ename = UPPER('smith');  -- smith�� sal�� 800�̸� null, �ƴϸ� sal

-- 7. COALESCE
SELECT deptno, comm, COALESCE(comm, 100)  -- NULL�̸� 100, NULL�� �ƴϸ� COMM�� ���
FROM emp
WHERE deptno IN(10, 30)
ORDER BY deptno;

-- 8. DECODE   IF~ IF ELSE ����
SELECT deptno, sal, DECODE(deptno, 10, sal*1.1, 20, sal*1.5, sal) AS "���ʽ�"
FROM emp
ORDER BY deptno;

SELECT job, sal, DECODE(job, 'ANALYST', sal*0.1, 'CLERK', sal*0.2, 'MANAGER', sal*0.3, 0) AS "���ʽ�"
FROM emp
ORDER BY job;

-- �Ի��� �⵵ 87�� = '���' , 82�� = '����', 81�� = '����', 80�� = '�̻�' 
SELECT ename, CONCAT('19', TO_CHAR(hiredate, 'RR')) AS "�Ի�⵵",
       DECODE(TO_CHAR(hiredate, 'RR'), '80', '�̻�', 
                                       '81', '����', 
                                       '82', '����', 
                                             '���') AS "����"
FROM emp
ORDER BY "�Ի�⵵";

-- 9. CASE
SELECT deptno, sal, DECODE(deptno, 10, sal*1.1, 20, sal*1.5, sal) AS "���ʽ�"
FROM emp
ORDER BY deptno;

SELECT deptno, sal, CASE 
                        WHEN deptno = 10 THEN sal*1.1
                        WHEN deptno = 20 THEN sal*1.5
                        ELSE sal 
                    END AS "���ʽ�"
FROM emp
ORDER BY deptno;

SELECT job, sal, CASE 
                    WHEN job = 'ANALYST' THEN sal*0.1
                    WHEN job = 'CLERK'   THEN sal*0.2
                    WHEN job = 'MANAGER' THEN sal*0.3
                    ELSE 0
                 END AS "���ʽ�"
FROM emp
ORDER BY job;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT ename, TO_CHAR(hiredate, 'YYYY') AS "�Ի�⵵",
              CASE
                    WHEN TO_CHAR(hiredate, 'YYYY') = '1980' THEN '�̻�'
                    WHEN TO_CHAR(hiredate, 'YYYY') = '1981' THEN '����'
                    WHEN TO_CHAR(hiredate, 'YYYY') = '1982' THEN '����'
                    ELSE '���'
              END AS "����"
FROM emp
ORDER BY "�Ի�⵵";

SELECT ename, hiredate, TRUNC(TRUNC(sysdate - hiredate) / 365) || '��° �ٹ�', TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) || '����° �ٹ�' 
FROM emp
WHERE deptno = 10;

SELECT SYSDATE + 5
FROM dual;                        -- 5�� ��

SELECT ADD_MONTHS(SYSDATE, 5)
FROM dual;                        -- 5������

SELECT NEXT_DAY(NEXT_DAY(SYSDATE, '������'), '������')
FROM dual;

SELECT LAST_DAY(ADD_MONTHS(SYSDATE, 1))
FROM dual;

SELECT ROUND(sysdate, 'YEAR'), TRUNC(sysdate, 'YEAR')
FROM dual;
