-- 1) INNER JOIN: all bookings with users
SELECT b.id AS booking_id, b.user_id, u.id AS user_id, u.name AS user_name
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- 2) LEFT JOIN: all properties with reviews (including properties with no reviews)
SELECT p.id AS property_id, p.title AS property_title, r.id AS review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON r.property_id = p.id;

-- 3) FULL OUTER JOIN: all users and all bookings
-- Some DBs (like MySQL) don't support FULL OUTER JOIN, so use UNION workaround
SELECT u.id AS user_id, u.name AS user_name, b.id AS booking_id, b.property_id, b.start_date, b.end_date
FROM users u
LEFT JOIN bookings b ON b.user_id = u.id
UNION
SELECT u.id AS user_id, u.name AS user_name, b.id AS booking_id, b.property_id, b.start_date, b.end_date
FROM users u
RIGHT JOIN bookings b ON b.user_id = u.id;
