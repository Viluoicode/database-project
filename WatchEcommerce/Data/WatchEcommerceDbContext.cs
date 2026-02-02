using Microsoft.EntityFrameworkCore;
using WatchEcommerce.Models;

namespace WatchEcommerce.Data
{
    public class WatchEcommerceDbContext : DbContext
    {
        public WatchEcommerceDbContext(DbContextOptions<WatchEcommerceDbContext> options)
            : base(options)
        {
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<CartItem> CartItems { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configure precision for decimal properties
            modelBuilder.Entity<Product>()
                .Property(p => p.Price)
                .HasPrecision(18, 2);

            modelBuilder.Entity<Order>()
                .Property(o => o.TotalAmount)
                .HasPrecision(18, 2);

            modelBuilder.Entity<OrderDetail>()
                .Property(od => od.UnitPrice)
                .HasPrecision(18, 2);

            // Seed initial data
            modelBuilder.Entity<Category>().HasData(
                new Category { CategoryID = 1, CategoryName = "Đồng hồ nam", Description = "Đồng hồ dành cho nam giới", CreatedDate = DateTime.Now },
                new Category { CategoryID = 2, CategoryName = "Đồng hồ nữ", Description = "Đồng hồ dành cho nữ giới", CreatedDate = DateTime.Now },
                new Category { CategoryID = 3, CategoryName = "Đồng hồ thể thao", Description = "Đồng hồ thể thao và outdoor", CreatedDate = DateTime.Now },
                new Category { CategoryID = 4, CategoryName = "Đồng hồ thông minh", Description = "Smartwatch và wearable devices", CreatedDate = DateTime.Now },
                new Category { CategoryID = 5, CategoryName = "Đồng hồ cao cấp", Description = "Đồng hồ luxury và premium", CreatedDate = DateTime.Now }
            );

            modelBuilder.Entity<Product>().HasData(
                new Product { ProductID = 1, ProductName = "Rolex Submariner", CategoryID = 5, Brand = "Rolex", Price = 250000000, StockQuantity = 5, Description = "Đồng hồ lặn cao cấp với thiết kế iconic", ImageURL = "/images/rolex-submariner.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 2, ProductName = "Omega Seamaster", CategoryID = 5, Brand = "Omega", Price = 180000000, StockQuantity = 8, Description = "Đồng hồ thể thao sang trọng", ImageURL = "/images/omega-seamaster.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 3, ProductName = "Casio G-Shock", CategoryID = 3, Brand = "Casio", Price = 3500000, StockQuantity = 50, Description = "Đồng hồ thể thao chống sốc", ImageURL = "/images/casio-gshock.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 4, ProductName = "Apple Watch Series 9", CategoryID = 4, Brand = "Apple", Price = 12000000, StockQuantity = 30, Description = "Smartwatch với nhiều tính năng sức khỏe", ImageURL = "/images/apple-watch-9.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 5, ProductName = "Seiko Presage", CategoryID = 1, Brand = "Seiko", Price = 15000000, StockQuantity = 20, Description = "Đồng hồ cơ tự động Nhật Bản", ImageURL = "/images/seiko-presage.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 6, ProductName = "Citizen Eco-Drive", CategoryID = 1, Brand = "Citizen", Price = 8000000, StockQuantity = 25, Description = "Đồng hồ năng lượng ánh sáng", ImageURL = "/images/citizen-ecodrive.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 7, ProductName = "Michael Kors Lexington", CategoryID = 2, Brand = "Michael Kors", Price = 6500000, StockQuantity = 15, Description = "Đồng hồ thời trang cao cấp cho nữ", ImageURL = "/images/mk-lexington.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 8, ProductName = "Daniel Wellington Classic", CategoryID = 2, Brand = "Daniel Wellington", Price = 4200000, StockQuantity = 40, Description = "Đồng hồ tối giản Scandinavian", ImageURL = "/images/dw-classic.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 9, ProductName = "Garmin Fenix 7", CategoryID = 3, Brand = "Garmin", Price = 18000000, StockQuantity = 12, Description = "Đồng hồ GPS cho vận động viên", ImageURL = "/images/garmin-fenix7.jpg", IsActive = true, CreatedDate = DateTime.Now },
                new Product { ProductID = 10, ProductName = "Tag Heuer Carrera", CategoryID = 5, Brand = "Tag Heuer", Price = 120000000, StockQuantity = 6, Description = "Đồng hồ đua xe huyền thoại", ImageURL = "/images/tag-carrera.jpg", IsActive = true, CreatedDate = DateTime.Now }
            );
        }
    }
}
