INSERT INTO Customers
(customer_name,email,phone,address)
VALUES
('Hemashi Yeole','hemashi@gmail.com','9876543210','Nagpur'),
('Rahul Sharma','rahul@gmail.com','9876543211','Pune'),
('Priya Patel','priya@gmail.com','9876543212','Mumbai'),
('Amit Verma','amit@gmail.com','9876543213','Delhi'),
('Sneha Joshi','sneha@gmail.com','9876543214','Nagpur');
INSERT INTO Customers
(customer_name,email,phone,address)
VALUES
('Kartik Raut','kagna@gmail.com','9887423210','Bengluru');
SELECT * FROM Customers;

INSERT INTO Restaurants
(restaurant_name,location,rating)
VALUES
('Dominos','Nagpur',4.5),
('McDonalds','Pune',4.3),
('Burger King','Mumbai',4.2),
('Pizza Hut','Delhi',4.4),
('Subway','Nagpur',4.1);
SELECT * FROM Restaurants;

INSERT INTO Delivery_Agents
(agent_name,phone,vehicle_number,rating)
VALUES
('Rohan Patil','9000000001','MH31AB1234',4.7),
('Karan Singh','9000000002','MH12CD5678',4.5),
('Neha Sharma','9000000003','MH01EF9876',4.8),
('Vikas Gupta','9000000004','DL04GH1122',4.6),
('Anjali Deshmukh','9000000005','MH31XY4455',4.9);
SELECT * FROM Delivery_Agents;

INSERT INTO Menu_Items
(restaurant_id,item_name,category,price)
VALUES
(1,'Margherita Pizza','Veg',199.00),
(1,'Farmhouse Pizza','Veg',299.00),
(1,'Garlic Bread','Veg',129.00),

(2,'McAloo Tikki Burger','Veg',79.00),
(2,'McVeggie Burger','Veg',149.00),
(2,'French Fries','Snack',99.00),

(3,'Whopper Burger','Veg',199.00),
(3,'Veg Crunch Burger','Veg',149.00),
(3,'Coke','Beverage',49.00),

(4,'Veggie Supreme Pizza','Veg',349.00),
(4,'Cheese Pizza','Veg',249.00),
(4,'Pepsi','Beverage',59.00),

(5,'Veggie Delight Sub','Veg',179.00),
(5,'Paneer Tikka Sub','Veg',229.00),
(5,'Cold Coffee','Beverage',99.00);
SELECT * FROM Menu_Items;

INSERT INTO Orders
(customer_id,order_date,total_amount,order_status)
VALUES
(1,NOW(),527.00,'Delivered'),
(2,NOW(),248.00,'Delivered'),
(3,NOW(),398.00,'Preparing'),
(4,NOW(),199.00,'Out for Delivery'),
(5,NOW(),478.00,'Pending');
SELECT * FROM Orders;

INSERT INTO Payments
(order_id,amount,payment_method,payment_status,payment_date)
VALUES
(1,527.00,'UPI','Success',NOW()),
(2,248.00,'Card','Success',NOW()),
(3,398.00,'UPI','Pending',NOW()),
(4,199.00,'Cash','Pending',NOW()),
(5,478.00,'UPI','Pending',NOW());
SELECT * FROM Payments;

INSERT INTO Deliveries
(order_id,agent_id,delivery_status,assigned_time,delivered_time)
VALUES
(1,1,'Delivered',NOW(),NOW()),
(2,2,'Delivered',NOW(),NOW()),
(3,3,'Assigned',NOW(),NULL),
(4,4,'On Route',NOW(),NULL),
(5,5,'Assigned',NOW(),NULL);
SELECT * FROM Deliveries;

INSERT INTO Order_Items
(order_id,item_id,quantity)
VALUES
(1,1,1),
(1,2,1),
(1,3,1),
(2,4,1),
(2,6,1),
(3,7,2),
(4,1,1),
(5,10,1),
(5,11,1);
SELECT * FROM Order_Items;

