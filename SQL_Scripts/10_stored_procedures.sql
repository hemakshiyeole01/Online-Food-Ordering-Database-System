-- Procedures
-- Get Orders of a Customer
DELIMITER $$
CREATE PROCEDURE GetCustomerOrders
(
    IN p_customer_id INT
)
BEGIN
    SELECT * FROM Orders
    WHERE customer_id = p_customer_id;
END $$
DELIMITER ;
CALL GetCustomerOrders(3);

-- Get Restaurant Menu
DELIMITER $$
CREATE PROCEDURE GetRestaurantMenu
(
    IN p_restaurant_id INT
)
BEGIN
    SELECT * FROM Menu_Items
    WHERE restaurant_id = p_restaurant_id;
END $$
DELIMITER ;
CALL GetRestaurantMenu(4);

-- Orders by Status
DELIMITER $$
CREATE PROCEDURE GetOrdersByStatus
(
    IN p_status VARCHAR(30)
)
BEGIN
    SELECT * FROM Orders
    WHERE order_status = p_status;
END $$
DELIMITER ;
CALL GetOrdersByStatus('Delivered');

-- Variables Inside Procedures
-- Total Orders Count
DELIMITER $$
CREATE PROCEDURE TotalOrders()
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Orders;
    SELECT total AS total_orders;
END $$
DELIMITER ;
CALL TotalOrders();

-- IF ELSE Inside Procedures
-- Check High Value Order
DELIMITER $$
CREATE PROCEDURE CheckOrderValue
(
    IN p_order_id INT
)
BEGIN
    DECLARE amount DECIMAL(10,2);
    SELECT total_amount INTO amount 
    FROM Orders WHERE order_id = p_order_id;
    IF amount > 400 THEN
        SELECT 'High Value Order' AS Message;
    ELSE
        SELECT 'Normal Order' AS Message;
    END IF;
END $$
DELIMITER ;
CALL CheckOrderValue(1);

-- OUT Parameters
-- Customer Order Count
DELIMITER $$
CREATE PROCEDURE CustomerOrderCount
(
    IN p_customer_id INT,
    OUT total_orders INT
)
BEGIN
    SELECT COUNT(*) INTO total_orders
    FROM Orders WHERE customer_id = p_customer_id;
END $$
DELIMITER ;
CALL CustomerOrderCount(1,@count);
SELECT @count;

-- GetCustomerSpending
DELIMITER $$
CREATE PROCEDURE GetCustomerSpendingOutP(
    IN p_customer_id INT,
    OUT p_customer_name VARCHAR(100),
    OUT p_total_orders INT,
    OUT p_total_spent DECIMAL(10,2)
)
BEGIN
    SELECT c.customer_name,COUNT(o.order_id),SUM(o.total_amount)
    INTO p_customer_name,p_total_orders,p_total_spent
    FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY c.customer_name;
END $$
DELIMITER ;
CALL GetCustomerSpending(1,@name,@orders,@spent);
SELECT @name,@orders,@spent;

DELIMITER $$
CREATE PROCEDURE GetCustomerSpendingQuery(
    IN p_customer_id INT
)
BEGIN
    SELECT c.customer_name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
    FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY c.customer_name;
END $$
DELIMITER ;
CALL GetCustomerSpending(1);
   
SHOW PROCEDURE STATUS WHERE Db='food_ordering_system';
SHOW CREATE PROCEDURE GetCustomerOrders;
DROP PROCEDURE GetCustomerOrders;