use regex;
create table xyz2(id int not null, fname varchar(20) unique);
insert into xyz2 values(2, "tushar");

insert into xyz2 values(2, null);


-- unique - is  if can insert the null value can insert 
create table xyz1(id int not null, fname varchar(20) default 'regex');
insert into xyz1(id) values(2);
select * from xyz2;
select * from xyz1;

-- dob data  set the defult currentDate
create table xy(dob datetime  default now());
insert into xy values('2025-05-20 ');

insert into xy() values();
select * from xy;

-- create a table id int  with the primary key
create table addmission ( AddmissionID int  primary key, collegeName varchar(200), studentID int Unique);

desc addmission;


insert into addmission values (1241,"RIET",32), (231,"RTU",123),(12,"RCW",13);
select * from addmission;

create table student ( studentID int  primary key, studentName varchar(200));

insert into student values (1241,"Raj"), (21,"Raju"),(12,"Ram");
select * from student;


drop table addmission;

create table addmission ( AddmissionID int  primary key, collegeName varchar(200), studentID int,foreign key(studentID) references student(studentID));

desc addmission;

insert into addmission values( 132, "RIET",12);
select * from addmission;

create table Students ( StudentId int primary key, SName varchar(200), Age int, Grade int,City varchar(200));
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,  -- Unique identifier for each mark entry
    Subjects VARCHAR(200), 
    Marks INT, 
    StudentId INT,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId)
);


-- create the table using the subquery 

use sakila;
create table test99 as 
    select actor_id,first_name from actor;
select * from test99;

-- delete  from actor(select actor_id form actor where actor_id= where first_name='PENELOPE';
select actor_id from actor where  first_name='PENELOPE';



delete from actor where actor_id in( select actor_id from actor where  first_name='PENELOPE');

-- create a copy of the payment id
create table paymentDates as select payment_date from payment;

-- first divided the table based on ids 
select amount from payment where payment_id=2;
select amount from payment where customer_id=1;

select amount from payment where customer_id=(select amount from payment where payment_id=2);
-- 0.99 is the same 
update payment set amount=(select amount from payment where payment_id=2) where customer_id=1;







     
