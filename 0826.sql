-- 1. 모든 row와 모든 column 조회하기
SELECT ALL *
FROM salgrade;

-- 2. ahems row와 특정 column 조회하기
SELECT job, sal, empno, ename
FROM emp;

-- 3. 부서 테이블에서 부서번호와 부서명 조회하기
SELECT DEPTNO, DNAME
FROM dept;

-- 사원테이블에서 사원번호와 부서번호 조회하기
SELECT EMPNO, DEPTNO
FROM EMP;

-- 사원테이블에서 직무를 조회하기
SELECT DISTINCT job
FROM emp;

-- 사원테이블에서 사원들이 속해있는 부서는 모두 몇 가지입니까?
SELECT DISTINCT deptno 
FROM emp;

-- 3. 별칭 사용하기   별칭이 특수문자를 쓰거나 공백이 있으면 반드시 쌍따옴표("")로 묶는다
SELECT empno  as "사원 번호"    , ename   as "사원 이름"        
FROM   emp;

-- DB에서는 null이 데이터나 연산의 대상이 안됀다(empty 개념)  / 0은 연산이 가능함
-- 추출에서는 이름이 따로 없기 때문에 AS " "로 이름을 지어준다
-- NVL(comm, 0) : comm이 null이면 0으로 바꿔준다 
SELECT sal * 12 + NVL(COMM, 0) AS "연봉"    
FROM emp;

-- 사원테이블에서 사번, 사원의 이름, 직무, 월급, 보너스, 연봉을 조회하시오
SELECT empno AS "사원", ename AS "사원", job as "직무", 
       sal AS "월급", comm AS "보너스", sal * 12 + NVL(comm, 0) AS "연봉" 
FROM emp;

-- ORDER BY 정렬은 없는 column의 정렬도 가능하다
-- 4. 정렬하기
-- 사원테이블에서 부서번호로 오름차순 정렬 월급을 내림차순으로 정렬하시오
SELECT deptno, sal
FROM emp
ORDER BY deptno asc, sal desc; 


-- 사원테이블에서 사번, 사원의 이름, 직무, 월급, 보너스, 연봉을 조회하시오
-- 단, 연봉은 내림차순으로 출력하시오
SELECT empno AS "사원", ename AS "사원", job as "직무", 
       sal AS "월급", comm AS "보너스", sal * 12 + NVL(comm, 0) AS "연봉" 
FROM emp
ORDER BY "연봉" DESC;

--SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO
--FROM EMP
--ORDER BY DEPTNO DESC, ENAME ASC;


-- 5. NULL 처리
-- NVL()함수
--SELECT  NVL(comm, 100) -- NVL(1, 2) NVL안의 값은 타입이 같아야한다 ex) NVL(comm, 100) 
--FROM emp;

SELECT NVL(mgr, 0)
FROM emp;

-- 문자열을 이을때는 '||' 를 써준다
-- 6. 문자열 연결하기
SELECT 'Hello' || ', World'
FROM dual;

SELECT '사원번호 ' || empno || '는 ' || ename || '입니다'
FROM emp;

-- 7. 조건절
SELECT ename, job, sal
FROM emp
WHERE deptno = 10;

SELECT SAL
FROM EMP
WHERE EMPNO = 7782;

-- 사원테이블에서 부서번호가 20번 부서에 속해있는 사원 중에 월급이 1000불 이하인 사원의 정보를 조회하시오
SELECT ename
FROM emp
WHERE deptno = 20 and sal <= 1000;


SELECT sal
FROM EMP
WHERE EMPNO = 7369;

-- 사원테이블에서 부서번호가 10번이거나 월급이 3000불에서 5000불 사이인 사원의
-- 사번, 이름, 월급, 부서번호를 조회하시오
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10 OR (SAL >= 3000 AND SAL <= 5000); 

-- 논리부정연산자 NOT
SELECT deptno, dname, loc
FROM dept
--WHERE NOT (deptno = 10 OR deptno = 20);
WHERE deptno NOT IN(10,20);  -- IN은 OR를 대체

-- 사원테이블에서 직무가 SALESMAN이거나 MANAGER이거나 PRESIDENT인 사원의 
-- 사원이름, 직무를 조회하시오

SELECT ename, job
FROM EMP
WHERE job IN('SALESMAN', 'MANAGER', 'PRESIDENT');