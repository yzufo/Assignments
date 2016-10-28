SELECT * 
FROM customers 
WHERE custid NOT IN (
	SELECT custid 
	FROM orders,customers 
	WHERE custid = ocust 
		AND odate > to_date('20160101', 'yyyymmdd') 
		AND odate < to_date('20170101','yyyymmdd'));
