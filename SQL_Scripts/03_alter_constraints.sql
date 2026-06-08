-- ==========================================
-- Add UNIQUE Constraints
-- ==========================================

ALTER TABLE Customers
ADD CONSTRAINT uq_customer_email UNIQUE (email);

ALTER TABLE Customers
ADD CONSTRAINT uq_customer_phone UNIQUE (phone);

ALTER TABLE Delivery_Agents
ADD CONSTRAINT uq_agent_phone UNIQUE (phone);

ALTER TABLE Delivery_Agents
ADD CONSTRAINT uq_vehicle_number UNIQUE (vehicle_number);

-- ==========================================
-- Orders
-- ==========================================

ALTER TABLE Orders
MODIFY order_status VARCHAR(30)
NOT NULL DEFAULT 'Pending';

ALTER TABLE Orders
ADD CONSTRAINT chk_order_status
CHECK (
    order_status IN
    ('Pending','Preparing','Out for Delivery','Delivered','Cancelled')
);

-- ==========================================
-- Payments
-- ==========================================

ALTER TABLE Payments
MODIFY payment_status VARCHAR(30)
NOT NULL DEFAULT 'Pending';

ALTER TABLE Payments
ADD CONSTRAINT chk_payment_status
CHECK (
    payment_status IN
    ('Success','Failed','Pending')
);

-- ==========================================
-- Deliveries
-- ==========================================

ALTER TABLE Deliveries
MODIFY delivery_status VARCHAR(30)
NOT NULL DEFAULT 'Assigned';

ALTER TABLE Deliveries
ADD CONSTRAINT chk_delivery_status
CHECK (
    delivery_status IN
    ('Assigned','Picked Up','On Route','Delivered')
);

-- ==========================================
-- Ratings
-- ==========================================

ALTER TABLE Restaurants
ADD CONSTRAINT chk_restaurant_rating
CHECK (rating BETWEEN 0 AND 5);

ALTER TABLE Delivery_Agents
ADD CONSTRAINT chk_agent_rating
CHECK (rating BETWEEN 0 AND 5);

-- ==========================================
-- Quantity
-- ==========================================

ALTER TABLE Order_Items
ADD CONSTRAINT chk_quantity
CHECK (quantity > 0);