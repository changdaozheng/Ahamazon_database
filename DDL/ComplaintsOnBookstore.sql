CREATE TABLE ComplaintsOnBookstore (
    ComplaintID VARCHAR(255) NOT NULL,
    BookstoreID VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (ComplaintID),
    FOREIGN KEY (ComplaintID) REFERENCES Complaints(ComplaintID),
    FOREIGN KEY (BookstoreID) REFERENCES Bookstore(BookstoreID),
)