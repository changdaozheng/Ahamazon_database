CREATE TABLE OrderStatus (
    OrderId VARCHAR(255) NOT NULL,
    ItemID VARCHAR(255) NOT NULL,
    StockID VARCHAR(255) NOT NULL,
    PubID VARCHAR(255) NOT NULL,
    BookstoreID VARCHAR(255) NOT NULL,
    StatusDatetime DATETIME NOT NULL, /*Replaces Date*/
    OrderStatus VARCHAR(255) NOT NULL, /*Replaces State*/
    
    PRIMARY KEY (OrderId, ItemID, StockID, PubID, BookstoreID, StatusDatetime)
)