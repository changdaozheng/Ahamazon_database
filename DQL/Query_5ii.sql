-- 5ii. Produce a list that contains all publications published by Nanyang Publisher Company, 
-- and for each of them, the number of bookstores on Ahamazon that sell them.

With PublicationsInBookstores as (
    SELECT p.PubID, p.Publisher, sib.BookstoreID ,sib.PubID as sibPubID 
    FROM Publications AS p
    LEFT JOIN StocksInBookstore AS sib
    on sib.PubID = p.PubID 
)

SELECT PubID, COUNT(DISTINCT BookstoreID) AS NumBookstores
FROM PublicationsInBookstores
WHERE Publisher = 'Nanyang Publisher Company'
GROUP BY PubID