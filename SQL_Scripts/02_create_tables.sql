SELECT DATABASE();
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL
);
CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(150) NOT NULL,
    location VARCHAR(255) NOT NULL,
    rating DECIMAL(2,1)
);
CREATE TABLE Delivery_Agents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_name VARCHAR(120) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    vehicle_number VARCHAR(30) NOT NULL,
    rating DECIMAL(2,1)
);
CREATE TABLE Menu_Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(150) NOT NULL,
    category VARCHAR(80),
    price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_status VARCHAR(30) NOT NULL,

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    payment_date DATETIME,

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);
CREATE TABLE Deliveries (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE,
    agent_id INT NOT NULL,
    delivery_status VARCHAR(30) NOT NULL,
    assigned_time DATETIME NOT NULL,
    delivered_time DATETIME,

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (agent_id)
    REFERENCES Delivery_Agents(agent_id)
);
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (item_id)
    REFERENCES Menu_Items(item_id)
);
SHOW TABLES;
