-- constraints
/* 
constraints are rules and regulation which don't allow invalid data entry in the table
-- not null

*/

create database regexdb;
use regexdb;
create table test(id int);
insert into test values(10),(11),(10),(null);
select * from test;
select count(*), count(id) from test;

create table test2(id int not null);
insert into test2 values(10),(11),(10);
insert into test2 values (null), (12); -- this will give error

create table test3(id int unique);
insert into test3 values(10), (11), (10); --  duplicate values

create table test4(id int, gender varchar(20) );
insert into test4(id) values(10);
select * from test4;

create table test5(id int, gender varchar(20) default'male'); -- default
insert into test5(id) values(10);
select * from test5;

create table test6(id int check (id>5), gender varchar(20)); -- check
insert into test6(id) values(10);
insert into test6(id) values(3); --  this will give error
select * from test6;

create table test7(id int check (id>5), gender varchar(20) check ( gender in ('male' , 'female'))); -- check
insert into test7(id, gender) values(10,'male');
insert into test7(id, gender) values(11,'transgender');
-- this will give error
select * from test7;

create table test8(id int check (id>5), gender varchar(20),
constraint db_test8_gender_chk check ( gender in ('male','female'))); -- check table


insert into test8(id, gender) values(10,'male');
insert into test8(id, gender) values(11,'transgender');

-- Primery key

create table product(pid int primary key, pname varchar(20));
insert into product values(101,'iphone');
-- insert into product values(101,'ipad');
insert into product values(102,'ipad');
select * from product;

-- with foreign key
create table orders2( order_id int, price int, pid int,
foreign key (pid) references product(pid));
insert into orders2 values(1981, 200, 101), (1982,250,102), (1983,275,101),(1984,500,108);
insert into orders2 values(1984, 500, 108);

select * from orders2;


-- without foreign key ( every data will be inserted independent from product table

create table orders( order_id int, price int, pid int);
insert into orders values(1981, 200, 101), (1982,250,102), (1983,275,101),(1984,500,108);
select * from orders;

-- you have to create two table 1st employe - primery key
-- 2nd 
-- 3rd employe email sholud  be uniqe
-- 4  

-- alos create another table for department id unqie and department name that will we check conserent 
-- in  the department table and also try to insert department id null values 

/*
table employee empid pk 
emp name 
email unique
department id reference fk
table dempartment
department id unique 
deparnmentnamecheck constroin biology or phiysics
also try insert null values
*/


create table employee(emp_id int primary key, emp_name varchar (20) not null,
email varchar (100) unique, department_id int, 
