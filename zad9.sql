--zad1
CREATE FUNCTION f_Fibonacci(@n int)
RETURNS @num TABLE(nr int)
AS
BEGIN
	DECLARE @n1 INT = 0,@n2 INT =1,@i INT=0,@pom INT
	INSERT INTO @num VALUES(@n1),(@n2)
	WHILE (@i<=@n-2)
	BEGIN 
		INSERT INTO @num VALUES(@n2+@n1)
		SET @pom = @n2
		SET @n2 = @n2 + @n1
		SET @n1 = @pom
		SET @i += 1
	END	
	RETURN 
END

CREATE PROCEDURE
p_Fibonacci @n INT
AS
SELECT * FROM f_Fibonacci(@n);

--np.
EXEC p_Fibonacci @n=20;

--zad2
CREATE TRIGGER
LN_UPP ON AdventureWorks2017.Person.Person
FOR UPDATE AS
UPDATE AdventureWorks2017.Person.Person SET LastName = UPPER(LastName)

--np.
UPDATE AdventureWorks2017.Person.Person
SET FirstName='Terry' WHERE BusinessEntityID = 21;
SELECT * FROM AdventureWorks2017.Person.Person WHERE BusinessEntityID = 21;

--3
CREATE TRIGGER
taxRateMonitoring ON AdventureWorks2017.Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
	DECLARE @t1 FLOAT = (SELECT TaxRate FROM deleted);
	DECLARE @t2 FLOAT = (SELECT TaxRate FROM inserted);
	DECLARE @t3 FLOAT = 0.3* @t1;
	IF (@t2> (@t1 + @t3)) OR (@t2< (@t3))
		BEGIN
		PRINT 'ERROR - wartoœæ pola TaxRate nie mo¿e ulec zmainie o wiecej ni¿ 30%'
		ROLLBACK;
	END;
END;

--np.
SELECT * FROM AdventureWorks2017.Sales.SalesTaxRate WHERE SalesTaxRateID = 21;
UPDATE AdventureWorks2017.Sales.SalesTaxRate SET TaxRate = '15' WHERE SalesTaxRateID = 21;

