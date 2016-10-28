SELECT orders.ordid,odate,ocust 
FROM orders LEFT JOIN details ON details.ordid = orders.ordid 
WHERE details.ordid IS null 
	AND orders.odate < to_date('20160609','yyyymmdd');
