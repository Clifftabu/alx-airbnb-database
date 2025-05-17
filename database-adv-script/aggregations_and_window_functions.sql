-- Query to find total number of bookings made by each user
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- Query for Ranking properties based on total bookings using window function
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;

-- Query for Assign a unique row number to each booking per user using ROW_NUMBER()
SELECT
    b.booking_id,
    b.user_id,
    b.start_date,
    b.end_date,
    ROW_NUMBER() OVER (PARTITION BY b.user_id ORDER BY b.start_date) AS booking_number_per_user
FROM 
    Booking b;
