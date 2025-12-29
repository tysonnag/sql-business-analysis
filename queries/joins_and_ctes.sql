-- SLA calculation using CTE
WITH sla_data AS (
    SELECT 
        site_code,
        order_id,
        otd_minutes,
        CASE 
            WHEN otd_minutes <= 30 THEN 1 ELSE 0 
        END AS sla_flag
    FROM orders
)
SELECT 
    site_code,
    COUNT(order_id) AS total_orders,
    SUM(sla_flag) * 100.0 / COUNT(order_id) AS sla_percentage
FROM sla_data
GROUP BY site_code;
