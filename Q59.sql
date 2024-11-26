create table sku 
(
sku_id int,
price_date date ,
price int
);
delete from sku;
insert into sku values 
(1,'2023-01-01',10)
,(1,'2023-02-15',15)
,(1,'2023-03-03',18)
,(1,'2023-03-27',15)
,(1,'2023-04-06',20)

select * from sku


-- using recursive approach 
with recursive cte as ( 

select  distinct '2023-01-01'::date as day1 from  sku  

union all 

select day1+1  from  cte
where day1 <='2023-05-01'::date
) 
, cte1 as (select distinct date_trunc('month' , day1  )::date  from cte ) 
 , cte2 as ( 

select * , lead( price_date-1 , 1,'9999-12-31') over(order by price_date) from sku
)

select cte1.date_trunc , cte2.price , coalesce  (abs(cte2.price - lag(cte2.price) over(order by cte1.date_trunc )   ) , 0)
from cte1 , cte2
--on 
where  cte1.date_trunc >= cte2.price_date and cte1.date_trunc <= cte2.lead


-- using various date functions 



with temp1 as ( 

with cte1 as (
SELECT * 
, row_number() over(partition by sku_id , extract(year from price_date) ,extract(month from price_date) order by price_date desc ) rn  
from sku )
select sku_id, price_date , price from sku where extract (day from price_date) =1
union all 

select 
sku_id
,date_trunc('month' ,  (price_date+interval '1 month'))::date 
, price
from cte1 
where rn = 1  
and date_trunc('month' ,  (price_date+interval '1 month'))::date not in ( select price_date from sku where extract (day from price_date) =1) ) 

select *
, coalesce  (abs(price - lag(price) over(partition by sku_id order by price_date )   ) , 0)
from temp1