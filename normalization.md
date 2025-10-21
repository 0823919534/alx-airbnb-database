# Task 1 — Database Normalization to 3NF

## Objective
Ensure the Airbnb database schema is in Third Normal Form (3NF) by removing redundancies and ensuring proper dependencies.

## Step 1: First Normal Form (1NF)
- All tables have atomic values (no arrays or repeated groups).
- Primary keys uniquely identify each row.

## Step 2: Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the primary key.
- No partial dependencies exist. Example: In Property, all columns depend on property_id.

## Step 3: Third Normal Form (3NF)
- No transitive dependencies exist. Example: In Booking, 	otal_price depends only on the booking, not on property or user.
- All tables comply with 3NF.

## Conclusion
The database design is already normalized up to 3NF.  
No changes to table structures are necessary. All FKs are correctly defined, and all attributes are dependent on their respective primary keys.
