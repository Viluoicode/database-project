# Watch E-commerce Website

## Mô tả dự án
Website thương mại điện tử bán đồng hồ được xây dựng bằng C#, ASP.NET Core MVC và Entity Framework Core.

## Công nghệ sử dụng
- **Framework**: ASP.NET Core 8.0 MVC
- **ORM**: Entity Framework Core 8.0
- **Database**: SQL Server
- **Frontend**: Bootstrap 5, Razor Views
- **Ngôn ngữ**: C# 12

## Cấu trúc dự án

### WatchEcommerce/
- **Models/**: Các model cho database
  - Category.cs - Danh mục sản phẩm
  - Product.cs - Sản phẩm đồng hồ
  - Customer.cs - Khách hàng
  - Order.cs - Đơn hàng
  - OrderDetail.cs - Chi tiết đơn hàng
  - CartItem.cs - Giỏ hàng

- **Data/**: Database Context
  - WatchEcommerceDbContext.cs - Entity Framework DbContext

- **Controllers/**: Controllers xử lý logic
  - HomeController.cs - Trang chủ
  - ProductsController.cs - Quản lý sản phẩm

- **Views/**: Giao diện người dùng
  - Home/ - Trang chủ
  - Products/ - Quản lý sản phẩm
  - Shared/ - Layout chung

### WatchEcommerce.sql
File SQL script để tạo database trực tiếp trên SQL Server với dữ liệu mẫu.

## Tính năng

### Đã triển khai
✅ Quản lý danh mục sản phẩm
✅ Quản lý sản phẩm đồng hồ (CRUD)
✅ Hiển thị danh sách sản phẩm
✅ Tìm kiếm và lọc sản phẩm theo danh mục
✅ Xem chi tiết sản phẩm
✅ Database seeding với dữ liệu mẫu
✅ Responsive design với Bootstrap

### Có thể mở rộng
- Giỏ hàng và thanh toán
- Quản lý đơn hàng
- Đăng ký/đăng nhập khách hàng
- Đánh giá và nhận xét sản phẩm
- Upload hình ảnh sản phẩm
- Báo cáo doanh thu
- Panel quản trị admin

## Cài đặt và chạy

### Yêu cầu hệ thống
- .NET 8.0 SDK hoặc mới hơn
- SQL Server hoặc LocalDB
- Visual Studio 2022 hoặc VS Code

### Cách chạy

1. **Clone repository**
```bash
git clone https://github.com/Viluoicode/database-project.git
cd database-project
```

2. **Cấu hình connection string**
   - Mở file `WatchEcommerce/appsettings.json`
   - Cập nhật connection string phù hợp với SQL Server của bạn

3. **Tạo database bằng migrations (khuyến nghị)**
```bash
cd WatchEcommerce
dotnet ef migrations add InitialCreate
dotnet ef database update
```

4. **Hoặc chạy script SQL trực tiếp**
   - Mở SQL Server Management Studio
   - Chạy file `WatchEcommerce.sql`

5. **Chạy ứng dụng**
```bash
dotnet run
```

6. **Truy cập ứng dụng**
   - Mở trình duyệt và truy cập: `https://localhost:5001` hoặc `http://localhost:5000`

## Database Schema

### Categories (Danh mục)
- CategoryID (PK)
- CategoryName
- Description
- CreatedDate

### Products (Sản phẩm)
- ProductID (PK)
- ProductName
- CategoryID (FK)
- Brand
- Price
- StockQuantity
- Description
- ImageURL
- IsActive
- CreatedDate

### Customers (Khách hàng)
- CustomerID (PK)
- FullName
- Email
- PasswordHash
- PhoneNumber
- Address
- City
- Country
- CreatedDate
- IsActive

### Orders (Đơn hàng)
- OrderID (PK)
- CustomerID (FK)
- OrderDate
- TotalAmount
- Status
- ShippingAddress
- PaymentMethod

### OrderDetails (Chi tiết đơn hàng)
- OrderDetailID (PK)
- OrderID (FK)
- ProductID (FK)
- Quantity
- UnitPrice
- Subtotal (Computed)

### CartItems (Giỏ hàng)
- CartItemID (PK)
- CustomerID (FK)
- ProductID (FK)
- Quantity
- AddedDate

## Dữ liệu mẫu

Database được seed với:
- 5 danh mục sản phẩm
- 10 sản phẩm đồng hồ từ các thương hiệu nổi tiếng (Rolex, Omega, Casio, Apple, Seiko, Citizen, Michael Kors, Daniel Wellington, Garmin, Tag Heuer)

## Tác giả
- Repository: [Viluoicode/database-project](https://github.com/Viluoicode/database-project)

## License
MIT License
