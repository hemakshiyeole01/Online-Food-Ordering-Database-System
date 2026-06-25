-- Views 
-- Customer Order Summary
CREATE VIEW Customer_Order_Summary AS
SELECT c.customer_name, o.order_id, o.total_amount, o.order_status
FROM Customers c JOIN Orders o ON c.customer_id=o.customer_id;
SELECT * FROM Customer_Order_Summary;

-- Restaurant Menu View
CREATE VIEW Restaurant_Menu AS
SELECT r.restaurant_name,m.item_name,m.category,m.price
FROM Restaurants r JOIN Menu_Items m ON r.restaurant_id=m.restaurant_id;
SELECT * FROM Restaurant_Menu;

-- Payment Summary
CREATE VIEW Payment_Summary AS
SELECT o.order_id,p.amount,p.payment_method,p.payment_status
FROM Orders o JOIN Payments p ON o.order_id=p.order_id;
SELECT * FROM Payment_Summary;

-- Delivery Summary
CREATE VIEW Delivery_Summary AS
SELECT o.order_id,da.agent_name,d.delivery_status,d.assigned_time
FROM Deliveries d JOIN Orders o ON d.order_id=o.order_id 
JOIN Delivery_Agents da ON d.agent_id=da.agent_id;
SELECT * FROM Delivery_Summary;

-- Complete Order Details
CREATE VIEW Complete_Order_Details AS
SELECT c.customer_name,o.order_id,m.item_name,oi.quantity,m.price,o.total_amount,o.order_status
FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
JOIN Order_Items oi ON o.order_id=oi.order_id
JOIN Menu_Items m ON oi.item_id=m.item_id;
SELECT * FROM Complete_Order_Details;

-- Top Customers
CREATE VIEW Top_Customers AS 
SELECT c.customer_name, COUNT(o.order_id), SUM(o.total_amount)
FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name 
ORDER BY (SUM(o.total_amount)) DESC;
SELECT * FROM Top_Customers;

-- OPerations on VIEWS
SHOW FULL TABLES WHERE TABLE_TYPE='VIEW';
DESCRIBE Customer_Order_Summary;
UPDATE Customer_Order_Summary SET order_status='Delivered' WHERE order_id=3;
DROP VIEW Customer_Order_Summary;