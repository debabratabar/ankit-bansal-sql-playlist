drop table if exists icc_world_cup;
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;


-- 1st method 
--1. get total match
--2. get total wins 
--3. left join above to get the desired result 


select a.team_name , a.match_played , coalesce (b.match_won , 0) no_of_wins , a.match_played - coalesce (b.match_won , 0) no_of_losses  
from (
select team_name , count(*) match_played 
from 
(
select team_1 as team_name from icc_world_cup iwc union all
select team_2 as team_name from icc_world_cup iwc 
) subq1
group  by 1 
) a 
left join ( 

select winner as team_name , count(*) match_won from icc_world_cup iwc
group by 1 ) b 

on a.team_name = b.team_name
order by a.team_name 


--2nd Method 
--using case statements 


select team_name , count(*) tot_match_played ,  sum (win_flag ) no_of_wins ,  count(*) - sum(win_flag ) as no_of_loses 
from
(
select team_1 as team_name  
, case when team_1=winner then 1 else 0 end as win_flag from icc_world_cup iwc union all
select team_2 as team_name
, case when team_2=winner then 1 else 0 end as win_flag
from icc_world_cup iwc 
 ) temp 
 group by 1 
 order by 1