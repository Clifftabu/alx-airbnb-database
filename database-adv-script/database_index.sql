

-- User Table 
CREATE INDEX idx_user_id ON User(user_id);

-- Booking
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
-- Porperty
CREATE INDEX idx_property_id ON Property(property_id);
-- Review 
CREATE INDEX idx_review_property_id ON Review(property_id);
