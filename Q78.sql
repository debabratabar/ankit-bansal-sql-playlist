
create table cricket_match( 
	matchid int,
	ballNumber int , 
	inningno int , 
	overs numeric, 
	outcome varchar(10),
	batter varchar(50),
	bowler varchar(50),
	score int
)

INSERT INTO cricket_match VALUES(1,1,1,0.1,'0','Mohammed Shami','Devon Conway',0),(1,2,1,0.2,'1lb','Mohammed Shami','Devon Conway',1),(1,3,1,0.3,'0','Mohammed Shami','Ruturaj Gaikwad',0),(1,4,1,0.4,'1','Mohammed Shami','Ruturaj Gaikwad',1),(1,5,1,0.5,'0','Mohammed Shami','Devon Conway',0),(1,6,1,0.6,'0','Mohammed Shami','Devon Conway',0),(1,7,1,1.1,'4','Hardik Pandya','Ruturaj Gaikwad',4),(1,8,1,1.2,'0','Hardik Pandya','Ruturaj Gaikwad',0),(1,9,1,1.3,'4','Hardik Pandya','Ruturaj Gaikwad',4),(1,10,1,1.4,'1','Hardik Pandya','Ruturaj Gaikwad',1),(1,11,1,1.5,'1','Hardik Pandya','Devon Conway',1),(1,12,1,1.6,'1','Hardik Pandya','Ruturaj Gaikwad',1),(1,13,2,2.1,'1','Ruturaj Gaikwad','Mohammed Shami',1),(1,14,2,2.2,'w','Devon Conway','Mohammed Shami',0),(1,15,2,2.3,'0','Moeen Ali','Mohammed Shami',0),(1,16,2,2.4,'0','Moeen Ali','Mohammed Shami',0),(1,17,2,2.5,'0','Moeen Ali','Mohammed Shami',0),(1,18,2,2.6,'0','Moeen Ali','Mohammed Shami',0),(1,19,2,3.1,'6','Ruturaj Gaikwad','Josh Little',6),(1,20,2,3.2,'4','Ruturaj Gaikwad','Josh Little',4),(1,21,2,3.3,'1','Ruturaj Gaikwad','Josh Little',1),(1,22,2,3.4,'0','Moeen Ali','Josh Little',0),(1,23,2,3.5,'4','Moeen Ali','Josh Little',4),(1,24,2,3.6,'0','Moeen Ali','Josh Little',0),(2,1,1,4.1,'0','Mohammed Shami','Ruturaj Gaikwad',0),(2,2,1,4.2,'1','Mohammed Shami','Ruturaj Gaikwad',1),(2,3,1,4.3,'4','Mohammed Shami','Moeen Ali',4),(2,4,1,4.4,'1nb','Mohammed Shami','Moeen Ali',1),(2,5,1,4.4,'6','Mohammed Shami','Moeen Ali',6),(2,6,1,4.5,'4','Mohammed Shami','Moeen Ali',4),(2,7,1,4.6,'1','Mohammed Shami','Moeen Ali',1),(2,8,1,5.1,'0','Rashid Khan','Moeen Ali',0),(2,9,1,5.2,'0','Rashid Khan','Moeen Ali',0),(2,10,1,5.3,'0','Rashid Khan','Moeen Ali',0),(2,11,1,5.4,'4','Rashid Khan','Moeen Ali',4),(2,12,1,5.5,'w','Rashid Khan','Moeen Ali',0),(2,13,1,5.6,'1','Rashid Khan','Ben S',1),(2,14,2,6.1,'0','Ben S','Hardik Pandya',0),(2,15,2,6.2,'1','Ben S','Hardik Pandya',1),(2,16,2,6.3,'6','Ruturaj Gaikwad','Hardik Pandya',6),(2,17,2,6.4,'6','Ruturaj Gaikwad','Hardik Pandya',6),(2,18,2,6.5,'0','Ruturaj Gaikwad','Hardik Pandya',0),(2,19,2,6.6,'0','Ruturaj Gaikwad','Hardik Pandya',0),(2,20,2,7.1,'1','Ben S','Rashid Khan',1),(2,21,2,7.2,'1','Ruturaj Gaikwad','Rashid Khan',1),(2,22,2,7.3,'4','Ben S','Rashid Khan',4),(2,23,2,7.4,'w','Ben S','Rashid Khan',0),(2,24,2,7.5,'1','Ambati Rayudu','Rashid Khan',1),(2,25,2,7.6,'1','Ruturaj Gaikwad','Rashid Khan',1),(3,1,1,8.1,'6','Alzarri Joseph','Ruturaj Gaikwad',6),(3,2,1,8.2,'0','Alzarri Joseph','Ruturaj Gaikwad',0),(3,3,1,8.3,'0','Alzarri Joseph','Ruturaj Gaikwad',0),(3,4,1,8.4,'6','Alzarri Joseph','Ruturaj Gaikwad',6),(3,5,1,8.5,'0','Alzarri Joseph','Ruturaj Gaikwad',0),(3,6,1,8.6,'6','Alzarri Joseph','Ruturaj Gaikwad',6),(3,7,1,9.1,'0','Rashid Khan','Brett Lee',0),(3,8,1,9.2,'1','Rashid Khan','Brett Lee',1),(3,9,1,9.3,'1','Rashid Khan','Ruturaj Gaikwad',1),(3,10,1,9.4,'1','Rashid Khan','Brett Lee',1),(3,11,1,9.5,'0','Rashid Khan','Ruturaj Gaikwad',0),(3,12,1,9.6,'0','Rashid Khan','Ruturaj Gaikwad',0),(3,13,2,10.1,'0','Ambati Rayudu','Josh Little',0),(3,14,2,10.2,'0','Ambati Rayudu','Josh Little',0),(3,15,2,10.3,'0','Ambati Rayudu','Josh Little',0),(3,16,2,10.4,'1','Ambati Rayudu','Josh Little',1),(3,17,2,10.5,'0','Ruturaj Gaikwad','Josh Little',0),(3,18,2,10.6,'6','Ruturaj Gaikwad','Josh Little',6),(3,19,2,11.1,'1','Ambati Rayudu','Yash Dayal',1),(3,20,2,11.2,'0','Ruturaj Gaikwad','Yash Dayal',0),(3,21,2,11.3,'6','Ruturaj Gaikwad','Yash Dayal',6),(3,22,2,11.4,'0','Ruturaj Gaikwad','Yash Dayal',0),(3,23,2,11.5,'1','Ruturaj Gaikwad','Yash Dayal',1),(3,24,2,11.6,'6','Ambati Rayudu','Yash Dayal',6),(4,1,1,12.1,'1','Josh Little','Ruturaj Gaikwad',1),(4,2,1,12.2,'1','Josh Little','Brett Lee',1),(4,3,1,12.3,'4','Josh Little','Ruturaj Gaikwad',4),(4,4,1,12.4,'1','Josh Little','Ruturaj Gaikwad',1),(4,5,1,12.5,'w','Josh Little','Brett Lee',0),(4,6,1,12.6,'0','Josh Little','Shivam Dube',0),(4,7,1,13.1,'1','Alzarri Joseph','Ruturaj Gaikwad',1),(4,8,1,13.2,'1','Alzarri Joseph','Shivam Dube',1),(4,9,1,13.3,'1','Alzarri Joseph','Ruturaj Gaikwad',1),(4,10,1,13.4,'0','Alzarri Joseph','Shivam Dube',0),(4,11,1,13.5,'0','Alzarri Joseph','Shivam Dube',0),(4,12,1,13.6,'1','Alzarri Joseph','Shivam Dube',1),(4,13,2,14.1,'1','Shivam Dube','Hardik Pandya',1),(4,14,2,14.2,'1','Ruturaj Gaikwad','Hardik Pandya',1),(4,15,2,14.3,'4lb','Shivam Dube','Hardik Pandya',4),(4,16,2,14.4,'1','Shivam Dube','Hardik Pandya',1),(4,17,2,14.5,'0','Ruturaj Gaikwad','Hardik Pandya',0),(4,18,2,14.6,'1','Ruturaj Gaikwad','Hardik Pandya',1),(4,19,2,15.1,'1','Ruturaj Gaikwad','Alzarri Joseph',1),(4,20,2,15.2,'0','Shivam Dube','Alzarri Joseph',0),(4,21,2,15.3,'1','Shivam Dube','Alzarri Joseph',1),(4,22,2,15.4,'1','Ruturaj Gaikwad','Alzarri Joseph',1),(4,23,2,15.5,'2','Shivam Dube','Alzarri Joseph',2),(4,24,2,15.6,'2','Shivam Dube','Alzarri Joseph',2);



select * from cricket_match


--1st method

with total_player as (
select player , count(matchid) from 

(
select distinct  batter as player, matchid from cricket_match
union
select distinct bowler as player, matchid from cricket_match
) a
group by 1 ) ,
batter as 
(select distinct  batter as player, count(distinct matchid) from cricket_match  group by 1 )
, bowler as ( select distinct  bowler as player, count(distinct matchid) from cricket_match  group by 1  )

select distinct  a.player , a.count , coalesce  ( b.count, 0 ) , coalesce  ( c.count , 0)
from total_player a left join batter b on a.player = b.player
left join bowler c on a.player = c.player 
order by  a.player ; 


--2nd method

with cte as ( 

select distinct  batter as player, matchid::varchar as batting_match , null as bowling_match from cricket_match
union
select distinct bowler as player, null  as  batting_match , matchid::varchar as bowling_match from cricket_match

)
-- use coalesce to get distinct match played
select player , count ( distinct  coalesce( batting_match ,  bowling_match ) ) as total_Match 
,count(batting_match)  batting_match
, count(bowling_match)  bowling_match
from cte  
group by 1 
order by 1 ;
