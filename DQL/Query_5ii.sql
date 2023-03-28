SELECT PubID, COUNT(DISTINCT BookstoreID) AS NumBookstores
FROM StocksInBookstore AS X, Publication AS Y
WHERE Publisher = “Nanyang Publisher Company”
    AND X.PubID = Y.PubID
GROUP BY PubID