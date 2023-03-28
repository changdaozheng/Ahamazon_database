CREATE TABLE ComplaintStatus (
    ComplaintID VARCHAR(255) NOT NULL,
    ModifiedDate DATETIME NOT NULL, /*Replaces Date*/
    ComplaintState VARCHAR(255) NOT NULL, /*Replaces State*/
    
    PRIMARY KEY (ComplaintID, ModifiedDate),
    FOREIGN KEY (ComplaintID) REFERENCES Complaints(ComplaintID)
)