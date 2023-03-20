CREATE TABLE ComplaintStatus (
    ComplaintID VARCHAR(255) NOT NULL,
    ModifiedDate DATETIME NOT NULL, /*Replaces Date*/
    ComplaintStatus VARCHAR(255) NOT NULL, /*Replaces State*/
    
    PRIMARY KEY (EmployeeID, ModifiedDate)
)