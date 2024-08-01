--las transacciones son fundamentales para asegurar la consistencia 
--y la entegridad de dlos datos 
--Transaccion : es una unidad de trabajo que se ejecutade manera
--completamente exitosa o no se ejecuta en absoluto
--Begin  transaction :inicia una nueva transaction
--commit transaction: confirma todos los cambios  realizados durante la transaccion
--Rollback:revierte todos los cambios realizados durante la transaccion
use Northwind
select*from Categories

begin transaction

insert into Categories(CategoryName,Description)
values ('Categoria11','Los Remediales')

commit transaction

rollback transaction

Create 