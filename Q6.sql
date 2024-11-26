create table friend(
	personId int,
	friendId int
)



create table person(
	personId int,
	name varchar(30),
	email varchar(30),
	score int
)



insert into friend(personId , friendId)
	values 
(1,	2),
(1,	3),
(2,	1),
(2,	3),
(3,	5),
(4,	2),
(4,	3),
(4,	5);


insert into person(personId , name , email , score)
	values
(1,	'Alice' ,'alice2018@hotmail.com	',88          ),
(2,	'Bob'     ,'bob2018@hotmail.com	',        11  ),
(3,	'Davis' ,'davis2018@hotmail.com	',27          ),
(4,	'Tara', 'tara2018@hotmail.com	',45          ),
(5,	'John', 'john2018@hotmail.com	',63          )



select * from friend

select * from person




with temp1 as (
select  f.personid  --, p.name 
, count(f.friendid) as friend_count , sum(p.Score) as tot_score
from friend f left join person p 
on f.friendid  = p.personid
group by f.personid  having  sum(p.Score) >100
order by f.personid  )
select t1.personid , p.name  , t1.friend_count , t1.tot_score from 
temp1 t1 join person p 
on  t1.personid = p.personid 