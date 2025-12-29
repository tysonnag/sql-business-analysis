/* ============================================================
File Name   : basic_queries.sql
Author      : Naga Mallikarjun
Purpose     : Basic SQL queries used for exploratory data analysis
Domain      : Operations / Quick Commerce Analytics

Description :
This file contains foundational SQL queries used to understand
order volumes, site-level distribution, and basic performance
metrics. These queries are typically used as the first step
in business data analysis and dashboard development.
============================================================ */

-- Basic order count per site
SELECT 
    site_code,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY site_code;
