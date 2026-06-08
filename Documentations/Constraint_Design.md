# Constraint Design

## Introduction

Constraints are rules enforced by the database management system to ensure the accuracy, consistency, and integrity of data. The Online Food Ordering Database System uses multiple types of constraints.

---

## Primary Key Constraints

Purpose:

* Uniquely identify each record.
* Prevent duplicate entries.
* Cannot contain NULL values.

Examples:

Customers(customer_id)

Restaurants(restaurant_id)

Menu_Items(item_id)

Orders(order_id)

Order_Items(order_item_id)

Payments(payment_id)

Delivery_Agents(agent_id)

Deliveries(delivery_id)

---

## Foreign Key Constraints

Purpose:

* Maintain relationships between tables.
* Enforce referential integrity.

Relationships:

Orders.customer_id → Customers.customer_id

Menu_Items.restaurant_id → Restaurants.restaurant_id

Order_Items.order_id → Orders.order_id

Order_Items.item_id → Menu_Items.item_id

Payments.order_id → Orders.order_id

Deliveries.order_id → Orders.order_id

Deliveries.agent_id → Delivery_Agents.agent_id

---

## NOT NULL Constraints

Purpose:

* Ensure mandatory information is always provided.

Examples:

customer_name

email

phone

restaurant_name

item_name

price

order_date

total_amount

payment_method

delivery_status

---

## UNIQUE Constraints

Purpose:

* Prevent duplicate values.

Applied To:

Customers.email

Customers.phone

Delivery_Agents.phone

Delivery_Agents.vehicle_number

Payments.order_id

Deliveries.order_id

Business Rules Enforced:

* One customer account per email.
* One customer phone number per account.
* One delivery agent per vehicle.
* One order can have only one payment.
* One order can have only one delivery record.

---

## CHECK Constraints

Purpose:

* Restrict invalid values.

Examples:

Restaurant Rating:

rating BETWEEN 0 AND 5

Delivery Agent Rating:

rating BETWEEN 0 AND 5

Order Quantity:

quantity > 0

Payment Status:

Success, Failed, Pending

Order Status:

Pending, Preparing, Out for Delivery, Delivered, Cancelled

Delivery Status:

Assigned, Picked Up, On Route, Delivered

---

## DEFAULT Constraints

Purpose:

* Automatically assign values when no value is provided.

Examples:

Orders.order_status = 'Pending'

Payments.payment_status = 'Pending'

Deliveries.delivery_status = 'Assigned'

---

## Referential Integrity

Referential Integrity ensures that relationships between tables remain valid. A child table cannot reference a non-existing record in a parent table.

Example:

An order cannot be inserted with a customer_id that does not exist in the Customers table.

This prevents orphan records and keeps the database consistent.

---

## Parent and Child Tables

Customers → Orders

Restaurants → Menu_Items

Orders → Payments

Orders → Deliveries

Orders → Order_Items

Menu_Items → Order_Items

Delivery_Agents → Deliveries

---

## Conclusion

The combination of PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, and DEFAULT constraints ensures that the Online Food Ordering Database System maintains high data quality, consistency, and integrity.
