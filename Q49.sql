Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20);
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15);
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30);
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32);
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19);
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19);


select  * from Trade_tbl

select  trade_timestamp- from Trade_tbl


select t1.trade_id as first_trade , t2.trade_id as second_trade, t1.price  as first_trade_price, t2.price as second_trade_price
,  100* abs( t1.price - t2.price  ) / t1.price as percentdiff
from Trade_tbl t1 join Trade_tbl t2 
on t1.trade_stock = t2.trade_stock
and t1.trade_timestamp < t2.trade_timestamp
where   extract ( epoch from t2.trade_timestamp - t1.trade_timestamp)   between 0 and 10 
and 100.00* abs( t1.price - t2.price  ) / t1.price >10
order by 1 , 2 
