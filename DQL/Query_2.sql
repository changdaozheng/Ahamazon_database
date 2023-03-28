
WITH aug_ratings AS (
    SELECT PubID
    FROM ItemsInOrder 
    WHERE Rating = 5
        AND OrderDatetime BETWEEN '1 August 2022' AND '31 August 2022'
    GROUP BY PubID
        HAVING COUNT(Rating) >= 10
)

SELECT IO.PubID, CAST(AVG(IO.Rating) AS DECIMAL(18,4)) AS Avg_Rating
FROM ItemsInOrder AS IO
JOIN aug_ratings AS aug 
    ON IO.PubID = aug.PubID
GROUP BY IO.PubID
ORDER BY Avg_Rating DESC