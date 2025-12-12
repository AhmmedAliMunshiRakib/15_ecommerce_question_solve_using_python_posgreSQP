
 /*15. Identify the top 3 customers who spent the most money in each year.*/

SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
    o.customer_id,
    SUM(pmt.payment_value) AS payments,
    DENSE_RANK() OVER(PARTITION BY EXTRACT(YEAR FROM o.order_date) ORDER BY SUM(pmt.payment_value) DESC) AS rank
FROM orders o
LEFT JOIN payments pmt ON o.order_id = pmt.order_id
GROUP BY EXTRACT(YEAR FROM o.order_date), o.customer_id
HAVING SUM(pmt.payment_value) >= 1



