CREATE TABLE Complaints (
    ComplaintID VARCHAR(255) NOT NULL,
    CustomerID VARCHAR(255) NOT NULL,
    EmployeeID VARCHAR(255) NOT NULL,
    ComplaintBody VARCHAR(255) NOT NULL, /*Replaces Text*/
    FiledDatetime DATETIME NOT NULL,
    HandledDatetime DATETIME,

    PRIMARY KEY (ComplaintID)
)
