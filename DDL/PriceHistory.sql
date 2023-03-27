CREATE TABLE PriceHistory (
    BookstoreID VARCHAR(255) NOT NULL,
    PubID VARCHAR(255) NOT NULL,
    StockID VARCHAR(255) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL, 
    Price DECIMAL(18,2) NOT NULL,

    PRIMARY KEY (BookstoreID, PubID, StockID, StartDate, EndDate, Price),
    FOREIGN KEY (StockID) REFERENCES StocksInBookstore(StockID),
    FOREIGN KEY (BookstoreID) REFERENCES Bookstore(BookstoreID),
    FOREIGN KEY (PubId) REFERENCES Publications(PubId),
)