USE cafe_db;

SELECT order_id, table_number, customer_name, order_status,
       total_amount, payment_method, payment_status, created_at
FROM orders ORDER BY order_id DESC;

SELECT * FROM order_items ORDER BY order_item_id DESC;

select * from cafe_tables;
SELECT * FROM orders ORDER BY order_id DESC;

select * from order_items;

select * from menu_items;

USE cafe_db;
SELECT * FROM order_items;
SELECT * FROM bills;

-- bills <-> orders <-> dishes joined through both junction tables
SELECT b.bill_number, o.order_id, oi.item_name, oi.quantity
FROM bills b
JOIN bill_orders bo ON bo.bill_id = b.bill_id
JOIN orders o       ON o.order_id = bo.order_id
JOIN order_items oi ON oi.order_id = o.order_id;