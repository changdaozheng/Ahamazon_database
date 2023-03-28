CREATE TABLE Orders (
    OrderID VARCHAR(255) NOT NULL,
    CustomerID VARCHAR(255) NOT NULL,
    OrderDatetime DATETIME, /*Replaces Date-time*/
    ShippingAddress VARCHAR(255) NOT NULL,

    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)