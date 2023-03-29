-- Additional 3. Find the name of the best employee based on the most number of complaints closed 

SELECT EmployeeName
FROM Employees
WHERE EmployeeID = ( 
    SELECT TOP 1 EmployeeID
    FROM z42g1.dbo.Complaints
    GROUP BY EmployeeID
    ORDER BY COUNT(EmployeeID) DESC 
)