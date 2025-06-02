use employees;

show tables;

select * from employees;
select * from dept_emp;
select * from departmetns;

select e.emp_no,e.first_name,d.dept_no from employees as e 
inner join dept_emp as d where e.emp_no = d.emp_no;
desc salaries;

select emp_no from salaries  where salary > (select avg(salary) from salaries where emp_no =10001);


-- outrt queary rsult is used in inner queay in used this  is called the corelated sub quesary ..

select * from salaries as sal 
where salary > (select avg(salary) from salaries as s 
	where sal.emp_no = s.emp_no);
    
    