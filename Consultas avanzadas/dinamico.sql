
use Northwind
go
create or alter proc sp_select_table
@tabla nchar (50)
as
begin
DECLARE @query NVARCHAR(50);
    SET @query = 'SELECT * FROM ' + QUOTENAME(@tabla);
	exec (@query);
	--sp_execsql
end;
go 

exec sp_select_table 'products';
drop proc sp_select_table