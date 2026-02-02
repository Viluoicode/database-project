# Quick Start Guide - Watch E-commerce Website

## 🚀 Getting Started in 5 Minutes

### Prerequisites
- ✅ .NET 8.0 SDK installed
- ✅ SQL Server or LocalDB

### Installation Steps

```bash
# 1. Clone the repository
git clone https://github.com/Viluoicode/database-project.git
cd database-project/WatchEcommerce

# 2. Restore packages
dotnet restore

# 3. Create database
dotnet ef migrations add InitialCreate
dotnet ef database update

# 4. Run the application
dotnet run

# 5. Open browser
# Navigate to: https://localhost:5001
```

## 📁 Project Files

| File | Description |
|------|-------------|
| `README.md` | English documentation |
| `HUONG_DAN.md` | Vietnamese user guide (detailed) |
| `PROJECT_SUMMARY.md` | Complete project summary |
| `DATABASE_SCHEMA.md` | Database ERD and relationships |
| `WatchEcommerce.sql` | SQL script (alternative to migrations) |
| `WatchEcommerce/` | ASP.NET Core MVC application |

## 🎯 What You'll See

### Home Page
- Featured products (6 premium watches)
- Category navigation buttons
- Beautiful Bootstrap 5 design

### Product Listing (`/Products`)
- Search by name or brand
- Filter by category
- View all products with pricing

### Product Details
- Full product information
- Stock availability
- Edit/Delete options

### Admin Features
- Add new products
- Edit existing products
- Delete products
- Manage inventory

## 🗄️ Database

### Option 1: EF Core Migrations (Recommended)
```bash
cd WatchEcommerce
dotnet ef migrations add InitialCreate
dotnet ef database update
```

### Option 2: SQL Script
1. Open SQL Server Management Studio
2. Run `WatchEcommerce.sql`
3. Database created with sample data

## 📊 Sample Data Included

### 5 Categories
- Đồng hồ nam (Men's watches)
- Đồng hồ nữ (Women's watches)
- Đồng hồ thể thao (Sports watches)
- Đồng hồ thông minh (Smart watches)
- Đồng hồ cao cấp (Luxury watches)

### 10 Products
From affordable to luxury:
- Casio G-Shock: 3,500,000 VNĐ
- Daniel Wellington: 4,200,000 VNĐ
- ...
- Rolex Submariner: 250,000,000 VNĐ

## 🛠️ Development

### Build
```bash
dotnet build
```

### Run
```bash
dotnet run
```

### Access
- **HTTPS**: https://localhost:5001
- **HTTP**: http://localhost:5000

## 📖 Documentation

For detailed information:
- **English**: See `README.md`
- **Vietnamese**: See `HUONG_DAN.md`
- **Technical**: See `PROJECT_SUMMARY.md`
- **Database**: See `DATABASE_SCHEMA.md`

## 🔧 Configuration

Edit `appsettings.json` to change:
- Database connection string
- Logging settings
- Other configurations

## ✨ Features

✅ Product catalog with search
✅ Category filtering
✅ CRUD operations
✅ Responsive design
✅ Vietnamese interface
✅ Stock tracking
✅ Sample data

## 🎓 Technology Stack

- ASP.NET Core 8.0 MVC
- Entity Framework Core 8.0
- SQL Server
- Bootstrap 5
- C# 12

## 📞 Support

For questions or issues:
- Check documentation files
- Review code comments
- See GitHub repository

## 🎉 That's It!

You now have a fully functional watch e-commerce website running locally!

---
**Repository**: https://github.com/Viluoicode/database-project
