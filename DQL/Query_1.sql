/*Find the average price of “Harry Porter Finale” on Ahamazon from 1 August 2022 to 31 August 2022. */
DECLARE @augStart DATE = '2022-08-01';
DECLARE @augEnd DATE = '2022-08-31';

WITH aug_prices_by_bookstore AS (
    SELECT BookstoreID,
            Price, 
            CASE
                WHEN (startDate BETWEEN @augStart AND @augEnd) AND (endDate BETWEEN @augStart AND @augEnd) THEN DATEDIFF(day, startDate, endDate)
                WHEN (startDate BETWEEN @augStart AND @augEnd) AND (endDate > @augEnd) THEN DATEDIFF(day, startDate, @augEnd) + 1
                WHEN (startDate < @augStart) AND (endDate BETWEEN @augStart AND @augEnd) THEN DATEDIFF(day, @augStart, endDate) 
                WHEN (startDate < @augStart) AND (endDate > @augEnd) THEN DATEDIFF(day, @augStart, @augEnd) + 1
            END AS num_days
    FROM PriceHistory AS ph
    JOIN Books
        ON ph.PubID = Books.PubID
    WHERE Books.Title = 'Harry Potter Finale'
), 

avg_aug_price_by_bookstore AS (
    SELECT BookstoreID, 
            SUM(Price * num_days) / SUM(num_days) AS bookstore_avg_price
    FROM aug_prices_by_bookstore
    GROUP BY BookstoreID
)

SELECT AVG(bookstore_avg_price) as avg_price 
FROM avg_aug_price_by_bookstore