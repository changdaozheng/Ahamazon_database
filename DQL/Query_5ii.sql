SELECT X.PubID, COUNT(DISTINCT BookstoreID) AS NumBookstores
FROM StocksInBookstore AS X, Publications AS Y
WHERE Publisher = 'Nanyang Publisher Company'
    AND X.PubID = Y.PubID
GROUP BY X.PubID