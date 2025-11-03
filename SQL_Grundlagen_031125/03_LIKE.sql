USE Northwind
-- LIKE: Fuer ungenaue Filterung/Suche koennen wir LIKE verwenden
-- (statt Vergleichsoperatoren)

SELECT ContactName FROM Customers
WHERE ContactTitle LIKE 'Manager'

-- Wildcards
-- "%"-Zeichen: Beliebige Symbole, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%manager%'

-- "_"-Zeichen: EIN beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles was in den Klammern ist, ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[012345]%'

-- "[a-z]" oder gegenteil mit ^ [^a-z] = Caret oder so..
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^123]%'

-- Bereich 1-3 haben und a-g
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-3 a-g]%'

-- Sonderfälle: % ' -
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[-]%'