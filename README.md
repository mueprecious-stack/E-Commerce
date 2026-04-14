# E-Commerce Performance

### Project Overview
---
The report focuses on analysis of sales performance across time periods, locations, product categories, and customers behaviour. In order to find patterns, identify business opportunities, determine profitability of products and study customer behaviour.
## Table of Contents
---
- [Tools and Skills](#tools-and-skills)
- [Data Source](#data-source)
- [Tables](#tables)
- [Time Period](#time-period)
- [Key Columns](#key-columns)
- [Data Analysis](#data-analysis)
- [Data Visualization](#data-visualization)
- [Dashboard Overview](#dashboard-overview)
- [Business Insights](#business-insights)
- [Recommendations](#recommendations)
- [Conclusion](#conclusion)

### Tools and Skills Used:
- SQL (CTEs, Joins, Aggregate Functions, Select Cases, Window Functions)
- Power BI (DAX, Data Visualization, Dashboarding)

### Data Source
  Clean "Online Sales Data" downloaded from Kaggle 
  - [Download here](https://www.kaggle.com/datasets/samruddhi4040/online-sales-data)

#### Tables:
- Orders
- Details. 

#### Time Period: 
- January 2018 - December 2018

#### Key Columns: 
- Order_Date
- Amount
- Profit
- State
- Category
- Sub_Category
- CustomerName

 ### Data Analysis
---
 1. Base Data Selection
```SELECT * FROM Orders O JOIN Details D ON O.Order_ID = D.Order_ID```
2. Querying performance metrics
3. Analysis based on months, regions, categories, products, and customer behaviour to draw insights.
4. Creating customers’ table.
   
### Data Visualization
---
1. Importing tables from SQL
2. Creating measures using DAX functions to represent KPIs
3. Visualization of KPIs and graphical representation of trends and performance.
4. Dashboarding

### Dashboard Overview
This dashboard summarizes monthly sales, profit margins, regional, category, and product performance, as well as customer segmentation and purchase behavior, with slicers for detailed analysis. It also includes key annual KPIs.

<img width="900" height="508" alt="E-Commerce Dashboard" src="https://github.com/user-attachments/assets/e4480322-7272-460f-a478-fca2136a7fbe" />

Click [here](https://app.powerbi.com/view?r=eyJrIjoiNjZlY2RhYjQtMTA3Ny00NDE0LTlmYjctYWNmNjRhNjA3Mzg2IiwidCI6IjExOTQ1YTJlLTlkNWUtNDBmOC04OTVlLTlhY2I4YWEwZjBhNiJ9) to acess interactive dashboard
### Business Insights
---
1. Sales peaked in January and declined in July according to unstable unit prices across product categories. February recorded the highest profit margin, while July saw the largest loss.
2.All the categories incurred losses in May and July, suggesting that the promotional discount strategy undermined profitability.
3. A high customer retention rate does not necessarily translate to strong profits. Among categories, Furniture has the lowest retention rate.
4. Electronics emerged as the most profitable category when sold at full price, whereas clothing demonstrated lower risk even with discounting
5. The average order per customer is one, indicating that one-time buyers outnumber returning customers.
6. High sales can mask poor performance, as some top-selling products generate negative profit margins.

### Recommendations
---
1. Increase product availability in the Electronics and Furniture categories to boost sales and improve customer retention.
2. Review the pricing strategy for products such as sarees, tables, and furnishings.
3. Reduce discount levels across all products, particularly in the Electronics category.
4. Enhance marketing strategies for the Furniture category.
5. Strengthen customer service initiatives to drive higher customer retention

### Conclusion
---
The overall insights from the dataset reveal weak performance, as reflected in the 8.44% annual profit margin, despite efforts to boost sales through promotional discount strategies across products. However, both sales and profitability can improve over time and across regions if the recommended actions are implemented.




