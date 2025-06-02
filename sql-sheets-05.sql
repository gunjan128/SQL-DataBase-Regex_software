use sakila;

desc payment;

-- Question [-- get the payment_id, rentral_id, staff_id,amount,only for those paymentwhere staffid = reatalid=1422
select payment_id,customer_id,staff_id,amount from payment where staff_id=(select staff_id from payment where rental_id=1422);

select staff_id from payment where rental_id=1422;


-- sub Queries  -- queary within queries 

select * from payment where amount=(select amount from paymnet where payment_id=6);

desc actor;
select * from actor
 where actor_id >(select actor_id from actor where first_name='ED' and last_name="CHASE");
 
 
 desc payment;
 
 select * from payment limit 2;
 
 select * from payment 
	where month(payment_date)=(select  month(payment_date) from payment where payment_id=5);
    
    
select * from payment where payment_id=7 and amount<5;
-- sub part
select payment_id,customer_id,amount from payment
where rental_id<(select rental_id from payment where payment_id=7 and amount<5);

select amount, count(payment_id) from payment where amount=5.99;

select amount,sum(payment_id) from payment group by amount
where count(payment)>(select amount, count(payment_id) from payment where amount=5.99);


-- multi row sub queryes
-- in operator first  for the spacfice datas
select * from payment
where amount in (select amount payment where payment_id in (3,1));


-- = any this is used for 
select * from payment
where amount =any(select amount payment where payment_id in (3,1));

select * from payment
where amount >any (select amount payment where payment_id in (3,1));

select * from payment
where amount >all (select amount payment where payment_id in (3,1));

select * from payment
where amount <=all (select amount payment where payment_id in (3,1));




 




