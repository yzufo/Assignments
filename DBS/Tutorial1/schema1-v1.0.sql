CREATE TABLE Customers (
    custid   INTEGER PRIMARY KEY,
    cname    VARCHAR(100),
    country  CHAR(3) 
);

CREATE TABLE Products (
    pcode    INTEGER PRIMARY KEY,
    pname    VARCHAR(100),
    pdesc    VARCHAR(500),
    price    NUMERIC(6,2)
);

CREATE TABLE Orders (
    ordid    INTEGER PRIMARY KEY,
    odate    DATE,
    ocust    INTEGER NOT NULL REFERENCES Customers
);

CREATE TABLE Details (
    ordid    INTEGER REFERENCES Orders,
    pcode    INTEGER REFERENCES Products, 
    qty      SMALLINT,
    PRIMARY KEY (ordid, pcode)
);

CREATE TABLE Invoices (
    invid    INTEGER PRIMARY KEY,
    ordid    INTEGER NOT NULL REFERENCES Orders,
    amount   NUMERIC(10,2),
    issued   DATE,
    due      DATE
);

CREATE TABLE Payments (
    payid    INTEGER PRIMARY KEY,
    tstamp   TIMESTAMP,
    amount   INTEGER,
    invid    INTEGER NOT NULL REFERENCES Invoices
);
