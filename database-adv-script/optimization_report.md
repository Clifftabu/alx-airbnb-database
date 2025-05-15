# Optimization Report

## Initial Query which was slower
- Query joined Booking, Property, User, and Payment.
- All joins were using Seq Scan due to missing indexes.
- Execution time was high on large data.

- No indexes on JOIN columns.
- Left join on Payment causes slow scanning on large datasets.
- Booking, Property, and User used Seq Scan.

## What i have done:
- Created indexes:
  - Booking.property_id
  - Booking.user_id
  - Payment.booking_id
- Confirmed foreign ky columns on User and Property are indexed.

## New query
- Booking and oayment table now uses Index Scan.
- Overall query execution time reduced.
- Joins now perform faster because of optimization.

## Conclusion
Proper indexing on columns used in JOIN conditions and WHERE filters dramatically improves performance.
