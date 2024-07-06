--Crear Base de datos con nombre asignado
CREATE DATABASE EjerciciosJoins;
use EjerciciosJoins; 
--2


create TABLE Empleado (
Idempleado INT not null IDENTITY(1,1) ,
    Nombrecompleto VARCHAR(50),
    titulo VARCHAR(50),
    diadecontratacion DATETIME

);
--3
SET IDENTITY_INSERT Empleado ON;

INSERT INTO Empleado (Idempleado, Nombrecompleto, titulo, diadecontratacion)
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName), Title, HireDate
FROM Northwind.dbo.Employees;
SET IDENTITY_INSERT Empleado off;
--4

 SET IDENTITY_INSERT Empleado ON;
INSERT into Empleado (Idempleado, Nombrecompleto, titulo, diadecontratacion)
VALUES (10,'Jorge Maynez','Sales Representative',1992-04-01 ),
 (11,' Yañez','Sales Representative',1992-04-01 );
SELECT*from Empleado;
--5
