SET DateStyle = 'ISO, MDY';

drop table if exists users 
create table users
(
user_id integer,
name varchar(20),
join_date date
);
insert into users
values (1, 'Jon', CAST('2-14-20' AS date)), 
(2, 'Jane', CAST('2-14-20' AS date)), 
(3, 'Jill', CAST('2-15-20' AS date)), 
(4, 'Josh', CAST('2-15-20' AS date)), 
(5, 'Jean', CAST('2-16-20' AS date)), 
(6, 'Justin', CAST('2-17-20' AS date)),
(7, 'Jeremy', CAST('2-18-20' AS date));

create table events
(
user_id integer,
type varchar(10),
access_date date
);

insert into events values
(1, 'Pay', CAST('3-1-20' AS date)), 
(2, 'Music', CAST('3-2-20' AS date)), 
(2, 'P', CAST('3-12-20' AS date)),
(3, 'Music', CAST('3-15-20' AS date)), 
(4, 'Music', CAST('3-15-20' AS date)), 
(1, 'P', CAST('3-16-20' AS date)), 
(3, 'P', CAST('3-22-20' AS date));

select * from users



select * from events


with temp1 as ( 
select e.user_id  , e.type from events e join users u on e.user_id = u.user_id 
where abs (u.join_date - e.access_date) <=30 and e.type ='Music'
union all
select e.user_id  , e.type  from events e join users u on e.user_id = u.user_id 
where abs (u.join_date - e.access_date) <=30 and e.type ='P'
) 

select count( distinct case when type ='P' then user_id end) *100.00 /  count(distinct user_id ) 
from temp1 
