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

-- (rest of SQL - same as earlier)
