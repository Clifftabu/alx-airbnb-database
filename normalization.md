Normalization

This document outlines the normalization process applied to the database schema.


## First Normal Form (1NF)

Applied:
- All tables (User, Property, Booking, Payment, Review, Message) have unique primary keys.
- Each field contains atomic values.
- No multivalued or repeating columns exist.



## Second Normal Form (2NF)

Applied:
- All tables use a single-column primary key, so all attributes depend on the full key.
No partial dependencies exist.



## Third Normal Form (3NF)

Applied:
- Each non-key column depends only on the primary key.


---

## Conclusion

All tables in the database are normalized up to 3NF:
- No repeating groups
- No partial dependencies
- No transitive dependencies

