SELECT PubID
FROM Orders os, Items-In-Orders iio
WHERE os.OrderID = iio.OrderID
    AND os.Date-time >= ‘2022-08-01’ 
    AND os.Date-time < ‘2022-09-01’
    AND NOT EXISTS
            (SELECT *
                FROM Items-In-Orders ii, Orders o
                WHERE ii.PubID = iio.PubID
                    AND o.Date-time = ii.Date-Time
                AND o.Date-time >= ‘2022-07-01’ 
                AND o.Date-time < ‘2022-08-01’) 
GROUP BY iio.PubID
ORDER BY SUM(iio.ItemQty) DESC  
LIMIT 3
