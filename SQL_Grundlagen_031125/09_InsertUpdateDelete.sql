USE Northwind
/*************************************/

-- CREATE / ALTER / DROP - DDL (Data Definition Language)

/*************************************/

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle
--DROP TABLE IF EXISTS dbo.PurchasingOrders
--GO

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	ProductID INT NOT NULL
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrder und Prodducts anlegen über ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufügen zu bestehender Tabelle
ALTER TABLE PurchasingOrders
ADD TestDaten INT

-- Spalte aus der bestehenden Tabelle löschen
--ALTER TABLE PurchasingOrders
--DROP COLUMN TestDaten

-- Spalte nach Datentyp ändern
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten FLOAT 

/*************************************/

-- INSERT - Hinzufügen von Datensätzen in bestehender Table

/*************************************/

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES (GETDATE(), 5, 10)

SELECT * FROM PurchasingOrders

-- Explizit einzelne Spalten befuellen:
INSERT INTO PurchasingOrders
(OrderDate, ProductID) VALUES(GETDATE(), 10)

SELECT * FROM PurchasingOrders

-- Ergebnisse einer SELECT-Abfrage direkt Inserten
-- (Wenn Spaltenanzahl passt und Datentypen Kompatibel)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 3, NULL

SELECT * INTO PurchasingTest
FROM PurchasingOrders

SET IDENTITY_INSERT [Tabellenname] ON

/*************************************/

-- DELETE - Löschen von Datensätzen in einem bestehendem Table

/*************************************/


SELECT * FROM PurchasingOrders

-- AUfpassen! Ohne WHERE Filter werden ALLE Datensaetze geloescht!
DELETE FROM PurchasingOrders
WHERE ID = 5

-- Primär/-Fremdschlüsselbeziehungen verhinder das loeschen von Datensätzen
-- weil sonst andere Datensätze ins "leere laufen wuerden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- Macht genau das selbe wie DELETE FROM [YXZ]
TRUNCATE TABLE PurchasingOrders

/*************************************/

-- UPDATE - Ändern von Spaltenwerten in einem vorhandenden Datensatz

/*************************************/

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 8
WHERE ID = 4

-- 'Loeschen' von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 4

/*******************************************/

-- Transactions

/*******************************************/

BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 8
WHERE ID = 4

COMMIT
ROLLBACK

--1. Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- 2: Aendere die Werte danach um, in eine Person die frei erfunden ist