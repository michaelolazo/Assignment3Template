-- 30 MARKS TOTAL

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
			ImagePath VARCHAR(MAX)
)
CREATE TABLE tbProduct -- there are many products in a single category
(			 ProductID INT IDENTITY(1,1) PRIMARY KEY,
			 Name VARCHAR(MAX),
			 Price INT,
			 PrimaryImagePath VARCHAR(MAX),
			 CategoryID INT FOREIGN KEY REFERENCES tbCategory(ID)
			 
)
CREATE TABLE tbOrder -- an order happens on a date by a customer
(			OrderID int identity(1,1) primary key
			
)
CREATE TABLE tbOrderDetail -- there can be many details in an order, each detail contains the product purchased, the price paid at the time for the product multiplied by the quantity
(			OrderDetailID int identity(1,1) primary key,
			
)
INSERT INTO tbCustomer(UserName,Password,AcessLevel) VALUES('rjayop','rjaypassword','0'),
																													 ('omar','omarpassword','0'),
																													 ('andrew','andrewpassword','0'),
																													 ('josh','joshpassword','0'),
																													 ('michaeladmin','adminpassword','1')  
																														-- 5, 1 admin, 4 non-admins


INSERT INTO tbCategory -- 4 categories

INSERT INTO tbProduct  -- 6 products in category one, 3 products in category two, 1 in category three

INSERT INTO tbOrder    -- 3 example orders from the non-admins

INSERT INTO tbOrderDetail -- one item on the first order, 3 items on the second order, 2 items on the third order


-- NOTE: All Insert procs *MUST* return the new identity number of the primary key.
-- Example: if you use spInsertCategory after there are 4 categories, it should return the value 5.
-- If a procedure says: ByID, it means return ALL rows in the table if an ID is not supplied (ISNULL)

spGetCategoryByID
spInsertCategory
spDeleteCategory
spUpdateCategory

spLogin
spGetCustomerByID
spInsertCustomer
spDeleteCustomer
spUpdateCustomer

spGetProductsByCategoryID
spGetProductByID
spInsertProduct
spDeleteProduct
spUpdateProduct

spGetOrderByID
spInsertOrder
spDeleteOrder
spUpdateOrder

spGetOrderDetailByID
spInsertOrderDetail
spDeleteOrderDetail
spUpdateOrderDetail
spGetOrderAndDetailsByOrderID -- Show all Details based on the OrderID


-- Create these reports:
1. Top 3 Customers for TOTAL spent among all orders
2. Show each category and how many products are available in each
3. Show the products listed by total amount paid (take into consideration quantity & price)
