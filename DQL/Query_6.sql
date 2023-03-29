-- 6. Find bookstores that made the most revenue in August 2022.

WITH aug_revenue_ranking AS (
	SELECT X.BookstoreID, 
		SUM(ItemPrice * ItemQty) AS TotalRevenue, 
		ROW_NUMBER() OVER(ORDER BY SUM(ItemPrice * ItemQty) DESC) AS RevenueRanking
	FROM ItemsInOrder AS X 
	INNER JOIN OrderStatus AS Y 
		ON Y.ItemID = X.ItemID
			AND Y.StockID = X.StockID
			AND Y.BookstoreID = X.BookstoreID
			AND Y.PubID = X.PubID
			AND Y.OrderID = X.OrderID
	WHERE X.OrderDatetime BETWEEN '2022-08-01' AND '2022-08-31'
		AND Y.OrderState != 'Returned'
	GROUP BY X.BookstoreID
)

SELECT BookstoreID, TotalRevenue
FROM aug_revenue_ranking
WHERE RevenueRanking = 1