create database prueba_triggers3
go
use prueba_triggers3
go
create table tablal
(id int not null primary key,
nombre varchar (50)not null);
go


create or alter trigger tg_verificar_insercion
on tablal
after insert 
as 
begin
	print 'se ejecuto el trigger en la tabla 1'
end;

insert into tablal 
values(1,'Nombre1');

delete tablal 
where id=1;

insert into tablal 
values(1,'Nombre1');
go

create or alter trigger tg_verificar_delete
on tablal
after delete
as 
begin
	print 'se ejecuto el trigger en la tabla 1'
end;
go
create or alter trigger tg_verificar_update
on tablal
after update 
as 
begin
	print 'se ejecuto el trigger en la tabla 1'
end;

update tablal
set nombre='Nombre Nuevo'
where id=1;


drop trigger tg_verificar_delete


create or alter trigger verificar_contenido_inserted
on tablal
after insert
as 
begin
--ver los datos de la tabla inserted
select *from inserted
end;

insert into tablal
values(6,'Nombre2'),(5,'Nombre3')
use Northwind

create or alter trigger verificar_inserted_categories
on categories
after insert
as
begin
select categoryid,categoryname,[description] from inserted;
end

insert into categories(Categoryname,description)
values('CategoriaNueva','Prueba Triggers')

begin transaction
create or alter trigger verificar_update_categories
on categories
after update
as
begin
select categoryid,categoryname,[description] from inserted;
select categoryid,categoryname,[description] from deleted;
end
rollback
update categories set categoryname='CategoriaOtra',
[description] ='si esta bien'
where  categoryid=9

drop trigger verificar_update_categories
drop trigger verificar_inserted_categories

--rtreyy5yer

create or alter trigger verificar_inserted_deleted
on categories
after insert,update,delete
as
begin
if exists(select 1 from inserted )and not exists(select 1 from deleted)
begin
print('Existen datos en la tabla inserted,se ejecuto insert')
end
if exists(select 1  from deleted)and not exists(select 1 from inserted)
begin 
print ('Existen datos en tabla deleted se realizo un delete')
end
end;

insert into categories (categoryname,[Description])
values('categoria10','pipon')

delete categories 
where categoryname='categoria10';

create or alter trigger verificar_inserted_deleted
on categories
after insert,update,delete
as
begin
if exists(select 1 from inserted )and not exists(select 1 from deleted)
begin
print('Existen datos en la tabla inserted,se ejecuto insert')
end
if exists(select 1  from deleted)and not exists(select 1 from inserted)
begin 
print ('Existen datos en tabla deleted se realizo un delete')
end
else if exists(select 1 from inserted )and exists(select 1 from deleted)
begin
print 'Exiten datos en las dos tablas ,se realizo un update '
end
end;
update categories set categoryname='Ctegoria123'


use prueba_triggers3
go
create table empleado
(id int not null primary key,
nombre varchar (50)not null,
salario money not null
);


create or alter trigger verificar_salario
on empleado
after insert,update
as 
begin
if exists(select 1 from inserted )and not exists(select 1 from deleted)
begin
print('Existen datos en la tabla inserted , se ejecuto insert')
begin
declare @salarioNuevo money
set @salarioNuevo=(select salario from inserted)
if @salarioNuevo>50000
begin
raiserror('El salario es mayor a 50000 y no esta permitido',16,1);
rollback transaction;
end
end
end
end;
