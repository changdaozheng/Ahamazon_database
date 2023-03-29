-- 7. For customers that made the most number of complaints, find the most expensive publication he/she has ever purchased.

WITH max_complaints AS (
  SELECT CustomerID, COUNT(ComplaintID) AS numComplaints
  FROM Complaints
  GROUP BY CustomerID
),

purchases AS (
  SELECT c.CustomerID, 
    numComplaints, 
    MAX(numComplaints) OVER() AS MaxComplaints,
    iio.StockID, 
    iio.ItemPrice, 
    MAX(iio.ItemPrice) OVER (PARTITION BY c.CustomerID) AS CustomerMaxPurchase
  FROM max_complaints AS c
    JOIN ItemsInOrder AS iio ON c.CustomerID = iio.CustomerID
)

SELECT CustomerID, numComplaints, StockID, itemPrice
FROM purchases 
WHERE  numComplaints = MaxComplaints 
  AND itemPrice = CustomerMaxPurchase