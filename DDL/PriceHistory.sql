CREATE TABLE PriceHistory (
    StockID VARCHAR(255) NOT NULL,
    BookstoreID VARCHAR(255) NOT NULL,
    PubID VARCHAR(255) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL, 
    Price DECIMAL(18,2) NOT NULL,

    PRIMARY KEY (BookstoreID, PubID, StockID, StartDate, EndDate, Price),
    FOREIGN KEY (StockID, BookstoreID, PubID) REFERENCES StocksInBookstore(StockID, BookstoreID, PubID),
    FOREIGN KEY (BookstoreID) REFERENCES Bookstore(BookstoreID),
    FOREIGN KEY (PubId) REFERENCES Publications(PubId),
)