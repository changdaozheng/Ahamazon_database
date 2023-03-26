SELECT BookstoreID
FROM (SELECT BookstoreID, SUM(ItemPrice * ItemQty) AS TotalRevenue
           	FROM ItemsInOrders AS X, OrderStatus AS Y
           	WHERE Y.date LIKE “%August 2022”
           	AND Y.ItemID = X.ItemID
           	AND Y.StockID = X.StockID
           	AND Y.BookstoreID = X.BookstoreID
           	AND Y.PubID = X.PubID
           	GROUP BY BookstoreID)
WHERE TotalRevenue = MAX(TotalRevenue)
