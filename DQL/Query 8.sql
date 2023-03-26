SELECT p.Title, COUNT(*) AS Num_Purchases
FROM Publications p
INNER JOIN Books b ON p.PubID = b.PubID
INNER JOIN Stocks_In_Bookstore s ON s.PubID = p.PubID
INNER JOIN Items_In_Orders io ON io.StockID = s.StockID
INNER JOIN Orders o ON o.OrderID = io.OrderID
WHERE o.Date_time >= '2022-08-01' AND o.Date_time < '2022-09-01'
AND p.PubID NOT IN (
    SELECT p.PubID
    FROM Publications p
    INNER JOIN Books b ON p.PubID = b.PubID
    INNER JOIN Stocks_In_Bookstore s ON s.PubID = p.PubID
    INNER JOIN Items_In_Orders io ON io.StockID = s.StockID
    INNER JOIN Orders o ON o.OrderID = io.OrderID
    WHERE o.Date_time >= '2022-07-01' AND o.Date_time < '2022-08-01'
)
GROUP BY p.Title
ORDER BY Num_Purchases DESC
LIMIT 3
