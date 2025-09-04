# Customer Segmentation with RFM Model (SQL Project)

## 📌 Project Overview

This project focuses on customer segmentation using the **RFM (Recency,
Frequency, Monetary)** model based on the **AdventureWorks** database.\
The RFM analysis is a powerful marketing technique that classifies
customers according to their purchasing behavior.\
By analyzing the **time of last purchase (Recency)**, the **number of
purchases (Frequency)**, and the **amount spent (Monetary)**, businesses
can better understand their customers and improve marketing strategies.

------------------------------------------------------------------------

## 🎯 Project Goals

1.  Gain a comprehensive understanding of the RFM model and its
    applications.\
2.  Identify and extract relevant data from `SalesOrderHeader` and
    `SalesOrderDetail`.\
3.  Write SQL queries to calculate R, F, and M values for each
    customer.\
4.  Use **Window Functions** (e.g., `NTILE`, `CUME_DIST`,
    `PERCENT_RANK`) for scoring.\
5.  Develop queries to segment customers into meaningful clusters.\
6.  Analyze and interpret the results to provide marketing insights.

------------------------------------------------------------------------

## 🗂 Database Tables

-   **SalesOrderHeader**
    -   `SalesOrderID` -- unique order ID\
    -   `OrderDate` -- order date\
    -   `CustomerID` -- customer ID\
    -   `TotalDue` -- total order amount
-   **SalesOrderDetail**
    -   `SalesOrderDetailID` -- unique detail ID\
    -   `SalesOrderID` -- link to SalesOrderHeader\
    -   `OrderQty` -- ordered quantity\
    -   `ProductID` -- product ID\
    -   `UnitPrice` -- unit price\
    -   `LineTotal` -- total item cost

------------------------------------------------------------------------

## 🛠 Tasks

1.  **Explain the RFM model** -- describe Recency, Frequency, Monetary
    and their role in marketing.\
2.  **Identify data sources** -- extract required fields from the
    database.\
3.  **Compute RFM values** -- write SQL queries to calculate Recency,
    Frequency, and Monetary.\
4.  **Apply Window Functions** -- implement functions for scoring and
    ranking.\
5.  **Cluster Customers** -- create customer segments (e.g., High Value,
    Medium Value, At Risk).\
6.  **Interpret Results** -- provide insights into each cluster and
    their marketing implications.

------------------------------------------------------------------------

## 📑 Deliverables

1.  A one-page explanation of the RFM model.\
2.  SQL scripts including calculations, scoring, and clustering.\
3.  A complete report (Word or PDF) covering:
    -   RFM model explanation\
    -   SQL scripts with explanations\
    -   Selected Window Function and its role\
    -   Analysis and interpretation of results

------------------------------------------------------------------------

## 📝 Evaluation Criteria

-   Accuracy and completeness of RFM model explanation.\
-   Correctness and efficiency of SQL queries.\
-   Proper use of Window Functions.\
-   Clarity and organization of code and documentation.\
-   Depth of insights from results interpretation.

------------------------------------------------------------------------

