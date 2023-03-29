-- Additional 2. Find the TOP 3 bookstores with the greatest total stock value

SELECT TOP 3 
    BookstoreID,
    SUM(StockPrice*StockQty) AS Total_Value
FROM StocksInBookStore
GROUP BY BookstoreID
ORDER BY Total_Value DESC
