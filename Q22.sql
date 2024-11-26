create table exams (student_id int, subject varchar(20), marks int);
delete from exams;
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);


select * from exams


--1st method 
select a.student_id
from 
(select  student_id ,marks
from exams
where  subject ='Physics'
) a
join 
(select  student_id ,marks
from exams
where  subject ='Chemistry')
b on a.student_id = b.student_id 
where a.marks =b.marks



--2nd method with group  by & having 


select student_id 
from exams 
where subject in ('Physics' ,'Chemistry' )
group  by student_id
having count(distinct subject ) =2 and  count( distinct marks) =1