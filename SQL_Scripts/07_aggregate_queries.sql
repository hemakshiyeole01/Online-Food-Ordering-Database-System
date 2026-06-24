-- Aggregate Functions
-- Total Customers
SELECT COUNT(*) AS total_customers FROM Customers;
-- Total Orders
SELECT COUNT(*) AS total_orders FROM Orders;
-- Total Revenue
SELECT SUM(total_amount) AS total_revenue FROM Orders;
-- Average Order Value
SELECT AVG(total_amount) AS average_order_value FROM Orders;
-- Highest Order Amount
SELECT MAX(total_amount) AS highest_order FROM Orders;
-- Lowest Order Amount
SELECT MIN(total_amount) AS lowest_order FROM Orders;

-- GROUP BY
-- Orders Per Customer
SELECT 
       customer_id, COUNT(order_id) AS total_orders
       FROM Orders
       GROUP BY customer_id;
-- using joins
SELECT
    c.customer_name, COUNT(o.order_id) AS total_orders
    FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
	GROUP BY c.customer_name;
-- Revenue Per Customer
SELECT 
	c.customer_name , SUM(o.total_amount) AS total_spent
    FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name;
-- Orders By Status    
SELECT
    order_status, COUNT(order_id) AS total_orders
    FROM Orders
    GROUP BY order_status;
-- Revenue By Payment Method
SELECT
    payment_method, SUM(amount) AS revenue
    FROM Payments
    GROUP BY payment_method;
-- Menu Items Count Per Restaurant
SELECT
    r.restaurant_name, COUNT(m.item_id) AS total_items
    FROM Restaurants r JOIN Menu_Items m ON r.restaurant_id = m.restaurant_id
    GROUP BY r.restaurant_name;    
    
-- where clause
SELECT * FROM Orders WHERE total_amount > 300;
-- having clause(Customers Who Spent More Than ₹300)
SELECT
    c.customer_name, SUM(o.total_amount) AS total_spent
    FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
    HAVING SUM(o.total_amount) > 300;
    
-- JOIN + GROUP BY + ORDER BY (Most Ordered Menu Item)
SELECT
    m.item_name, SUM(oi.quantity) AS total_ordered
    FROM Menu_Items m JOIN Order_Items oi ON m.item_id = oi.item_id
    GROUP BY m.item_name
    ORDER BY total_ordered DESC;

-- Restaurant Performance Report
SELECT
    r.restaurant_name, SUM(m.price * oi.quantity) AS total_revenue
    FROM Restaurants r JOIN Menu_Items m ON r.restaurant_id = m.restaurant_id
    JOIN Order_Items oi ON m.item_id = oi.item_id
    GROUP BY r.restaurant_name
    ORDER BY total_revenue DESC;