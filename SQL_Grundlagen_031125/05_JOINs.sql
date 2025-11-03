USE Northwind

/*
	Inner Join:
	=> Wenn du nur übereinstimmende Daten aus beiden Tabellen brauchst
*/

SELECT * FROM Customers
SELECT * FROM Orders

/*
	JOIN Syntax
	SELECT * FROM Tabelle A
	INNER JOIN Tabelle B ON A.KeySpalte = B.KeySpalte
*/

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Mit Alias
SELECT * FROM Customers as Cus
JOIN Orders as Ord On Cus.CustomerID = Ord.CustomerID
WHERE Cus.CustomerID = 'ALFKI'

-- JOIN zwischen Customers - Orders - Order Details
SELECT Customers.*, Orders.OrderDate, Orders.ShippedDate, [Order Details].* FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
