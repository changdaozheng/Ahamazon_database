SELECT IO.PubID, AVG(IO.Rating) AS Avg_Rating
FROM ItemsInOrder AS IO, 
    (SELECT PubID
        FROM ItemsInOrder 
        WHERE Rating = 5
        AND OrderDatetime BETWEEN '1 August 2022' AND '31 August 2022'
        GROUP BY PubID
        HAVING COUNT(Rating) >= 10) AS RES
WHERE IO.PubID = RES.PubID
GROUP BY IO.PubID
ORDER BY Avg_Rating

