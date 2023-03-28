SELECT IO.PubID, AVG(IO.Rating) AS Avg_Rating
FROM Items-In-Orders AS IO, 
    (SELECT PubID
        FROM Items-In-Orders 
        WHERE Rating = 5
        AND Date-time BETWEEN ‘1 August 2022’ AND ‘31 August 2022’
        GROUP BY PubID
        HAVING COUNT(*) >= 10) AS RES
WHERE IO.PubID = RES.PubID
GROUP BY IO.PubID
ORDER BY Avg_Rating

