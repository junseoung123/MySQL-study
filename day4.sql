create database project; -- 프로젝트 데이터베이스생성
use project;

drop table membertbl;
truncate membertbl;

select * from membertbl; -- membertabl 확인
insert into membertbl values ('manager', '1234', '매니저', '9999');

create table membertbl(  -- membertbl만들기
id varchar(20) not null primary key, 
pwd varchar(20) not null,
name varchar(20) not null,
phoneNumber varchar(20)
);
insert into membertbl values("아이디1", "비번1", "이름1", "전번1");


truncate runningtbl;
drop table runningtbl;
select*from runningtbl;

create table runningtbl( -- 예약테이블
 num int auto_increment not null primary key,
 id varchar(20) not null,
 rdate varchar(100) not null,
 rtime varchar(100) not null,
 amount varchar(100) not null,
 requirements varchar(100),
 foreign key(id) references membertbl(id)
 );
 
 insert into runningtbl values(null, "아이디1", "날짜1", "시간1", "인원수1", "비고1");


select * from logtbl;
truncate logtbl;
drop table logtbl;     
   
create table logtbl( -- 로그인했을때 아이디 기록 유지를 위한 테이블
	id varchar(20) not null,
    foreign key(id) references membertbl(id)
);
select * from membertbl where id != 'manager'; -- 관리자 : 회원 정보 확인용 데이터 쿼리
select r.num, m.id, m.name, m.phoneNumber, r.rdate, r.rtime, r.amount, r.requirements from runningtbl r inner join membertbl m on m.id = r.id; -- 관리자 : 예약 내역 확인용 데이터 쿼리
select r.num, m.id, m.name, m.phoneNumber, r.rdate, r.rtime, r.amount, r.requirements from runningtbl r inner join membertbl m on m.id = r.id where m.id = (select id from logtbl); -- 회원 : 예약 내역 확인용 데이터 쿼리

