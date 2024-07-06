create DATABASE repasojoins;


CREATE TABLE Proveedor(
ProveedorID int not null IDENTITY (1,1),
nombre VARCHAR (50) not null,
limite_credito money not null,
constraint pk_proveedor
PRIMARY key (ProveedorID)
);


create table Producto(
    ProdID int not null identity(1,1),
    nombre varchar (100) not null,
    existencia int not null,
    precio money not null,
    Proveedor int,
    CONSTRAINT pk_producto
    PRIMARY KEY(ProdID),
CONSTRAINT fk_producto_proveedor
FOREIGN KEY(Proveedor)
REFERENCES Proveedor(ProveedorID) 
);

INSERT into Proveedor (nombre,limite_credito)
VALUES('Proveedor1',100000),
('Proveedor2',200000),
('Proveedor3',300000),
('Proveedor4',400000),
('Proveedor5',500000)
--error en el insert
INSERT into Producto (nombre,existencia,precio,Proveedor)
VALUES ('producto1',34,45.6,1),
('producto2',34,45.6,1),
('producto3',34,45.6,1),
('producto4',34,45.6,1)




SELECT*FROM Proveedor;
SELECT*FROM Producto;

--Consultas inner

SELECT pr.nombre as 'Nombre_Prodructo' ,pr.precio AS'Precio Producto',pr.existencia as [Existencia],p.nombre as 'Proveedor'
 FROM Proveedor as [P] INNER JOIN Producto as [Pr]
 ON pr.Proveedor=p.ProveedorID;

 --left join
 SELECT pr.nombre as 'Nombre_Prodructo' ,pr.precio AS'Precio Producto',pr.existencia as [Existencia],p.ProveedorID , p.nombre as 'Proveedor'
 FROM Proveedor as [P] LEFT JOIN Producto as [Pr]
 ON pr.Proveedor=p.ProveedorID;
--da mas campos
--alterar datos
UPDATE Proveedor
set nombre = 'Proveedor5'
WHERE ProveedorID=5;
--insert o modificar tabla 
INSERT into Proveedor()










--rigth joins
 SELECT pr.nombre as 'Nombre_Prodructo' ,pr.precio AS'Precio Producto',pr.existencia as [Existencia],p.ProveedorID , p.nombre as 'Proveedor'
 FROM Proveedor as [P] RIGHT JOIN Producto as [Pr]
 ON pr.Proveedor=p.ProveedorID;

 INSERT into Producto
 VALUES('Producto5',78.8,22,null)
 --full join
    SELECT pr.nombre as 'Nombre_Prodructo' ,pr.precio AS'Precio Producto',pr.existencia as [Existencia],p.ProveedorID , p.nombre as 'Proveedor'
    FROM Proveedor as [P] full join Producto as [Pr]
    ON pr.Proveedor=p.ProveedorID;
    --seleccionar todos los no nulos
     SELECT pr.nombre as 'Nombre_Prodructo' ,pr.precio AS'Precio Producto',pr.existencia as [Existencia],p.ProveedorID , p.nombre as 'Proveedor'
 FROM Proveedor as [P] RIGHT JOIN Producto as [Pr]
 ON pr.Proveedor=p.ProveedorID;




 SELECT p.ProveedorID from Proveedor
Select * from producto;


-- Consultas inner join 

-- Seleccionar todos los productos que tienen proveedor 

select pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.nombre as 'Proveedor'
From proveedor as [p]
inner join 
producto as [pr]
on p.provid = pr.proveedor;

-- Consulta Let Join 

-- Mostrar todos los proveedores y sus respectivos productos 

select pr.prodid ,pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.provid , p.nombre as 'Proveedor'
From proveedor as [p]
left join 
producto as [pr]
on p.provid = pr.proveedor;


update proveedor
set nombre = 'Proveedor6'
where provid = 5;

select * from proveedor

update proveedor
set nombre = 'Proveedor5'
where provid = 5;

insert into proveedor (nombre, limite_credito)
values('Proveedor 6', 45000);

delete from proveedor
where provid =  7;

update proveedor
set nombre='Proveedor6'
where provid = 6;


-- Utilizando rigth join 

select pr.prodid ,pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.provid , p.nombre as 'Proveedor'
From proveedor as [p]
Right join 
producto as [pr]
on p.provid = pr.proveedor;

insert into producto (nombre, precio, existencia, proveedor)
values('producto5', 78.8,22, null);

-- Full Join
select pr.prodid ,pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.provid , p.nombre as 'Proveedor'
From proveedor as [p]
full join 
producto as [pr]
on p.provid = pr.proveedor;

-- Seleccionar todos los proveedores que no tienen asignado productos
select  p.provid as 'Numero de Proveedor' , p.nombre as 'Proveedor'
From proveedor as [p]
left join 
producto as [pr]
on p.provid = pr.proveedor
where pr.prodid is null;

-- Seleccionar todos los productos que no tienen proveedor

select  pr.nombre, pr.precio, pr.Existencia
From proveedor as [p]
right join 
producto as [pr]
on p.provid = pr.proveedor
where p.provid is null
 