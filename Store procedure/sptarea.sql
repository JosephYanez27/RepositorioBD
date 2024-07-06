use Northwind
--Clinte
CREATE OR ALTER PROCEDURE sp_Actualizar_Insertar_Clientes
AS
BEGIN
    -- Actualizar registros existentes
    UPDATE AlmacenDatos.dbo.Customers
    SET 
        Clientebk = n.CustomerID,
        CompanyName = ISNULL(n.CompanyName, 'no tiene CompanyName'),
        [Address] = ISNULL(n.[Address], 'no tiene Address'),
        City = ISNULL(n.City, 'no tiene City'),
        Region = ISNULL(n.Region, 'no tiene Region'),
        Country = ISNULL(n.Country, 'no tiene Country')
    FROM Northwind.dbo.Customers AS n
    INNER JOIN AlmacenDatos.dbo.Customers AS a
    ON n.CustomerID = a.Clientebk
    WHERE 
        a.Clientebk <> n.CustomerID OR
        a.CompanyName <> ISNULL(n.CompanyName, 'no tiene CompanyName') OR
        a.[Address] <> ISNULL(n.[Address], 'no tiene Address') OR
        a.City <> ISNULL(n.City, 'no tiene City') OR
        a.Region <> ISNULL(n.Region, 'no tiene Region') OR
        a.Country <> ISNULL(n.Country, 'no tiene Country');

    -- Insertar registros nuevos
    INSERT INTO AlmacenDatos.dbo.Customers (Clientebk, CompanyName, [Address], City, Region, Country)
    SELECT 
        n.CustomerID,
        ISNULL(n.CompanyName, 'no tiene CompanyName'),
        ISNULL(n.[Address], 'no tiene Address'),
        ISNULL(n.City, 'no tiene City'),
        ISNULL(n.Region, 'no tiene Region'),
        ISNULL(n.Country, 'no tiene Country')
    FROM Northwind.dbo.Customers AS n
    LEFT JOIN AlmacenDatos.dbo.Customers AS a
    ON n.CustomerID = a.Clientebk
    WHERE a.Clientebk IS NULL;
END;


EXEC sp_Actualizar_Insertar_Clientes;

	select * from AlmacenDatos.dbo.Customers;
	select * from Northwind.dbo.Customers;