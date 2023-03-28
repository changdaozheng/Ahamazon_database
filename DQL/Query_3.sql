SELECT AVG(DATEDIFF(day, X.OrderDatetime, Z.DeliveryDatetime)) AS Avg_Delivery_Time
FROM (SELECT O.OrderID, O.OrderDatetime
	  	FROM Orders AS O
	 	WHERE O.OrderDatetime BETWEEN '2022-06-01' AND '2022-06-30') AS X,  
	ItemsInOrder AS Z 
WHERE Z.DeliveryDatetime IS NOT NULL
	AND Z.OrderID = X.OrderID

