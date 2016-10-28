SELECT I.invid,A.sum-I.amount 
FROM invoices I,(
	SELECT invid,SUM(amount) 
	FROM payments 
	GROUP BY invid) A 
WHERE A.invid = I.invid 
	AND I.amount < A.sum;
