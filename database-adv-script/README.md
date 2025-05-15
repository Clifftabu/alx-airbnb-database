# Joins Queries
# Task 0:File joins_queries.sql

This file (`joins_queries.sql`) has 3 SQL queries that show how to use JOINs in SQL using the Airbnb database schema.

Queries Included:

1. INNER JOIN
   Retrieves all bookings and the respective users who made those bookings.  
   - Tables used: Booking, User

2. LEFT JOIN 
   Retrieves all properties and their reviews including those with  no reviews.  
   - Tables used: Property, Review

3. FULL OUTER JOIN
   Retrieves all users and all bookings. Includes users who have no bookings and bookings that have no linked users.  
   - Tables used: User, Booking

# Task 1: File subqueries.sql

The file subqueries.sql includes 2 queries which helps in:
1. Finding all properties with an average rating graater than 4.0

2. Finding all users who made more than 3 bookings

#Task 2: File aggregations_and_window_functions
- Used count and group by to find bookings per user.

- Used RANK window function to rank properties based on total bookings.
