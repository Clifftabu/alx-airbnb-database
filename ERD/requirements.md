
This document explains the entities and relationships in the Airbnb system based on the ER diagram.

---

User:
- user_id (Primary Key)
- first_name
- last_name
- email
- password_hash
- phone_number
- role
- created_at

Relationships:
- One user can book many properties (1-to-many with Booking)
- One user can write many reviews (1-to-many with Review)
- One user can send and receive messages (1-to-many with Message)
- One user can host many properties (1-to-many with Property through host_id)

---

Property:
- property_id (Primary Key)
- host_id (Foreign Key → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

Relationships:
- One property can be booked many times (1-to-many with Booking)
- One property can have many reviews (1-to-many with Review)

---

Booking:
- booking_id (Primary Key)
- user_id (Foreign Key → User.user_id)
- property_id (Foreign Key → Property.property_id)
- start_date
- end_date
- total_price
- status
- created_at

Relationships:
- Each booking is made by one user and belongs to one property
- Each booking has one payment (1-to-1 with Payment)

---

Payment:
- payment_id (Primary Key)
- booking_id (Foreign Key → Booking.booking_id)
- amount
- payment_date
- payment_method

Relationships:
- Each payment is linked to one booking

---

Review:
- review_id (Primary Key)
- user_id (Foreign Key → User.user_id)
- property_id (Foreign Key → Property.property_id)
- rating
- comment
- created_at

Relationships:
- Each review is written by one user for one property

---

Message:
- message_id (Primary Key)
- sender_id (Foreign Key → User.user_id)
- recipient_id (Foreign Key → User.user_id)
- message_body
- sent_at

Relationships:
- Messages are between users (user to user, recursive relationship)

---

Summary of Relationships:
- User to Booking: 1-to-many
- User to Property (as Host): 1-to-many
- User to Review: 1-to-many
- User to Message: 1-to-many (sender and receiver)
- Property to Booking: 1-to-many
- Property to Review: 1-to-many
- Booking to Payment: 1-to-1

Diagram created using draw.io and saved in the ERD directory where this same file is saved.
