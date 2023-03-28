CREATE TABLE Books (
    PubID VARCHAR(255) NOT NULL,
    Title VARCHAR(255) NOT NULL,

    PRIMARY KEY (PubID),
    FOREIGN KEY (PubID) REFERENCES Publications(PubId)
)