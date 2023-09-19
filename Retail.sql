---Understanding the data
SELECT *
FROM [dbo].[SampleSuperstore]

SELECT DISTINCT Ship_Mode
FROM [dbo].[SampleSuperstore]

SELECT DISTINCT Segment
FROM [dbo].[SampleSuperstore]

SELECT DISTINCT Region
FROM [dbo].[SampleSuperstore]

SELECT DISTINCT Category
FROM [dbo].[SampleSuperstore]

SELECT DISTINCT Sub_Category
FROM [dbo].[SampleSuperstore]

/*There are no nulls present in the data so it could be said to be a clean data.
The data is a retail dataset consisting of 4 type of shipping mode divided into segments of Corporate, home office and consumer and
summarized into a few category of orders such as office supplies, Furniture and Technology. The retail is distributed into regions
(East, South, West, & Central)*/

--Analysis
SELECT *
FROM [dbo].[SampleSuperstore]

SELECT COUNT(Ship_Mode) Count_of_mode, Ship_Mode
FROM [dbo].[SampleSuperstore]
WHERE Segment ='Home Office'
GROUP BY Ship_Mode
ORDER BY 1 ASC
---It was gotten that standard class is the most common shipping mode in the retail section, with consumer segment has being most sorted after.

SELECT COUNT(Ship_Mode) Count_of_mode, Ship_Mode
FROM [dbo].[SampleSuperstore]
WHERE Segment ='Home Office'
GROUP BY Ship_Mode
ORDER BY 1 ASC

---Which sub_category had the least sale by there respective category
SELECT SUM(Sales)Total_Sales, Sub_Category
FROM [dbo].[SampleSuperstore]
WHERE Category ='Office Supplies'
GROUP BY Sub_Category
ORDER BY 1 DESC

SELECT SUM(Sales)Total_Sales, Sub_Category
FROM [dbo].[SampleSuperstore]
WHERE Category ='Furniture'
GROUP BY Sub_Category
ORDER BY 1 DESC

SELECT SUM(Sales)Total_Sales, Sub_Category
FROM [dbo].[SampleSuperstore]
WHERE Category ='Technology'
GROUP BY Sub_Category
ORDER BY 1 DESC

SELECT SUM(Sales)Total_Sales,SUM(Profit)Total_Profit,  Sub_Category
FROM [dbo].[SampleSuperstore]
GROUP BY Sub_Category
ORDER BY 2 DESC

----Which region had the most sales
SELECT SUM(Sales)Total_Sales, Region
FROM [dbo].[SampleSuperstore]
GROUP BY Region
ORDER BY 1 DESC

SELECT SUM(Sales)Total_Sales, State
FROM [dbo].[SampleSuperstore]
WHERE Region= 'South'
GROUP BY State
ORDER BY 1 DESC

--- By profit
SELECT SUM(Profit)Total_Profit, SUM(Discount) Total_Discount,Category
FROM [dbo].[SampleSuperstore]
GROUP BY Category
ORDER BY 1 DESC

SELECT SUM(Sales)Total_Sales, Sub_Category
FROM [dbo].[SampleSuperstore]
GROUP BY Sub_Category
ORDER BY 1 DESC

---
SELECT SUM(Sales)Total_Sales, Sub_Category
FROM [dbo].[SampleSuperstore]
WHERE Sub_Category IN ('Supplies', 'Bookcases', 'Tables')
GROUP BY Sub_Category
ORDER BY 1 DESC 

---From the analysis it is preferable to cut cost of supplies, bookcases and tables in other to derive profit.

SELECT COUNT(Ship_Mode)
FROM [dbo].[SampleSuperstore]