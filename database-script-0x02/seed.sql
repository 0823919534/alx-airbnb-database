-- Sample data for Airbnb database

-- Users
INSERT INTO "User" (first_name, last_name, email, password_hash, phone_number, role) VALUES
('Alice', 'Mokgadi', 'alice@example.com', 'hashedpassword1', '+27710000001', 'guest'),
('Beverley', 'Mokgadi', 'beverley@example.com', 'hashedpassword2', '+27710000002', 'host');

-- Properties
INSERT INTO Property (host_id, title, description, price_per_night, max_guests, bedrooms, bathrooms, listing_type) VALUES
(2, 'Cozy Apartment', 'A lovely apartment in the city center', 500.00, 4, 2, 1, 'entire place'),
(2, 'Townhouse', 'Spacious townhouse with garden', 750.00, 6, 3, 2, 'entire place');

-- Bookings
INSERT INTO Booking (property_id, guest_id, start_date, end_date, total_price, status) VALUES
(1, 1, '2025-11-01', '2025-11-05', 2000.00, 'confirmed'),
(2, 1, '2025-12-10', '2025-12-15', 3750.00, 'pending');

-- Payments
INSERT INTO Payment (booking_id, amount, payment_method, currency, transaction_id, status, paid_at) VALUES
(1, 2000.00, 'card', 'ZAR', 'TXN001', 'completed', '2025-10-28 10:00:00'),
(2, 3750.00, 'paypal', 'ZAR', 'TXN002', 'pending', NULL);

-- Reviews
INSERT INTO Review (booking_id, reviewer_id, rating, comment) VALUES
(1, 1, 5, 'Amazing stay!');

-- Amenities
INSERT INTO Amenity (name, description) VALUES
('WiFi', 'High speed internet'),
('Air Conditioning', 'Cool and comfortable');

-- PropertyAmenities
INSERT INTO PropertyAmenity (property_id, amenity_id) VALUES
(1, 1),
(1, 2),
(2, 1);

-- Photos
INSERT INTO Photo (property_id, url, caption) VALUES
(1, 'https://example.com/photo1.jpg', 'Living room'),
(2, 'https://example.com/photo2.jpg', 'Garden view');
