-- ## Task 1: 
-- Write a query to determine how many products have the year_added value missing. Your output should be a single column, 
-- missing_year, with a single row giving the number of missing values.

SELECT COUNT(*) AS missing_year
FROM products
WHERE year_added IS NULL;


-- ## Task 2: 
-- Write a query to ensure the product data matches the description provided. 
-- Do not update the original table.

SELECT product_id,
  COALESCE(product_type,'Unknown') AS product_type,-- replace the Null with the 'Unknown'
  COALESCE(NULLIF(REPLACE(brand,'-',''),''),'Unknown') AS brand, -- replace '-' with '', become NULL if '' otherwise it stays the same
  COALESCE(ROUND(CAST(REGEXP_REPLACE(weight,'[^\d.]', '', 'g') AS DECIMAL(10, 2)), 2), 
    ROUND((SELECT PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY CAST(REGEXP_REPLACE(weight, '[^\d.]', '', 'g') AS DECIMAL(10, 2))) FROM products), 2)) 
    AS weight, -- remove everything that is not a digit or a '.', round to 2 decimal places, replace NULL with median
  COALESCE(TO_CHAR(CAST(price AS DECIMAN (10,2)), '9999999999.99'),
    TO_CHAR(CAST((SELECT PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY price) FROM products) AS DECIMAL(10, 2)), '9999999999.99')
) AS price, -- converting to decimal, replacing NULL with median
  price,
  COALESCE(average_units_sold,'0') AS average_units_sold,
  COALESCE(year_added,'2022') AS year_added,
  COALESCE(UPPER(Stock_location), 'Unknown') AS stock_location
FROM products;
