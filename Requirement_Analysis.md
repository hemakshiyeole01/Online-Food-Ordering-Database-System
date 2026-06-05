# Requirement Analysis

## Project Title

Online Food Ordering Database System

## Objective

The objective of this project is to design and implement a relational database system that manages food ordering operations for an online food delivery platform. The system stores and manages customer information, restaurant details, menu items, orders, payments, and delivery tracking while ensuring data consistency, integrity, and efficient retrieval of information.

---

## Entities and Attributes

### Customers

* customer_id
* customer_name
* email
* phone
* address

### Restaurants

* restaurant_id
* restaurant_name
* location
* rating

### Menu_Items

* item_id
* restaurant_id
* item_name
* category
* price

### Orders

* order_id
* customer_id
* order_date
* total_amount
* order_status

### Order_Items

* order_item_id
* order_id
* item_id
* quantity

### Payments

* payment_id
* order_id
* amount
* payment_method
* payment_status
* payment_date

### Delivery_Agents

* agent_id
* agent_name
* phone
* vehicle_number
* rating

### Deliveries

* delivery_id
* order_id
* agent_id
* delivery_status
* assigned_time
* delivered_time

---

## Functional Requirements

### Customer Functions

* Register customer information
* Browse restaurants
* View menu items
* Place orders
* Make payments
* Track order status

### Restaurant Functions

* Add menu items
* Update menu information
* Receive customer orders

### Delivery Agent Functions

* Accept assigned deliveries
* Update delivery status
* Complete deliveries

### Admin Functions

* Manage customer data
* Manage restaurant data
* Monitor orders
* Track payments
* Generate reports
* Analyze revenue and performance

---

## Non-Functional Requirements

* Data accuracy
* Data consistency
* Security of customer information
* Efficient query performance
* Reliable transaction processing
* Scalability for future growth

---

## Business Rules

1. One customer can place many orders.
2. One order belongs to exactly one customer.
3. One restaurant can have many menu items.
4. One menu item belongs to exactly one restaurant.
5. One order can contain many menu items.
6. One menu item can appear in many orders.
7. Order_Items resolves the many-to-many relationship between Orders and Menu_Items.
8. One order has exactly one payment.
9. One payment belongs to exactly one order.
10. One order has one delivery record.
11. One delivery record belongs to one order.
12. One delivery agent can deliver many orders.
13. One delivery record is assigned to one delivery agent.
