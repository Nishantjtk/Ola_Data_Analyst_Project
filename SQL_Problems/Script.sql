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
create view top5_customer as
select "Customer_ID" , Count("Booking_ID") from bookings 
group by "Customer_ID" 
order by count("Booking_ID") desc 
limit 5;

select * from "top5_customer";

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view  canceled_by_rider as 
select count(*) from bookings 
where "Canceled_Rides_by_Driver" = 'Personal & Car related issue';

select * from canceled_by_rider

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view prime_sedan_ratings as
select MAX("Customer_Rating")as "max_rating",MIN("Customer_Rating")as "min_rating" from bookings 
where "Vehicle_Type" ='Prime Sedan';

select * from prime_sedan_ratings

--7. Retrieve all rides where payment was made using UPI:
create view upi_Payment as 
select * from bookings 
where "Payment_Method"= 'UPI'

select * from upi_payment

--8. Find the average customer rating per vehicle type:
create view avg_rating_on_vehicle_type as
SELECT "Vehicle_Type",
       AVG(NULLIF("Customer_Rating", 'null')::NUMERIC) AS Average_Rating
FROM bookings
GROUP BY "Vehicle_Type";

select * from avg_rating_on_vehicle_type;

--9. Calculate the total booking value of rides completed successfully:
--10. List all incomplete rides along with the reason:
