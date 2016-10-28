-- df: null=0

CREATE TABLE Customers (          -- df: mult=1			  
    custid   INTEGER PRIMARY KEY,                                 
    cname    VARCHAR(100),	  -- df: lenmax=10		  
    country  CHAR(3) 		  -- df: word=:GBR,USA,ITA,CHN,JPN
);

CREATE TABLE Products (           -- df: size=1000
    pcode    INTEGER PRIMARY KEY,                 
    pname    VARCHAR(100),	  -- df: lenmax=10
    pdesc    VARCHAR(500),	  -- df: lenmax=20
    price    NUMERIC(6,2)
);

CREATE TABLE Orders (             -- df: mult=3
    ordid    INTEGER PRIMARY KEY,
    odate    DATE,
    ocust    INTEGER NOT NULL REFERENCES Customers -- df: null=0
);

CREATE TABLE Details (            -- df: mult=15
    ordid    INTEGER REFERENCES Orders,	           -- df: null=0
    pcode    INTEGER REFERENCES Products,          -- df: null=0
    qty      SMALLINT,
    PRIMARY KEY (ordid, pcode)
);

CREATE TABLE Invoices (           -- df: mult=3
    invid    INTEGER PRIMARY KEY,
    ordid    INTEGER NOT NULL REFERENCES Orders,   -- df: null=0
    amount   NUMERIC(10,2),
    issued   DATE,
    due      DATE
);

CREATE TABLE Payments (           -- df: mult=6
    payid    INTEGER PRIMARY KEY,
    tstamp   TIMESTAMP,
    amount   INTEGER,
    invid    INTEGER NOT NULL REFERENCES Invoices
);
