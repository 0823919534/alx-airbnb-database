# Task 0 — ER Diagram requirements

## Overview
Goal: Create an Entity-Relationship diagram for a simplified Airbnb-like system. This document lists entities, attributes, primary keys (PK), foreign keys (FK), and relationships with cardinalities. Use this as the source of truth for the diagram in Draw.io.

## Entities & Attributes

### User
- user_id (PK)
- first_name
- last_name
- email (unique)
- password_hash
- phone_number
- role (guest | host | admin)
- created_at
- updated_at

### Property
- property_id (PK)
- host_id (FK -> User.user_id)
- title
- description
- price_per_night
- max_guests
- bedrooms
- bathrooms
- listing_type (entire_place | private_room | shared_room)
- created_at
- updated_at

### Address
- address_id (PK)
- property_id (FK -> Property.property_id)  // one-to-one with Property
- street
- city
- state_province
- country
- postal_code
- latitude
- longitude

### Booking
- booking_id (PK)
- property_id (FK -> Property.property_id)
- guest_id (FK -> User.user_id)
- start_date
- end_date
- total_price
- status (pending | confirmed | cancelled | completed)
- created_at
- updated_at

### Payment
- payment_id (PK)
- booking_id (FK -> Booking.booking_id)
- amount
- payment_method (card | paypal | bank_transfer)
- currency
- transaction_id (external id)
- status (pending | paid | failed | refunded)
- paid_at

### Review
- review_id (PK)
- booking_id (FK -> Booking.booking_id)  // optional: only after stay
- reviewer_id (FK -> User.user_id)
- rating (1-5)
- comment
- created_at

### Amenity
- amenity_id (PK)
- name
- description

### PropertyAmenity (join table)
- property_id (FK -> Property.property_id)
- amenity_id (FK -> Amenity.amenity_id)
- PRIMARY KEY (property_id, amenity_id)

### Photo
- photo_id (PK)
- property_id (FK -> Property.property_id)
- url
- caption
- uploaded_at

## Relationships (with cardinality)
- User (host) 1 — N Property  
- User (guest) 1 — N Booking  
- Property 1 — N Booking  
- Booking 1 — 0..1 Payment  
- Booking 0..1 — 1 Review  
- Property 1 — 1 Address  
- Property N — N Amenity (via PropertyAmenity)  
- Property 1 — N Photo

## Deliverables
1. `ERD/requirements.md`
2. `ERD/airbnb-erd.drawio` (editable placeholder)
3. `ERD/airbnb-erd.png` (export manually from draw.io)
4. `ERD/sample_schema.sql`
