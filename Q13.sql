drop table if exists orders;
create table orders
(
order_id int,
customer_id int,
product_id int
);

insert into orders VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 4),
(3, 1, 5);

drop table if exists products;
create table products (
id int,
name varchar(10)
);
insert into products VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');


select * from orders o 

select * from products p  

with temp1 as (
select o1.order_id , o1.product_id as p_id1  , o2.product_id as p_id2 from orders o1
join orders o2 on o1.order_id = o2.order_id 
where o1.product_id != o2.product_id and o1.product_id < o2.product_id 

) , temp2 as (
select p1.name as p1_name  ,p2.name as p2_name  , count(1)
from temp1 t1 inner join products p1 on t1.p_id1 = p1.id 
join products p2 on t1.p_id2 = p2.id
group by 1 , 2) 
select concat(p1_name , ' ' ,  p2_name) , count from temp2   order by count desc  ,concat 