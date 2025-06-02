use sakila;

desc payment;
select * from payment limit 5;
 -- select customer_id, count(payment_id) from payment where customer_id >3 group by customer_id

-- having in sql -- it is applying those column which is not present in table and appl


-- get the number of payment for each amount
select amount, count(payment_id) from payment group by amount ;

-- 
select amount, count(payment_id) from payment where amount not in(0.99,2.99) group by amount;
 
desc payment;

select amount ,sum(rental_id) ,sum(amount) from payment where amount in(2.99,0.99,5.99) group by  amount having sum(rental_id)>1000;


-- taskss

desc actor;

desc film_actor;


select a.actor_id,count(film_id) from actor as a
join film_actor as fa 
where a.actor_id=fa.actor_id group by a.actor_id  having count(film_id)>25;




-- find how much person 