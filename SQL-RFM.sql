/*creating schema and talble for storing the result of this project*/
--CREATE SCHEMA Project;
drop table Project.TblRFM
CREATE TABLE Project.TblRFM (
    CustomerID INT,
	RScore INT,
	FScore INT,
	MScore INT,
	RFM float,
    CustomerGroup NVARCHAR(50)
);

--CLEs
with TblAggregate as (SELECT 
        soh.CustomerID,
        DATEDIFF(DAY, MAX(soh.OrderDate), GETDATE()) AS R,  -- فاصله آخرین تاریخ خرید مشتری تا امروز
        COUNT(soh.SalesOrderID) AS F,  -- تعداد کل سفارش‌ها
        SUM(sod.LineTotal) AS M  -- مجموع مبلغ خرج‌شده توسط مشتری
    FROM Sales.SalesOrderHeader soh
    JOIN Sales.SalesOrderDetail sod 
        ON soh.SalesOrderID = sod.SalesOrderID  
    GROUP BY soh.CustomerID
),

TblWindowFunction as(
select CustomerID,
NTILE(4) over (order by R desc) as 'RScore',
NTILE(4) over (order by F ) as 'FScore',
PERCENT_RANK() over (order by M ) as 'MPercent'
from TblAggregate  ),

TblMGrouping AS (
    SELECT 
        CustomerID,
        RScore,
        FScore,
        CASE 
            WHEN MPercent <= 0.25 THEN 1  
            WHEN MPercent <= 0.50 THEN 2  
            WHEN MPercent <= 0.75 THEN 3  
            ELSE 4 
        END AS MScore
    FROM TblWindowFunction
),

TblCalcRFM AS (
    SELECT 
        CustomerID,RScore,FScore,MScore,
        ((RScore * 0.3 + FScore * 0.3 + MScore * 0.4)-1)/3 AS RFM
    FROM TblMGrouping
)


insert into Project.TblRFM
select CustomerID,RScore,FScore,MScore,
RFM,
case 
when RFM >0.75 then N'ارزش بالا'
when RFM > 0.5 then N'ارزش متوسط'
when RFM > 0.25 then N'ارزش پایین'
else  N'در معرض خطر'
end 
from TblCalcRFM 



select COUNT(*) AS GroupCount,
MAX(RFM) as MaxRFM,
MIN(rfm) as MinRFM,
CustomerGroup FROM PROJECT.TblRFM GROUP BY CustomerGroup order by MaxRFM desc

select * from Project.TblRFM order by CustomerID