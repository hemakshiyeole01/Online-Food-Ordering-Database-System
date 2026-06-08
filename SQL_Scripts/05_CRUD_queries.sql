-- Show all delivered orders.
SELECT * FROM Orders WHERE order_status='Delivered';
-- Show orders above ₹300.
SELECT * FROM Orders WHERE total_amount > 300;
-- Show orders sorted by amount descending.
SELECT * FROM Orders ORDER BY total_amount DESC ;
-- Update Order 3 status from Preparing to Out for Delivery
UPDATE Orders SET order_status = 'Out for Delivery' WHERE order_id = 3;
-- Deleting Customer 1 :SHOWS FOREIGN KEY CONSTRAINT
DELETE FROM Customers WHERE customer_id = 1;
