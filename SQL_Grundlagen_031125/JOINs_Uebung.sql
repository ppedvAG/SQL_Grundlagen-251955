-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
SELECT DISTINCT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Leverling'

-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? 
SELECT OrderID
FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 4. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-------------------------------------------------
-- OUTER JOINS: LEFT/RIGHT UND FULL OUTER
-- LEFT
-- Alle Datensätzen aus der Linken Tabelle, auch wenn es keine passende Verknüpfung gibt
SELECT * FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
-- Haben wir Bestellungen, wo kein Kunde hinterlegt ist (gibts nicht)

-- RIGHT Z: 189 & 502
-- Alle Datensätze aus der Rechten Tabelle, auch wenn es keine passende Verknüpfung gibt
SELECT * FROM Orders 
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
-- Haben wir Kunden, die aber keine Bestellung getätigt haben? (Ja)

-- FULL OUTER => Left und Right kombiniert
SELECT * FROM Orders 
FULL OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- JOIN invertieren
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderID IS NULL OR Customers.CustomerID IS NULL

-- CROSS JOIN: Erstellt ein karthesisches Produkt zweier Tabellen (A x B)
SELECT * FROM Orders CROSS JOIN Customers

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter
FROM Employees as E1
RIGHT JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo