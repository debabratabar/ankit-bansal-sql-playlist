create table brands 
(
category varchar(20),
brand_name varchar(20)
);
insert into brands values
('chocolates','5-star')
,(null,'dairy milk')
,(null,'perk')
,(null,'eclair')
,('Biscuits','britannia')
,(null,'good day')
,(null,'boost');

/* 
 * write a sql query to populate category values to the last not null value
 * 
 */


with temp1 as (
select * 
, row_number() over() rn  
from brands
) , temp2 as ( 
select category,rn , coalesce ( lead(rn) over()-1   ,(select max(rn) from temp1)  )  as max_rn from temp1 where category is not null
)--,
--temp3 as ( 
--select * from temp1 where category is  null
--)

select t2.category , t1.brand_name
from temp1 t1 , temp2 t2 --where t2.rn =1
where   t1.rn >=t2.rn and t1.rn <=  t2.max_rn 

