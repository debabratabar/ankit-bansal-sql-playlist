create table purchase_history
(userid int
,productid int
,purchasedate date
);
SET DATEFORMAT dmy;
insert into purchase_history values
(1,1,'23-01-2012')
,(1,2,'23-01-2012')
,(1,3,'25-01-2012')
,(2,1,'23-01-2012')
,(2,2,'23-01-2012')
,(2,2,'25-01-2012')
,(2,4,'25-01-2012')
,(3,4,'23-01-2012')
,(3,1,'23-01-2012')
,(4,1,'23-01-2012')
,(4,2,'25-01-2012')
;


select * from purchase_history


/* write a sql query to find users who purchased different products in different day 
 * products purchased on any given day are not repeated on any other day 
 * 1. we have to remove user_ids who only purchase for 1 day 
 * 2. we have to remove user_ids who purchased same product more than once 
*/





--1st method

select a.userid from 
(
select userid ,  count (distinct purchasedate)   
from purchase_history
group by 1 having count (distinct purchasedate)  >1
) a left join 
(
select distinct p1.userid  from purchase_history p1
 join purchase_history p2
on p1.userid = p2.userid  
and  p1.productid  = p2.productid  

where p1.purchasedate !=p2.purchasedate
) b 
on a.userid = b.userid
where b.userid is null 


-- 2nd method ( using group by)



select userid , count(distinct purchasedate) , count(productid) , count(distinct  productid)
from purchase_history 
group by userid
having count(distinct purchasedate) >1 
and count(productid) =  count(distinct  productid) 