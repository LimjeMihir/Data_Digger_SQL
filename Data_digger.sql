-- Create a database....
CREATE DATABASE Abc_company;

-- USE the database....
USE Abc_company;

-- Creating the Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255)
);

-- Creating the Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Creating the Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Creating the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- INSERT RECORDS INTO TABLE....
INSERT INTO Customers (Name, Address)
VALUES 
    ('Aarav', '123 Rajpur Road, Dehradun, Uttarakhand'),
    ('Karan', '456 Lajpat Nagar, Delhi'),
    ('Mihir', '789 MG Road, Bangalore, Karnataka'),
    ('Neha', '101 Khar Road, Mumbai, Maharashtra'),
    ('Manish', '202 Boring Canal Road, Patna, Bihar'),
    ('Dhruv', '303 Banjara Hills, Hyderabad, Telangana'),
    ('Karan', '404 Mall Road, Amritsar, Punjab'),
    ('Anjali', '505 Jubilee Hills, Hyderabad, Telangana'),
    ('Shivani', '606 Sector 21, Faridabad, Haryana'),
    ('Karan', '707 MG Road, Pune, Maharashtra');

-- Retrieve all customers...
SELECT * FROM Customers;

-- Update a customer's address...
UPDATE Customers
SET Address = '15 New Road, Varanasi, Uttar Pradesh'
WHERE Name = 'Manish';

-- Delete a customer usilg their CustomerID...
DELETE FROM Customers
WHERE CustomerID = 10;

SELECT * FROM Customers;

-- Disphy an customers whose name 'karan'..
SELECT * FROM Customers
WHERE Name = 'Karan';


-- INSERT RECORDS INTO ORDERS TABLE...
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
    (1, '2025-03-01', 55000.00),
    (2, '2025-03-02', 18000.00),
    (3, '2025-03-03', 5000.00),
    (4, '2025-03-04', 25000.00),
    (5, '2025-03-05', 12000.00),
    (6, '2025-03-06', 10000.00);


-- Retrieve all orders..
SELECT * FROM Orders;

-- Retrieve all orders made by a  specific customer.
SELECT * 
FROM Orders
WHERE CustomerID = 5;

-- Update an order's total amount..
UPDATE Orders
SET TotalAmount = 11000.00
WHERE OrderID = 1;

-- Delete an order using its OrderID...
DELETE FROM Orders
WHERE OrderID = 6;

SELECT * FROM Orders;

-- Retrieve orders placed in the last 30 days...
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- Retrieve orders placed in the last 30 days...
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 15 DAY;

-- Retrieve orders placed in the last 30 days...
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 17 DAY;

-- Retrieve the highest, lowest, and average order amount using aggregate functions..
SELECT 
    MAX(TotalAmount) AS HighestAmount,
    MIN(TotalAmount) AS LowestAmount,
    AVG(TotalAmount) AS AverageAmount
FROM Orders;

-- INSERT RECORDS INTO PRODUCTS...
INSERT INTO Products (ProductName, Price, Stock)
VALUES 
    ('Laptop', 50000.00, 50),
    ('Smartphone', 15000.00, 100),
    ('Headphones', 2500.00, 200),
    ('Keyboard', 1000.00, 150),
    ('Mouse', 500.00, 300),
    ('Smartwatch', 8000.00, 120),
    ('Monitor', 12000.00, 30),
    ('Charger', 700.00, 400),
    ('Speakers', 3500.00, 60),
    ('External Hard Drive', 6000.00, 0);

    
-- Retrieve all products...
SELECT * FROM Products;

-- Retrieve all products sorted by price in descending order..
SELECT * 
FROM Products
ORDER BY Price DESC;

-- Update the price of a specific product...
UPDATE Products
SET Price = 9000  
WHERE ProductID = 3; 

-- Delete a product if it's out of stock...
DELETE FROM Products
WHERE Stock = 0;

SELECT * FROM Products;

-- Retrieve products whose price is between 2500 and 22000...
SELECT * 
FROM Products
WHERE Price BETWEEN 2500 AND 22000;

-- Retrieve the most expensive and cheapest product using MAX() and MIN()..
-- Most expensive...
SELECT * 
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

-- Cheapest...
SELECT * 
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);


-- INSERT RECORDS INTO ORDERDETAILS..
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal)
VALUES
    (1, 1, 1, 50000.00),
    (2, 2, 1, 15000.00),
    (3, 3, 2, 35000.00),
    (4, 4, 2, 20000.00),
    (5, 5, 3, 80000.00);

-- Retrieve all order details...
SELECT * FROM OrderDetails;

-- Retrieve all order details for a specific order..
SELECT * 
FROM OrderDetails
WHERE OrderID = 5;

-- Calculate the total revenue generated from all orders using SUM()...
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;

-- Retrieve the top 3 most ordered products...
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;

-- Count how many times a product has been sold using COUNT()..
SELECT COUNT(*) AS ProductSoldCount
FROM OrderDetails
WHERE ProductID = 2;
