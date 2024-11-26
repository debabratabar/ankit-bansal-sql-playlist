create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_orders
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

--1st method with lag()

with temp1  as (
select order_date , customer_id ,  
case when  lag(order_date) over(partition by  customer_id order by  order_date   ) is null then 1 else 0 end as cust_chk 
from customer_orders
)
select order_date , sum(cust_chk) as new_cust, count(*) - sum(cust_chk) as new_cust
from temp1
group by 1 
order by 1 


--2nd mehtod with min(order_date)



with temp1  as (
select order_date , customer_id ,  
case when  min(order_date) over(partition by  customer_id ) = order_date then 1 else 0 end as cust_chk 
from customer_orders
)
select order_date , sum(cust_chk) as new_cust, count(*) - sum(cust_chk) as old_cust
from temp1
group by 1 
order by 1 