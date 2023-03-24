CREATE TABLE Employees (
    EmployeeID VARCHAR(255),
    EmployeeName VARCHAR(255) NOT NULL, /*Replaces Name*/
    Salary DECIMAL(18,2),
    
    PRIMARY KEY (EmployeeID)
)