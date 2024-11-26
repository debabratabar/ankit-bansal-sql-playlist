drop table if exists students;
CREATE TABLE students(
 studentid int NULL,
 studentname varchar(255) NULL,
 subject varchar(255) NULL,
 marks int NULL,
 testid int NULL,
 testdate date NULL
)
--data:
insert into students values (2,'Max Ruin','Subject1',63,1,'2022-01-02');
insert into students values (3,'Arnold','Subject1',95,1,'2022-01-02');
insert into students values (4,'Krish Star','Subject1',61,1,'2022-01-02');
insert into students values (5,'John Mike','Subject1',91,1,'2022-01-02');
insert into students values (4,'Krish Star','Subject2',71,1,'2022-01-02');
insert into students values (3,'Arnold','Subject2',32,1,'2022-01-02');
insert into students values (5,'John Mike','Subject2',61,2,'2022-11-02');
insert into students values (1,'John Deo','Subject2',60,1,'2022-01-02');
insert into students values (2,'Max Ruin','Subject2',84,1,'2022-01-02');
insert into students values (2,'Max Ruin','Subject3',29,3,'2022-01-03');
insert into students values (5,'John Mike','Subject3',98,2,'2022-11-02');



select * from students 




-- Q1 

with temp1 as (
select subject , avg(marks) as avg_marks from students 
group by 1 
) 



select distinct  studentid , studentname , s.subject from 
students s  join temp1 t1 
on s.subject = t1.subject 
where s.marks > t1.avg_marks
order by 1 , 2



-- Q2

select 
100.00 * count(distinct  case when marks > 90 then studentid else null end) / count(distinct studentid)  as perc
from students 


-- Q3 

with temp1 as (
select 
subject , marks ,
rank() over(partition by subject order by marks ) as marks_asc,
rank() over(partition by subject order by marks desc) as marks_desc
from students s order by 1 , 2 ) 
select subject , max(case when marks_asc = 2  then marks else null end ) as second_lowest , 
max(case when marks_desc = 2  then marks else null end ) as second_Highest  
from temp1 
group by 1 



-- Q4
select studentid ,  testdate  , subject , marks 
, lag(marks , 1 ) over(partition by studentid order by testdate  , subject ) , 
case when marks > lag(marks , 1 ) over(partition by studentid order by testdate  , subject ) then 'Increased' 
when marks < lag(marks , 1 ) over(partition by studentid order by testdate  , subject ) then  'Decreased' else null  end as test_chk
from students s 