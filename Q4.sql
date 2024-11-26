
do  $$declare 
	n int = 3;
	wkday int= 2;

begin

-- getting nth sunday( or any date )  date

 select current_date , extract (dow from current_date) ,  date_trunc('week' , current_date)::date-1 + ((3-1)*7)+(2) 

-- code 
select current_date , extract (dow from current_date) ,  date_trunc('week' , current_date)::date-1 + ((n-1)*7)+wkday


end$$ ;