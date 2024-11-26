select distinct  country_region from superstrore_sales


--
--drop table superstrore_sales
CREATE TABLE public.superstrore_sales (
	row_id int4 NULL,
	order_id varchar(50) NULL,
	order_date date NULL,
	ship_date date NULL,
	ship_mode varchar(20) NULL,
	customer_id varchar(30) NULL,
	customer_name varchar(30) NULL,
	segment varchar(20) NULL,
	country varchar(20) NULL,
	city varchar(20) NULL,
	state varchar(20) NULL,
	postal_code int4 NULL,
	region varchar(20) NULL,
	product_id varchar(50) NULL,
	category varchar(20) NULL,
	sub_category varchar(30) NULL,
	product_name varchar(1000) NULL,
	sales numeric(15, 5) NULL,
	quantity int4 NULL,
	discount numeric(15, 5) NULL,
	profit numeric(15, 5) NULL,
	country_region varchar(50) NULL
);

with temp1 as (
select product_id , sum(sales) prod_sales from 
superstrore_sales ss 
group by 1 
order by prod_sales desc )
, temp2 as (
select product_id , 
sum(prod_sales) over(order by prod_sales desc ) as running_sales, 
0.8* sum(prod_sales) over()  as tot_sales
from temp1) 

select * from  temp2 where running_sales <= tot_sales;