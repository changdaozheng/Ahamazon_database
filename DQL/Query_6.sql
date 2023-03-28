SELECT TOP 1 X.BookstoreID, SUM(ItemPrice * ItemQty) AS TotalRevenue
FROM ItemsInOrder AS X, OrderStatus AS Y
WHERE X.OrderDatetime BETWEEN '2022-08-01' AND '2022-08-31'
	AND Y.ItemID = X.ItemID
	AND Y.StockID = X.StockID
	AND Y.BookstoreID = X.BookstoreID
	AND Y.PubID = X.PubID
GROUP BY X.BookstoreID