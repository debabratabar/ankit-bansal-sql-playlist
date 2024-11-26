create table phone_numbers (num varchar(20));
insert into phone_numbers values
('1234567780'),
('2234578996'),
('+1-12244567780'),
('+32-2233567889'),
('+2-23456987312'),
('+91-9087654123'),
('+23-9085761324'),
('+11-8091013345');


--Method 1 

with cte as (
select *
,   case when position('-' in num) <>0 then  split_part( num , '-' , 2) else num end   as act_num

from phone_numbers
)
, cte2 as (
select  act_num  ,  regexp_split_to_table ( act_num , '' ) ele 
from cte)
select act_num , count(distinct ele) , count( ele)  
from cte2 
group by 1
having count(distinct ele) = count( ele)  

;

