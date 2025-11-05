/*******************************************/

-- Variablen allgemein

/*******************************************/

DECLARE @OrderID INT = 10250, @var int, @var3 int

SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID

SET @OrderID = 10251


SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID

Use Northwind
GO
/*******************************************/

-- Stored Procedures / gespeicherte Prozeduren

/*******************************************/

/*
	- Sind gespeicherte SQL Anweisungen (nicht nur SELECT, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Praktisch zum "automatisieren" von Code
	- Prozeduren verwenden Ihren QueryPlan jedes mal wieder
*/

CREATE PROCEDURE spRechnungsOrderID @OrderID INT
AS
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID

-- Prozedur ausführen
EXEC spRechnungsOrderID 10248
GO

CREATE PROCEDURE spNewCustomer
@CustomerID CHAR(5), @CompanyName VARCHAR(40),
@Country VARCHAR(30), @City VARCHAR(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer 'ALDIS', 'PPEDV AG', 'Germany', 'Burghausen'
EXEC spNewCustomer LIDLI, lidlgmbH, germany, burghausen
EXEC spNewCustomer PPEDV, ppedvag, 20, burghausen
EXEC spNewCustomer PPaga, ppedvag, [GETDATE()], burghausen


SELECT * FROM Customers
GO

-- Default Werte
CREATE PROCEDURE spKundenNachLand 
@Country VARCHAR(50) = 'Germany', @City VARCHAR(50) = 'Berlin'
AS
SELECT * FROM Customers
WHERE COuntry = @Country AND City = @City
go

EXEC spKundenNachLand France, Paris
EXEC spKundenNachLand DEFAULT, Köln
EXEC spKundenNachLand @City = 'München', @Country = 'Germany'


--1. Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
--Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden 
-- SUM(Quantity * UnitPrice + Freight) = RechnungsSumme.
GO

CREATE PROCEDURE sp_RechnungsSumme @OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) AS Rechnungssumme
FROM Orders JOIn [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = @OrderID
GROUP BY Orders.OrderID

EXEC sp_RechnungsSumme 10248
GO


CREATE PROCEDURE sp_RechnungsSummeTest @OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) AS Rechnungssumme
FROM Orders JOIn [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = @OrderID


SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
--WHERE Orders.OrderID = 10248
GROUP BY Orders.OrderID
