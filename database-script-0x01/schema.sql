-- User 
CREATE TABLE User (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property 
CREATE TABLE Property (
    property_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    location VARCHAR(100),
    price_per_night DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    host_id INTEGER REFERENCES User(user_id) ON DELETE SET NULL
);

-- Booking 
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    property_id INTEGER REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES User(user_id) ON DELETE CASCADE
);

-- Payment 
CREATE TABLE Payment (
    payment_id SERIAL PRIMARY KEY,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(30),
    booking_id INTEGER REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- Review 
CREATE TABLE Review (
    review_id SERIAL PRIMARY KEY,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    property_id INTEGER REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES User(user_id) ON DELETE CASCADE
);

-- Message 
CREATE TABLE Message (
    message_id SERIAL PRIMARY KEY,
    message_body TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sender_id INTEGER REFERENCES User(user_id) ON DELETE CASCADE,
    recipient_id INTEGER REFERENCES User(user_id) ON DELETE CASCADE
);
