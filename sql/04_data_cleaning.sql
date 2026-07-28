-- Null Value Check
SELECT *
FROM products
WHERE product_category_name IS NULL;

-- Duplicate check
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Standardize City Names
UPDATE customers
SET customer_city = INITCAP(customer_city);