SELECT C.EID, AVG(DATEDIFF(C.Filed-date-time, C.Handled-date-time)) AS Latency
FROM Complaints AS C
JOIN Employees E ON C.EID = E.EmployeeID
GROUP BY EID
ORDER BY Latency
LIMIT 1
