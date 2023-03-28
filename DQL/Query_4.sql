SELECT C.EID
FROM Complaints AS C, Employees AS E
WHERE C.EID = E.EID 
GROUP BY EID
HAVING AVG(DATEDIFF(C.Filed-date-time, C.Handled-date-time)) AS Latency
ORDER BY Latency
LIMIT 1
