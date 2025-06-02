use regex_software;
-- customer table
create table customers (customer_id int , name varchar(20), country varchar(30));
insert into customers values(1,"Alice","USA"),(2,"Bob","Canada"),(3,"Charie","USA"),(4,"David","UK");

-- test question 
-- Question (1). list the maximum single order amount by each customer
select  customer_id,max(amount) from customers group by customer_id;

-- Q(2). shwo the total order value amd order count for each cistomer.
select customer_id, sum(amount),count(order_id) from orders group by customer_id;

-- Q(3) --> list each order with the customer's name and country.
select c.customer_id, c.name,c.country ,o.order_id from customers  as c
join ON_orders as o 
where c.customer_id=o.customer_id;

-- Q(4)  list all customer and their corresponding order, show customers even if they haven't placed any orders;
select c.name,o.order_id from customer as  c
left join ordes as o 
on c.customer_id=o.customer_id;

-- Q(5)-- list customer who haven't placed any order
select customer_id from orders where order_id is NULL;

-- Q (6) -> list the most recent order for each customer
select customer_id,max(order_date) from orders group by customer_id;


-- Q(7)-- find the total amount spent by customer from the USA
select o.sum(amount),c.name,c.customer_id from orders as o
join customer as c
where country="USA"
-- Q(8)-- list order that were placed in april 2024 along with customer info



















-- orders table
create table ON_orders(order_id int ,customer_id int ,amount int ,order_date DATE);
insert into ON_orders values(101,1,250,2024-01-10),(102,2,300,2024-02-11),(103,1,150,2024-05-11),(104,3,450,2024-02-11),(105,4,500,2024-01-10);
