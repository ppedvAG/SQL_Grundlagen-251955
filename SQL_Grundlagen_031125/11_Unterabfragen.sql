Use Northwind
/*******************************************/

-- Subqueries / Unterabfragen / nested queries

/*******************************************/

/*
	- Muessen eigenstaendig fehlerfrei ausfuehrbar sein!
	- Koennen prinzipiell ueberall in eine Abfrage eingebaut werden (wenn es Sinn macht)
	- Abfragen werden "von innen nach außen" der Reihe nach ausgefuehrt
*/

-- Zeige mir alle Orders, deren Freight Wert ueber dem Durchschnitt liegt
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

--SELECT * FROM Orders
--WHERE Freight > 74.2442