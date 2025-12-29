/* ============================================================
File Name   : joins_and_ctes.sql
Author      : Naga Mallikarjun
Purpose     : Advanced SQL using JOINs and Common Table Expressions (CTEs)
Domain      : Business Performance & SLA Analysis

Description :
This file demonstrates the use of JOINs and CTEs to combine
multiple datasets and calculate business KPIs such as SLA
percentage, site-wise performance, and delivery efficiency.
CTEs are used to improve query readability and maintainability.
============================================================ */
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
