-- Monthly Sales View
CREATE VIEW monthly_sales AS

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,

    ROUND(SUM(p.payment_value)::numeric, 2) AS revenue

FROM orders o

JOIN payments p
ON o.order_id = p.order_id

GROUP BY month;


-- Top Customers View
CREATE VIEW top_customers AS

SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value)::numeric, 2) AS total_spent

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id

ORDER BY total_spent DESC
LIMIT 10;