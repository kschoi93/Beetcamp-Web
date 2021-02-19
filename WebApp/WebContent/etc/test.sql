select concat('oracle', 'korea') name from dual;
select initcap('kang shin hun') name from dual;
select lower('KANG SHIN HUN') name from dual;
select upper('kang shin hun') name from dual;
select substr('jung-sick',3,3) name from dual;
select instr('corprate floor','ok') "Instring" from dual;
select instr('corporate floor','or',3)"instring" from dual;
select trim( 00099362000        ) "TRIM Example" FROM dual;
select ltrim('xyxXxyLast WORD','xy') "LTRIM Example" from dual;
select empno,nvl(comm,0) from emp where deptno = 30;
select * from emp;
select empno, ename,job,hiredate,sal,comm from emp;
select empno, ename,job,hiredate,sal,comm,sal+comm "ม๖ฑÞพื" from emp;
select ename, job,sal,nvl(comm,0) from emp where sal between 1000 and 3000 and job = 'SALESMAN' order by sal desc;
select deptno, decode(deptno,10,'ACCOUNTIN',20,'RESEARCH',30,'SALES',40,'OPERATIONS')as department from emp;
select * from tab;
select * from dept;
select * from member;
select * from emp;

select * from tab;
desc bookstbl;
desc pubtbl;
desc authortbl;

SELECT SYSDATE TODAY, LAST_DAY(SYSDATE) LASTDAY FROM dual;
select add_months(sysdate,5) from dual;
select months_between(to_date(sysdate),to_date('2021/09/01')) "Date" from dual;
select round(to_date(sysdate),'month') from dual;

select * from user_constraints;
purge recyclebin;
drop table bookstbl;
drop table pubtbl;
drop table authortbl;