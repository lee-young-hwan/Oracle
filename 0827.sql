SELECT ename
FROM emp
WHERE ename LIKE '$_T%' ESCAPE '$'; -- ESCAPE '$'는 $뒤에 문자를 특수문자가 아닌 일반데이터로 친다 

--우리 회사에서 보너스를 받지 않는 사원 정보를 조회하시오
SELECT *
FROM emp
WHERE comm IS NOT NULL;  -- NULL과 일치하는 값 : IS NULL  / NULL과 일치하지 않는 값 : IS NOT NULL

-- 우리 회사에서 매니저가 없는 사원의 정보를 출력하시오
SELECT *
FROM emp
WHERE mgr IS NULL;

-- 보너스 기준 내림차순
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


SELECT * FROM emp10;   -- 3명
SELECT * FROM emp20;   -- 5명


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

--emp_tf 테이블을 생성하되 각 사원의 사번, 이름, 직무만으로 구성된 두 개의 테이블을 합치세요
-- 합집합
CREATE TABLE emp_tf
AS
SELECT empno, ename, job
FROM emp_clerk   -- 4명
UNION
SELECT empno, ename, job 
FROM emp_manager; -- 7명

-- 차집합
SELECT ename, job
FROM emp   -- 14명
MINUS
SELECT ename, job
FROM emp_clerk; -- 4명

-- 교집합
SELECT ename, job
FROM emp   -- 14명
INTERSECT
SELECT ename, job
FROM emp_clerk; -- 4명


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


--SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO (다시해보기)
--FROM EMP
--WHERE COMM IS NULL AND JOB IN('MANAGER', 'CLERK') OR ENAME LIKE '_L%';



-- 2-1 BASIC SELECT 실습 11번

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= '1983-01-01'; 


-- 2-1 BASIC SELECT 실습 12번
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL <= COMM;


-- 2-1 BASIC SELECT 실습 20번
SELECT ENAME, SAL, COMM, (SAL + COMM)
FROM EMP
ORDER BY (SAL + COMM) ASC; 


-- 2-1 BASIC SELECT 실습 21번 (다시해보기)
SELECT ENAME, SAL, COMM, DEPTNO
FROM DEPT
WHERE DEPTNO = 10 AND SAL*1.3 = COMM;


-- 2-1 BASIC SELECT 실습 40번
SELECT *
FROM EMP
WHERE ENAME > 'K%';


-- 단일 행 함수 다루기
-- 1. 문자 함수 다루기
SELECT *
FROM EMP
--WHERE job = UPPER('SALESMAN');  
WHERE LOWER(job) = 'salesman';

SELECT UPPER('hello, world'), LOWER('HELLO, WORLD'), INITCAP('HELLO, WORLD')
FROM dual;


-- job이 salesman인 사람만 출력, 사원이름이 대문자로 출력
SELECT INITCAP(ename)
FROM EMP
WHERE job = UPPER('SALESMAN');

SELECT LENGTH('SCOTT'), LENGTHB('SCOTT'),
LENGTH('안녕하세요'), LENGTHB('안녕하세요')
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

-- 1987년에 입사한 사람
--SELECT empno, ename, hiredate
--FROM emp
--WHERE hiredate >= '1987-01-01' AND hiredate <= '1987-12-31';
--WHERE HIREDATE BETWEEN '1987-01-01' AND '1987-12-31';
--WHERE hiredate LIKE '1987%';

-- 이름이 B와 J 사이의 모든 사원의 정보출력하시오
SELECT *
FROM emp
WHERE SUBSTR(ename, 1, 1) BETWEEN 'B' AND 'J';

SELECT ename, LENGTH(ename),LOWER(ename), SUBSTR(ename, 1, 3), INSTR(ename, 'A')
FROM emp
WHERE deptno = 20;

SELECT *
FROM zipcode
--WHERE dong LIKE '%개포%';
WHERE dong LIKE CONCAT(CONCAT('%', '개포'), '%');

SELECT 'aaHelloaa', LTRIM('aaHelloaa', 'a'), RTRIM('aaHelloaa', 'a'),
       TRIM(BOTH 'a' FROM 'aaHelloaa')
FROM dual; 

-- CHR(10) 은 줄바꿈형식 / CTRL+ENTER 말고 F5로 실행해야됌
SELECT 'Hello' || ', World' || CHR(10) || CHR(36) || 'Oracle Programming'
FROM dual;


SELECT GREATEST('한지민', '김지민', '박지민'), LEAST('한지민', '김지민', '박지민')
FROM dual;

 
