use AdventureWorks2012;

/*Activity 1. Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */
SELECT JobTitle, 
	count(BusinessEntityID) as Number
FROM HumanResources.Employee
WHERE CurrentFlag = 1
GROUP BY JobTitle;




/*Activity 2. Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */
SELECT JobTitle, 
	count(BusinessEntityID) as Number
FROM HumanResources.Employee
WHERE CurrentFlag = 1
GROUP BY JobTitle
HAVING count(BusinessEntityID) >1; 

/*Activity 3. For each product, show its ProductID and Name (FROM the ProductionProduct table) and the location of its inventory (FROM the Product.Location table) and amount of inventory held at that location (FROM the Production.ProductInventory table).*/
SELECT p.ProductID, p.name as Product, l.name as Location, I.quantity 
FROM Production.Product as P join Production.ProductInventory as I 
ON P.ProductID = I.ProductID
join Production.Location as L on I.LocationID = L.LocationID 





/*Activity 4. Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID FROM the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 
*/
SELECT m.ProductModelID, m.Name, p.ProductID
FROM Production.Product as P right join Production.ProductModel as M on p.productmodelID = m.productmodelID
WHERE p.productID is NULL 


