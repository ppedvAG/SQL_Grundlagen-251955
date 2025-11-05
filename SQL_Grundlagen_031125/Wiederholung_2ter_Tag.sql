--1. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
--„Seafood“ (Categories) verkauft?
--Wenn ja, wieviel Lieferkosten sind 
--dabei insgesamt entstanden (Freight)?
SELECT SUM(Freight) as Lieferkosten
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' and Categories.CategoryName = 'Seafood'

--2. Erstellen Sie einen Bericht, der die Gesamtzahl der 
--Bestellungen nach Kunde seit dem 31. Dezember 1996 anzeigt. 
--Der Bericht sollte nur Zeilen zurückgeben, 
--für die die Gesamtzahl der Aufträge größer als 15 ist (5 Zeilen)
SELECT CustomerID, COUNT(OrderID) as Aufträge FROM Orders
WHERE OrderDate > '31.12.1996'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY Aufträge DESC
