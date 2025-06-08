-- find the employees who's salary is more than the average salary earned by all employees
use sakila;

show tables;

select * from employee1;
select * from employees;
truncate table employees;
select * from payment;
select * 
from employee1
where salary >(select avg(salary) from employee1);


-- types of subquerys in sql
-- one row and one columns - if a query return the one columns is called teh saclary sub query 
-- also rewrite the this subquery in the anotehr formates


-- get the all recored form te employees table sna d 
-- the two columns get the employees avg(salary),sa 


-- scalar subquery
select * from employees e 
join (select avg(salary) sal from employee) avg_sal 
on e.salary> avg_sal.sal;

-- multiple row subquery 
-- when a query that return the mutlple columns and multiple rows

-- sub query which return is the only 1 colu,sn and multople rows  under the multiple row sub querys

-- explains
-- find the employee who earn the highest salary in each department
select * from employees where (dept_name,salary) in(select dept_name, max(salary),   departmentId from employee group by department);

-- it don't depend on the other 

-- simple to get the data 
select dept_name,max(salary) 
from employee
group by dept_name;


-- corelated subquerys

-- find the employees in each department who earn more than the average salary in that department

select employee_name ,salary from employee  as e where salary >
(select avg(salary) , ed.department from employee as ed group by departmentId );


select * from employees e1
where salary > (select avg(salary) 
				from employees e2
                 where e2.dept_name =e1.dept_name
                 );
                 


-- Question : find department who do not have any employees
select  department_name from department where employeesId  is null;

-- other important ways

select * from department d where not exists ( select 1 from employees e where e.dept_name = d.dept_name);


select 1 from employee e where e.dept_name = 'Martketing';
				


-- nested subquery in sql
-- inside subquery -> inside subquery > inside subquery

-- Question find stores who's sales where better than the average sales accorss all  stores
-- (1) find the total sales for each store.
-- (2) find avg sales for all the stores
-- (3) compare 1 & 2
select * from (select store_name , sum(price) as total_sales
		from sales
        group by store_name) sales
join (select avg(total_sales) as sales
	 from (select store_name, sum(price) as total_sales
     from sales
     group by store_name) x) avg_sales
     on sales.total_sales > avg_sales.sales;
     
-- easy to modify
with sales as 
     (select store_name , sum(price) as total_sales
     from sales 
     group by store_name)
select * 
from sales
join (select avg(total_sales) as sales
	from sales x) avg_sales
    on sales.total_sales > avg_sales.sales;
     
     
-- type of the clouse in the sql 
/*
-SElECT
-From 
-Where
-HAVINg
*/

-- sung a subquery in SELECT clause.
/* question  -Fetch all employee details and add remarks to those employees who earn more then avg salary of employee
*/

select * ,( case when salary> (select avg(salary) from employee)
			then 'Higher than average'
		else null
          end ) as remarks
from employee; 
     
SELECT *, 
       CASE 
           WHEN salary > (SELECT AVG(salary) FROM employee) 
           THEN 'Above Average' 
           ELSE 'Below Average' 
       END AS remarks
FROM employee;           


-- avodint this select claues used the simple join
select *
, ( case when salary > avg_sal.sal
	then "higher than average"
    else null
end ) as remarks
from employee
cross join (select avg(salary) sal from employee) avg_sal;


-- Having case
-- questions - find the store who have sold more unit than the average untis sold by all stores;


select store_name, sum(quantity)
from sales
group by store_name
having sum(quantity) >  (select avg(quantity) from sales);

-- sql commnands which allow subquery
/* 
- sql qyery - done
- inset
-update 
-delete
*/

-- inset 
-- q. inset data to employee history table. make sure not inset duplocate recors/

select * from employee_history;

insert into employee_history
select e.emp_id, e.emp_name, d.dept_name,e.salary,d.loation 
from employee e 
join department d on d.dept_name = e.dept_name
where not exists (select 1 
				from emplyee_history eh
                where eh.emp_id = e.emp_id);
                
              
-- update 
/* question :- Give 10% increment to all employee in Bangalor location based on the maximum salary earned by an each dept. only cosider employees in employee-history table */

UPDATE employees e  
SET salary = (
    SELECT MAX(salary) + (MAX(salary) * 0.1)  
    FROM employee_history eh  
    WHERE eh.dept_name = e.dept_name
)  
WHERE e.dept_name IN (
    SELECT dept_name FROM department  
    WHERE location = 'Bangalore'
)  
AND e.emp_id IN (SELECT emp_id FROM employee_history);
                


-- delete statment    how to write   

-- question : delete all departemnt whio do not ahve any emplyees
delete from department 
where dept_name in (select dept_name from departement d
where not exists(select 1 from employee e where e.dept_anem = d.dept_name)
);