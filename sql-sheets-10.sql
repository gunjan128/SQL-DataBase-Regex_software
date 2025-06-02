use sakila;

select * from payment;

select payment_id, customer_id,amount,
sum(amount) over(partition by customer_id),
rank() over(partition by customer_id order by amount desc),
dense_rank()
over(partition by customer_id order by amount desc)
from payment;

select * from(
select payment_id, customer_id,amount,
rank()
 over(partition by customer_id order by amount desc)
     as rank1,
dense_rank()
over(partition by customer_id order by amount desc)
as drank1
from payment) as tab where drank1=3; -- i need to those data in rank -2, rank -3 

-- if asking the hight salary you need to get - to first finding the  max salary colums

-- how to insert and update the data in table
create table xyx( id int , fname varchar(20));
insert into xyx values(10,'ram'); -- in this requied the all arguement values , if you missing the argument show the error
insert into xyx(id) values (11); -- it is can spacfice columsn can insert
select * from xyx;

-- DML data manipulation language 
-- delete it will delete the recoder 
-- please always delete with the particluer conditon , to save you data 
delete from xyx where id=11;

-- update the values
update xyx set fname='ram' where id=10;

select * from xyx;

# drop table - complte - it is the ddl data defition langeuage
# its compelte deltete withe the table anda the content for the  tables
drop table xyx;





