-- Task 2: Aggregations and Window Functions

-- 1) Total number of bookings per user
SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON b.user_id = u.id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

-- 2) Rank properties by total number of bookings
SELECT
    p.id AS property_id,
    p.title AS property_title,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON b.property_id = p.id
GROUP BY p.id, p.title
ORDER BY booking_rank;
