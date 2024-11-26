drop table if exists activity
CREATE table activity
(
user_id varchar(20),
event_name varchar(20),
event_date date,
country varchar(20)
);
delete from activity;
insert into activity values (1,'app-installed','2022-01-01','India')
,(1,'app-purchase','2022-01-02','India')
,(2,'app-installed','2022-01-01','USA')
,(3,'app-installed','2022-01-01','USA')
,(3,'app-purchase','2022-01-03','USA')
,(4,'app-installed','2022-01-03','India')
,(4,'app-purchase','2022-01-03','India')
,(5,'app-installed','2022-01-03','SL')
,(5,'app-purchase','2022-01-03','SL')
,(6,'app-installed','2022-01-04','Pakistan')
,(6,'app-purchase','2022-01-04','Pakistan');


select * from activity a 


--Q1 
select event_date , count(distinct user_id)
from activity 
group by 1 
order by 1 ;

--Q2
select date_trunc('week', event_date)::date , count(distinct user_id)
from activity 
group by 1 
order by 1 ;

select event_date , EXTRACT(DOW FROM event_date)  , extract( week from event_date ) from activity a 


SELECT ((EXTRACT(DOW FROM current_date::date) + 1) % 7 ) AS day_of_week;

SELECT EXTRACT(DOW FROM '2024-10-13'::date)  , EXTRACT(day FROM extract (epoch from '2024-10-13'::date) )  AS day_of_week;


--Q3

select a.event_date , count(t1.user_id)
from (
select distinct event_date from activity )a 
left join (
select user_id , max(case when event_name='app-installed' then event_date  end ) as app_installed_date 
from activity a 
group by 1 
having max(case when event_name='app-installed' then event_date  end ) =  max(case when event_name='app-purchase' then event_date  end )
)   t1 on a.event_date = t1.app_installed_date
group by 1
order by 1




--Q4




with temp1 as (
select   
case when  country='India' then country  
	when country='USA' then country
	else 'Others' end as country , count(user_id ) as app_purchase_count

from activity 
where event_name='app-purchase'
group by 1 )
select country , app_purchase_count*100.0 / ( select count(distinct user_id) from activity where event_name='app-purchase') from temp1
group by 1 , 2
order by 1 , 2;




-- Q5

--
--select * from activity a 
--order by user_id , event_date


select a.event_date ,sum (case when event_installed_date is null then 0 else 1 end)  from activity a
left join (
select a.event_installed_date  from 
(
select user_id , event_date+1  as event_installed_date from activity 
where event_name ='app-installed' ) a 
join (
select user_id , event_date as event_purchased_date from activity 
where event_name ='app-purchase'
 ) b 
 on a.event_installed_date = b.event_purchased_date
 and a.user_id = b.user_id
 
 ) c 
 
 on  a.event_date = c.event_installed_date
 group by a.event_date
 order  by a.event_date


 --Q5 2nd approach
 
 


