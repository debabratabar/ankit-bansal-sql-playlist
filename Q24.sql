create table company_users 
(
company_id int,
user_id int,
language varchar(20)
);

insert into company_users values (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English');



select * from company_users

with temp1 as (
select company_id , user_id  
from company_users 
where language in ('English' , 'German')
group by company_id  , user_id 
having count(distinct language) =2 
)
select  company_id 
from temp1 
group by 1 
having count(distinct user_id ) >=2