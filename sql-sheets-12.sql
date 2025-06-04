-- TCL (Transction control languages

select @@autocommit ;--  to save the automaticly save bydefult

# disable this
set @@autocommit=0;

create database  tushar;
use tushar;
create table test(id int);
insert into test values(2);
insert into test values(1),(2),(3),(4);

select * from test;
-- check the data consistency or not it measns data is all place will same or not 
-- if you want to store the data in the evey place to used the 
commit; -- to save in the databases 

update test set id=102;
select * from test;

-- but i want to not save the data in teh data bases  to used and restore the data  using rollback
rollback;  -- it is save the data with the loss

-- the challeges will come if you not commit the data and you create the table that process is the ended and save the data in databases beacue it the the ddl query
insert into test values(12),(213),(214);
 select * from test;
 
 CREATE TABLE TESTS (ID INT);
 insert into TESTS values(1234),(212433),(22414);
commit;

-- have a big proble with the data if perforn the mroe the DML Quersy 
-- in sql to define the checkout to save the particular loaction till the place , and next work is not save 
create table ts(id int);
insert into ts values (12),(201),(30);
delete from ts where id=1;
savepoint till_the_insetedData;
update ts set id =100;
select * from ts;

-- i need to rollback my updated data - if have not save point i cant rollback the data 

rollback to till_the_insetedData;
select * from ts;
commit;
-- start	 transction parts in sql 


set @@autocommit=1; -- this defult process to start the transction in sql 
-- another way to start the transction in sql used the 
start transaction;  -- this is the start the traction in sql

update  test set id =999999;

rollback;
select * from test;

delete from test ;
rollback;
select * from test;

-- this complete data is delete because @@autocommit  is the start , the is remove from the databases;



--  view in the sql 
-- create the copy of the original table 
create table t_actor as 
	select * from sakila.actor limit 20;
select * from t_actor ;
	create view actor_view as 
select actor_id , first_name from t_actor;

desc t_actor;
create view maxActorId as 
select count(actor_id) ,first_name,last_name avg from t_actor;
select * from maxActorId;

update maxActorId  set first_name='2131';
drop view maxActorId;








