use bdVentas1
Select * from [Northwind].dbo.Customers
go
select * from cliente;
--Selecciona que ahi termina 
go
-- Inserta En la tabla clientes en una sola instruccion
insert into cliente(rfc,curp,nombre,apellido1,apellido2)
Values ('GDIE19830406X9X','JLHG198304086',' Thomas Hardy Fut','XYTFDD','Futterskiste'),
('GDIE1983EWEuju','JLHG19830456',' Thomas Hardy Fut','XYTFDD','Futterskiste'),
('GDIE1983GREBRE','JLHG19830476',' Thomas Hardy Fut','XYTFDD','Futterskiste')
--consulta
select * from cliente
--elimina datos de la tabla cliente
delete cliente
-- Comando para reiniciar el identity de una tabla
DBCC CHECKIDENT(cliente,RESEED,0)
-- crea una tabla apartir de una consulta
select top 0  EmployeeID as 'EmpleadoID', LastName as 'Primer Nombre ',FirstName AS Nombre,BirthDate as 'Fecha de Nacimiento',HireDate as 'Fecha contratacion'
,[Address] as 'Direccion' ,City as 'Ciudad',Region ,PostalCode as 'Codigo Postal',Country as 'Pais' into empleado2 





order by OrderID desc

select * from empleado2;
select * from cliente
select * from Empleado
select*from ordenCompra

insert into Empleado(nombre,apellido1,apellido2,curp,rfc,numeroexterno,calle
,salario,numeronomina)
values('Alan','Santiago','Molina','SAT324325HF','ALM3543rf'
,23,'calle del Infierno',708900,12345),
('Yamileth','Mejia','Rangel','YMER325453H','frg4rtg4324',null,'Calle del hambre',689900,2341),
('Moises','Santiago','Isidro','YMER3254dfe','frg4rtgdegf',null,'Calle de la gordura',800000,2324)
alter table  empleado2
add constraint pk_empleado2
primary key (EmpleadoID)
select GETDATE()
insert into ordenCompra 
values (GETDATE(),8,9),
 (GETDATE(),9,10)

 select*from ordenCompra

insert into empleado2 (EmpleadoID,[Primer Nombre ],Nombre,[Fecha de Nacimiento],[Fecha contratacion],Direccion,Ciudad,[Codigo Postal],Pais)
select   EmployeeID as 'EmpleadoID', LastName as 'Primer Nombre ',FirstName AS Nombre,BirthDate as 'Fecha de Nacimiento',HireDate as 'Fecha contratacion'
,[Address] as 'Direccion' ,City as 'Ciudad',PostalCode as 'Codigo Postal',Country as 'Pais'  from  Northwind.dbo.Employees

select* from Northwind.dbo.Products


select SupplierID ,CompanyName,PostalCode,'calle de la soledad',City,2345 as cp,'www.prueba.com.mx' as 'paginaweb' from Northwind.dbo.Suppliers
select* from Northwind.dbo.Products
delete from Proveedor
select * from ordenCompra

insert into detallecompra
values (2,2,20,(select precio from producto where numerocontrol=2))

update producto
set precio=20.2
where numerocontrol=1
insert into detallecompra
values (2,2,20,(select precio from producto where numerocontrol=2))
select*,(cantidad*preciocompra)as importe from detallecompra where productoid=1
select sum(cantidad*preciocompra)as 'total a pagar' from detallecompra where productoid=1