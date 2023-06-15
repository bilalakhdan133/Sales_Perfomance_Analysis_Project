# 1. What was the best month for sales? How much was earned that month?
# 2. What city sold the most product?
# 3. What time should we display advertisemens to maximize the likelihood of customer’s buying product?
# 4. What product sold the most?

SELECT * 
FROM sales_data;

SELECT COUNT(*) as total_data 
FROM sales_data;

SELECT FORMAT(SUM(`Total Purchase`), 'C') as total_earnings, SUM(`Quantity Ordered`) as total_sales, COUNT(*) as total_order
FROM sales_data;

# 1. What was the best month for sales? How much was earned that month?
SELECT sales_data.Month, COUNT(*) as total_sales, FORMAT(SUM(`Total Purchase`), 'C') as total_earnings
FROM sales_data
GROUP BY sales_data.Month
ORDER BY total_earnings DESC;

# 2. What city sold the most product?
SELECT City, SUM(`Quantity Ordered`) as total_sales
FROM sales_data
GROUP BY City
ORDER BY total_sales DESC;

# 3. What time should we display advertisemens to maximize the likelihood of customer’s buying product?
SELECT HOUR(`Order Date`) as hour, SUM(`Quantity Ordered`) as total_sales
FROM sales_data
GROUP BY hour
ORDER BY total_sales DESC
LIMIT 5;

# 4. What product sold the most?
SELECT Product, SUM(`Quantity Ordered`) as total_sold
FROM sales_data
GROUP BY Product
ORDER BY total_sold desc
LIMIT 5;

