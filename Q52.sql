create table hall_events
(
hall_id integer,
start_date date,
end_date date
);
delete from hall_events
insert into hall_events values 
(1,'2023-01-13','2023-01-14')
,(1,'2023-01-14','2023-01-17')
,(1,'2023-01-15','2023-01-17')
,(1,'2023-01-18','2023-01-25')
,(2,'2022-12-09','2022-12-23')
,(2,'2022-12-13','2022-12-17')
,(3,'2022-12-01','2023-01-30');



select * from hall_events he 

-- method 1 

with cte as (
select *  , coalesce  ( lag(end_date) over(partition by hall_id order by  start_date )  , end_date) prev_end_date
, coalesce (  lag(start_date) over(partition by hall_id order by  start_date ) , start_date ) prev_strt_date
from hall_events he )
, cte2 as (select * , case when (start_date >=prev_strt_date and start_date <=prev_end_date) 
or ( prev_strt_date >= start_date and prev_strt_date <= end_date )
then 1 else 0 end as chk
from cte)
select hall_id , min(start_date)  start_date , max(end_date) end_date 
from cte2  where chk=1
group by 1 
union all 
select hall_id , start_date , end_date from cte2  where chk=0



-- method 2

with recursive cte as (
select * , row_number () over(order by hall_id, start_date)  rn 
from hall_events he 
) 
,  cte_1  as (
 select hall_id,start_date,end_date,rn , 1 as chk from cte where rn =1 
 
 union all

 select b.hall_id,b.start_date,b.end_date ,b.rn  ,
 case when (a.hall_id = b.hall_id ) and  ( (b.start_date >= a.start_date and b.start_date <=a.end_date) 
or ( a.start_date >= b.start_date and a.start_date<= b.end_date )  )
then chk else chk+1 end as chk
 from cte_1 a join cte b on a.rn+1= b.rn
 
)
select hall_id , chk , min(start_date) start_date  , max(end_date) end_date from cte_1 
group by 1 ,2