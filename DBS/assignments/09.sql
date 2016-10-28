SELECT DISTINCT A.country,COUNT(A.ordid) 
FROM (
	SELECT * 
	FROM customers,orders) A 
WHERE custid = ocust 
	AND odate >= to_date('20160101', 'yyyymmdd') 
	AND odate < to_date('20170101','yyyymmdd') 
GROUP by(A.country);
