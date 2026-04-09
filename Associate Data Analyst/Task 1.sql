-- ## Task 1: 
-- Write a query to determine how many products have the year_added value missing. Your output should be a single column, missing_year, with a single row giving the number of missing values.

SELECT COUNT(*) AS missing_year
FROM products
WHERE year_added IS NULL;

## Task 2: 
