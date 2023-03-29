-- 8. Find publications that have never been purchased by any customer in July 2022, but are the top 3 most purchased publications in August 2022.

SELECT TOP 3 PubID
FROM Orders AS os, ItemsInOrder AS iio
WHERE os.OrderID = iio.OrderID
    AND os.OrderDatetime >= '2022-08-01'
    AND os.OrderDatetime < '2022-09-01'
    AND NOT EXISTS
            (SELECT *
                FROM ItemsInOrder AS ii, Orders o
                WHERE ii.PubID = iio.PubID
                    AND o.OrderDatetime = ii.OrderDatetime
                    AND o.OrderDatetime >= '2022-07-01'
                    AND o.OrderDatetime < '2022-08-01') 
GROUP BY iio.PubID
ORDER BY SUM(iio.ItemQty) DESC  