create table stadium (
id int,
visit_date date,
no_of_people int
);

insert into stadium
values (1,'2017-07-01',10)
,(2,'2017-07-02',109)
,(3,'2017-07-03',150)
,(4,'2017-07-04',99)
,(5,'2017-07-05',145)
,(6,'2017-07-06',1455)
,(7,'2017-07-07',199)
,(8,'2017-07-08',188);



select * from stadium


/* write a query to display the records which have 3 or more consecutive rows 
 * with the amount of people more than 100 ( inclusive) each day 
 * 
 */

select id , visit_date  , no_of_people from (
select * , 
lag(no_of_people,2) over(order by visit_date) as prev_2_cnt,
lag(no_of_people,1) over(order by visit_date) as prev_1_cnt,
lead(no_of_people,2) over(order by visit_date) as next_2_cnt,
lead(no_of_people,1) over(order by visit_date) as next_1_cnt
from stadium
)  a where 

(no_of_people >= 100 and prev_2_cnt >=100 and prev_1_cnt>=100) or 
(no_of_people >= 100 and next_2_cnt >=100 and next_1_cnt>=100) or
(no_of_people >= 100 and prev_1_cnt >=100 and next_1_cnt>=100)


-- 2nd method 

with temp1 as (
select * ,
id - row_number () over(order by visit_date )  as grp 
from stadium s 
where no_of_people >=100) 
select id , visit_date , no_of_people 
from temp1 where grp in ( 

select grp from temp1 group by grp having count(grp)>=3
)





