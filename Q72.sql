CREATE TABLE swipe (
    employee_id INT,
    activity_type VARCHAR(10),
    activity_time timestamp
);

-- Insert sample data
INSERT INTO swipe (employee_id, activity_type, activity_time) VALUES
(1, 'login', '2024-07-23 08:00:00'),
(1, 'logout', '2024-07-23 12:00:00'),
(1, 'login', '2024-07-23 13:00:00'),
(1, 'logout', '2024-07-23 17:00:00'),
(2, 'login', '2024-07-23 09:00:00'),
(2, 'logout', '2024-07-23 11:00:00'),
(2, 'login', '2024-07-23 12:00:00'),
(2, 'logout', '2024-07-23 15:00:00'),
(1, 'login', '2024-07-24 08:30:00'),
(1, 'logout', '2024-07-24 12:30:00'),
(2, 'login', '2024-07-24 09:30:00'),
(2, 'logout', '2024-07-24 10:30:00');


select * from swipe ; 


--Q1




select employee_id , date(activity_time)   , --extract(date from activity_time ) , 
-- min( case when activity_type ='login' then activity_time end ) first_login_time
-- ,max( case when activity_type ='logout' then activity_time end ) first_logout_time
  max(  activity_time  ) 
  -  min(  activity_time  ) 
ofc_time 
from swipe 
group by 1,2
order by 1,2;




--Q2

select
a.employee_id , date(a.activity_time) , 
sum( b.activity_time - a.activity_time )
from 
(
select
* , row_number() over(partition by employee_id order by date(activity_time)) rn
from swipe 
where activity_type ='login' 
) a 
join 
(
select
* , row_number() over(partition by employee_id order by date(activity_time)) rn
from swipe 
where activity_type ='logout' 
) b 
on a.employee_id = b.employee_id 
and date(a.activity_time) = date(b.activity_time)
and a.rn = b.rn
group by 1,2
order by 1,2;

-- within 1 query 

with cte as (
select * , date(activity_time ) activity_date , 
lead(activity_time,1) over(partition by employee_id , date(activity_time) order by activity_time )
from swipe) 

select 
employee_id , activity_date
,max(  lead  )   -  min(  activity_time  )  
,sum ( lead -activity_time  )

from cte 
where activity_type = 'login'
group by 1 , 2 ;