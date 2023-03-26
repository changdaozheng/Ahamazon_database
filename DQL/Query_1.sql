SELECT AVG(PH.PRICE) AS AVG_PRICE
FROM Price-History AS PH, Books AS B
WHERE B.PubID = PH.PubID
AND B.Title = 'Harry Porter Finale'
AND PH.Start-date = '1 August 2022'
AND PH.End-date = '31 August 2022'