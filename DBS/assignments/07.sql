SELECT pcode,sum 
FROM (
	SELECT pcode,SUM(qty) 
	FROM details 
	GROUP BY pcode) A 
WHERE A.sum > 10;
