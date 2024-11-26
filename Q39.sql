drop table if exists students;
create table students
(
student_id int,
student_name varchar(20)
);
insert into students values
(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

drop table if exists exams;
create table exams
(
exam_id int,
student_id int,
score int);

insert into exams values
(10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
,(40,2,70),(40,4,80);



select * from students s 
select * from exams e 

/*
 * Write a sql query to report the students ( student_id , student_name ) who are 'quiet' in all exams
 * a quiet student is who took at least one exam and didn't score neither high score and low score in any of the exam
 * don't return the student who has never taken any exam , result should be order by student_id 
 */


-- 1st method 
with temp1 as (
select exam_id , min(score ) , max(score ) 
from exams e 
group by exam_id ) 
, tot_exam as( select student_id , count(exam_id) from  exams e  group by student_id ) 
, temp2 as (
select   e.student_id  , count( e.exam_id ) --, e.score , t1.min , t1.max
from exams e join temp1 t1 
on e.exam_id = t1.exam_id 
where (e.score != t1.min and e.score != t1.max)
group by e.student_id  
) 
select * from students where student_id in ( select a.student_id  from temp2 a  join tot_exam b on a.student_id = b.student_id and a.count = b.count ) 



-- 2nd method  using case and having 


with temp1 as (
select exam_id , min(score ) , max(score ) 
from exams e 
group by exam_id ) 
, temp2 as (
select   e.student_id 
from exams e join temp1 t1 
on e.exam_id = t1.exam_id 
group by e.student_id  
having max(case when e.score = t1.min or e.score = t1.max then 1 else 0 end ) = 0
)
select * from students where student_id in ( select student_id from temp2)