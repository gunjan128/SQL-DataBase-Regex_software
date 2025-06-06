use sakila;

desc film_actor;
desc film;

select count(actor_id),actor_id from film_actor where film_id=45;

select actor_id from film_actor where film_id=45;

select actor_id ,count(film_id) from film_actor group by actor_id order by actor_id ;

select count(actor_id) ,film_id from film_actor group by film_id order by  actor_id;

select count(film_id) ,actor_id from film_actor group by film_id having (actor_id) >2;


-- payment tables

desc payment;
select customer_id,count(staff_id), sum(amount),avg(amount)  from payment group by customer_id,staff_id ;

select customer_id,staff_id,sum(amount) from payment group by staff_id;
desc payment;
select * from payment ;
select sum(amount),year(payment_date),month(payment_date) from payment group by  year(payment_date),month(payment_date) ;


select * from payment  where payment_date >(select payment_id from payment where payment_id=3) ;

select * from payment where (staff_id,amount) =(select staff_id,amount from payment where payment_id=2);

select customer_id ,count(amount) from payment group by customer_id  having count(payment_id) > (select  count(payment_id) from payment where customer_id=2);
-- select customer_id,sum(amount) from payment where sum(payment_id)>(select sum(payment_id) from payment where customer_id=2) ;
