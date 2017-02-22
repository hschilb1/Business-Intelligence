USE AdventureWorks2012; /*Set current database*/


/*1, Display the total amount collected from the orders for each order date. */

SELECT OrderDate, SUM(TotalDue) as DailyAmount, COUNT (SalesOrderID) as Daily_Number_of_Orders
FROM Sales.SalesOrderHeader
GROUP BY OrderDate
Order by OrderDate; 


/*2, Display the total amount collected from selling the products, 774 and 777. */

SELECT SUM(LineTotal) as TotalAmountCollected, ProductID 
FROM Sales.SalesOrderDetail
Group By ProductID
Having ProductID = 774 or ProductID = 777; 





/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and the name of the territory to which they belong.*/
SELECT p.BusinessEntityID, p.LastName, p.FirstName, s.TerritoryID
FROM Person.Person as p join Sales.SalesPerson as s on p.BusinessEntityID = s.BusinessEntityID 





/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard, Person.Person*/

SELECT Person.BusinessEntityID, CardType,
	LastName, FirstName
FROM Sales.CreditCard
JOIN Sales.PersonCreditCard
ON Sales.CreditCard.CreditCardID = Sales.PersonCreditCard.CreditCardID
JOIN Person.Person
ON Sales.PersonCreditCard.BusinessEntityID=Person.BusinessEntityID
WHERE CardType = 'Vista';




/*Show the number of customers for each type of credit cards*/
SELECT CardType, COUNT(BusinessEntityID) as Number_of_Customers
FROM Sales.CreditCard
JOIN Sales.PersonCreditCard
ON Sales.CreditCard.CreditCardID = Sales.PersonCreditCard.CreditCardID
GROUP BY CardType;



/*5, Write a query to display ALL the country region codes along with their corresponding territory IDs*/
/* tables: Sales.SalesTerritory, Person.CountryRegion*/

SELECT C.CountryRegionCode, C.Name, S.TerritoryID
FROM Person.CountryRegion as C left join Sales.SalesTerritory as S on S.CountryRegionCode = C.CountryRegionCode 


/*6, Find out the average of the total dues of all the orders.*/

SELECT AVG(TotalDue) as AverageTotalDues
FROM Sales.SalesOrderHeader




/*7, Write a query to report the sales order ID of those orders where the total due is greater than the average of the total dues of all the orders*/

SELECT SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue > 
(SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader)
ORDER BY TotalDue;




