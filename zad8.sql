--1
BEGIN
DECLARE @s_stawka FLOAT;
SET @s_stawka = (SELECT AVG(Pay.PayFrequency * Pay.Rate) FROM AdventureWorks2017.HumanResources.EmployeePayHistory Pay);
SELECT @s_stawka AS s_stawka;
SELECT Emp.*, Pay.Rate, Pay.PayFrequency FROM AdventureWorks2017.HumanResources.Employee Emp, AdventureWorks2017.HumanResources.EmployeePayHistory Pay
WHERE Pay.BusinessEntityID = Emp.BusinessEntityID AND (Pay.Rate * Pay.PayFrequency) < @s_stawka
END;
--2
CREATE FUNCTION
d_wys (@w INT)
RETURNS TABLE AS
RETURN SELECT Header.ShipDate AS d_wys FROM AdventureWorks2017.Sales.SalesOrderHeader Header
WHERE Header.SalesOrderID = @w;
--3
CREATE PROCEDURE
info (@naz_p nvarchar(50))
AS
SELECT Product.ProductID, Product.ProductNumber, Product.SellEndDate FROM AdventureWorks2017.Production.Product Product
WHERE Product.Name = @naz_p;
--4
CREATE FUNCTION
nr_karty (@id  INT)
RETURNS TABLE AS
RETURN (SELECT Header.*, CreditCard.CardNumber FROM AdventureWorks2017.Sales.CreditCard CreditCard, AdventureWorks2017.Sales.SalesOrderHeader Header
WHERE CreditCard.CreditCardID = Header.CreditCardID AND Header.SalesOrderID = @id);
--5
CREATE PROCEDURE
wyn_dziel (@num1 FLOAT , @num2 FLOAT)
AS
BEGIN
IF @num1 < @num2
	PRINT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
ELSE
	SELECT @num1/@num2 AS wynik_dzielenia
END;
