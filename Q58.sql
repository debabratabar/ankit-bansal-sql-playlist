CREATE TABLE travel_data (
    customer VARCHAR(10),
    start_loc VARCHAR(50),
    end_loc VARCHAR(50)
);

INSERT INTO travel_data (customer, start_loc, end_loc) VALUES
    ('c1', 'New York', 'Lima'),
    ('c1', 'London', 'New York'),
    ('c1', 'Lima', 'Sao Paulo'),
    ('c1', 'Sao Paulo', 'New Delhi'),
    ('c2', 'Mumbai', 'Hyderabad'),
    ('c2', 'Surat', 'Pune'),
    ('c2', 'Hyderabad', 'Surat'),
    ('c3', 'Kochi', 'Kurnool'),
    ('c3', 'Lucknow', 'Agra'),
    ('c3', 'Agra', 'Jaipur'),
    ('c3', 'Jaipur', 'Kochi');
   
   select * from travel_data
    
select  a.customer ,start_loc ,  end_loc
   from ( 
   -- end location 
  select td.customer , td.end_loc 
  from travel_data td  left join travel_data td1
  on td.end_loc = td1.start_loc and td.customer = td1.customer where td1.start_loc is null
) a join (
	-- start location 
  select td.customer , td.start_loc 
  from travel_data td  left join travel_data td1
  on td.start_loc = td1.end_loc and td.customer = td1.customer where td1.start_loc is null
  
  ) b 
  on a.customer = b.customer