SELECT O.ordid,O.odate, SUM(D.qty * P.price) 
FROM orders O,details D,products P 
WHERE O.ordid = D.ordid 
	AND P.pcode = D.pcode 
	AND O.ordid NOT IN(
		SELECT ordid FROM invoices) 
GROUP BY O.ordid;
