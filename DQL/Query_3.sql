SELECT PID, AVG(DATEDIFF(X. Date-time, Z.Delivery-date))
FROM (SELECT O.OrderID
	  	FROM Orders AS O
	 	WHERE O.Date-time BETWEEN “2022-06-01” AND “2022-06-31”) AS X,  
	Items-In-Orders AS Z 
WHERE Z.Delivery-date IS NOT NULL
	AND Z.OrderID = X.OrderID
GROUP BY PID
