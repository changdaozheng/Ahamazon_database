WITH employee_avg AS (
    SELECT C.EmployeeID, CAST(AVG(DATEDIFF(SECOND, C.FiledDatetime, C.HandledDatetime)) AS DECIMAL(18,4)) AS EmployeeLatency
    FROM Complaints AS C
    JOIN Employees AS E
        ON C.EmployeeID = E.EmployeeID
    GROUP BY C.EmployeeID
),

min_latency AS (
    SELECT EmployeeID, EmployeeLatency, MIN(EmployeeLatency) OVER() AS LowestLatency 
    FROM employee_avg
)

SELECT EmployeeID, EmployeeLatency, LowestLatency
FROM min_latency 
WHERE EmployeeLatency = LowestLatency