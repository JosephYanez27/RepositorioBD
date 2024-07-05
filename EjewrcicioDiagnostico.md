# Requerimientos
controles los proveedores, clientes, empleados, categorías de producto y órdenes de compra. Para los proveedores se necesita almacenar un numero de control, nombre de la empresa, direcelón (numero, calle, colonia, estado), ep, teléfono, página web, teléfono de contacto o contactos del proveedor, hombre del contacto, esail del contacto, Para los empleados se desca almacenar un numero de nómina, nombre copleto del espleado, rfc, curp, salario (El salario máximo es de65800), para los ordenes de copra se necesita almacenar la fecha de creación de la orden, el empleado que la realizo, al cliente que se le vende, la fecha de entrega y los diferentes productos que contiene, El producto debe almacenar un numero de control y una descripción única, status, existencia y un precio. La categoría debe tener un identificadon y nombre único de categoría. La compra siempre debe tener un precio de venta que se obtiene del precio unitario del producto y una cantidad vendida.
# Diagrama E-R
# Diagrama Relacional
![Diagrama relacional](/Ejercicio1.png);
# creacion de Base de Datos con  Lenguaje SQL-LDD
 ``` sql
 create table cliente(
clienteID int not null identity(1,1),
rfc varchar (20),
curp varchar(18) not null,
nombre varchar(50) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
constraint PKCliente
primary key(clienteID),
constraint unico_rfc
unique (rfc),
constraint unico_curp
unique(curp)
);

create table contacto_proveedor(
contactoID int not null identity(1,1),
proveedorid int not null,
nombres varchar(50) not null,
apellido1 varchar(50) not null, 
apellido2 varchar(50)not null
constraint pk_contactoproveedor
primary key(contactoID)
);

create table proveedor(
proveedorid int not null identity(1,1),
nombreEmpresa varchar(50) not null,
rfc varchar(20) not null,
calle varchar(30) not null,
colonia varchar(50) not null,
cp int not null,
paginaweb varchar(80),
constraint pk_proveedor
primary key(proveedorid),
constraint unico_nombreEmpresa
unique(nombreEmpresa),
constraint unico_rfc2
unique(rfc),
);

alter table contacto_proveedor
add constraint fk_contactopproveedor_proveedor
foreign key(proveedorid)
references proveedor(proveedorid)


create table empleado(
empleadoid int not null identity(1,1),
nombre varchar(50) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
rfc varchar(20) not null,
curp varchar(18) not null,
numeroexterno int,
calle varchar(50) not null,
salario money not null,
numeronomina int not null,
constraint pk_empleado
primary key(empleadoid),
constraint unico_rfcEmpleado
unique (rfc),
constraint unic_curpEmpleado
unique(curp),
constraint chk_salario
check(salario>=0.0 and salario<=100000),
-- check(salario between 0.1 and 100000)
constraint unico_numeronomina_empleado
unique(numeronomina)
);


create table telefonoProveedor(
telefonoid int not null,
proveedorid int not null,
numerotelefono varchar(15),
constraint pk_telefonoProveedor
primary key(telefonoid,proveedorid),
constraint pk_telefonoProv_proveedor
foreign key(proveedorid)
references proveedor(proveedorid)
on delete cascade
on update cascade
);

create table producto(
numerocontrol int not null identity(1,1),
descripcion varchar(50) not null,
precio money not null,
[status] int not null,
existencia int not null,
proveedorid int not null,
constraint pk_Producto
primary key (numerocontrol),
constraint unico_descripcion
unique(descripcion),
constraint chk_precio
check (precio between 1 and 200000),
constraint chk_status
check ([status]=1 or [status]=0),
constraint chk_existencia
check (existencia>0),
constraint fk_producto_proveedor
foreign key (proveedorid)
references proveedor(proveedorid)
);


create table ordenCompra(
numeroorden int not null identity(1,1),
fechacompra date not null,
clienteid int not null,
empleadoid int not null
constraint pk_Ordencompra
primary key(numeroorden)
constraint fk_ordencompra_cliente
foreign key(clienteid)
references cliente(clienteid),
constraint fk_ordencompra_empleado
foreign key(empleadoid)
references empleado(empleadoid)
);

create table detallecompra(
productoid int not null,
numeroorden int not null,
cantidad int not null ,
preciocompra money not null,
constraint pk_detallecompra
primary key (productoid, numeroorden),
constraint fk_ordencompra_producto
foreign key (productoid)
references producto(numerocontrol),
constraint fk_ordencompra_compra
foreign key(numeroorden)
references ordenCompra(numeroorden)
);
```