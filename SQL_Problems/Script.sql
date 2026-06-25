--1. Retrieve all successful bookings:
create view successfull_bookings as  
select * from bookings b 
where b."Booking_Status" ='Success'

select * from successfull_bookings;


--2. Find the average ride distance for each vehicle type:
create view avg_distance as 
select b."Vehicle_Type"   , AVG(b."Ride_Distance") as avg_distance 
from bookings b
group by b."Vehicle_Type" ; 

select * from avg_distance

--3. Get the total number of cancelled rides by customers:
create view canceled_ride_customer as 
select count(*) from bookings 
where "Booking_Status" = 'Canceled by Customer';

select * from canceled_ride_customer;
--4. List the top 5 customers who booked the highest number of rides:
--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
--7. Retrieve all rides where payment was made using UPI:
--8. Find the average customer rating per vehicle type:
--9. Calculate the total booking value of rides completed successfully:
--10. List all incomplete rides along with the reason:
