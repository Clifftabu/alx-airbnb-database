-- Query 1: INNER JOIN to get bookings and their respective users
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    User.user_id,
    User.first_name,
    User.last_name
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;

-- Query 2: LEFT JOIN to get all properties and their reviews (even if no review exists)
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Review.review_id,
    Review.rating,
    Review.comment
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id;

-- Query 3: FULL OUTER JOIN to get all users and all bookings (including unmatched)
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date
FROM 
    User
FULL OUTER JOIN 
    Booking ON User.user_id = Booking.user_id;
