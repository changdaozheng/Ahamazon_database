SELECT AVG(PH.PRICE) AS AVG_PRICE
FROM Price-History AS PH, Books AS B
WHERE B.PubID = PH.PubID
    AND B.Title = 'Harry Porter Finale'
    AND PH.Start-date = '2022-08-01'
    AND PH.End-date = '2022-08-31'