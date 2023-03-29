CREATE TABLE OrderStatus (
    OrderID VARCHAR(255) NOT NULL,
    ItemID VARCHAR(255) NOT NULL,
    StockID VARCHAR(255) NOT NULL,
    PubID VARCHAR(255) NOT NULL,
    BookstoreID VARCHAR(255) NOT NULL,
    StatusDatetime DATETIME NOT NULL, 
    OrderState VARCHAR(255) NOT NULL, 
    
    PRIMARY KEY (OrderId, ItemID, StockID, PubID, BookstoreID, StatusDatetime),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES ItemsInOrder(ItemID),
    FOREIGN KEY (StockID) REFERENCES StocksInBookstore(StockID),
    FOREIGN KEY (BookstoreID) REFERENCES Bookstore(BookstoreID),
    FOREIGN KEY (PubId) REFERENCES Publications(PubId),
)