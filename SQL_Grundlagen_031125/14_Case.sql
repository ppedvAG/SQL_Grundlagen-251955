Use Northwind
/*******************************************/

-- CASE - unterscheiden wir definierte Fälle, die die Ausgabe abändern

/*******************************************/

-- Wenn ein Fall gefunden wird, dann passiert xyz, wenn nicht dann ist das Ergebnis NULL
SELECT UnitsInStock,
CASE 
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt.'
END as Pruefung
FROM Products

-- Alternativ mit ELSE einen "Fallback" definieren
SELECT UnitsInStock,
CASE 
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt.'
	ELSE 'Fehler!'
END as Pruefung
FROM Products

-- Funktioniert auch mit UPDATE:
UPDATE Customers
SET City = 
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END

SELECT * FROM Customers

-- Auch IM GROUP BY
SELECT SUM(UnitsInStock),
CASE
	WHEN UnitsInStock < 20 THEN 'Nachbstellen bitte'
	WHEN UnitsInStock >= 20 THEN 'Passt so'
	ELSE 'Fehler!'
END as Pruefung
FROM Products
GROUP BY 
CASE
	WHEN UnitsInStock < 20 THEN 'Nachbstellen bitte'
	WHEN UnitsInStock >= 20 THEN 'Passt so'
	ELSE 'Fehler!'
END

-- Aufgabe:
-- Wenn ShippedDate kleiner als RequiredDate => "Pünktlich versendet!"
-- Wenn ShippedDate gleich 0 ist => 'Noch nicht versendet'
-- Ansonsten: "Verspätet versendet"
SELECT OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate,
CASE
	WHEN ShippedDate <= RequiredDate THEN 'Pünktlich versendet!'
	WHEN ShippedDate IS NULL THEN 'Noch nicht versendet'
	ELSE 'Verspätet versendet'
END AS OrderStatus
FROM Orders