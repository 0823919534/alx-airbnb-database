-- Task 1: Practice Subqueries

-- 1) Non-correlated subquery: find properties with avg rating > 4.0
SELECT p.id AS property_id, p.title AS property_title
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- 2) Correlated subquery: find users with more than 3 bookings
SELECT u.id AS user_id, u.name AS user_name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
