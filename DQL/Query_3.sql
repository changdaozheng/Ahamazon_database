SELECT Z.PID, AVG(DATEDIFF(X. Date-time, Z.Delivery-date))
FROM (SELECT O.OrderID
	  FROM Orders as O
	 WHERE O.Date-time = 'June 2022') AS X,  Items-In-Orders AS Z
WHERE Z.Delivery-date IS NOT NULL
AND Z.OrderID = X.OrderID
