use sakila;
show tables;

desc payment;

select * from payment;


-- corelated subquerys
select payment_id ,customer_id , amount from payment p1 where 
amount > (select avg(amount) from payment p2 where p1.customer_id=p2.payment_id) ;


