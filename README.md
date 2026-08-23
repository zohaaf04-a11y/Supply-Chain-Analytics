# Supply Chain & Inventory Analytics

## 📌 Project Overview

This project analyzes supply chain, inventory, sales, supplier, and warehouse data using SQL and Power BI.

The goal is to identify inventory risks, analyze sales performance, evaluate suppliers and warehouses, and generate actionable business insights.

## 🎯 Business Objectives

- Analyze total sales and order performance
- Identify products that require stock replenishment
- Analyze inventory levels across warehouses
- Evaluate supplier performance
- Compare warehouse performance
- Identify top-performing products and categories
- Analyze monthly revenue trends
- Support data-driven inventory decisions

## 🛠️ Tools & Technologies

- **SQL / MySQL** – Data analysis and business queries
- **Power BI** – Interactive dashboard and visualization
- **Python / Pandas** – Data generation and preparation
- **Excel** – Data inspection and validation
- **GitHub** – Project documentation and version control

## 🔄 Project Workflow

1. **Data Generation & Preparation**
   - Generated and prepared supply chain datasets using Python and Pandas.
   - Created datasets for products, inventory, orders, suppliers, and warehouses.

2. **Data Storage & SQL Analysis**
   - Stored the datasets in MySQL.
   - Used SQL queries to analyze revenue, inventory, suppliers, warehouses, and order trends.

3. **Data Modeling**
   - Connected the datasets in Power BI.
   - Created relationships between products, inventory, orders, suppliers, and warehouses.

4. **Data Visualization**
   - Built interactive Power BI visuals and KPI cards.
   - Added filters for warehouse, category, and order date.

5. **Business Insights**
   - Identified high-revenue categories and products.
   - Identified products requiring replenishment.
   - Compared supplier and warehouse performance.
   - Analyzed monthly revenue trends.

## 🗄️ Database Structure

The project contains five main tables:

| Table | Records |
|---|---:|
| Products | 550 |
| Inventory | 5,500 |
| Orders | 50,000 |
| Suppliers | 50 |
| Warehouses | 10 |

### Main Tables

**Products**
- Product_ID
- Product_Name
- Category
- Brand
- Unit_Cost
- Unit_Price

**Inventory**
- Inventory_ID
- Product_ID
- Warehouse_ID
- Supplier_ID
- Stock_Quantity
- Reorder_Level

**Orders**
- Order_ID
- Order_Date
- Product_ID
- Warehouse_ID
- Quantity
- Unit_Price
- Total_Amount

**Suppliers**
- Supplier_ID
- Supplier_Name
- Country
- Lead_Time_Days
- Rating

**Warehouses**
- Warehouse_ID
- Warehouse_Name
- City
- Region
- Capacity

## 📊 SQL Analysis

SQL was used to analyze:

- Revenue by category
- Revenue by product
- Revenue by supplier
- Revenue by warehouse
- Monthly revenue trends
- Inventory levels
- Products below reorder level
- Supplier performance
- Warehouse performance
- Supplier lead times and ratings

### SQL Highlights

The analysis includes queries using:

- `JOIN` operations to combine related tables
- `GROUP BY` for category, supplier, warehouse, and product analysis
- Aggregate functions such as `SUM()`, `COUNT()`, and `AVG()`
- Filtering using `WHERE`
- Sorting and ranking using `ORDER BY`
- Date-based analysis for monthly revenue trends

## 📈 Power BI Dashboard

The Power BI dashboard provides an interactive overview of supply chain performance.

### Dashboard Preview

![Supply Chain Analytics Dashboard](PowerBI/supply-chain-dashboard.png)

### Key KPIs

- Total Revenue: ₹9bn
- Total Orders: 50K
- Total Quantity Sold: 275K
- Average Order Value: ₹172.21K
- Total Inventory: 3M
- Total Inventory Value: ₹72bn
- Products Below Reorder: 269

### Dashboard Features

- Revenue by Category
- Revenue by Product
- Revenue by Month
- Revenue by Warehouse
- Revenue by Supplier
- Inventory by Category
- Product Reorder Status
- Warehouse and Category filters
- Order date filtering

## 🔍 Key Insights

- **Electronics** generated the highest revenue among the analyzed categories.
- **H&M T-Shirt** ranked highest among the analyzed products by revenue.
- **Mumbai Warehouse** recorded the highest warehouse revenue.
- Several products were identified as requiring **reorder/replenishment**, highlighting potential inventory risks.
- Supplier performance varied based on **revenue contribution, lead time, and rating**.
- Monthly revenue remained relatively consistent throughout **2025**, with noticeable variation between months.
  
## 📁 Project Structure

```text
Supply-Chain-Analytics/
│
├── Data/
│   ├── Products.csv
│   ├── Inventory.csv
│   ├── Orders.csv
│   ├── Suppliers.csv
│   └── Warehouses.csv
│
├── Python/
│   └── 01_Generate_Datasets.ipynb
│
├── SQL/
│   └── supply_chain_analysis.sql
│
├── PowerBI/
│   ├── supply chain analytics.pbix
│   └── supply-chain-dashboard.png
│
└── README.md

## 💼 Skills Demonstrated

- **SQL:** Joins, aggregations, filtering, grouping, sorting, and business analysis
- **Power BI:** Data modeling, DAX measures, KPI cards, interactive charts, slicers, and dashboards
- **Python:** Pandas-based data generation and preparation
- **Data Analysis:** Revenue, inventory, supplier, warehouse, and product analysis
- **Business Intelligence:** Identifying trends, inventory risks, and operational insights
- **Data Visualization:** Creating interactive and business-focused dashboards
- **Git & GitHub:** Project organization, version control, and documentation
