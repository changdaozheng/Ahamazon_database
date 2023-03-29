WITH aug_sales_ranking AS(
    SELECT PubID, 
        SUM(ItemQty) AS Sold, 
        ROW_NUMBER() OVER(ORDER BY SUM(ItemQty) DESC) AS salesRanking
    FROM ItemsInOrder
    WHERE OrderDatetime >= '2022-08-01' 
        AND OrderDatetime < '2022-09-01'
    GROUP BY PubID
),

jul_not_bought AS (
    SELECT PubID
    FROM Publications

    EXCEPT 

    SELECT PubID
    FROM ItemsInOrder
    WHERE OrderDatetime >= '2022-07-01' 
        AND OrderDatetime < '2022-08-01'
    GROUP BY PubID
)

SELECT sr.PubID
FROM aug_sales_ranking AS sr, jul_not_bought AS nb
WHERE sr.PubID = nb.PubID
    AND sr.salesRanking <4
ORDER BY Sold DESC
