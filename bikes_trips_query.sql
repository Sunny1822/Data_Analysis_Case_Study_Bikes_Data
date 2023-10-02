# Using Case_study Database
Use Case_Study;

-- Reviewing the imported data

Select * from divvy_trips_2019_01;    # Count of Line records 56
Select * from divvy_trips_2019_02;    # Count of Line records 73
Select * From divvy_trips_2019_03;    # Count of Line records 4732

# Now appending table 1 , 2 & 3  all tables into 1 _named_ trips_master_data

Select * from divvy_trips_2019_01
Union
Select * From divvy_trips_2019_02
Union
Select * from divvy_trips_2019_03;



-- Creating a New Table Naed - trips_master

CREATE TABLE  trips_master_data (trip_id int , start_time text , end_time text , bikeid int, tripduration Decimal(10 ,3) , from_station_id int , from_station_name text , to_station_id int,to_station_name text
,usertype text, gender text, birthyear int);


Select * from trips_master_data;

-- Modifying the data type of trip_duration

ALter table trips_master_data 
Modify column tripduration float;

-- Modifying table 1
ALter table divvy_trips_2019_01
Modify column tripduration Decimal(10 , 3);
-- Modifying table 2
ALter table divvy_trips_2019_02
Modify column tripduration Decimal(10,3);
 -- Modying table 3
 ALter table divvy_trips_2019_03
Modify column tripduration Decimal(10,3);




-- Now appending data  - Using Union Function

Insert into trips_master_data(trip_id , start_time , end_time , bikeid , tripduration  , from_station_id  , from_station_name  , to_station_id ,to_station_name ,
usertype, gender, birthyear)
Select * from divvy_trips_2019_01
Union
Select * From divvy_trips_2019_02
Union
Select * from divvy_trips_2019_03;

Select * from trips_master_data
limit 10;

-- Analyising the data 

Select gender , count(trip_id) as Total_Trips
From trips_master_data
Group By gender;

/* Key Points - Male count if much more higher than fenale
and found Null values too 
*/

Select * from trips_master_data;

Select Count(distinct(trip_id)) as Unique_Count
from trips_master_data;

-- Have found duplicaity ion the data too.

Select * from trips_master_data;

Select usertype , count(trip_id) as users_count
from trips_master_data
group by usertype
order by users_count Desc;

-- More Subscribers as compare to Customer

Select * from trips_master_data;

Select usertype , avg(tripduration) as avg_trip_duration
from trips_master_data
group by usertype;

