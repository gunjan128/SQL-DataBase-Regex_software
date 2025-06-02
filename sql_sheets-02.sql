show databases;
use regex_software;

show tables;

create database regex;
use regex;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);
select * from orders1;

-- cartion join it is join that will first table --will first row will match second table all the rows that means cross joins between 
-- 2 coloums table first , multiply -- 2 coloumsn table second = 
select o.oid,o.city,o.pid, p.pname ,p.pid from orders1 as o
join product as p ;

select o.oid,o.city,o.pid, p.pname ,p.pid from orders1 as o
 INNER join product as p where o.pid=p.pid ;
 -- coman columns will give me the 

-- left join it will give me  the lelf table complete data and right table will selected data gives
-- left join in used the on 


select o.oid,o.city,o.pid, p.pname ,p.pid from orders1 as o
 LEFT JOIN product as p on o.pid=p.pid ;
 
 select o.oid,o.city,o.pid, p.pname ,p.pid from orders1 as o
 JOIN product as p on o.pid=p.pid ;

