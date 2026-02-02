# Database Schema Diagram

## Entity Relationship Diagram (ERD)

```
┌─────────────────────┐
│    Categories       │
├─────────────────────┤
│ PK CategoryID       │◄─────────┐
│    CategoryName     │          │
│    Description      │          │
│    CreatedDate      │          │
└─────────────────────┘          │
                                 │ 1
                                 │
                                 │ N
┌─────────────────────┐          │
│    Products         │          │
├─────────────────────┤          │
│ PK ProductID        │          │
│ FK CategoryID       │──────────┘
│    ProductName      │
│    Brand            │          ┌─────────────────┐
│    Price            │          │   CartItems     │
│    StockQuantity    │◄─────────├─────────────────┤
│    Description      │       N  │ PK CartItemID   │
│    ImageURL         │          │ FK CustomerID   │
│    IsActive         │          │ FK ProductID    │
│    CreatedDate      │          │    Quantity     │
└─────────────────────┘          │    AddedDate    │
        ▲                        └─────────────────┘
        │                                 │
        │ N                               │
        │                                 │ N
        │                                 │
        │                                 ▼
        │                        ┌─────────────────┐
        │                        │   Customers     │
        │                        ├─────────────────┤
        │                        │ PK CustomerID   │
        │                        │    FullName     │
        │                        │    Email        │
        │                        │    PasswordHash │
        │                        │    PhoneNumber  │
        │                        │    Address      │
        │                        │    City         │
        │                        │    Country      │
        │                        │    CreatedDate  │
        │                        │    IsActive     │
        │                        └─────────────────┘
        │                                 │
        │                                 │ 1
        │                                 │
        │                                 │ N
        │                                 ▼
┌───────┴─────────┐              ┌─────────────────┐
│  OrderDetails   │              │     Orders      │
├─────────────────┤              ├─────────────────┤
│PK OrderDetailID │              │ PK OrderID      │
│FK OrderID       │◄─────────────│ FK CustomerID   │
│FK ProductID     │          N   │    OrderDate    │
│   Quantity      │              │    TotalAmount  │
│   UnitPrice     │              │    Status       │
│   Subtotal      │              │ ShippingAddress │
└─────────────────┘              │ PaymentMethod   │
                                 └─────────────────┘

```

## Relationships

### One-to-Many Relationships

1. **Categories → Products** (1:N)
   - One category can have many products
   - Each product belongs to one category

2. **Customers → Orders** (1:N)
   - One customer can have many orders
   - Each order belongs to one customer

3. **Orders → OrderDetails** (1:N)
   - One order can have many order details
   - Each order detail belongs to one order

4. **Products → OrderDetails** (1:N)
   - One product can appear in many order details
   - Each order detail is for one product

5. **Customers → CartItems** (1:N)
   - One customer can have many cart items
   - Each cart item belongs to one customer

6. **Products → CartItems** (1:N)
   - One product can be in many carts
   - Each cart item is for one product

## Tables Overview

| Table | Primary Key | Foreign Keys | Purpose |
|-------|-------------|--------------|---------|
| Categories | CategoryID | - | Product categorization |
| Products | ProductID | CategoryID | Watch products |
| Customers | CustomerID | - | User accounts |
| Orders | OrderID | CustomerID | Purchase orders |
| OrderDetails | OrderDetailID | OrderID, ProductID | Order line items |
| CartItems | CartItemID | CustomerID, ProductID | Shopping cart |

## Key Features

### Data Integrity
- All relationships use foreign keys
- Cascading rules ensure data consistency
- Indexes on foreign keys for performance

### Business Logic
- Computed column: OrderDetails.Subtotal = Quantity × UnitPrice
- Default values: CreatedDate, IsActive, Quantity
- Required fields enforce data quality

### Performance Optimization
- Indexes on CategoryID, CustomerID, OrderID, ProductID
- Proper data types (decimal for money, datetime for dates)
- Varchar for variable-length strings

## Sample Data Flow

```
1. Customer browses Categories
2. Selects Products from a Category
3. Adds Products to CartItems
4. Proceeds to checkout
5. CartItems convert to Order
6. Order creates OrderDetails for each item
7. Products.StockQuantity updated
```
