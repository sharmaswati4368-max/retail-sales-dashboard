CREATE DATABASE Retail_db;
USE Retail_db;
-- Customers Table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  Gender CHAR(1),
  City VARCHAR(100),
  Age INT
);

-- Products Table
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
  OrderDetailID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Insert into Customers
INSERT INTO Customers VALUES (1, 'Swati', 'F', 'Morena', 24);
INSERT INTO Customers VALUES (2, 'Aman', 'M', 'Gwalior', 28);

-- Insert into Products
INSERT INTO Products VALUES (101, 'Kadai Paneer', 'Food', 250);
INSERT INTO Products VALUES (102, 'Pizza', 'Fast Food', 350);

-- Insert into Orders
INSERT INTO Orders VALUES (5001, 1, '2025-07-25', 500);
INSERT INTO Orders VALUES (5002, 2, '2025-07-26', 350);

-- Insert into OrderDetails
INSERT INTO OrderDetails VALUES (1, 5001, 101, 2);  -- 2 Kadai Paneer
INSERT INTO OrderDetails VALUES (2, 5002, 102, 1);  -- 1 Pizza
SELECT * FROM Customers WHERE City = 'Morena';
SELECT c.CustomerName, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
SELECT c.City, SUM(o.TotalAmount) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY TotalSales DESC;
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC;
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 3;
SELECT 
  o.OrderID,
  p.ProductName,
  od.Quantity,
  p.Price,
  (od.Quantity * p.Price) AS Total
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID;
CREATE VIEW CustomerSummary AS
SELECT 
  c.CustomerID,
  c.CustomerName,
  COUNT(o.OrderID) AS TotalOrders,
  SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;
SELECT * FROM CustomerSummary;
SELECT 
  c.CustomerName,
  SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING TotalSpent > (
  SELECT AVG(TotalAmount) FROM Orders
);
SELECT 
  c.CustomerName,
  SUM(o.TotalAmount) AS TotalSpent,
  RANK() OVER (ORDER BY SUM(o.TotalAmount) DESC) AS SpendingRank
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
SELECT 
  p.ProductName,
  SUM(od.Quantity) AS TotalSold,
  DENSE_RANK() OVER (ORDER BY SUM(od.Quantity) DESC) AS QuantityRank
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;
select*from customers;
SELECT * FROM your_table_name LIMIT 10;
USE retail_db;



