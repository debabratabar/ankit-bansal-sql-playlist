
create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');



select * from useractivity ua 



--1st method
with temp1 as (
select * , rank() over ( partition by username order by startdate desc) as rn
from useractivity ua 
)
select username,activity,startdate,enddate from temp1 where rn =2
union all 

select t2.username,activity,startdate,enddate from 
(
select username , count(1) 
from useractivity ua 
group by 1 having count(1) =1 
) t2 
join useractivity ua on t2.username = ua.username



--2nd method
with temp1 as (
select * , 
rank() over ( partition by username order by startdate desc) as rn,
count(1) over(partition by username ) cnt
from useractivity ua 
) 
select username,activity,startdate,enddate from temp1
where rn =2 or cnt =1