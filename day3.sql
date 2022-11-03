use sqldb;
select cast('2020-10-19 12:35:29.123' as date) as '날짜';
select cast('2020-10-19 12:35:29.123' as time) as '시간';
select cast('2020-10-19 12:35:29.123' as datetime) as '날짜시간';

select cast('2020-10-19 12:35:29.123' as date) as '날짜' , cast('2020-10-19 12:35:29.123' as time) as '시간';

-- 1.변수사용 @ at
set @myVar1 = 10;
set @myVar2 = 'abc';
set @myVar3 = 0; -- false 0 아닌수는 true이다 

set @result1 = @myVar1 + 100;
select @result1;
select @myVar3;
select concat(@myVar2, 'dfg');

set @myVar4 = '가수이름==>';
select @myVar4, name from usertbl where height>=180;

set @myVar5 = 3;
prepare myQuery5 from 'select name, height from usertbl order by height limit ?' ;
execute myQuery5 using @myVar5; -- @myVar5 만큼 실행(3)

-- 2.함수
-- 2-1 데이터 형식 바꾸기 cast(), convert()
select * from buytbl;
select * from usertbl;

select userid, cast( avg(amount) as signed integer) from buytbl group by userid;
select userid, convert( avg(amount), signed integer) from buytbl group by userid;

-- 정수형을 문자형으로 변환해보기
select userid, 
		concat(cast(price as char(5)), '원') as '가격', 
        concat(convert( amount, char(5)), '개') as '갯수' 
        from buy tbl;
        
-- 문자를 날짜형식으로 바꾸기
select cast('2020$12$12' as date);

set @dateV1 = '2022/06/07';
set @cdateV1 = cast(@dateV1 as date);
select @cdateV1;

-- 246 7-8
select * from employee;
use day02;
-- 급여 x 12개월 = 연봉
-- 출력화면 설계
-- empno |급여x12개월=| 연봉 
select empno, concat(cast(sal as char(10)), 'X', '12개월 = ') as '급여x12개월'
, sal*12 as '연봉'
from employee;

-- 묵시적형 변환 명시적형 변환 
select '100' + '200' + 'abc'; -- 정수처리 300
select concat(100, '200'); -- 문자처리 100200
select 1>'2mega'; -- 1>2 비교해서 결과는 false
select 1>'0mega'; -- 1>0 비교해서 결과는 true
select 1>'mega'; -- ??

-- 연봉이 5000만원이 넘는 사람은 고액 연봉자 아니면 보통사람
-- 1단계 연봉을 구해서 변수 담는다
select if((select sal*12 from employee where empno=1001) > 5000, '고액연봉자', '보통사람');
-- 연봉이 5000만원 넘는 사람은 세금 5.5% 아니면 세금 3.3% 변수에 담기
set @rate = if((select sal*12 from employee where empno=1001) > 5000, 0.055, 0.033);
select @rate;

select ifnull(null,'널'), ifnull(100, '널이아님');

use employees;
select * from departments;
select * from employees;
select * from dept_emp;

use sqldb;
select * from usertbl;
-- 핸드폰이 없는 사람의 이름 출력하기 
-- 있으면 핸드폰번호 출력하기 
select ifnull(concat(mobile1,mobile2), name) as '핸드폰' from usertbl;

-- 자바 switch ~ case
-- case when then else end
-- 세금이 3%이상이면 3등급 price*amount <= 2000
-- 세금이 3~5% 2등급 <=3000
-- 5%이상 1등급 >3000
use sqldb;
select * from buytbl;
set @caseVar = 'c';
select case @caseVar
when 'a' then '에이'
when 'b' then '비'
when 'c' then '씨'
else '모름'
end as 'case 연습';

select*from buytbl;
set @salVar = (price*amount);
select userid, price*amount, case
when price*amount between 0 and 2000 then '3등급'
when price*amount between 2001 and 3000 then '2등급'
when price*amount >= 3000 then '1등급'
else '잘못됨'
end as '세금연습'  
from buytbl;

select ascii("A");
select char(65);

select bit_length('abc'); -- 3byte 3x8bit
select char_length('abc'); -- 문자열의 갯수
select length('abc'); -- 할당된 byte수를 반환

select bit_length('가나다'); -- 9byte 9x8bit
select char_length('가나다'); -- 문자열의 갯수
select length('가나다'); -- 한글자에 할당된 byte수를 반환

select bit_length('!@#'); -- 3byte 3x8bit
select char_length('!@#'); -- 문자열의 갯수
select length('!@#'); -- 할당된 byte수를 반환

select concat_ws('-', 'my', 'sql', '8.0');
select concat_ws('-', mobile1, mobile2) from usertbl;

select * from usertbl;
-- mobile1 필드에서 '6'이 들어있는 필드 찾기 
select name, mobile1 from usertbl where instr(mobile1, '6') !=0;
select name, mobile1 from usertbl where locate('6', mobile1) !=0;
-- avg(sal*36) 소수점 2자리까지만 표시
use day02;
select format(avg(sal*36*0.085124), 2) from employee; 

select bin(15);
select oct(15);
select hex(15);

select insert('abcdefghi', 3, 4, '@@@@');
select insert('abcdefghi', 3, 2, '@@@@');
select left('abcdefghi', 3);
select right('abcdefghi', 3);

select trim('이것이'), trim(both 'ㅋ' from 'ㅋㅋㅋ재밌어요. ㅋㅋㅋ');
select substring('대한민국만세', 3, 2);

select ceiling(4,3);
select conv('fa', 16, 2); -- 1111 1010

select mod(157, 10);

-- 10<=임의의 정수<30 난수   m<정수<n floor(m+(rand() * (n-m)));
select floor(10+(rand() * (30-10)));

select truncate(1231567890, -4);
select truncate(1231567890.146234, 2); -- 소수점 2자리수 

use day02;
select*from employee;

-- hifreadte 입사일
select adddate(hiredate, interval 15 day) as '한달후', hiredate as '입사일' from employee;
select adddate(hiredate, interval 2 month) as '두달후', hiredate as '입사일' from employee;
select subdate(hiredate, interval 1 year) as '한달후', hiredate as '입사일' from employee;

select sysdate();
select date(now()), time(now());
-- 생일로부터 몇일 지났는지 알아보기

select datediff( now(), '1997-10-15');
select dayofweek(curdate());

-- 대출 2022년 3월 5일 천만 대출 이자 - 다음달의 마지막날 이자날짜 2022년 4월 30일 나오게하기 
-- 다음달을 구한다 -> 마지막날을 구한다 
select last_day(adddate('2022-03-05', interval 1 month)); 
-- 대출일자 구하기 2022-04-30 ~ 2022-03-05 까지는 몇일?
select datediff(last_day(adddate('2022-03-05', interval 1 month)), '2022-03-05');
-- 이자는 대출일*원금*5%
-- 원금은 10,000,000
select datediff(last_day(adddate('2022-03-05', interval 1 month)), '2022-03-05') * (10000000*0.05/12)as 이자;

select quarter(curdate()); -- 1 2 3월 1분기 4 5 6월 2분기 
select user();
select database();
select*from employee;
select row_count();

-- 모든 직원의 sal 100인상하기
update employee set sal = sal+100;
select row_count();

select version();

create database moviedb; -- 데이터베이스 만들기
use moviedb;
create table movietbl(
movie_id int,
movie_title varchar(30),
movie_director varchar(20),
movie_star varchar(20),
movie_script longtext,
movie_film LONGBLOB
)default charset = utf8mb4;

insert into movietbl values (
1, '쉰들러리스트', '스필버그', '리암닐슨', load_file('c:/sql/movies/Schindler.txt'), load_file('c:/sql/movies/Schindler.mp4')

);

select*from movietbl;


-- 대용량의 자료이기 때문에 삽입X
-- 처리방법은 패킷 크기를 늘린다, 파일업로드/다운로드 경로를 변경 
show variables like 'max_allowed_packet'; -- 패킷 크기
show variables like 'secure_file_priv'; -- 파일업로드/다운로드 경로를 변경

-- 패킷 크기와 파일 업로드 경로 다시 설정하기 - my.ini 파일 내용 바꾸기 
use moviedb;
truncate movietbl; -- 로그인 기록을 남기지 않고 모든 행동을 지우기

-- 266 5-1 용량이 너무커서 오류가 날수잇음 
-- 6-1 데이터베이스 서버에 있는 자료를 다운받기 
select movie_script from movietbl where movie_id = 1
into outfile 'c:/sql/movies/Schindler_output.txt'
lines terminated by '\\n'; -- \특수문자 \n new line 한줄 내리기 

-- 대용량의 동영상파일 다운받기
select movie_film from movietbl where movie_id = 1
into dumpfile 'c:/sql/movies/schindler_output.mp4';

-- 피벗구현
-- 엑셀 vlookup함수 피벗테이블

use sqldb;
create table pivottest(
uname char(3),
season char(2),
amount int);
insert into pivottest VALUES
('김범수', '겨울', 10), ('윤종신', '여름', 15), ('김범수', '가을', 25), ('김범수', '봄', 23), 
('김범수', '봄', 37), ('윤종신', '겨울', 40), ('김범수', '여름', 14), ('김범수', '겨울', 22), 
('윤종신', '여름', 64);

select *from pivottest;
select uName, 
sum(if(season='봄', amount, 0)) as '봄',
sum(if(season='여름', amount, 0)) as '여름',
sum(if(season='가을', amount, 0)) as '가을',
sum(if(season='겨울', amount, 0)) as '겨울',
sum(amount) as '합계' from pivottest group by uName;

-- 7-3 예제 풀어보기
select season,
sum(if(uname='김범수', amount, 0) ) as '김범수',
sum(if(uname='윤종신', amount, 0) ) as '윤종신',
sum(amount) as '합계'
from pivottest
group by season order by season;

-- 만약에 평균을 구한다면 sum-> avg로 바꾸면 된다
-- 만약에 갯수를 구한다면 sum-> count로 바꾸면된다
-- 만약에 표준편차를 구한다면 sum-> sqrt로 바꾸면된다

-- json 중요함 270~272

-- join
select*from usertbl, buytbl; -- cross join 동일함 
-- 많이 사용하는 조인방법
select*from usertbl, buytbl where usertbl.userid = buytbl.userid and buytbl.userid='JYP';

select * from buytbl 
         inner join usertbl
         on buytbl.userid = usertbl.userid
         order by num;
         
select * from buytbl 
         inner join usertbl
         on buytbl.userid = usertbl.userid
         where buytbl.userid='JYP';

-- 필요한 열만 검색하기
select usertbl.userid, name, prodname, addr, concat_ws('-',mobile1, mobile2) as '연락처' from buytbl
inner join usertbl
on buytbl.userID = usertbl.userID;

select*from buytbl;

use day02;
select*from employee;
select*from dept;
-- employee 테이블과 dept테이블을 inner join하기
-- 공통일 열을 찾아서 inner join 조건으로 삼기 
select*from employee inner join dept on employee.deptno = dept.deptno;

-- 20부서의 사원명과 급여 지역 출력하기 단 comm가 0인사람은 제외
select ename, sal, loc, employee.deptno from employee inner join dept on employee.deptno = dept.deptno where comm != 0;

-- 281 그림

-- stdtbl 열이름 stdName addr
-- clubtbl clubName roomNo
-- stdcluttbl num - 자동을 증가하기, stdname, clubname

create table stdtbl
(
stdname varchar(10) not null,
addr varchar(10) not null,
primary key(stdname)
);

create table clubtbl (
clubname varchar(10) not null,
roomNo varchar(10) not null,
primary key(clubname)
);

create table stdclubtbl(
num int auto_increment not null,
stdname varchar(10) not null,
clubname varchar(10) not null,
foreign key(stdname) references stdtbl(stdname),
foreign key(clubname) references clubtbl(clubname),
primary key (num, stdname, clubname)
);

insert into stdtbl values('김범수', '경남'), ('성시경', '서울'), ('조용필', '경기'), ('은지원', '경북'), ('바비킴', '서울');
insert into clubtbl values('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');
insert into stdclubtbl values(null,'김범수', '바둑'), (null,'김범수', '축구'), (null,'조용필', '축구'), (null,'은지원', '축구'), (null,'은지원', '봉사'), (null, '바비킴', '봉사');

select * from stdtbl;
select * from clubtbl;
select * from stdclubtbl;

-- 3개 테이블 조인하기
select sc.num, s.stdname, c.clubname, c.roomNo, s.addr from stdtbl s 
            inner join stdclubtbl sc 
            on s.stdname = sc.stdname
            inner join clubtbl c 
            on sc.clubname = c.clubname
            order by num;

-- 회원인데 구매하지 않은 회원도 검색하기 usertbl 있는것 모두 검색 buytbl on 만족하지 않아도 왼쪽 테이블 있는것 모두 출력
use sqldb;
select * from usertbl u 
         left outer join buytbl b
         on u.userid = b.userid;
         
select * from usertbl u right outer join buytbl b
         on u.userid = b.userid;
         
-- 학생인데 동아리 가입하지 않은 학생도 검색하기


select*from member;

-- json 함수 
-- 개방형 표준 포맷
/*
{ 
"아이디":"BBK",
}*/
use sqldb;
select*from usertbl;
select name, height from usertbl where height>=180;
-- json으로 변환하는 함수
select JSON_OBJECT('이름', name, '키', height) as 'json값'
from usertbl where height>=180;

select*from buytbl;
-- price 500이상 amount 3개이상 
-- userid, prodname 그룹은 groupname json형식으로 변환
select JSON_OBJect('userid', userID, 'prodname', prodName) as 'json값'
from buytbl where price>=500 and amount>=3 group by groupName;

select JSON_Array('userid', userID, 'prodname', prodName) as 'json값'
from buytbl where price>=500 and amount>=3 group by groupName;
  
  -- 테이블만들기
  create table jsontbl(
  id int AUTO_INCREMENT not null primary key,
  email varchar(64) not null,
  info json
  );
  -- 데이터 구조보기
  desc jsontbl;
  
  -- 테이블 데이터 삽입하기
  insert into jsontbl
  set id = null,
       email = 'aa@naver.com',
       info = '{"name":"이순신", "age":20, "address":"서울", "tel":"123-4567"   }';

select * from jsontbl;

select json_valid(info), json_valid(email) from jsontbl;


-- json에 있는 key를 가지고 값을 읽기 '->'화살표함수
select id, email, info->'$.age' from jsontbl;
select info->'$.jname', info->'$.tel', info->'$.age', id, email from jsontbl;

select info->'$.jname', info->'$.tel', info->'$.age', id, email from jsontbl where info->'$.age'>=20;

select json_valid(info), json_valid(email) from jsontbl;

-- 285
use sqldb;
select u.userid, u.name, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
from buytbl b
right outer join usertbl b
on u.userid = b.userid
order by u.userid; 

select u.userid, u.name, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
from buytbl b
right outer join usertbl u
on u.userid = b.userid
order by u.userid; 

-- 287 
use day02;
select s.stdname, s.addr, c.clubname, c.roomno 
				  from stdtbl s
                  left outer join stdclubtbl sc
                  on s.stdname = sc.stdname
                  left outer join clubtbl c
                  on sc.clubname = c.clubname
order by s.stdname;

select s.stdname, s.addr, c.clubname, c.roomno 
				  from stdtbl s
                  left outer join stdclubtbl sc
                  on s.stdname = sc.stdname
                  left outer join clubtbl c
                  on sc.clubname = c.clubname
union

select s.stdname, s.addr, c.clubname, c.roomno 
				  from stdtbl s
                  left outer join stdclubtbl sc
                  on s.stdname = sc.stdname
                  right outer join clubtbl c
                  on sc.clubname = c.clubname;

-- self join 은 같은 테이블을 조인할 경우 사용함
-- 즉 오지호 사원은 상사명을 출력하기
use day02;
select *from employee;
select  e1.empno as '사원명', e1.ename as '사원명', e2.empno as '상사번호', e2.ename as '상사명'   
     from employee e1
         inner join employee e2
           on e1.mgr = e2.empno
      where e1.ename = '오지호';     






