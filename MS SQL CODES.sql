

--TABLE INSPECTION

SELECT * FROM Orders O JOIN Details D ON O.Order_ID = D.Order_ID

--PERFORMANCE METRICS

--Total number of States, Cities, Customers, and Orders
SELECT 
	COUNT(DISTINCT State)[Total_Number_of_States], 
	COUNT(DISTINCT City)[Total_Number_of_Cities], 
	COUNT(DISTINCT CustomerName)[Total_Number_of_Customers] ,
	COUNT(DISTINCT Order_ID)[Total_Orders]
FROM Orders


--MONTHLY ANALYSIS

--1.How does total revenue and profit change month over month
--2.Which month recorded the highest and lowest profit?
--3.Is there a seasonal pattern in sales or profit?
SELECT 
	MONTH(Order_Date)[Month_Number],
	DATENAME(MONTH, Order_Date)[Month],
	COUNT(DISTINCT State)[States_Covered],
	COUNT(DISTINCT City)[Cities_Covered],
	COUNT(DISTINCT CustomerName)[Customers_Reached],
	COUNT(*)[Total_Orders],
	SUM(Quantity)[Units_Sold],
	SUM(Amount)[Revenue],
	SUM(Profit)[Profit],
	100 * SUM(Profit)/SUM(Amount)[Profit_Margin]
FROM Orders O JOIN Details D ON O.Order_ID = D.Order_ID
GROUP BY
	MONTH(Order_Date),
	DATENAME(MONTH, Order_Date)
ORDER BY MONTH(Order_Date)

--4.What product categories contributed to the extremely high and low profit margins experienced?
SELECT 
	MONTH(Order_Date)[MonthNum], 
	DATENAME(MONTH, Order_Date)[MonthName], 
	LAST_VALUE(Category) OVER(PARTITION BY Category ORDER BY SUM(Quantity) DESC)[Category],
	SUM(Quantity)[Units_Sold],
	SUM(Amount)/SUM(Quantity)[Price_Per_Unit],
	SUM(Amount)[Revenue],
	SUM(Profit)[Profit],
	100 * SUM(Profit)/SUM(Amount)[Profit_Margin]
FROM Orders O JOIN Details D ON O.Order_ID = D.Order_ID
Group by MONTH(Order_Date), DATENAME(MONTH, Order_Date), Category
ORDER BY Month(Order_Date), sum(Quantity) desc


--REGIONAL ANALYSIS

--5.Which State generates the highest revenue and profit?
--6.Which State has the lowest profit margin despite high sales?
--7.Which state have the highest customer retention rates?
--8.Which States have high sales but low customer retention?
SELECT 
	State,
	COUNT(DISTINCT City)[Number_of_Cities],
	COUNT(DISTINCT CustomerName)[Number of Customers],
	COUNT(*)[Total_Orders],
	COUNT(*)/COUNT(DISTINCT CustomerName)[Average_Purchase_Per_Customer],
	SUM(Amount)[Sales/Revenue],
	SUM(profit)[Profit],
	100 * SUM(Profit)/SUM(Amount)[Profit Margin],
	CASE 
		WHEN SUM(Amount) < 10000 THEN 'Low'
		WHEN SUM(Amount) BETWEEN 10000 AND 20000 THEN 'Medium'
		WHEN SUM(Amount) > 20000 AND SUM(Amount) < 40000 THEN 'High'
		ELSE 'Very High'
	END AS "Class_of_Sales"
FROM Orders O jOIN Details D ON O.order_Id = D.order_id
GROUP BY State
ORDER BY SUM(Amount) DESC


--CATEGORICAL ANALYSIS

--9.Which product category contributes the most to total revenue and profit?
--10.Which category has the highest and lowest profit margins?
--11.Are they categories with high sales but low profitability?
--12.Which categories have the highest customer retention rates?
SELECT Category, 
	COUNT(DISTINCT CustomerName)[Number_of_Customers],
	COUNT(*)[Total_Orders],
	COUNT(*)/COUNT(DISTINCT CustomerName)[Average_Purchase_Per_Customer],
	SUM(Amount)[Revenue], 
	SUM(Profit)[Profit], 
	100 * sum(Profit)/sum(Amount)[Profi_Margin]
FROM Orders O JOIN Details D ON O.Order_Id = D.Order_id 
GROUP BY Category
ORDER BY SUM(Amount) DESC


--PRODUCT PERFORMANCE

--13.What are the top 10 products by revenue and profit?
--14.Which products have high sales volume but low profit margins?
--15.What is the relationship between quantity sold and profit per product?
WITH Product_Performance AS (
	SELECT 
		ROW_NUMBER() OVER(ORDER BY SUM(Amount) DESC)[Row Number],
		Category,
		Sub_Category,
		SUM(Amount)/SUM(Quantity)[Price_Per_Unit],
		SUM(Quantity)[Units_Sold],
		SUM(Amount)[Sales/Revenue],
		SUM(Profit)[Profit],
		100 * SUM(Profit)/SUM(Amount)[Profit Margin]
	FROM Orders O JOIN Details D ON O.order_Id = D.order_id
	GROUP BY Sub_Category, category
	)

SELECT TOP 10 * FROM Product_Performance
ORDER BY [Sales/Revenue] DESC,[Profit Margin] DESC,[Units_Sold] DESC

--How many distinct products are available in the different categories
SELECT 
	Category,
	COUNT(DISTINCT Sub_Category)[Unique_Products]
FROM Details 
GROUP BY Category

--CUSTOMER BEHAVIOUR

--16.What is the average number of purchasess per customer?
SELECT 
	COUNT(DISTINCT Order_ID)/COUNT(DISTINCT CustomerName)[Average_Purchase_Per_Customer]
FROM Orders

--Creating a table that segments the customers into new, returning, and loyal customers.
WITH CustomerType AS (
	SELECT 
	CustomerName,
	COUNT(CustomerName)[Purchases],
	CASE
		WHEN COUNT(CustomerName) = 1 THEN 'New'
		WHEN COUNT(CustomerName) BETWEEN 2 AND 3 THEN 'Returning'
		ELSE 'Loyal'
	END AS "CustomerSegment"
	FROM Orders
	GROUP BY CustomerName
	)
SELECT * INTO Customers FROM CustomerType

SELECT * FROM Customers

--17.How many customers are repeat customers vs one-time buyers?

SELECT 
	CustomerSegment,
	COUNT(*)[Purchases]
FROM Customers
GROUP BY CustomerSegment
ORDER BY COUNT(*) DESC

