WITH max_complaints AS (
  SELECT TOP 5 CustomerID, COUNT(ComplaintID) AS num_complaints
  FROM Complaints
  GROUP BY CustomerID
  ORDER BY num_complaints DESC
),

purchases AS (
  SELECT c.CustomerID, num_complaints, iio.StockID, iio.ItemPrice, MAX(iio.ItemPrice) OVER (PARTITION BY c.CustomerID) AS CustomerMaxPurchase
  FROM max_complaints AS c
    JOIN ItemsInOrder AS iio ON c.CustomerID = iio.CustomerID
)

SELECT CustomerID, num_complaints, StockID, itemPrice
FROM purchases 
WHERE itemPrice = CustomerMaxPurchase
ORDER BY num_complaints DESC