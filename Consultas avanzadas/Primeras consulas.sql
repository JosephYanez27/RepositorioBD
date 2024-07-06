SELECT Pacientes.Nombre
FROM Pacientes
LEFT JOIN Citas ON Pacientes.ID_Paciente = Citas.ID_Paciente;

SELECT Pacientes.nombre, HistorialesMedicos.diagnostico, HistorialesMedicos.tratamiento
FROM Pacientes
LEFT JOIN HistorialesMedicos ON Pacientes.ID_Paciente = HistorialesMedicos.ID_Paciente;

SELECT Pacientes.nombre, Medicos.nombre AS nombre_medico
FROM Pacientes
LEFT JOIN Citas ON Pacientes.ID_Paciente = Citas.ID_Paciente
LEFT JOIN Medicos ON Citas.ID_Medicos = Medicos.ID_Medicos;

SELECT Pacientes.nombre, Citas.fecha_hora
FROM Pacientes
JOIN Citas ON Pacientes.ID_Paciente = Citas.ID_Paciente
WHERE Pacientes.Edad < 40;

SELECT Pacientes.nombre, Citas.fecha_hora
FROM Pacientes
JOIN Citas ON Pacientes.ID_Paciente = Citas.ID_Paciente;

use Northwind
SELECT*from Orders WHERE (ShippedDate >='01-07-1996'and ShippedDate <='1998-04-30')
AND EmployeeID in (5,3,1)



SELECT*FROM Orders where ShippedDate BETWEEN '1996-07-01' and '1998-04-30'
and EmployeeID (5,9,1)


SELECT YEAR(OrderDate)as año FROM Orders
SELECT OrderID as 'numero orden ',OrderDate as 'fecha orden',YEAR(OrderDate) as Año FROM Orders WHERE OrderDate BETWEEN '1996-01-01' and '1998-12-31'

--seleccionar todos los apellidos de los empleados que comiencen con d 
SELECT * FROM Employees 
WHERE LastName LIKE 'D%'
--seleccionar a todos los empleados que comiencen con Da
SELECT LastName as Apellido FROM Employees 
WHERE LastName  LIKE 'DA%'
--Seleccionar todos los empleado que su appellido termine con a
SELECT *from Employees WHERE LastName LIKE '%a'
--seleccionar todos los empleado que su apellido contenga la letra a 
SELECT *from Employees WHERE LastName LIKE '%a%'
--seleccionar todos los emplkeado que su apellido no contenga la letra a
SELECT *from Employees WHERE LastName  not LIKE '%a%'
--seleccionar todos los empleados que contengan su apellido cualquier letra y una i
SELECT *from Employees WHERE LastName   LIKE '%__i%'
--Seleccionar todos los empleados donde su nombre contenga 3 caracteres la palabra despues la palabra li antes un caracter y fin almente la letra d 
SELECT *from Employees WHERE FirstName   LIKE '%__li_g%'
--sleccionar los apellidos que comiencen con d o con l de los empleados
SELECT *from Employees WHERE LastName   LIKE 'l%' or FirstName   LIKE 'd%'
SELECT *from Employees WHERE LastName   LIKE '[DL]%'
--Seleccionar todos los empleado que su apellido comiencen con una S o una C

SELECT *from Employees WHERE LastName   LIKE '[SC]%'
--seleccionar todos los empleados que en su apellido contengan una d o una  l
SELECT *from Employees WHERE LastName   LIKE '%[DL]%'--OR
--SELECCIONA A TODOS LOS EMPLEADOS DONDE SU APELLIDO CONTENGA LA LETRTA ENTRE LA A Y LA F
SELECT *from Employees WHERE LastName   LIKE '%[A-F]%' --BETWEEN 
--SELECCIONAR CUANTOS EMPLEADOS QUE EN SU APELLIDO CONTIENE LA LETRA ENTRE 
SELECT COUNT(*) as 'TOTAL' from Employees WHERE LastName   LIKE '%[A-F]%' --contador
--seleccionar todos los empleado en donde todos sus apellidos COMIENCEN con cb
SELECT*from Employees WHERE LastName like '[CB]%'
SELECT*from Employees WHERE LastName like '[^CB]%'--don like
--funciones de agregado,grup by,having y joins

/*
sum
count(*)
count(campo)
agv()
max()
min()
*/

use Northwind

--selecciona el numero total de ordenes realizadas
SELECT COUNT(*) as 'total de ordenes' FROM Orders

--cuenta los registros de un campo especifico sin contar las nulas
SELECT COUNT(ShipRegion) from Orders

--selecciona el numero de paises a los que les he enviado ordenes

SELECT count(distinct  ShipCountry) as 'Total de envios a paises' from Orders

--seleccionar el total de ordenes enviadas a francia entre 1996 y 1998
SELECT YEAR(OrderDate)as año FROM Orders
SELECT OrderID as 'numero orden ',OrderDate as 'fecha orden',YEAR(OrderDate) as Año FROM Orders WHERE OrderDate BETWEEN '1996-01-01' and '1998-12-31'

SELECT COUNT(*) as 'Total de ordenes' from Orders
WHERE ShipCountry='Mexico' and YEAR(ShippedDate) BETWEEN'1996' and '1998';
--seleccionar el precion minimo de los prductos
select MIN(UnitPrice) as 'precio Minimo' from Products

--seleccionar el producto mas caro 
select max(UnitPrice) as 'precio Maximo'  from Products

--selecciona el nombre del prudcto y su precio mas caro

SELECT top 1 ProductName, UnitPrice from Products
order BY UnitPrice desc


--seleccionar el monto total de las ordenes 
Select (UnitPrice  * Quantity) as 'Total de ventas' FROM [Order Details]
--seleccionar el total de ventas realizadas a los productos que no tiene descuento
Select sum(UnitPrice  * Quantity) as 'Total de ventas' FROM [Order Details] WHERE Discount=0;
--SELECCIONAR EL PROMEDIO DE VENTAS PARA LOS PRODUCTOS SINGAPOREAN HOKKIE FRIED MEY MOZZARELLA DI GIOVANNI 
SELECT avg(UnitPrice* Quantity) AS 'total de ventas' FROM [Order Details] WHERE ProductID= 72 or ProductID=42
--seleccionar el total de ventas para el cliente chop suey chinese de 1996 a 1998 
--seleccionar los dstos de las tablas  de categoria y de productos 
SELECT*FROM Categories as c INNER join Products as p on c.CategoryID=p.CategoryID

SELECT c.CategoryName AS 'Nombre categoria ',p.ProductName as 'nombre del producto',p.UnitPrice as 'precio unitario',p.UnitsInStock 'existencia', *FROM Categories as c INNER join Products as p on c.CategoryID=p.CategoryID
--seleccionar los productos de las categorias beverages
SELECT c.CategoryName AS 'Nombre categoria ',p.ProductName as 'nombre del producto',p.UnitPrice as 'precio unitario',p.UnitsInStock 'existencia', *FROM Categories as c INNER join Products as p on c.CategoryID='beverages' and p.UnitPrice>20 
-- seleccionar el numero de paises a los que he enviado ordenes 
--Joins







--Ejercicio 2 
SELECT p.ProductName as 'Nombre del producto',
s.CompanyName as 'Nombre del proveedor'
 FROM Products as p
 inner JOIN Suppliers as s 
 on p.SupplierID=s.SupplierID;


Select p.ProductName,p.UnitPrice,s.CompanyName
from (
    select SupplierID,ProductName,UnitPrice FROM Products 
) as p
INNER JOIN 
Suppliers as s 
on p.SupplierID=s.SupplierID;
--Segunda

Select p.ProductName,p.UnitPrice,s.CompanyName
from (
    select SupplierID,ProductName,UnitPrice FROM Products 
) as p
INNER JOIN
( 
select SupplierID,CompanyName FROM Suppliers
) as s 
on p.SupplierID=s.SupplierID;

SELECT c.ContactName as 'Nombre cliente' ,YEAR(o.OrderDate )as 'Año de compra',MONTH(o.OrderDate) AS 'mes de compra',Day(o.OrderDate) AS 'Dia compra', o.OrderID FROM Customers as c
INNER JOIN Orders as o  
 on o.CustomerID=c.CustomerID;


 select o.OrderID as 'Número de Orden',
c. CompanyName as 'Nombre del Cliente',
 o.OrderDate as 'Fecha de orden', 
 year (o.OrderDate) as 'AÑO de Compra' ,
 month(o. OrderDate) as 'MES de Compra',
  day(o.OrderDate) as 'DIA de Compra'
  from(
select CustomerID, CompanyName from Customers)as c
INNER JOIN
( select CustomerID, OrderID, OrderDate from Orders ) as o
on c. CustomerID = o. CustomerID;

--  4 
SELECT CONCAT(e.FirstName,'',e.LastName) as 'Nombre del empleado' ,e.Title as 'cargo',
t.TerritoryDescription as 'territorio'

 FROM EmployeeTerritories as et
INNER JOIN Employees as e 
ON et.EmployeeID=e.EmployeeID
INNER JOIN Territories as t 
ON t.TerritoryID=et.TerritoryID;


----------------------------------------

SELECT CONCAT(e.FirstName,'',e.LastName) as 'Nombre del empleado' ,e.Title as 'cargo',
t.TerritoryDescription as 'territorio'

 FROM (
    select TerritoryID,EmployeeID from EmployeeTerritories) as et
INNER JOIN (select EmployeeID,FirstName,LastName,Title from Employees) as e 
ON et.EmployeeID=e.EmployeeID
INNER JOIN (select TerritoryID,TerritoryDescription from Territories) as t 
ON t.TerritoryID=et.TerritoryID;


----Ejercicio de reto
--seleccionar todas las ordenes mostrando el empleado que las realizo, cleinte ala que se le vendio el nombre de los productos,el precio que se vendio las unidades vendidas y el importe para de enero de 1997 a febrero de 1998
 SELECT e.FirstName,p.ProductName from Employees as e 
 INNER JOIN  Products as p 
 ---
 SELECT CONCAT(FirstName,'',LastName) as 'empleado'
  FROM Employees as e 
  on e.ABORT



  ------saber cuanto a vendido categoria beverage
  SELECT p.UnitPrice,ca.CategoryName from Products as P
  INNER JOIN Categories as CA 
  on p.CategoryID=ca.CategoryID
  INNER join [Order Details]
 as od 
 on od.OrderID=
select DATEPART(year,'2024-06-06') as 'Año',
 DATENAME(MONTH,'2024-06-06') as 'Mes',
  DATENAME(WEEK,'2024-06-06') as 'semana',
  DATENAME(WEEKDAY,'2024-06-06') as 'Dia de la semana',
   DATENAME(day,'2024-06-06') as 'Dia',
 DATENAME(QUARTER,'2024-06-06') as 'Trimestre'
--funcion que devuelve alguna parte de una fecha
select DATEPART(year,OrderDate) as 'Año',
 DATEPART(MONTH,OrderDate) as 'Mes',
  DATEPART(WEEK,OrderDate) as 'semana',
  DATEPART(WEEKDAY,OrderDate) as 'Dia de la semana',
   DATEPART(day,OrderDate) as 'Dia',
 DATEPART(QUARTER,OrderDate) as 'Trimestre' ,
  DATEPART(YY,OrderDate) as 'Año 2' 
 FROM Orders;
--funcion que devuelve el nombre de una funcion o dia
SELECT DATENAME(MONTH,GETDATE()) AS mes

set LANGUAGE spanish

SELECT DATENAME(MONTH,GETDATE()) as mes ,DATENAME(WEEKDAY,GETDATE()) as dia 


