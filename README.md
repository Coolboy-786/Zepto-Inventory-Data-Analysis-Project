Zepto E-commerce SQL Data Analyst Portfolio Project
A real-world SQL portfolio project based on Zepto’s e-commerce inventory dataset. This project simulates analyst workflows — from raw data exploration to business-focused insights.
🚀 Highlights
- Create and clean a messy e-commerce inventory database
- Perform Exploratory Data Analysis (EDA) on categories, pricing, and stock
- Handle nulls, invalid entries, and convert prices from paise → rupees
- Write business-driven SQL queries for revenue, discounts, inventory, and product value
📂 Dataset
- Scraped from Zepto’s product listings (via Kaggle)
- Each row = unique SKU (Stock Keeping Unit)
- Columns: sku_id, name, category, mrp, discountPercent, discountedSellingPrice, availableQuantity, weightInGms, outOfStock, quantity
📊 Business Insights
- Top 10 best-value products by discount %
- High-MRP products currently out of stock
- Potential revenue per category
- Expensive products (MRP > ₹500) with minimal discount
- Top 5 categories with highest average discounts
- Price per gram → value-for-money analysis
- Inventory weight grouped by category



- Run zepto_SQL_data_analysis.sql in PostgreSQL (pgAdmin or any client)
- Import dataset (ensure CSV is saved as UTF-8)
