drop table if exists products
create table products
(
product_id varchar(20) ,
cost int
);
insert into products values ('P1',200),('P2',300),('P3',500),('P4',800);

create table customer_budget
(
customer_id int,
budget int
);

insert into customer_budget values (100,400),(200,800),(300,1500);


select * from products;

select * from customer_budget;

select customer_id , budget , count(product_id) , string_agg(product_id , ',')
from (
select distinct customer_id,budget ,product_id ,  mov_sum ,  budget -mov_sum from 
customer_budget , 
(select product_id , sum(cost) over (order by product_id) mov_sum  from products) b 
--where budget -mov_sum  >0
order by customer_id , budget , product_id
) temp1 
group  by customer_id , budget



with 
