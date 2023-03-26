SELECT IO.PubID, AVG(IO.Rating) AS Avg_Rating
FROM Items-In-Orders AS IO, (SELECT PubID
    FROM Items-In-Orders 
    WHERE Rating = 5
    AND Date-time BETWEEN '2022-08-01' AND '2022-08-31'
    GROUP BY PubID
    HAVING COUNT(*) >= 10) AS RES
WHERE IO.PubID = RES.PubID
GROUP BY IO.PubID
ORDER BY Avg_Rating
