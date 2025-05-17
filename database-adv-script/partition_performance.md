# Partitioning Performance Report

##Goal
Partition the `Booking` table by `start_date` year to optimize queries.

I have:
- Dropped the old `Booking` table.
- Created a partitioned `Booking` table using RANGE partitioning on `start_date`.
- Created partitions:
    - `Booking_2022`
    - `Booking_2023`
    - `Booking_2024`

## Testing the data
- Inserted test bookings in each partition.
- Queried bookings from 2023

