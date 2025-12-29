/* ============================================================
File Name   : window_functions.sql
Author      : Naga Mallikarjun
Purpose     : Analytical queries using SQL Window Functions
Domain      : Operational Performance Ranking & Trend Analysis

Description :
This file contains SQL queries that use window functions such
as RANK(), ROW_NUMBER(), and AVG() OVER() to analyze and rank
site performance without collapsing result sets. These queries
are useful for comparative analysis and business decision-making.
============================================================ */
-- Ranking sites by average OTD
SELECT 
    site_code,
    AVG(otd_minutes) AS avg_otd,
    RANK() OVER (ORDER BY AVG(otd_minutes)) AS performance_rank
FROM orders
GROUP BY site_code;
