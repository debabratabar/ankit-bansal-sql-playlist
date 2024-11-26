create table tbl_orders (
order_id integer,
order_date date
);
insert into tbl_orders
values (1,'2022-10-21'),(2,'2022-10-22'),
(3,'2022-10-25'),(4,'2022-10-25');

select * into tbl_orders_copy from  tbl_orders;

select * from tbl_orders;
insert into tbl_orders
values (5,'2022-10-26'),(6,'2022-10-26');
delete from tbl_orders where order_id=1;



select * from tbl_orders

select * from tbl_orders_copy 


/* get the delta records without using the timestamp
 * */

-- 1st method ( with union all ) 


select tor.order_id , 'I' as flag
from tbl_orders tor
left join tbl_orders_copy toc 
on tor.order_id = toc.order_id
where toc.order_id is null 
union all 
select toc.order_id , 'D' as flag
from tbl_orders_copy toc 
left join  tbl_orders tor
on tor.order_id = toc.order_id
where tor.order_id is null 


-- 2nd method ( without union all ) 

select coalesce (tor.order_id , toc.order_id  ), case when tor.order_id is null then 'D' else 'I' end as flag
from tbl_orders tor
full outer  join tbl_orders_copy toc 
on tor.order_id = toc.order_id
where tor.order_id is null or toc.order_id  is null 