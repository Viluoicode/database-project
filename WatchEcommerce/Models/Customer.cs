using System.ComponentModel.DataAnnotations;

namespace WatchEcommerce.Models
{
    public class Customer
    {
        [Key]
        public int CustomerID { get; set; }

        [Required]
        [StringLength(100)]
        [Display(Name = "Họ tên")]
        public string FullName { get; set; } = string.Empty;

        [Required]
        [StringLength(100)]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; } = string.Empty;

        [Required]
        [StringLength(255)]
        [DataType(DataType.Password)]
        [Display(Name = "Mật khẩu")]
        public string PasswordHash { get; set; } = string.Empty;

        [StringLength(20)]
        [Phone]
        [Display(Name = "Số điện thoại")]
        public string? PhoneNumber { get; set; }

        [StringLength(500)]
        [Display(Name = "Địa chỉ")]
        public string? Address { get; set; }

        [StringLength(100)]
        [Display(Name = "Thành phố")]
        public string? City { get; set; }

        [StringLength(100)]
        [Display(Name = "Quốc gia")]
        public string? Country { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime CreatedDate { get; set; } = DateTime.Now;

        [Display(Name = "Hoạt động")]
        public bool IsActive { get; set; } = true;

        // Navigation properties
        public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
        public virtual ICollection<CartItem> CartItems { get; set; } = new List<CartItem>();
    }
}
