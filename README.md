# Sales_Perfomance_Analysis_Project
Sales perfomance project based on transaction dataset, data cleaning using Python, data analysis using SQL, and data visualization using Tableu Public. This project was inpsired by [Github Project](https://github.com/KeithGalli/Pandas-Data-Science-Tasks).

## Dashboard Preview
Here is the final dashboard preview, you can find the full dashboard [here](https://public.tableau.com/views/SalesPerfomanceAnalysis_16364520828390/SalesPerfomanceAnalysis?:language=en-US&:display_count=n&:origin=viz_share_link).
![](Images/FinalDashboard.png)

## Data and Tools
**Dataset** - Transaction data with over 180000 rows and 6 columns. 

**Data Cleaning** - Python using Jupyter Notebook

**Data Analysis** - MySQL using MySQL Workbench

**Data Visualization** - Tableu Public

## Questions for Data Analysis
1. What was the best month for sales? How much was earned that month?
2. What city sold the most product?
3. What time should we display advertisemens to maximize the likelihood of customer’s buying product?
4. What product sold the most? Why do you think it sold the most?

## Data Cleaning and Analysis
### Data Overview
Data consist of 186850 of item transaction-related variables such as Order ID, Product, Quantity Ordered, Price Each, Order Date, and Purchase Address.

***Findings and Solution***
- ada 545 null values ini di drop
- ada header yg kebaca jadi data ini di drop
- tambahin col buat mempermudah analisis
- total purhcase col, quantity * price
- month col, dr order date
- city col, dr address


### Data Analysis using SQL
***What was the best month for sales? How much was earned that month?***
```SQL
SELECT sales_data.Month, COUNT(*) as total_sales, FORMAT(SUM(`Total Purchase`), 'C') as total_earnings
FROM sales_data
GROUP BY sales_data.Month
ORDER BY total_earnings DESC;
```
![](Images/BestMonth.png)

***What city sold the most product?***
```SQL
SELECT City, SUM(`Quantity Ordered`) as total_sales
FROM sales_data
GROUP BY City
ORDER BY total_sales DESC;
```
![](Images/CitySoldMost.png)

***What time should we display advertisemens to maximize the likelihood of customer’s buying product?***
```SQL
SELECT HOUR(`Order Date`) as hour, SUM(`Quantity Ordered`) as total_sales
FROM sales_data
GROUP BY hour
ORDER BY total_sales DESC
LIMIT 5;
```
![](Images/AdsTime.png)

***What product sold the most?***
```SQL
SELECT Product, SUM(`Quantity Ordered`) as total_sold
FROM sales_data
GROUP BY Product
ORDER BY total_sold desc
LIMIT 5;
```
![](Images/ProductSoldMost.png)
