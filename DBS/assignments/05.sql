SELECT DISTINCT custid,cname,A.odate 
FROM customers,orders A 
WHERE custid = A.ocust AND A.odate >= all (
	SELECT odate 
	FROM orders B 
	WHERE A.ocust = B.ocust);
