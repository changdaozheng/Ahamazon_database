CREATE TABLE ComplaintsOnOrders (
    ComplaintID VARCHAR(255) NOT NULL,
    OrderID VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (ComplaintID),
    FOREIGN KEY (ComplaintID) REFERENCES Complaints(ComplaintID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
)