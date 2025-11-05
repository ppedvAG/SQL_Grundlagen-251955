USE Northwind
GO

-- Versuch Nr.1
-- Eine Beliebige Variable mit VARCHAR(20) => Default Value muss Hoeher sein
-- @CustomerID = char(5), @CompanyName von varchar(40)
-- @Country varchar(20), @City = varchar(30)
-- Default Wert benoetigt!!!, Country Default Wert muss die 20 Zeichenketten ueberschreiben

------------------------------------------
-- Versuch Nr.2
-- Keine Defaultwerte:
-- @CustomerID = char(5), @CompanyName von varchar 40
-- @Country varchar(20), @City = varchar(30)
-- Beim Exec muss der WERT größer sein als der Datentyp es zulässt


-- Versuch Nr.3
-- Keine Defaultwerte:
-- @CustomerID = char(5), @CompanyName von varchar 40
-- @Country varchar(10), @City = varchar(30)
-- Beim Exec muss der WERT größer sein als der Datentyp es zulässt

-- Versuch Nr.4
-- @CustomerID = char(5), @CompanyName von varchar 40
-- @Country varchar(10), @City = varchar(30)
-- Mit Default werden