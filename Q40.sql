
create table phonelog(
    Callerid int, 
    Recipientid int,
    Datecalled timestamp 
);

insert into phonelog(Callerid, Recipientid, Datecalled)
values(1, 2, '2019-01-01 09:00:00.000'),
       (1, 3, '2019-01-01 17:00:00.000'),
       (1, 4, '2019-01-01 23:00:00.000'),
       (2, 5, '2019-07-05 09:00:00.000'),
       (2, 3, '2019-07-05 17:00:00.000'),
       (2, 3, '2019-07-05 17:20:00.000'),
       (2, 5, '2019-07-05 23:00:00.000'),
       (2, 3, '2019-08-01 09:00:00.000'),
       (2, 3, '2019-08-01 17:00:00.000'),
       (2, 5, '2019-08-01 19:30:00.000'),
       (2, 4, '2019-08-02 09:00:00.000'),
       (2, 5, '2019-08-02 10:00:00.000'),
       (2, 5, '2019-08-02 10:45:00.000'),
       (2, 4, '2019-08-02 11:00:00.000');
       
select * from phonelog

/* 
 * write a sql query to find out caller whose first & last call to the same person on a given day 
 * 
 */


-- 1st method , getting first_call and last_call separately and join to compare recipientid 

with first_call as ( 

select a.callerid , a.dates   , b.recipientid
from 
( select  callerid , Datecalled::date as dates , min(datecalled)  datecalled
from phonelog
group by callerid , Datecalled::date ) a join phonelog b 
on a.callerid = b.callerid
and a.datecalled = b.datecalled
)

,last_call as ( 

select a.callerid , a.dates  , b.recipientid
from 
( select  callerid , Datecalled::date as dates , max(datecalled)  datecalled
from phonelog
group by callerid , Datecalled::date ) a join phonelog b 
on a.callerid = b.callerid
and a.datecalled = b.datecalled
)


select fc.callerid , fc.dates , fc.recipientid

from first_call fc join last_call lc 
on fc.callerid = lc.callerid
and fc.dates = lc.dates
where fc.recipientid = lc.recipientid




-- 2nd method , getting first_call and last_call in a same wuery and then join to compare recipientid 


with temp1 as 
( select  callerid , Datecalled::date as dates 
, to_char( max(datecalled) , 'yyyy-MM-dd HH:mm:SS' ) max_dates 
, to_char( min(datecalled)  , 'yyyy-MM-dd HH:mm:SS' )  min_dates
from phonelog
group by callerid , Datecalled::date 
)

select t1.callerid , t1.dates ,p1.recipientid
from temp1 t1 inner join phonelog p1  on t1.callerid = p1.callerid and t1.max_dates = to_char( p1.datecalled , 'yyyy-MM-dd HH:mm:SS' )
inner join phonelog p2  on t1.callerid = p1.callerid and t1.min_dates = to_char( p2.datecalled , 'yyyy-MM-dd HH:mm:SS' )
where p1.recipientid  = p2.recipientid 
