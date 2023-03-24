CREATE TABLE StocksInBookstore (
    StockID VARCHAR(255) NOT NULL,
    BookstoreID VARCHAR(255) NOT NULL,
    PubID VARCHAR(255) NOT NULL,
    StockQty INT NOT NULL,
    StockPrice DECIMAL(18,2), 

    PRIMARY KEY (StockID, BookstoreID, PubID)
)