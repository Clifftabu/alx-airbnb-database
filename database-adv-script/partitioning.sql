-- Because it already exists, you drop it first and create another partitioned one
DROP TABLE IF EXISTS Booking CASCADE;

-- Creating the partitioned table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    property_id INTEGER REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES User(user_id) ON DELETE CASCADE
) PARTITION BY RANGE (start_date);

-- Creating small partitions by year
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

INSERT INTO Booking (start_date, end_date, total_price, status, property_id, user_id)
VALUES 
('2022-03-15', '2022-03-20', 500.00, 'confirmed', 1, 1),
('2023-07-10', '2023-07-15', 700.00, 'confirmed', 1, 1),
('2024-01-05', '2024-01-10', 800.00, 'pending', 1, 1);

EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
