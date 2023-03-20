CREATE TABLE ItemsInOrder (
    ItemID VARCHAR(255) NOT NULL,
    StockID VARCHAR(255) NOT NULL,
    OrderId VARCHAR(255) NOT NULL,
    BookstoreID VARCHAR(255) NOT NULL,
    PubID VARCHAR(255) NOT NULL,
    DeliveryDate DATETIME NOT NULL,
    ItemPrice DECIMAL(18,2) NOT NULL,
    ItemQty INT NOT NULL,
    CustomerID VARCHAR(255) NOT NULL,
    OrderDatetime DATETIME NOT NULL, /*Replace Datetime*/
    Comment VARCHAR(255),
    Rating INT,

    PRIMARY KEY (ItemID, StockID, OrderID, BookstoreID, PubID)
)