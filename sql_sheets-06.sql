use employees;
show tables;
select * from employees;


--- question no. first
select * from employees where year(hire_date)
= (select  year(hire_date) from employees where emp_no= 10002);
-- question no. second
select emp_no,birth_date ,concat(first_name,'  ',last_name) from
employees where birth_date >all(select birth_date from employees where emp_no in(10003,10004,10005,10006));

select* from employees limit 10;
select emp_no, first_name;