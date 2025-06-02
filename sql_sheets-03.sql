use sakila;

-- self join -- when a table will connect it self , that  
create table employee1(eid int, ename varchar(20), manager_id int);

insert into employee1 values(10,"tushar",null),(11,"amna",12),(10,"adi",15),(13,"sunil",11);


select * from employee1;

desc employee1;
select emp.eid , emp.ename, emp.manager_id,manager.eid,manager.ename
from employee1 as emp 
join employee1 as manager where emp.manager_id = manager.eid;
 
 
-- orther varition  

-- Natural join ---

use regex_software;

show tables;

select * from product natural join orders1;

-- have no same columns present in the tables 
