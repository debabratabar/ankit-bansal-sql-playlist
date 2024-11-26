create table events 
(userid int , 
event_type varchar(20),
event_time timestamp);

insert into events VALUES (1, 'click', '2023-09-10 09:00:00');
insert into events VALUES (1, 'click', '2023-09-10 10:00:00');
insert into events VALUES (1, 'scroll', '2023-09-10 10:20:00');
insert into events VALUES (1, 'click', '2023-09-10 10:50:00');
insert into events VALUES (1, 'scroll', '2023-09-10 11:40:00');
insert into events VALUES (1, 'click', '2023-09-10 12:40:00');
insert into events VALUES (1, 'scroll', '2023-09-10 12:50:00');
insert into events VALUES (2, 'click', '2023-09-10 09:00:00');
insert into events VALUES (2, 'scroll', '2023-09-10 09:20:00');
insert into events VALUES (2, 'click', '2023-09-10 10:30:00');



select * from events ;

with cte as (
select *
,  case when 
extract( epoch from  event_time  - lag(event_time , 1 , event_time) over(partition by userid order by event_time)    )/60  <=30 then 0 else 1
end as sessions
from events)
, cte2 as (
select * , sum(sessions) over(partition by userid order by event_time)+1 session_id from cte 
)
select userid , session_id , min(event_time) session_start_time, max(event_time) session_end_time, 
 extract( epoch from   max(event_time) - min(event_time)  ) /60 as session_duration 
,count(event_type) as event_count
from cte2 
group by 1 ,2 
order by 1 ,2 ;