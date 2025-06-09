use sakila;
select * from actor;


with data as
(select * from actor where actor_id between 2 and 5
order by actor_id desc)

select * from actor as ac inner join data d where ac.actor_id = d.actor_id;

-- cte  is the comman table expression 
-- it is provide the more clear and readable code  for the complex queryes , 
-- it start with the WITH keywords
-- it is the hold the data in the tempolryes varible that can access all over the data base 
-- cte is most faster and most expresive result with provide the custorm fucntionlity that can allow the multiple operation and 

with customSal as 
(select  customer_id , avg(amount) over(partition by customer_id ) from payment where customer_id  between 2 and 5 )
select  * from customSal ;

select * from customSal as c
left join  payment as p on c.customer_id = p.customer_id and p.amount>c.avg(amount);



select * from actor;
select * from film;

select * from film_actor;

/*
select act.first_name , act.last_name, act.actor_id , Act.actor_id , filAc.film_id from actor as act 
left join film_actor as filAc on act.actor_id = filAc.actor_id;
*/
with film_and_filmActor as 
(select  act.actor_id  , filAc.film_id,act.first_name  from actor as act 
join film_actor as filAc on act.actor_id = filAc.actor_id
)
select fil_act.actor_id,fil_act.first_name,fi.film_id,fi.title  from  film_and_filmActor as fil_act 
join film as fi on fil_act.film_id=fi.film_id;



with cte(id,amount) as -- can changed the names
(select customer_id,avg(amount) from payment group by customer_id)
select * from cte;

-- other recusive cte 
select 10+12 from dual;


-- recursive vte
with recursive cte as 
(select 1 as id 
union 
select id+1 from cte where id<5)
select * from cte ;


-- recursive columns
-- hirachy tables 

use regex;
CREATE TABLE Manager (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Manager(ID)
);

INSERT INTO Manager (ID, Name) VALUES
(1, 'John Smith'),
(2, 'Alice Brown'),
(3, 'David Lee');


INSERT INTO Employee (ID, Name, ManagerID) VALUES
(101, 'Mike Johnson', 1),
(102, 'Sarah Wilson', 2),
(103, 'Tom Hardy', 3),
(104, 'Emma Davis', 1),
(105, 'Chris Evans', 2),
(106, 'Olivia Stone', 3);

select * from employee;
with recursive cte as (
select e.id as employee_id ,e.Name as employee_name , e.ManagerId   as manager_name from employee as e
join Manager as m where e.ManagerID=m.Id)
select * from cte;






