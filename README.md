## Sales_Analysis_ETL_Visualization

# Project Summary

Project Overview:
This project demonstrates the complete ETL (Extract, Transform, Load) process, starting from data extraction via Kaggle API to advanced visual analytics in Power BI. The project emphasizes data transformation, SQL-based analysis, and interactive dashboard design.
Technologies Used:
•	Data Extraction: Kaggle API
•	Data Transformation: Python (pandas, zipfile, sqlalchemy)
•	Database: SQL Server
•	Visualization: Power BI (with DAX for calculations)

________________________________________


Project Phases:

1. Data Extraction & Transformation
•	Extracted data from Kaggle using the Kaggle API.
•	Transformed the dataset in Jupyter Labs:
o	Renamed columns to lowercase and replaced spaces with underscores.
o	Derived new columns: discount, sales_price, and profit.
o	Converted order_date to datetime format.
o	Dropped unnecessary columns for optimization.
o	Saved the transformed dataset as a CSV file.

2. Data Loading
•	Created a new database named Sales in SQL Server (not under the master database).
•	Loaded the transformed CSV data into SQL Server.

3. Data Analysis in SQL Server
•	Performed SQL queries for:
o	Top 10 highest revenue-generating products.
o	Top 5 highest-selling products in each region.
o	Month-over-month growth comparison for 2022 and 2023.
o	Highest sales month for each category.
o	Subcategory with the highest profit growth in 2023 compared to 2022.

4. Visualization in Power BI
•	Imported the SQL data into Power BI using Import Mode.
•	Developed interactive dashboards across four main pages:
o	Home Page: KPI metrics and sales trends.
o	Sales Analysis: Category, region, segment, and shipping mode analysis.
o	Orders Analysis: Order distribution across segments, regions, and top-selling products.
o	Profit Analysis: Profit distribution by category, region, segment, and shipping mode.
•	Utilized DAX for custom calculations.
•	Designed with slicers and filters for better insights.

________________________________________


Key Highlights:
•	Complete ETL lifecycle demonstrated.
•	Advanced SQL analysis with business insights.
•	Interactive Power BI dashboard with DAX measures.
Well-structured analysis for decision-making support.








## Project Structure

