-- Import Customers
COPY customers
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Import Geolocation
COPY geolocation
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Import Products
COPY products
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Import Category Translation
COPY category_translation
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/product_category_name_translation.csv'
DELIMITER ','
CSV HEADER;

-- Import Sellers
COPY sellers
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Import Orders
COPY orders
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Import Order Items
COPY order_items
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Import Payments
COPY payments
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Import Reviews
COPY reviews
FROM 'C:/SQLProjects/Retail-Analytics-SQL-Project/datasets/olist_order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;


-- Verifying Data Imports
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM payments;