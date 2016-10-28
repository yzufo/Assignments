SELECT invid,issued,orders.ordid,odate 
FROM orders,invoices 
WHERE issued < odate 
	AND orders.ordid = invoices.ordid;
