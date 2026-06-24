-- Subqueries (Nested Queries)
-- Orders Above Average Value
SELECT * FROM Orders
      WHERE total_amount >
	  (SELECT AVG(total_amount) FROM Orders);
-- Most Expensive Menu Item
SELECT *
FROM Menu_Items
WHERE price =
(
    SELECT MAX(price)
    FROM Menu_Items
);
-- Customer Who Spent The Most
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.total_amount) =
(
    SELECT MAX(total_spent)
    FROM
    (
        SELECT
            SUM(total_amount) AS total_spent
        FROM Orders
        GROUP BY customer_id
    ) AS spending
);
-- Restaurant With Highest Rating
SELECT *
FROM Restaurants
WHERE rating =
(
    SELECT MAX(rating)
    FROM Restaurants
);
-- Delivery Agent With Highest Rating
SELECT *
FROM Delivery_Agents
WHERE rating =
(
    SELECT MAX(rating)
    FROM Delivery_Agents
);

-- IN OPERATOR
-- Customers Who Placed Orders
SELECT *
FROM Customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM Orders
);
-- Customers With No Orders
SELECT *
FROM Customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM Orders
);

-- EXISTS OPERATOR
-- Restaurants That Have Menu Items
SELECT *
FROM Restaurants r
WHERE EXISTS
(
    SELECT *
    FROM Menu_Items m
    WHERE r.restaurant_id = m.restaurant_id
);
-- Restaurants Without Menu Items
SELECT *
FROM Restaurants r
WHERE NOT EXISTS
(
    SELECT *
    FROM Menu_Items m
    WHERE r.restaurant_id = m.restaurant_id
);

-- Correlated Subquery(The inner query depends on the outer query)
SELECT *
FROM Orders o
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM Orders
    WHERE customer_id = o.customer_id
);