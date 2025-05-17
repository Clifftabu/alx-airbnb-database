-- BEFORE OPTIMIZATION 
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    p.name AS property_name,
    p.location,
    u.first_name,
    u.last_name,
    u.email,
    pay.amount AS payment_amount,
    pay.payment_method
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
JOIN User u ON b.user_id = u.user_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed'
AND p.location = 'Nairobi';

-- ADD INDEXES to improve performance
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- AFTER OPTIMIZATION (query using same WHERE and AND with indexes now active)
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    p.name AS property_name,
    p.location,
    u.first_name,
    u.last_name,
    u.email,
    pay.amount AS payment_amount,
    pay.payment_method
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
JOIN User u ON b.user_id = u.user_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed'
AND p.location = 'Nairobi';
