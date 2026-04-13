# E-Commerce

### Project Overview

The report focuses on analysis of sales performance across time periods, locations, product categories, and customers behaviour. In order to find patterns, identify business opportunities, determine profitability of products and study customer behaviour.

### Tools and Skills Used:
- SQL (CTEs, Joins, Aggregate Functions, Select Cases, Window Functions)
- Power BI (DAX, PQE, Dashboarding)

### Data Source
  Online Sales Data downloaded from Kaggle 
  - [Download here](https://www.kaggle.com/datasets/samruddhi4040/online-sales-data)

#### Tables:
  Orders, Details. 

#### Time Period: 
  January 2018 - December 2018

#### Key Columns: 

- Order_Date
- Amount
- Profit
- State
- Category
- Sub_Category
- CustomerName

 ### Data Analysis in SQL 

 1. Base Data Selection
```SELECT * FROM Orders O JOIN Details D ON O.Order_ID = D.Order_ID```
2. Querying performance metrics
3. Analysis based on months, regions, categories, products, and customer behaviour.
4. Creating customers’ table.
   
### Data Visualization
1. Importing tables from SQL
2. Creating measures using DAX functions to represent KPIs
3. Visualization of KPIs and graphical representation of trends and performance.
4. Dashboarding


