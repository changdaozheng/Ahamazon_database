CREATE TABLE Complaints (
    ComplaintID VARCHAR(255) NOT NULL,
    CustomerID VARCHAR(255) NOT NULL,
    ComplaintBody VARCHAR(255) NOT NULL, /*Replaces Text*/
    FiledDatetime DATETIME NOT NULL,
    HandledDatetime DATETIME,
    EmployeeID VARCHAR(255),

    PRIMARY KEY (ComplaintID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
)
