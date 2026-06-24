SHOW TABLES;
-- customers,deliveries,delivery_agents,menu_items,order_items,orders,payments,restaurants --

-- INNER JOIN (Returns only matching rows.)
-- Which customer placed which order?
SELECT
    o.order_id,
    c.customer_name,
    o.total_amount,
    o.order_status
FROM Orders o
INNER JOIN Customers c
ON o.customer_id = c.customer_id;
-- Which menu item belongs to which restaurant?
SELECT
    r.restaurant_name,
    m.item_name,
    m.category,
    m.price
FROM Restaurants r
INNER JOIN Menu_Items m
ON r.restaurant_id = m.restaurant_id;
-- Which order was paid using which method?
SELECT
    o.order_id,
    p.payment_method,
    p.payment_status,
    p.amount
FROM Orders o
INNER JOIN Payments p
ON o.order_id = p.order_id;
-- Which delivery agent handled which order?
SELECT
    d.delivery_id,
    d.order_id,
    da.agent_name,
    d.delivery_status
FROM Deliveries d
INNER JOIN Delivery_Agents da
ON d.agent_id = da.agent_id;
-- Complete Order Details(customer, order, ordered item, quantity and price)
SELECT
    c.customer_name,
    o.order_id,
    m.item_name,
    oi.quantity,
    m.price
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
ON o.order_id = oi.order_id
INNER JOIN Menu_Items m
ON oi.item_id = m.item_id;
-- Complete Delivery Report
SELECT
    c.customer_name,
    o.order_id,
    p.amount,
    p.payment_status,
    d.delivery_status,
    da.agent_name
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Payments p
ON o.order_id = p.order_id
INNER JOIN Deliveries d
ON o.order_id = d.order_id
INNER JOIN Delivery_Agents da
ON d.agent_id = da.agent_id;

-- LEFT JOIN (Returns all rows from the left table)
SELECT
    c.customer_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id; -- shows customer without order also