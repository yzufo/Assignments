SELECT P.pcode,price 
FROM products P,(
	SELECT pcode,SUM(qty),count(pcode) 
	FROM details 
	GROUP BY pcode) A 
WHERE P.pcode = A.pcode 
	AND A.sum/A.count >= 8;
