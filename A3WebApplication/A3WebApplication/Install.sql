-- 30 MARKS TOTAL
use master
go
drop database dbA3
go
create database dbA3
go
use dbA3
-- TODO: Database

-- Complete these tables (3 marks), 
-- inserts (1 mark) 
-- stored procedures (20 marks total)
-- reports (6 marks)

CREATE TABLE tbCustomer -- AccessLevel is a BIT, 1 is admin, 0 is not an admin
(			CustomerID int identity(1,1) Primary key,
			FirstName VARCHAR(MAX),
			LastName VARCHAR(MAX),
			Address VARCHAR(MAX),
			City VARCHAR(MAX),
			PhoneNumber VARCHAR(MAX),
			UserName VARCHAR(MAX),
			Password VARCHAR(MAX),
			AcessLevel BIT
)
CREATE TABLE tbCategory
(			CategoryID INT IDENTITY(1,1) PRIMARY KEY,
			Name VARCHAR(MAX),
			--CustomerID INT FOREIGN KEY REFERENCES tbCustomer(CustomerID),
			ImagePath VARCHAR(MAX)
)
CREATE TABLE tbProduct -- there are many products in a single category
(			 ProductID INT IDENTITY(1,1) PRIMARY KEY,
			 Name VARCHAR(MAX),
			 Price DECIMAL(10,2),
			 PrimaryImagePath VARCHAR(MAX),
			 CategoryID INT FOREIGN KEY REFERENCES tbCategory(CategoryID)
			 
)
CREATE TABLE tbOrder -- an order happens on a date by a customer
(			OrderID int identity(1,1) primary key,
			CustomerID INT FOREIGN KEY REFERENCES tbCustomer(CustomerID),
			CategoryID INT FOREIGN KEY REFERENCES tbCategory(CategoryID),
			ProductID INT FOREIGN KEY REFERENCES tbProduct(ProductID)
			/*,
			PricePaid INT*/
			-- come back to this later add product name and customer name?
) 
CREATE TABLE tbOrderDetail -- there can be many details in an order, each detail contains the product purchased, the price paid at the time for the product multiplied by the quantity
(			
			OrderDetailID int identity(1,1) primary key,
			PricePaid DECIMAL(10,2),
			Quantity INT,
			OrderDate DATE,
			ProductID int foreign key references tbProduct(ProductID),
			CustomerID int foreign key references tbCustomer(CustomerID),
			CategoryID int foreign key references tbCategory(CategoryID)
)
INSERT INTO tbCustomer(FirstName,LastName,Address,City,PhoneNumber,UserName,Password,AcessLevel) VALUES
																													 ('rj','candoy','somewhere on manitoba','WPG','204','rjayop','rjaypassword','0'),
																													 ('omar','something','somewhere here','WPG','204','omar','omarpassword','0'),
																													 ('andrew','leake','somewhere on portage','WPG','204','andrew','andrewpassword','0'),
																													 ('joshua','caniouras','somewhere in st vital','WPG','204','josh','joshpassword','0'),
																													 ('michael','olazo','somewhere in garden grove','WPG','204','michaeladmin','adminpassword','1')  
																														-- 5, 1 admin, 4 non-admins
																														

INSERT INTO tbCategory(Name,ImagePath) VALUES
																													('Grounded','grounded.jpg'),
																													('Flying','Flying.jpg'),
																													('Mage','mage.png'),
																													('Doug/Boss','dougboss.jpg') -- 4 categories

INSERT INTO tbProduct(Name,Price,PrimaryImagePath,CategoryID)				VALUES('Slime','15.00','groundedslime.jpg',1),
																																	('Mushroom','20.00','groundedmushroom.png-c200',1),
																																	('Pig','10.00','groundedpig.png',1),
																																	('Zakum','200.00','groundedzakum.jpg',1),
																																	('Pianus Fish Thing','1000.00','groundedpianus',1),
																																	('Alf','9000.00','groundedalf.jpg',1),
																																	('Pidgey','300.00','flyingpidgey.jpg',2),
																																	('Noctowl','400.00','flyingowl.png',2),
																																	('Super Flying OP Monster a.k.a Ice Moltres','1.00','flyingice.jpg',2),
																																	('Best Mage','3.00','magepicture.jpg',3),
																																	('Boss.','1.00','dougboss.jpg',4)

																																	  -- 6 products in category one, 3 products in category two, 1 in category three


INSERT INTO tbOrder(CustomerID,ProductID,CategoryID) VALUES(2,10,3),(4,8,2),(1,11,4) -- bestmage(cost 3.00)andrew orders =3,noctowl(cost 400.00)omar orders=2,doug(cost 1.00) josh=4
																																					     -- 3 example orders from the non-admins


	INSERT INTO tbOrderDetail(CustomerID,ProductID,CategoryID,Quantity,PricePaid,OrderDate) VALUES(3,1,3,1,3,CURRENT_TIMESTAMP),
																																													(2,8,2,3,800.00,CURRENT_TIMESTAMP),
																																													(4,11,4,2,2.00,CURRENT_TIMESTAMP)

	SELECT * FROM tbCustomer
	SELECT * FROM tbCategory
	SELECT * FROM tbProduct
	SELECT * FROM tbOrder
	SELECT * FROM tbOrderDetail
	 -- one item on the first order, 3 items on the second order, 2 items on the third order


---- NOTE: All Insert procs *MUST* return the new identity number of the primary key.
---- Example: if you use spInsertCategory after there are 4 categories, it should return the value 5.
---- If a procedure says: ByID, it means return ALL rows in the table if an ID is not supplied (ISNULL)

--spGetCategoryByID
GO
CREATE PROC spGetCategoryByID
(@CategoryID INT =null
)
AS BEGIN
			SELECT * FROM tbCategory 
			WHERE CategoryID =ISNULL(@CategoryID,CategoryID)
END

--EXEC spGetCategoryByID
GO
--spInsertCategory
CREATE PROC spInsertCategory
(		@Name VARCHAR(MAX),
		@ImagePath VARCHAR(MAX)
	)
AS BEGIN
		INSERT INTO tbCategory(Name,ImagePath)
		VALUES(@Name,@ImagePath)
		SELECT SCOPE_IDENTITY() AS [CategoryID]
END
go
--spDeleteCategory
CREATE PROC spDeleteCategory
(
		@CategoryID INT
)
AS BEGIN
		DELETE FROM tbCategory
		WHERE CategoryID =@CategoryID
END
--spUpdateCategory
		--exec spInsertCategory @Name='new',@ImagePath='nothing'
go
--spLogin
CREATE PROC spLogin 
	(@UserName VARCHAR(MAX),
	@Password VARCHAR(MAX)
	 /*,
	@AcessLevel BIT */
	)

	AS BEGIN
				IF EXISTS (SELECT CustomerID FROM tbCustomer
				WHERE CustomerID =@UserName AND Password = @Password)
		BEGIN
				SELECT UserName FROM tbCustomer
				WHERE UserName = @UserName AND
				Password= @Password
END
		ELSE	
				SELECT 'Incorrect Login Info fam' as UserName
		END
--spGetCustomerByID
GO
CREATE PROC spGetCustomerByID
( 
		@CustomerID INT
)
AS BEGIN
		SELECT * FROM tbCustomer
		WHERE CustomerID =ISNULL(@CustomerID,CustomerID)
END
GO
--spInsertCustomer
CREATE PROC spInsertCustomer
(		@FirstName VARCHAR(MAX),
		@LastName VARCHAR(MAX),
		@Address VARCHAR(MAX),
		@City VARCHAR(MAX),
		@PhoneNumber VARCHAR(MAX),
		@UserName VARCHAR(MAX),
		@Password VARCHAR(MAX)
	)
AS BEGIN
		INSERT INTO tbCustomer(FirstName,LastName,Address,City,PhoneNumber,UserName,Password)
		VALUES(@FirstName,@LastName,@Address,@City,@PhoneNumber,@UserName,@Password)
		--SELECT SCOPE_IDENTITY() AS [CategoryID]
END
--spDeleteCustomer
--spUpdateCustomer

--spGetProductsByCategoryID
--spGetProductByID
--spInsertProduct
--spDeleteProduct
--spUpdateProduct

--spGetOrderByID
--spInsertOrder
--spDeleteOrder
--spUpdateOrder

--spGetOrderDetailByID
--spInsertOrderDetail
--spDeleteOrderDetail
--spUpdateOrderDetail
--spGetOrderAndDetailsByOrderID -- Show all Details based on the OrderID


---- Create these reports:
--1. Top 3 Customers for TOTAL spent among all orders
--2. Show each category and how many products are available in each
--3. Show the products listed by total amount paid (take into consideration quantity & price)