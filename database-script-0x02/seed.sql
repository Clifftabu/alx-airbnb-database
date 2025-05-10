--Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('u1', 'John', 'Johnson', 'johnjohnson@gmail.com', 'hash1', '07647873344', 'guest'),
('u2', 'Clifford', 'Tabu', 'clifftabu@gmail.com', 'hash2', '0766874736', 'admin'),
('u3', 'Marion', 'Mwangi', 'mmwangi@gmail.com', 'hash3', '0799445664', 'host'),
('u4', 'Andela', 'Githui', 'agithui@gmail.com', 'hash4', NULL, 'admin');

--Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
('p1', 'u2', 'Seaside Villa', 'A beautiful villa by the beach.', 'Mombasa', 12000.00),
('p2', 'u2', 'Urban Guest House', 'Modern guestmhouse in the city center.', 'Nairobi', 5000.00);

--Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('b1', 'p1', 'u1', '2025-06-01', '2025-06-06', 60000.00, 'confirmed'),
('b2', 'p2', 'u1', '2025-07-10', '2025-07-12', 10000.00, 'pending');

--Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
('pay1', 'b1', 60000.00, 'credit_card'),
('pay2', 'b2', 10000.00, 'paypal');

--Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
('r1', 'p1', 'u1', 5, 'Absolutely loved the place!'),
('r2', 'p2', 'u1', 4, 'Great experience, just a bit noisy around.');


--Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
('m1', 'u1', 'u2', 'Hi, is the place available for the weekend?'),
('m2', 'u2', 'u1', 'Yes, it is! Let me know your check-in time.');
