
-- DATABASE NORMALIZATION ASSIGNMENT
-- QUESTION 1: FIRST NORMAL FORM (1NF)

-- Create database
CREATE DATABASE NormalizationAssignment;

USE NormalizationAssignment;

-- Create ProductDetail_1NF table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Insert normalized records
INSERT INTO ProductDetail_1NF
(OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Display 1NF table
SELECT * FROM ProductDetail_1NF;


-- QUESTION 2: SECOND NORMAL FORM (2NF)

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);

-- Insert records into Orders table
INSERT INTO Orders
(OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert records into OrderItems table
INSERT INTO OrderItems
(OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Display Orders table
SELECT * FROM Orders;

-- Display OrderItems table
SELECT * FROM OrderItems;

-- Join both tables to display complete order details
SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderI
