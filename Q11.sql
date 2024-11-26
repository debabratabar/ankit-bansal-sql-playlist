create table spending 
(
user_id int,
spend_date date,
platform varchar(10),
amount int
);

insert into spending values(1,'2019-07-01','mobile',100),(1,'2019-07-01','desktop',100),(2,'2019-07-01','mobile',100)
,(2,'2019-07-02','mobile',100),(3,'2019-07-01','desktop',100),(3,'2019-07-02','desktop',100);


select * from spending 



select spend_date , user_id , platform ,  count(distinct user_id ) , sum(amount) 
from  spending 
group by 1 ,2 ,3 



-- approach 1 
with temp1 as ( 
select spend_date , user_id ,string_agg( distinct platform , ',' ) platforms , sum(amount) total_amount
from spending 
group by 1 , 2
union all 
select distinct spend_date , null::int  as user_id ,'both' as  platforms , 0 as  total_amount
from spending 

) 
select  spend_date ,--  platforms 
case when platforms = 'desktop,mobile' or platforms = 'mobile,desktop'  or platforms = 'both'  then 'both' else platforms end  as plaforms , 
sum(total_amount ), 
count(*) total_users 
from temp1
group by 1, 2
order by 1 , 2 desc



-- approach 2 

WITH platform_spending AS (
  SELECT
    user_id,
    spend_date,
    SUM(CASE WHEN platform = 'mobile' THEN amount ELSE 0 END) AS mobile_amount,
    SUM(CASE WHEN platform = 'desktop' THEN amount ELSE 0 END) AS desktop_amount
  FROM spending
  GROUP BY user_id, spend_date
)
SELECT
  spend_date,
  COUNT(CASE WHEN mobile_amount > 0 AND desktop_amount = 0 THEN user_id END) AS mobile_only_users,
  SUM(CASE WHEN mobile_amount > 0 AND desktop_amount = 0 THEN mobile_amount END) AS mobile_only_amount,
  
  COUNT(CASE WHEN desktop_amount > 0 AND mobile_amount = 0 THEN user_id END) AS desktop_only_users,
  SUM(CASE WHEN desktop_amount > 0 AND mobile_amount = 0 THEN desktop_amount END) AS desktop_only_amount,
  
  COUNT(CASE WHEN mobile_amount > 0 AND desktop_amount > 0 THEN user_id END) AS both_users,
  SUM(CASE WHEN mobile_amount > 0 AND desktop_amount > 0 THEN coalesce( (mobile_amount + desktop_amount) , 0 )  END) AS both_amount
FROM platform_spending
GROUP BY spend_date
ORDER BY spend_date;
