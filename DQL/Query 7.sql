SELECT c.Name, MAX(s.Stock_Price) AS Max_Price
FROM (
    SELECT CustomerID, COUNT(*) AS Num_Complaints
    FROM Complaints
    GROUP BY CustomerID
    ORDER BY Num_Complaints DESC
    LIMIT 1
) AS mc
INNER JOIN Complaints c ON c.CustomerID = mc.CustomerID
INNER JOIN Items_In_Orders io ON io.CustomerID = c.CustomerID
INNER JOIN Stocks_In_Bookstore s ON io.StockID = s.StockID
INNER JOIN Publications p ON s.PubID = p.PubID
GROUP BY c.Name
