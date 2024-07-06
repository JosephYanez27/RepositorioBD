create DATABASE vistaspractica;
use vistaspractica

CREATE or ALTER VIEW Datos_empleados
as
SELECT CONCAT(e.FirstName,'',e.LastName) as 'Nombre del empleado' ,e.Title as 'cargo',
t.TerritoryDescription as 'territorio'
 FROM  Northwind.DBO.EmployeeTerritories as et
INNER JOIN Northwind.dbo.Employees as e 
ON et.EmployeeID=e.EmployeeID
INNER JOIN Northwind.dbo.Territories as t 
ON t.TerritoryID=et.TerritoryID;
SELECT * FROM Datos_empleados


SELECT [Nombre del empleado]
 FROM Datos_empleados
 where cargo='Vice President, Sales';

