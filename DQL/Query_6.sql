SELECT BookstoreID
FROM (SELECT X.BookstoreID, SUM(ItemPrice * ItemQty) AS TotalRevenue
		FROM ItemsInOrders AS X, OrderStatus AS Y
		WHERE Y.date BETWEEN “2022-08-01” AND “2022-08-31”
			AND Y.ItemID = X.ItemID
			AND Y.StockID = X.StockID
			AND Y.BookstoreID = X.BookstoreID
			AND Y.PubID = X.PubID
		GROUP BY X.BookstoreID) AS Intermediate
WHERE TotalRevenue = (SELECT MAX(TotalRevenue)
			        	FROM Intermediate)
