WITH max_complaints AS (
  SELECT CustomerID, COUNT(*) AS num_complaints
  FROM Complaints
  GROUP BY CustomerID
  ORDER BY num_complaints DESC
  LIMIT 1
),
most_expensive_publication AS (
  SELECT c.CustomerID, MAX(s.Stock_Price) AS max_price
  FROM Customers c
  JOIN Orders o ON c.CustomerID = o.CustomerID
  JOIN Items_In_Orders iio ON o.OrderID = iio.OrderID
  JOIN Stocks_In_Bookstore s ON iio.StockID = s.StockID
  WHERE c.CustomerID = (SELECT CustomerID FROM max_complaints)
  GROUP BY c.CustomerID
)
SELECT p.Title, p.Year, mep.max_price
FROM Publication p
JOIN Stocks_In_Bookstore s ON p.PubID = s.PubID
JOIN most_expensive_publication mep ON s.BookstoreID = mep.BookstoreID
WHERE s.Stock_Price = mep.max_price
ORDER BY mep.max_price DESC
LIMIT 1;
