# Hướng dẫn sử dụng Website Thương mại Điện tử Đồng hồ

## Tổng quan
Đây là một ứng dụng web thương mại điện tử hoàn chỉnh để bán đồng hồ, được xây dựng với:
- **ASP.NET Core 8.0 MVC**
- **Entity Framework Core 8.0** (ORM)
- **SQL Server** (Database)
- **Bootstrap 5** (Frontend)

## Cấu trúc dự án

### 1. Models (Mô hình dữ liệu)

#### Category (Danh mục)
```csharp
- CategoryID: Mã danh mục (Primary Key)
- CategoryName: Tên danh mục
- Description: Mô tả danh mục
- CreatedDate: Ngày tạo
```

#### Product (Sản phẩm)
```csharp
- ProductID: Mã sản phẩm (Primary Key)
- ProductName: Tên sản phẩm
- CategoryID: Mã danh mục (Foreign Key)
- Brand: Thương hiệu
- Price: Giá bán
- StockQuantity: Số lượng tồn kho
- Description: Mô tả sản phẩm
- ImageURL: Đường dẫn hình ảnh
- IsActive: Trạng thái hoạt động
- CreatedDate: Ngày tạo
```

#### Customer (Khách hàng)
```csharp
- CustomerID: Mã khách hàng (Primary Key)
- FullName: Họ tên
- Email: Email
- PasswordHash: Mật khẩu đã mã hóa
- PhoneNumber: Số điện thoại
- Address: Địa chỉ
- City: Thành phố
- Country: Quốc gia
- CreatedDate: Ngày đăng ký
- IsActive: Trạng thái hoạt động
```

#### Order (Đơn hàng)
```csharp
- OrderID: Mã đơn hàng (Primary Key)
- CustomerID: Mã khách hàng (Foreign Key)
- OrderDate: Ngày đặt hàng
- TotalAmount: Tổng tiền
- Status: Trạng thái (Pending, Processing, Shipped, Delivered, Cancelled)
- ShippingAddress: Địa chỉ giao hàng
- PaymentMethod: Phương thức thanh toán
```

#### OrderDetail (Chi tiết đơn hàng)
```csharp
- OrderDetailID: Mã chi tiết (Primary Key)
- OrderID: Mã đơn hàng (Foreign Key)
- ProductID: Mã sản phẩm (Foreign Key)
- Quantity: Số lượng
- UnitPrice: Đơn giá
- Subtotal: Thành tiền (computed)
```

#### CartItem (Giỏ hàng)
```csharp
- CartItemID: Mã giỏ hàng (Primary Key)
- CustomerID: Mã khách hàng (Foreign Key)
- ProductID: Mã sản phẩm (Foreign Key)
- Quantity: Số lượng
- AddedDate: Ngày thêm
```

### 2. Controllers (Bộ điều khiển)

#### HomeController
- `Index()`: Hiển thị trang chủ với sản phẩm nổi bật
- `Privacy()`: Trang chính sách bảo mật

#### ProductsController
- `Index(searchString, categoryId)`: Danh sách sản phẩm với tìm kiếm và lọc
- `Details(id)`: Chi tiết sản phẩm
- `Create()`: Thêm sản phẩm mới (GET)
- `Create(product)`: Lưu sản phẩm mới (POST)
- `Edit(id)`: Chỉnh sửa sản phẩm (GET)
- `Edit(id, product)`: Lưu thay đổi (POST)
- `Delete(id)`: Xóa sản phẩm (GET)
- `DeleteConfirmed(id)`: Xác nhận xóa (POST)

### 3. Views (Giao diện)

#### Home
- `Index.cshtml`: Trang chủ với sản phẩm nổi bật và danh mục

#### Products
- `Index.cshtml`: Danh sách sản phẩm với tìm kiếm và lọc
- `Details.cshtml`: Chi tiết sản phẩm
- `Create.cshtml`: Form thêm sản phẩm
- `Edit.cshtml`: Form sửa sản phẩm
- `Delete.cshtml`: Xác nhận xóa sản phẩm

### 4. Data Layer

#### WatchEcommerceDbContext
- Kết nối database qua Entity Framework Core
- Cấu hình các DbSet cho mỗi model
- Seed dữ liệu mẫu
- Cấu hình precision cho decimal

## Tính năng đã triển khai

### ✅ Quản lý sản phẩm
- Thêm, sửa, xóa sản phẩm
- Xem danh sách và chi tiết sản phẩm
- Tìm kiếm sản phẩm theo tên, thương hiệu
- Lọc sản phẩm theo danh mục
- Hiển thị trạng thái tồn kho

### ✅ Giao diện người dùng
- Responsive design với Bootstrap 5
- Trang chủ hiển thị sản phẩm nổi bật
- Navigation menu tiếng Việt
- Card layout cho sản phẩm
- Filter buttons cho danh mục

### ✅ Database
- Code First approach với EF Core
- Relationships (Foreign Keys)
- Indexes cho performance
- Seed data với 10 sản phẩm mẫu
- 5 danh mục sản phẩm

## Dữ liệu mẫu

### Danh mục
1. Đồng hồ nam
2. Đồng hồ nữ
3. Đồng hồ thể thao
4. Đồng hồ thông minh
5. Đồng hồ cao cấp

### Sản phẩm mẫu
1. **Rolex Submariner** - 250,000,000 VNĐ (Cao cấp)
2. **Omega Seamaster** - 180,000,000 VNĐ (Cao cấp)
3. **Casio G-Shock** - 3,500,000 VNĐ (Thể thao)
4. **Apple Watch Series 9** - 12,000,000 VNĐ (Thông minh)
5. **Seiko Presage** - 15,000,000 VNĐ (Nam)
6. **Citizen Eco-Drive** - 8,000,000 VNĐ (Nam)
7. **Michael Kors Lexington** - 6,500,000 VNĐ (Nữ)
8. **Daniel Wellington Classic** - 4,200,000 VNĐ (Nữ)
9. **Garmin Fenix 7** - 18,000,000 VNĐ (Thể thao)
10. **Tag Heuer Carrera** - 120,000,000 VNĐ (Cao cấp)

## Cách chạy ứng dụng

### Yêu cầu
- .NET 8.0 SDK
- SQL Server hoặc SQL Server LocalDB
- Visual Studio 2022 hoặc VS Code

### Các bước

1. **Clone repository**
```bash
git clone https://github.com/Viluoicode/database-project.git
cd database-project/WatchEcommerce
```

2. **Khôi phục packages**
```bash
dotnet restore
```

3. **Cập nhật connection string**
Mở `appsettings.json` và chỉnh sửa connection string phù hợp với SQL Server của bạn:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=WatchEcommerceDb;Trusted_Connection=True;MultipleActiveResultSets=true"
  }
}
```

4. **Tạo database (Option 1: Migrations - Khuyến nghị)**
```bash
dotnet ef migrations add InitialCreate
dotnet ef database update
```

5. **Tạo database (Option 2: SQL Script)**
- Mở SQL Server Management Studio
- Chạy file `WatchEcommerce.sql` ở thư mục gốc

6. **Chạy ứng dụng**
```bash
dotnet run
```

7. **Truy cập**
Mở trình duyệt và truy cập:
- HTTPS: `https://localhost:5001`
- HTTP: `http://localhost:5000`

## Mở rộng trong tương lai

### Features có thể thêm
- 🛒 Shopping Cart (Giỏ hàng)
- 💳 Checkout & Payment Integration
- 👤 User Authentication (Đăng ký/Đăng nhập)
- 📝 Customer Reviews & Ratings
- 📸 Image Upload cho sản phẩm
- 📊 Admin Dashboard & Analytics
- 📧 Email Notifications
- 🔍 Advanced Search & Filtering
- ⭐ Wishlist (Danh sách yêu thích)
- 📱 Mobile App Integration

### Cải tiến kỹ thuật
- Repository Pattern
- Unit of Work Pattern
- Caching (Redis)
- API Controllers (RESTful)
- JWT Authentication
- AutoMapper
- Logging (Serilog)
- Unit Testing
- Integration Testing

## Công nghệ sử dụng

| Công nghệ | Phiên bản | Mục đích |
|-----------|-----------|----------|
| ASP.NET Core | 8.0 | Web Framework |
| Entity Framework Core | 8.0 | ORM |
| SQL Server | 2019+ | Database |
| Bootstrap | 5.3 | Frontend UI |
| jQuery | 3.7 | JavaScript Library |
| C# | 12.0 | Programming Language |

## Cấu trúc thư mục

```
WatchEcommerce/
├── Controllers/          # Controllers xử lý logic
├── Data/                # DbContext và Database Config
├── Models/              # Data Models
├── Views/               # Razor Views
│   ├── Home/           # Trang chủ
│   ├── Products/       # Quản lý sản phẩm
│   └── Shared/         # Layout & partial views
├── wwwroot/            # Static files
│   ├── css/            # Stylesheets
│   ├── js/             # JavaScript
│   └── lib/            # Client libraries
├── appsettings.json    # Configuration
└── Program.cs          # Application entry point
```

## Tác giả
Repository: https://github.com/Viluoicode/database-project

## License
MIT License
