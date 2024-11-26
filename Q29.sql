create table event_status
(
event_time varchar(10),
status varchar(10)
);
insert into event_status 
values
('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
,('10:11','on'),('10:12','off');



select * from event_status 

-- using join with on and off 

with temp1 as (
select event_time_strt , min(event_time_end) event_status
from 
(select  event_time::time as  event_time_strt from event_status where status ='on' ) a
join 
(select event_time::time as  event_time_end from event_status where status ='off') b
on event_time_strt < event_time_end 
group by 1) 
select  event_time_end , min(event_time_strt) event_time_strt ,count(1)
from temp1 group by 1 
order by 1 


-- using group key 
with temp1 as (
select * , sum(case when status ='on' and prev_stat='off' then 1 else 0 end ) over(order by event_time)
as running_sum from ( 
select  * ,coalesce( lag(status , 1) over(order by event_time) , status)  as prev_stat
from event_status) a
) 
select min(event_time) login , max(event_time) logout , count(*) -1 
from temp1 group by running_sum