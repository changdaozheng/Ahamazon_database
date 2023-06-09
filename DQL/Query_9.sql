-- 9. Find publications that are increasingly being purchased over at least 3 months.

WITH monthly_sales_by_publication AS (
    SELECT IinO.PubID, 
        DATEADD(month, DATEDIFF(month, 0, IinO.DeliveryDatetime), 0) AS month, 
        SUM(ItemQty) AS num_orders 
    FROM itemsInOrder AS IinO
    JOIN orders AS o 
        ON IinO.OrderID = o.OrderID
    JOIN OrderStatus AS os
        ON os.OrderId = o.OrderID
    WHERE IinO.DeliveryDatetime IS NOT NULL
        AND os.OrderState = 'Delivered'
    GROUP BY IinO.PubID
        , DATEADD(month, DATEDIFF(month, 0, IinO.DeliveryDatetime), 0) /*gives first day of the month*/
),

growth AS (
    SELECT a.PubID, 
        a.month, 
        (a.num_orders - b.num_orders) AS momIncrease

    FROM monthly_sales_by_publication AS a 
    JOIN monthly_sales_by_publication AS b 
        ON a.PubID = b.PubID
    WHERE DATEADD(month, -1, a.month) = b.month /*Matching a month and the previous month, ignores first months (no previous months)*/
)

SELECT DISTINCT curr.PubID
FROM growth AS curr
JOIN growth AS minus1
    ON curr.PubID = minus1.PubID
WHERE curr.momIncrease > 0 
    AND minus1.momIncrease > 0
    AND DATEADD(month, -1, curr.month) = minus1.month 