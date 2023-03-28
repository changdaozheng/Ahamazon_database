WITH max_complaints AS (
  SELECT TOP 5 CustomerID, COUNT(ComplaintID) AS num_complaints
  FROM Complaints
  GROUP BY CustomerID
  ORDER BY num_complaints DESC
),

purchases AS (
  SELECT c.CustomerID, num_complaints, s.StockID, s.StockPrice, MAX(s.StockPrice) OVER (PARTITION BY c.CustomerID) AS CustomerMaxPurchase
  FROM max_complaints AS c
    JOIN Orders AS o ON c.CustomerID = o.CustomerID
    JOIN ItemsInOrder AS iio ON o.OrderID = iio.OrderID
    JOIN StocksInBookstore AS s ON iio.StockID = s.StockID
)

SELECT CustomerID, num_complaints, StockID, StockPrice
FROM purchases 
WHERE StockPrice = CustomerMaxPurchase
ORDER BY num_complaints DESC