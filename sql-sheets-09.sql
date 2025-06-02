-- window function in sql that is part of the DQL
use sakila;
desc payment;
select * from payment limit 20;
select avg(amount),customer_id from payment  group by customer_id;
select payment_id,customer_id,amount , (select avg(amount) ,customer_id from payment group by customer_id) from payment;


-- a maction wherer the agremate fucntion we result show with the each and every row , agregation function
-- set of rule that return the result with each funtion
-- here no group by sactions need.
-- over() all those result show with the row,  it show the samne result show  sare data per apply

select payment_id,customer_id,amount,avg(amount) over(), sum(amount) over() ,max(amount) over() from payment;

-- partion by this is the statment the divided the data based on the , 
-- on the data fucntion operation apply karna and show with 
select payment_id,customer_id,amount,
avg(amount) over(),
avg(amount) over(partition by customer_id) from payment;


-- most imprtant question 
-- what is the runing sum  it is the sum step by step procedcuing 
select payment_id,customer_id,amount,
sum(amount) over(order by payment_id) from payment;  -- it is apply to try unique data  must , because it 

select payment_id,customer_id,amount,
sum(amount) over( partition by customer_id order by payment_id) from payment;


-- employee data ase used - salary 
use employees;
show tables;
-- get the emplyee_no , salary, total_salar, avg(salary) from salaryes tables

-- get the emplyee_no , salary, year -of _hiring  along with avg(salary) of emplyee from the salary tables;
-- get emplyee-no salay , and the runing salary for the each customer from salary table

desc salaries;
desc employees;
create table salary1 as select * from salaries limit 200;

select emp_no, salary,sum(salary) over(),avg(salary) over()  from salary1 ;
select emp_no, year(from_date),avg(salary) over(partition by emp_no)  from salary1;


select emp_no,salary, sum(salary) over( order by salary) from salaries limit 100;



-- topics 
-- rank(), dense_rank() row_number()






