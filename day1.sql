use employees;
use test; -- test 데이터베이스를 사용,열어주기 

show tables;

select*from employees; -- emplyees안의 데이터를 모두 보여줘라
select*from departments; 

use test;
create table employee (
sabun char(7) not null,
name char(8) not null,
hobong int(15) not null,
specialty varchar(20),
birthday date,       -- 생략하면 null
primary key (sabun)
); 

create table project(
projectNo char(7) not null,
projectContent varchar(20) not null,
startday date,
endday date,
primary key (projectNo)
);

-- 왜래키가 되려면 해당 테이블에서는 기본키여야한다
create table assignment(
sabun char(7) not null,
projectNo char(7) not null,
foreign key (sabun) references employee (sabun) on delete cascade,
foreign key (projectNo) references project (projectNo) on delete cascade,
primary key (sabun, projectNo)

);


-- 테이블을 삭제하기
drop table 테이블명;


-- 121 page
create table userTBLb (
userName char(3) not null,
birthYear int(4) not null,
addr varchar(20) not null,
moblie varchar(12),
primary key (userName)
);

create table buyTBL (
userName char(3) not null,
prodName char(3) not null,
price int(10) not null,
amount int(10) not null,
foreign key (userName) references userTBLb (userName),
primary key (userName) 
);

