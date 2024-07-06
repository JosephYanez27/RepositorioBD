--sp
use Northwind
create or alter procedure sp_vetas_proveedor
@year int ,@month int ,@day int
as
begin
select s.CompanyName,sum(od.UnitPrice*od.Quantity) from  Suppliers as s
inner join Products as p
on s.SupplierID=p.SupplierID
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on o.OrderID=od.OrderID
where  datepart (year ,o.OrderDate) =@year
and datepart (month ,o.OrderDate)=@month
and datepart (day,o.OrderDate)=@day
group by s.CompanyName
order by s.CompanyName;
end

go
exec
--hacer el mismo pero que aparezca el nombre del mes en ves de la fecha


use Northwind
create or alter procedure sp_vetas_proveedor_l
@year Varchar ,@month Varchar ,@day varchar
as
begin
select s.CompanyName,sum(od.UnitPrice*od.Quantity) from  Suppliers as s
inner join Products as p
on s.SupplierID=p.SupplierID
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on o.OrderID=od.OrderID
where  datepart (year ,o.OrderDate) =@year
and datepart (month ,o.OrderDate)=@month
and datepart (day,o.OrderDate)=@day
group by s.CompanyName
order by s.CompanyName;
end


