use day02;

create table employee (
empno int(4),  -- 사원번호
ename varchar(10),  -- 사원이름
job varchar(9), -- 직무
mgr int(4),   -- 상사코드
hiredate date, -- 입사일
sal int(7), -- 급여
comm int(7), -- 보너스
deptno int(2), -- 부서번호
primary key (empno)
);

-- 데이터를 삽입하기
insert into employee (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values( 1001, '김사랑', '사원', 1013, '2007-10-20', 300, 0, 20);

-- 삽입할떄 컬럼순서가 테이블이 있는 컬럼의 순서와 동일할경우 생략할수있다alter
insert into employee values(1002,'한예슬', '대리', 1005, '2007-04-02', 250, 6, 30);
-- 삽입할때 테이블에 있는 모든 필드가 아니라 일부 필드만 삽입할경우

insert into employee(empno, ename, hiredate, sal, deptno)
values(1004, '오지호', '2005-02-10', 500, 30);

/*insert into employee(ename, hiredate, sal, deptno)
values('이병헌', '2003-09-02', 700, 20);
-- empno는 기본키이기 때문에 같은게 2번있으면 안된다.
insert into employee(empno, ename, hiredate, sal, deptno)
values(1004, '홍길동', '2005-02-10', 600, 30);*/

-- 오지호 레코드( 한줄 한행 fow tuple) 삭제하기
delete from employee where ename = '오지호';

                       

INSERT INTO  employee ( empno, ename,  job, mgr, hiredate, sal, comm, deptno )

                       VALUES (1003, '오지호', '과장', 1005, '2005/02/10',  500, 100,30);                     

                        

INSERT INTO  employee ( empno, ename,  job, mgr, hiredate, sal, comm, deptno )

                       VALUES (1005, '신동엽', '과장', 1005, '2005/04/07',  450, 200,30);   

INSERT INTO  employee ( empno, ename,  job, mgr, hiredate, sal, comm, deptno )

                       VALUES (1006, '장동건', '부장', 1008, '2004/01/08',  520, 0,20);                         

INSERT INTO  employee ( empno, ename,  job, mgr, hiredate, sal, comm, deptno )

                       VALUES (1007, '김우성', '차장', 1008, '2005/03/08',  500, 0,30);                    

INSERT INTO  employee ( empno, ename,  job, mgr, hiredate, sal, comm, deptno )

                       VALUES (1008, '안성기', '사장', 0, '1996/04/07',  1000, 0,30); 
                       
                       create table dept (
                       deptno int(2),
                       dname varchar(14),
                       loc varchar(13),
                       primary key (deptno));
                       
INSERT INTO  dept ( deptno, dname, loc)    VALUES(10, '경리부', '서울');

INSERT INTO  dept ( deptno, dname, loc)    VALUES(20, '인사부', '인천');

INSERT INTO  dept ( deptno, dname, loc)    VALUES(30, '영업부', '용인');

INSERT INTO  dept ( deptno, dname, loc)    VALUES(40, '전산부', '수원');  


-- 급여등급 테이블
create table salgrade(
grade int(10),
loscal int(10),
hisal int(20)
);

INSERT INTO salgrade(grade, loscal, hisal)  VALUES(1, 700, 1200);

INSERT INTO salgrade(grade, loscal, hisal)  VALUES(2, 1201, 1400);

INSERT INTO salgrade(grade, loscal, hisal)  VALUES(3, 1401, 2000);

INSERT INTO salgrade(grade, loscal, hisal)  VALUES(4, 2001, 3000);

INSERT INTO salgrade(grade, loscal, hisal)  VALUES(5, 3001, 9999);  


select*from employee;
select*from dept;
select*from salgrade;

-- select문 검색 조회

use employees;
-- 데이터베이스안의 테이블 보기 show 
show tables;
select*from titles; -- 테이블안에 데이터를 검색
desc titles; -- 테이블 구조 보기

select first_name from employees;

-- 데이터베이스 day02으로 열기
use day02;
-- 테이블을 모두 보기
show tables;
-- employee 테이블의 자료 모두 보기
select*from employee;
-- employee 테이블의 구조보기
desc employee;
-- 사원번호 급여 보기
select empno, sal from employee;
select empno as 사원번호, sal as 급여 from employee;
select empno 사원번호, sal 급여 from employee;

-- 사원번호, 사원이름, 급여, 연봉을 검색하기 연봉은 급여*12
select empno as 사원번호, ename as 사원이름, sal 급여, sal*12 연봉 from employee;
-- 김사랑의 사원번호, 사원이름, 부서번호 알기 
select empno, ename, deptno from employee where ename = '김사랑';
-- 김사랑 제외한 사람들 사원번호, 사원이름, 부서번호 알기 != <> 아닌것
select empno, ename, deptno from employee where ename != '김사랑';
-- 부서번호가 10번인 사람 또는 부서번호가 20번인 사람의 사원번호와 이름을 검색하기 
select empno, ename, deptno from employee where deptno = 10 or deptno = 20;
-- 급여가 300~700 사이인 사람 전체 컬럼 검색하기
select*from employee where sal >=300 and sal <= 700;
-- 입사일 2005년 이후인 사람 출력하기
select*from employee where hiredate > '2005-12-31';
-- 200페이지
select*from dept;
-- 부서번호가 30번이하이고 지역인 인천인 자료 검색
select*from dept where deptno <=30 and loc='인천';
-- 입사일 2003~2005년 사이에 있는 사람 검색하기
-- 부등호
select*from employee where hiredate >='2003-01-01' and hiredate <= '2005-12-31';
-- between ~ and
select*from employee where sal between 300 and 700;
-- job 사원 과장 대리를 출력하기 
select*from employee where job='사원' or job='과장' or job='대리';
select*from employee where job in ('사원', '과장', '대리');
-- 이름 김씨인사람 검색
select*from employee where ename like '김%';
-- 중간에있는거 검색 서울시 강동구 명일동에서 강남 검색 '%강남%'

use employees;
-- first_name에서 중간에 'o'문자가 들어있는 사람 검색하기
select*from employees where first_name like '%o%';

-- 서브 쿼리 select안에 select
use day02;
select*from employee;
-- 김사람의 봉급보다 많이받는사람
select sal from employee where ename ='김사랑';
select * from employee where sal > 300;
-- 2개를 합치기
select * from employee where sal >(select sal from employee where ename ='김사랑' );

-- 인천에 근무하는 사람의 상사의 사번알기 
select deptno, mgr from  employee where deptno = (select deptno from dept where loc ='인천'); 
-- deptno mgr loc 출력되게하기
select employee.deptno, employee.mgr, dept.loc from employee, dept where employee.deptno = dept.deptno = ( select deptno from dept where loc = '인천');
select employee.deptno, employee.mgr, dept.loc from employee, dept;

select*from employee, dept;
select*from employee;
select*from dept;

select*from employee, dept where employee.deptno = dept.deptno and employee.deptno = 20;

-- 두개의 테이블을 검핵하면 두개의 카다넬리 곱으로 출력됨
select*from employee,dept;
-- 검색 조건을 두개 테이블의 공통 필드의 같은 것으로 처리함 
select*from employee,dept where employee.deptno = dept.deptno;

select*from employee e, dept d where e.deptno = d.deptno; -- e는 employee의 별칭입니다.

drop database if exists sqldb; -- 데이터베이스 삭제
create database sqldb; -- 데이터베이스 생성

use sqldb; -- 데이터베이스 지정 

CREATE TABLE userTbl -- 회원테이블

(

userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자아이디(PK)

name VARCHAR(10) NOT NULL, -- 이름

birthYear INT NOT NULL, -- 출생년도

addr CHAR(2) NOT NULL, -- 지역(경기, 서울, 경남식으로 2글자만입력)

mobile1 CHAR(3), -- 휴대폰의 국번 (011, 016, 017, 018, 019, 010 등)

mobile2 CHAR(8), -- 휴대폰의 나머지전화번호 (하이픈 제외)

height SMALLINT, -- 키

mDate DATE -- 회원가입일

);


CREATE TABLE buyTbl -- 회원구매테이블

(

num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK) -- 증가한다 null이 아니다

userID CHAR(8) NOT NULL, -- 아이디(FK)

prodName CHAR(6) NOT NULL, -- 물품명

groupName CHAR(4) , -- 분류

price INT NOT NULL, -- 단가

amount SMALLINT NOT NULL, -- 수량

FOREIGN KEY (userID) REFERENCES userTbl (userID) );


-- userTbl데이터입력

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011','1111111', 182, '2008-8-8');

INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011','2222222', 173, '2012-4-4');

INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019','3333333', 177, '2007-7-7');

INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011','4444444', 166, '2009-4-4');

INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL , NULL , 186, '2013-12-12');

INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016','6666666', 182, '2009-9-9');

INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL , NULL , 170, '2005-5-5');

INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011','8888888', 174, '2014-3-3');

INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018','9999999', 172, '2010-10-10');

INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010','0000000', 176, '2013-5-5');


-- buyTbl데이터입력

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL , 30, 2);

INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);

INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);

INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);

INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50, 3);

INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80, 10);

INSERT INTO buyTbl VALUES(NULL, 'SSK', '책 ', '서적', 15, 5);

INSERT INTO buyTbl VALUES(NULL, 'EJW', '책 ', '서적', 15, 2);

INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50, 1);

INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL , 30, 2);

INSERT INTO buyTbl VALUES(NULL, 'EJW', '책 ', '서적', 15, 1);

INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL , 30, 2);

select*from buytbl;
select*from usertbl;

-- 지역이 경남인 사람의 키보다 키가 크거나 같은사람 출력 
-- 지역이 경남인사람 키 173 170
select height from usertbl where addr = '경남';
-- 조건
select*from usertbl where height >= any(select height from usertbl where addr = '경남'); -- any또는 170 173
select*from usertbl where height >= all(select height from usertbl where addr = '경남'); -- all 그리고 173
select*from usertbl where height = any(select height from usertbl where addr = '경남');
select*from usertbl where height >= some(select height from usertbl where addr = '경남');

use day02;
select*from salgrade;
select*from employee;
-- 안성기의 등급을 구하기
select ename, grade from employee, salgrade where (sal between loscal and hisal) and ename = '안성기';

-- 과장보다 급여가 높은사람 오지호 500 신동엽 450
-- 신동엽보다 많이 받는사람
select*from employee where sal >= any(select sal from employee where job = '과장'); 
-- 오지호보다 많이받는사람
select*from employee where sal >= all(select sal from employee where job = '과장');

-- order by 컬럼명
select*from salgrade order by hisal; -- hisal 정렬
select*from salgrade order by hisal desc; -- 내림차순 

select*from employee order by deptno asc, sal desc; -- 오름차순

select*from employee order by deptno asc, sal desc limit 3; -- 위에서부터 3명만나옴

-- 상사번호순서대로 정렬 단 안성기는 제외
select*from employee where ename!='안성기' order by mgr;

-- 우리 회사에서 상사인 사람의 사번과 이름을 출력하기
-- 상사인사람 1005 1008 1013
-- 정답 1005신동엽 1008안성기 1013??
-- 1단계 mgr구하기 중복제거 distinct
select distinct mgr from employee;
-- 2단계 이름뽑고 사번뽑기 
select ename, empno from employee where empno in(select distinct mgr from employee);

-- 209
create table copyEmp (
select empno, ename, d.deptno, d.dname from employee e, dept d where e.deptno = d.deptno
);
select*from copyemp;

use sqldb;
select*from buytbl;
select*from usertbl;

-- buytbl 안에 자료 삽입하기 
insert into buytbl (userid, prodname, groupname, price, amount) values ('BBK', '컴퓨터', '전자', 100, 1);
-- 유저 아이디가 없는 BBQQ를 넣는다 usertbl과 외래키 관계라 오류가난다
insert into buytbl (userid, prodname, groupname, price, amount) values ('BBQQ', '컴퓨터', '전자', 100, 1);

-- buytbl을 복사하기 copybuytbl
create table copybuytbl( select*from buytbl);
-- 유저 아이디가 없는 BBQQ를 넣는다 usertbl과 copybuytbl은 외래키관계가 아니라 오류가나지않는다 제약조건은 복사해주지 않는다
insert into copybuytbl (userid, prodname, groupname, price, amount) values ('BBQQ', '컴퓨터', '전자', 100, 1);

select*from copybuytbl;

desc buytbl;
desc copybuytbl;  

select userid, amount from buytbl order by userid;
select userid, sum(amount), avg(amount), max(amount), min(amount) from buytbl group by userid order by sum(amount) desc limit 3;

-- 가장 키큰사람
select*from usertbl;
select name, height, max(height) as 키큰사람 from usertbl group by name;
-- 가장 큰 키 186
select max(height) from usertbl;
-- 186 사람의 이름과 키를 출력하기
select name, height from usertbl where height = (select max(height) from usertbl);

select name, max(height) as 키큰사람 from usertbl group by name having max(height) = (select max(height) from usertbl);

-- 215
select userid as '사용자', sum(price*amount) as '총구매액'from buytbl group by userid
having sum(price*amount) > 1000;

use day02;
select*from employee;
-- 부서벌로 급여 합계 구하기
select deptno as '부서', sum(sal) as '급여합' from employee group by deptno;  

-- job별로 급여 평균 구하기 
select deptno as '부서', job, avg(sal) from employee group by deptno;

-- 부서별로 급여가 가장 높은 사람 구하기 
select ename, deptno, job, sal from employee where sal in (select max(sal) from employee group by deptno);

use sqldb;
select num, groupName, sum(price*amount) as '비용'
from buytbl
group by groupName, num
with rollup;

-- 트렌젝션이란 임시로 저장하는 것 데이터베이스에 반영되지 않은 상태
-- 트렌젝션에 잇는 것을 데이터베이스에 적용하는것 commit
commit; 

-- DML
-- insert문
create table testtbl2 (
id int auto_increment primary key,
username char(3),
age int);

insert into testtbl2 values(null, '지민', 25);
insert into testtbl2 values(null, '유나', 22);
insert into testtbl2 values(null, '유경', 21);

select*from testtbl2;

create table copytbl2(select*from testtbl2);
insert into copytbl2 values(null, '현희', 21);
desc copytbl2;
desc testtbl2;

-- 이미 있는 테이블 고치기 
alter table testtbl2 auto_increment = 100;
insert into testtbl2 values(null, '찬미', 21);
insert into testtbl2 values(null, '찬수', 21);
set @@auto_increment_increment =3;
insert into testtbl2 values(null, '찬미', 22);
insert into testtbl2 values(null, '찬수', 22);

-- buytbl 구조만 복사
create table copyBuytbl2 (
select*from buytbl where userid = '9999999'
)

select*from copybuytbl2;

-- 동일한 구조 다른테이블에 있는것을 삽입하기
insert into copybuytbl2 select*from buytbl;
-- 다른 구조는 삽입되지않는다(X)
insert into copybuytbl2 select*from usertbl;

desc testtbl2;
insert into testtbl2(id, username, age) values (null, '정', 10);

select*from testtbl2;
-- 수정하기
update testtbl2 set username='지혜', age=30 where id=1;

select*from buytbl;
update buytbl set amount = amount + 2 where price>=100;

-- groupName null인것 삭제
delete from buytbl where groupName = null;
set sql_safe_updates=0;

-- 해당 테이블을 모두 삭제하기
delete from copybuytbl; -- 구조는 남기고 레코드만 삭제한다 삭제하면서 로그인 기록을 남긴다 장점:삭제한 자료가 트렌젝션 로그인 남아있다 삭제자료 확인 가능
drop table copytbl2; -- 구조까지 모두 다 지운다
truncate table testtbl2; -- 구조는 만들고 레코드를 삭제 삭제하면서 로그인 기록을 하지 않는다. 장점 속도가 빠르다 

select*from copybuytbl;
select*from testtbl2;








