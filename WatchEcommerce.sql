-- Watch E-commerce Database Schema
-- Created for ASP.NET, Entity Framework project

-- Drop tables if they exist (for clean recreation)
IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL DROP TABLE OrderDetails;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('CartItems', 'U') IS NOT NULL DROP TABLE CartItems;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Categories', 'U') IS NOT NULL DROP TABLE Categories;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;

-- Categories table
CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Products table (Watches)
CREATE TABLE Products
(
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(200) NOT NULL,
    CategoryID INT NOT NULL,
    Brand NVARCHAR(100),
    Price DECIMAL(18,2) NOT NULL,
    StockQuantity INT NOT NULL DEFAULT 0,
    Description NVARCHAR(MAX),
    ImageURL NVARCHAR(500),
    IsActive BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Customers table
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(500),
    City NVARCHAR(100),
    Country NVARCHAR(100),
    CreatedDate DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);

-- Orders table
CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(18,2) NOT NULL,
    Status NVARCHAR(50) NOT NULL, -- Pending, Processing, Shipped, Delivered, Cancelled
    ShippingAddress NVARCHAR(500),
    PaymentMethod NVARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Order Details table
CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    Subtotal AS (Quantity * UnitPrice) PERSISTED,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Shopping Cart table
CREATE TABLE CartItems
(
    CartItemID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    AddedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample categories
INSERT INTO Categories (CategoryName, Description)
VALUES 
    (N'Đồng hồ nam', N'Đồng hồ dành cho nam giới'),
    (N'Đồng hồ nữ', N'Đồng hồ dành cho nữ giới'),
    (N'Đồng hồ thể thao', N'Đồng hồ thể thao và outdoor'),
    (N'Đồng hồ thông minh', N'Smartwatch và wearable devices'),
    (N'Đồng hồ cao cấp', N'Đồng hồ luxury và premium');

-- Insert sample products
INSERT INTO Products (ProductName, CategoryID, Brand, Price, StockQuantity, Description, ImageURL)
VALUES 
    (N'Rolex Submariner', 5, N'Rolex', 250000000, 5, N'Đồng hồ lặn cao cấp với thiết kế iconic', N'/images/rolex-submariner.jpg'),
    (N'Omega Seamaster', 5, N'Omega', 180000000, 8, N'Đồng hồ thể thao sang trọng', N'/images/omega-seamaster.jpg'),
    (N'Casio G-Shock', 3, N'Casio', 3500000, 50, N'Đồng hồ thể thao chống sốc', N'/images/casio-gshock.jpg'),
    (N'Apple Watch Series 9', 4, N'Apple', 12000000, 30, N'Smartwatch với nhiều tính năng sức khỏe', N'/images/apple-watch-9.jpg'),
    (N'Seiko Presage', 1, N'Seiko', 15000000, 20, N'Đồng hồ cơ tự động Nhật Bản', N'/images/seiko-presage.jpg'),
    (N'Citizen Eco-Drive', 1, N'Citizen', 8000000, 25, N'Đồng hồ năng lượng ánh sáng', N'/images/citizen-ecodrive.jpg'),
    (N'Michael Kors Lexington', 2, N'Michael Kors', 6500000, 15, N'Đồng hồ thời trang cao cấp cho nữ', N'/images/mk-lexington.jpg'),
    (N'Daniel Wellington Classic', 2, N'Daniel Wellington', 4200000, 40, N'Đồng hồ tối giản Scandinavian', N'/images/dw-classic.jpg'),
    (N'Garmin Fenix 7', 3, N'Garmin', 18000000, 12, N'Đồng hồ GPS cho vận động viên', N'/images/garmin-fenix7.jpg'),
    (N'Tag Heuer Carrera', 5, N'Tag Heuer', 120000000, 6, N'Đồng hồ đua xe huyền thoại', N'/images/tag-carrera.jpg');

-- Insert sample customers
INSERT INTO Customers (FullName, Email, PasswordHash, PhoneNumber, Address, City, Country)
VALUES 
    (N'Nguyễn Văn An', N'an.nguyen@email.com', N'hashed_password_1', N'0901234567', N'123 Lê Lợi', N'Hồ Chí Minh', N'Việt Nam'),
    (N'Trần Thị Bình', N'binh.tran@email.com', N'hashed_password_2', N'0912345678', N'456 Trần Hưng Đạo', N'Hà Nội', N'Việt Nam'),
    (N'Lê Văn Cường', N'cuong.le@email.com', N'hashed_password_3', N'0923456789', N'789 Nguyễn Huệ', N'Đà Nẵng', N'Việt Nam');

-- Create indexes for performance
CREATE INDEX IX_Products_CategoryID ON Products(CategoryID);
CREATE INDEX IX_Orders_CustomerID ON Orders(CustomerID);
CREATE INDEX IX_OrderDetails_OrderID ON OrderDetails(OrderID);
CREATE INDEX IX_OrderDetails_ProductID ON OrderDetails(ProductID);
CREATE INDEX IX_CartItems_CustomerID ON CartItems(CustomerID);

-- Sample queries for testing
-- View all products with categories
SELECT p.ProductID, p.ProductName, c.CategoryName, p.Brand, p.Price, p.StockQuantity
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.IsActive = 1
ORDER BY p.ProductName;

-- View products by price range
SELECT ProductName, Brand, Price, StockQuantity
FROM Products
WHERE Price BETWEEN 5000000 AND 20000000
ORDER BY Price;

-- View top selling categories (would need actual sales data)
SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY ProductCount DESC;
