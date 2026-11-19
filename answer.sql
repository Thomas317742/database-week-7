
-- Week 7 Assignment: Database Design and Normalization
-- Student Name: THOMAS EKAMAIS
-- Date: 19/11/2026

-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)

-- Create your normalized table(s) below

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Insert your records below

INSERT INTO ProductDetail_1NF
(OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Display the normalized records

SELECT * FROM ProductDetail_1NF
  
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)

-- Create your Orders table below

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create your OrderItems table below

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

-- Display complete order details

SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID;

-- ==========================================
-- END OF WEEK 7 ASSIGNMENT
-- STUDENT NAME: THOMAS EKAMAIS
-- ==========================================
