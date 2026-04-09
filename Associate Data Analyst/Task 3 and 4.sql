-- Task 3: 
-- Write a query to return the product_type, min_price and max_price columns.

SELECT product_type, 
  MIN(price) AS min_price,
  MAX(price) AS max_price
FROM products
GROUP BY product_type;

-- Task 4:
-- Write a query to return the product_id, price, and average_units_sold of the rows of 
-- interest to the team (average units sold is greater than 10).

SELECT product_id, price, average_units_sold
FROM products
WHERE product_type IN ('Meat', 'Dairy')
  AND average_units_sold >10; 

