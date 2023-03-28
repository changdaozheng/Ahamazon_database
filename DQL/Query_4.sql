SELECT TOP 1 C.EmployeeID
FROM Complaints AS C, Employees AS E
WHERE C.EmployeeID = E.EmployeeID
GROUP BY C.EmployeeID
ORDER BY AVG(DATEDIFF(day, C.FiledDatetime, C.HandledDatetime)) 