create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);

insert into call_details
values ('OUT','181868',13),('OUT','2159010',8)
,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9)
,('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);



select * from call_details
where 
call_number= '2159010' and call_type='OUT'


/*
 * write a sql query to determine ph. numbers which satisfy below cond.
 * 1. the numbers that have both incoming $ outgoing calls 
 * 2. the sum of duration of out calls should be greater than sum of duration of inc calls 
 * 
 * */


-- 1st method , using having clause
select call_number ,
sum(case when call_type='OUT' then call_duration else 0 end ) out_calls,
sum(case when call_type='INC' then call_duration else 0 end ) inc_calls
from call_details 
group by call_number
having 
( sum(case when call_type='OUT' then call_duration else 0 end ) !=0 and 
sum(case when call_type='INC' then call_duration else 0 end ) !=0 and 
sum(case when call_type='OUT' then call_duration else 0 end ) > sum(case when call_type='INC' then call_duration else 0 end )  )



-- 2nd method , using cte and join 

with cte_out as (
select call_number ,
sum(call_duration ) out_calls
from call_details 
where call_type='OUT'
group by call_number
)
, cte_in as (
select call_number ,
sum(call_duration ) in_calls
from call_details 
where call_type='INC'
group by call_number
)

select a.call_number 
from cte_out a join cte_in b 
on a.call_number = b.call_number
where a.out_calls > b.in_calls