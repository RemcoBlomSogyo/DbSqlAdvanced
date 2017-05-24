/* 2.1 */
/*
SELECT count(Customers.CustomerID) AS 'Orders', Customers.CustomerID, CompanyName FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE City = 'London'
GROUP BY Customers.CustomerID, CompanyName
HAVING count(Customers.CustomerID) < 5
ORDER BY count(Customers.CustomerID) DESC;
*/

/* 2.2 */
/*
SELECT ([Order Details].UnitPrice * Quantity * (1 - Discount)) AS 'Sales volume', Orders.* FROM Orders
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Pavlova'
AND (([Order Details].UnitPrice * Quantity * (1 - Discount)) > 800);
*/

/* 2.3 */
/*
SELECT RegionDescription FROM Region
JOIN Territories ON Territories.RegionID = Region.RegionID
JOIN EmployeeTerritories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
JOIN Employees ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chocolade'
GROUP BY RegionDescription;
*/

/* 2.4 */
/*
SELECT Orders.OrderID, CompanyName FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Tofu' AND Freight >= 25 AND Freight <= 50;
*/

/* 2.5 */
/*
SELECT City FROM Customers
WHERE City IN
(SELECT City FROM Employees)
GROUP BY City;
*/

/* 2.6 */
/*
SELECT TOP 5 Products.ProductID, ProductName, sum(Quantity) FROM Products
JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country = 'Germany'
GROUP BY Products.ProductID, ProductName
ORDER BY sum(Quantity) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title, sum(Quantity) FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Products.ProductID = 60
AND Customers.Country = 'Germany'
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY sum(Quantity) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title, sum(Quantity) FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Products.ProductID = 40
AND Customers.Country = 'Germany'
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY sum(Quantity) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title, sum(Quantity) FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Products.ProductID = 59
AND Customers.Country = 'Germany'
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY sum(Quantity) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title, sum(Quantity) FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Products.ProductID = 76
AND Customers.Country = 'Germany'
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY sum(Quantity) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title, sum(Quantity) FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Products.ProductID = 21
AND Customers.Country = 'Germany'
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY sum(Quantity) DESC;
*/

/* 2.7 */
/*
SELECT TOP 5 Products.ProductID, ProductName, 
cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) AS 'SalesResult' FROM Products
JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country = 'Germany'
GROUP BY Products.ProductID, ProductName
ORDER BY cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title,
cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) AS 'SalesResults' FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Customers.Country = 'Germany'
AND [Order Details].ProductID = 38
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title,
cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) AS 'SalesResults' FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Customers.Country = 'Germany'
AND [Order Details].ProductID = 59
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title,
cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) AS 'SalesResults' FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Customers.Country = 'Germany'
AND [Order Details].ProductID = 29
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title,
cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) AS 'SalesResults' FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Customers.Country = 'Germany'
AND [Order Details].ProductID = 60
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) DESC;

SELECT TOP 5 Employees.EmployeeID, LastName, FirstName, Title,
cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) AS 'SalesResults' FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Customers.Country = 'Germany'
AND [Order Details].ProductID = 62
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY cast(sum([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) DESC;
*/

/* 2.8 */
/*
SELECT * FROM Products
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID;
/* W3Schools: (INNER) JOIN: Returns records that have matching values in both tables */

SELECT * FROM Products
LEFT JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID;
/* W3Schools: LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table */

SELECT * FROM Products
RIGHT JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID;
/* W3Schools: RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table */

SELECT * FROM Products
FULL JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID;
/* W3Schools: FULL (OUTER) JOIN: Return all records when there is a match in either left or right table */
*/

/* 2.9 */
SELECT Employees.EmployeeID, LastName, FirstName, Title, cast(avg([Order Details].UnitPrice * Quantity * (1 - Discount)) as decimal(18,2)) AS Average_SalesResult
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY Employees.EmployeeID, LastName, FirstName, Title
ORDER BY avg([Order Details].UnitPrice * Quantity * (1 - Discount)) DESC;