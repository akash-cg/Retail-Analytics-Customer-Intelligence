-- ADVANCED SQL ANALYTICS

-- Customer Revenue Ranking
SELECT
    customer_unique_id,

    SUM(payment_value) AS total_revenue,

    RANK() OVER(
        ORDER BY SUM(payment_value) DESC
    ) AS revenue_rank

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN payments p
ON o.order_id = p.order_id

GROUP BY customer_unique_id;


-- RFM Analysis
WITH rfm AS (

    SELECT
        c.customer_unique_id,

        MAX(o.order_purchase_timestamp) AS last_purchase,

        COUNT(DISTINCT o.order_id) AS frequency,

        SUM(p.payment_value) AS monetary

    FROM customers c

    JOIN orders o
    ON c.customer_id = o.customer_id

    JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_unique_id
)

SELECT *
FROM rfm;


-- Customer Retention Analysis
WITH monthly_customers AS (

    SELECT
        customer_id,

        DATE_TRUNC('month', order_purchase_timestamp) AS order_month

    FROM orders
)

SELECT
    order_month,

    COUNT(DISTINCT customer_id) AS active_customers

FROM monthly_customers

GROUP BY order_month

ORDER BY order_month;