-- BUSINESS KPI ANALYSIS

-- Monthly Revenue
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(p.payment_value)::numeric, 2) AS revenue

FROM orders o

JOIN payments p
ON o.order_id = p.order_id

GROUP BY month
ORDER BY month;


-- Top 10 Customers
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


-- Top Product Categories
SELECT
    ct.product_category_name_english,
    COUNT(*) AS total_orders

FROM order_items oi

JOIN products pr
ON oi.product_id = pr.product_id

JOIN category_translation ct
ON pr.product_category_name = ct.product_category_name

GROUP BY ct.product_category_name_english

ORDER BY total_orders DESC
LIMIT 10;


-- State-wise Sales
SELECT
    c.customer_state,
    ROUND(SUM(p.payment_value)::numeric, 2) AS revenue

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_state

ORDER BY revenue DESC;