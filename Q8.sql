create table players
(player_id int,
group_id int)

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int)

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);


select * from matches
select * from players

with player_record as (
select player , sum(score)  tot_score from (
select first_player as player , first_score as score from matches union
select second_player as player  ,second_score as score from matches ) temp1 group by 1 ) 
, temp2 as (
select group_id , p.player_id , tot_score ,  rank() over(partition by group_id order by tot_score desc , p.player_id ) as rn
from player_record pr join players p 
on pr.player = p.player_id
)
select group_id , player_id ,  tot_score from temp2 where rn=1