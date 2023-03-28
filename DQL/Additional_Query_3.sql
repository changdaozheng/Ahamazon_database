SELECT EmployeeName
FROM Employees
WHERE EmployeeID = ( 
    SELECT TOP 1
    EmployeeID
FROM z42g1.dbo.Complaints
GROUP BY EmployeeID
ORDER BY COUNT(EmployeeID) DESC 
)