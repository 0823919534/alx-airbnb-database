-- Airbnb Database Schema (PostgreSQL)
CREATE TABLE "User" (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    role VARCHAR(20) DEFAULT 'guest',
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE Property (
    property_id SERIAL PRIMARY KEY,
    host_id INT NOT NULL REFERENCES "User"(user_id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price_per_night NUMERIC(10,2) NOT NULL,
    max_guests INT DEFAULT 1,
    bedrooms INT,
    bathrooms INT,
    listing_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);
-- (Add rest of your SQL tables here, same format)
