CREATE TABLE OrderStatus (
    OrderId VARCHAR(255) NOT NULL,
    OrderDatetime DATETIME NOT NULL, /*Replaces Date*/
    ItemID VARCHAR(255) NOT NULL,
    StockID VARCHAR(255) NOT NULL,
    PubID VARCHAR(255) NOT NULL,
    BookstoreID VARCHAR(255) NOT NULL,
    OrderStatus VARCHAR(255) NOT NULL, /*Replaces State*/
    
    PRIMARY KEY (OrderId, OrderDatetime, ItemID, StockID, PubID, BookstoreID)
)