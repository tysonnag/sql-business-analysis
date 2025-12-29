-- Ranking sites by average OTD
SELECT 
    site_code,
    AVG(otd_minutes) AS avg_otd,
    RANK() OVER (ORDER BY AVG(otd_minutes)) AS performance_rank
FROM orders
GROUP BY site_code;
