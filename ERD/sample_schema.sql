-- Sample SQL schema for Task 0 ERD (PostgreSQL dialect)

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

CREATE TABLE Address (
  address_id SERIAL PRIMARY KEY,
  property_id INT UNIQUE REFERENCES Property(property_id),
  street VARCHAR(255),
  city VARCHAR(100),
  state_province VARCHAR(100),
  country VARCHAR(100),
  postal_code VARCHAR(20),
  latitude NUMERIC(9,6),
  longitude NUMERIC(9,6)
);

CREATE TABLE Booking (
  booking_id SERIAL PRIMARY KEY,
  property_id INT REFERENCES Property(property_id),
  guest_id INT REFERENCES "User"(user_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price NUMERIC(12,2),
  status VARCHAR(30) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE Payment (
  payment_id SERIAL PRIMARY KEY,
  booking_id INT UNIQUE REFERENCES Booking(booking_id),
  amount NUMERIC(12,2),
  payment_method VARCHAR(50),
  currency VARCHAR(10),
  transaction_id VARCHAR(255),
  status VARCHAR(30),
  paid_at TIMESTAMP
);

CREATE TABLE Review (
  review_id SERIAL PRIMARY KEY,
  booking_id INT REFERENCES Booking(booking_id),
  reviewer_id INT REFERENCES "User"(user_id),
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE Amenity (
  amenity_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

CREATE TABLE PropertyAmenity (
  property_id INT REFERENCES Property(property_id),
  amenity_id INT REFERENCES Amenity(amenity_id),
  PRIMARY KEY (property_id, amenity_id)
);

CREATE TABLE Photo (
  photo_id SERIAL PRIMARY KEY,
  property_id INT REFERENCES Property(property_id),
  url TEXT NOT NULL,
  caption TEXT,
  uploaded_at TIMESTAMP DEFAULT now()
);
