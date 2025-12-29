-- Basic order count per site
SELECT 
    site_code,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY site_code;
