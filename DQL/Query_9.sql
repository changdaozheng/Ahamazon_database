SELECT p.Title
FROM Publications p
INNER JOIN Books b ON p.PubID = b.PubID
INNER JOIN Stocks_In_Bookstore s ON s.PubID = p.PubID
INNER JOIN Items_In_Orders io ON io.StockID = s.StockID
INNER JOIN Orders o ON o.OrderID = io.OrderID
INNER JOIN (
    SELECT PubID, DATE_TRUNC('month', Date_time) AS Month, SUM(Item_Qty) AS Total_Qty
    FROM Items_In_Orders io
    INNER JOIN Orders o ON o.OrderID = io.OrderID
    WHERE o.Date_time >= '2022-01-01'
    GROUP BY PubID, Month
    HAVING COUNT(DISTINCT DATE_TRUNC('month', Date_time)) >= 3
) AS monthly_sales ON p.PubID = monthly_sales.PubID AND DATE_TRUNC('month', o.Date_time) = monthly_sales.Month
GROUP BY p.Title
HAVING COUNT(DISTINCT DATE_TRUNC('month', o.Date_time)) >= 3
AND SUM(Item_Qty) / monthly_sales.Total_Qty >= 1.5
