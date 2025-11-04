--1. Verkaufte Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
SELECT CategoryName, SUM(Quantity) FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName

--2. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
SELECT LastName, FirstName, COUNT(OrderID) as Bestellungen FROM Employees
JOIN Orders on Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName, FirstName
ORDER BY Bestellungen DESC

--3. Was war das meistverkaufte Produkt im Jahr 1998 (Productname)? Wieviel Stück (Quantity)?
SELECT TOP 1 ProductName, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE YEAR(OrderDate) = 1998
GROUP BY ProductName
ORDER BY Verkaufsmenge DESC

--4. In welcher Stadt (City) waren „Wimmers gute Semmelknödel“ am beliebtesten (Quantity)?
SELECT TOP 1 ShipCity, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE ProductName = 'Wimmers gute Semmelknödel'
GROUP BY ShipCity
ORDER BY Verkaufsmenge DESC

--5. Welcher Spediteur (Shippers) war durchschnittlich am günstigsten? (Freight)
SELECT TOP 1 CompanyName, AVG(Freight) as AvgFreight FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName
ORDER BY AvgFreight

-- 6. Jahrweiser Vergleich unserer 3. Spediteure: (Shippers Tabelle): 
-- Lieferkosten (Freight) gesamt, Durchschnitt (freight)
-- pro Lieferung und Anzahl an Lieferungen
-- Aggregate: SUM, AVG, COUNT
-- DATEPART() benoetigt
/*
	Ergebnis in etwa so:
	SpediteurName, Geschäftsjahr, FreightGesamt, FreightAvg, AnzBestellungen
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	usw....
*/
SELECT CompanyName,
DATEPART(YEAR, OrderDate) as Geschäftsjahr,
SUM(Freight) as FreightGesamt,
AVG(Freight) as FreightAvg,
COUNT(*) as AnzBestellungen
FROM Shippers
JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)
ORDER BY Geschäftsjahr, FreightAvg


select Shippers.CompanyName, DATEPART(YEAR, orders.OrderDate) as 'Jahr', 
SUM(Orders.Freight) as 'SUM', 
AVG(Orders.Freight) as 'AVG', 
COUNT (*) as 'COUNT' from Shippers
join orders on shippers.ShipperID = orders.ShipVia
join [Order Details] on Orders.OrderID = [Order Details].OrderID
group by DATEPART(YEAR, orders.OrderDate), Shippers.CompanyName
order by 'Jahr'

SELECT * FROM [Order Details]