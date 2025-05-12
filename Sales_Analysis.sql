--Check the data 
Select * from dbo.orders

-- Find Top 10 highest revenue generating products

Select Top 10 product_id, SUM(sales_price) AS Sales 
from dbo.orders 
Group By product_id 
Order By Sales desc;


-- Find Top 5 highest selling product in each region

With Sales_Sum_cte as (Select region, product_id, sum(sales_price) AS Sales
from dbo.orders
Group By region, product_id)
Select * From (
Select *,
	   ROW_NUMBER() Over( Partition By region Order By Sales desc) AS rn
From Sales_Sum_cte) Top5
where rn <=5;



-- Find month over month growth comparison for 2022 and 2023 sales eg: Jan 2022 - Jan 2023

With Aggregate_Sales AS 
(Select year(order_date) AS order_year, month(order_date) As order_Month,
	  sum(sales_price) AS Sales 
From dbo.orders 
Group By year(order_date), month(order_date)
--Order By year(order_date), month(order_date)
) 
Select order_Month, 
	   SUM(Case When order_year=2022 Then Sales Else 0 END) AS sales_2022,
	   SUM(Case When order_year=2023 Then Sales Else 0 END) AS sales_2023
From Aggregate_Sales 
Group By order_Month
Order By order_Month


-- For each category, which month has highest sales

With cte as 
(Select category, sum(sales_price) AS Sales, format(order_date, 'yyyyMM') as order_year_month
From dbo.orders 
Group By category, format(order_date, 'yyyyMM') 
)
Select * From (
Select *,
	   Rank() Over (Partition BY category Order By Sales Desc) rn
From cte) Top1
where rn = 1



-- Which subcategory has highest growth percentage by profit in 2023 as compared to 2022

With Aggregate_Sales AS 
(Select sub_category,year(order_date) AS order_year,
	  sum(sales_price) AS Sales 
From dbo.orders 
Group By sub_category,year(order_date) 
--Order By year(order_date), month(order_date)
), cte AS ( 
Select sub_category, 
	   SUM(Case When order_year=2022 Then Sales Else 0 END) AS sales_2022,
	   SUM(Case When order_year=2023 Then Sales Else 0 END) AS sales_2023
From Aggregate_Sales 
Group By sub_category)
Select Top 1 *,
	   ROUND((((sales_2023-sales_2022)*100) / sales_2022), 2) as growth_percent
From cte
Order BY ROUND((((sales_2023-sales_2022)*100) / sales_2022), 2) DESC;

