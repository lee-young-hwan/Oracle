REM 숫자 함수
-- 1. round()
SELECT ROUND(45.925, 2), ROUND(45.925, 0), ROUND(45.925, -1)
FROM DUAL;

-- 2-1 Basic SELECT 실습 23번
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
SELECT 15 / 6, MOD(15,6)        -- 몫 , 나머지
FROM DUAL;

-- 5. NVL2()
SELECT deptno, comm, NVL(comm, 0), NVL2(comm, comm*1.1, 0), NULLIF(comm, NULL)
FROM EMP
WHERE deptno IN (10,30)
ORDER BY deptno; 

-- 6. NULLIF()
SELECT NULLIF(sal, 800)
FROM EMP
WHERE ename = UPPER('smith');  -- smith의 sal이 800이면 null, 아니면 sal

-- 7. COALESCE
SELECT deptno, comm, COALESCE(comm, 100)  -- NULL이면 100, NULL이 아니면 COMM을 출력
FROM emp
WHERE deptno IN(10, 30)
ORDER BY deptno;

-- 8. DECODE   IF~ IF ELSE 개념
SELECT deptno, sal, DECODE(deptno, 10, sal*1.1, 20, sal*1.5, sal) AS "보너스"
FROM emp
ORDER BY deptno;

SELECT job, sal, DECODE(job, 'ANALYST', sal*0.1, 'CLERK', sal*0.2, 'MANAGER', sal*0.3, 0) AS "보너스"
FROM emp
ORDER BY job;

-- 입사한 년도 87년 = '사원' , 82년 = '과장', 81년 = '부장', 80년 = '이사' 
SELECT ename, CONCAT('19', TO_CHAR(hiredate, 'RR')) AS "입사년도",
       DECODE(TO_CHAR(hiredate, 'RR'), '80', '이사', 
                                       '81', '부장', 
                                       '82', '과장', 
                                             '사원') AS "직급"
FROM emp
ORDER BY "입사년도";

-- 9. CASE
SELECT deptno, sal, DECODE(deptno, 10, sal*1.1, 20, sal*1.5, sal) AS "보너스"
FROM emp
ORDER BY deptno;

SELECT deptno, sal, CASE 
                        WHEN deptno = 10 THEN sal*1.1
                        WHEN deptno = 20 THEN sal*1.5
                        ELSE sal 
                    END AS "보너스"
FROM emp
ORDER BY deptno;

SELECT job, sal, CASE 
                    WHEN job = 'ANALYST' THEN sal*0.1
                    WHEN job = 'CLERK'   THEN sal*0.2
                    WHEN job = 'MANAGER' THEN sal*0.3
                    ELSE 0
                 END AS "보너스"
FROM emp
ORDER BY job;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT ename, TO_CHAR(hiredate, 'YYYY') AS "입사년도",
              CASE
                    WHEN TO_CHAR(hiredate, 'YYYY') = '1980' THEN '이사'
                    WHEN TO_CHAR(hiredate, 'YYYY') = '1981' THEN '부장'
                    WHEN TO_CHAR(hiredate, 'YYYY') = '1982' THEN '과장'
                    ELSE '사원'
              END AS "직급"
FROM emp
ORDER BY "입사년도";

SELECT ename, hiredate, TRUNC(TRUNC(sysdate - hiredate) / 365) || '년째 근무', TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) || '개월째 근무' 
FROM emp
WHERE deptno = 10;

SELECT SYSDATE + 5
FROM dual;                        -- 5일 뒤

SELECT ADD_MONTHS(SYSDATE, 5)
FROM dual;                        -- 5개월뒤

SELECT NEXT_DAY(NEXT_DAY(SYSDATE, '월요일'), '월요일')
FROM dual;

SELECT LAST_DAY(ADD_MONTHS(SYSDATE, 1))
FROM dual;

SELECT ROUND(sysdate, 'YEAR'), TRUNC(sysdate, 'YEAR')
FROM dual;
