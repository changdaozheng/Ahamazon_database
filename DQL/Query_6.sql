SELECT TOP 1 X.BookstoreID, SUM(ItemPrice * ItemQty) AS TotalRevenue
FROM ItemsInOrder AS X INNER JOIN OrderStatus AS Y ON 
	Y.ItemID = X.ItemID
		AND Y.StockID = X.StockID
		AND Y.BookstoreID = X.BookstoreID
		AND Y.PubID = X.PubID
		AND Y.OrderID = X.OrderID
WHERE X.OrderDatetime BETWEEN '2022-08-01' AND '2022-08-31'
	AND Y.OrderState != 'Returned'
GROUP BY X.BookstoreID
ORDER BY TotalRevenue DESC