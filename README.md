DATA_DIGGER 

Abc_Company Database.....
This project contains the SQL scripts for setting up and managing a database for "Abc_Company". The database tracks customers, orders, products, and order details for an e-commerce company. It is built using basic relational database concepts, including tables, foreign keys, and various SQL queries for data manipulation.

Database Structure
Tables:
Customers

Stores customer details.
Fields:
CustomerID: Unique identifier for each customer (Primary Key).
Name: Name of the customer.
Address: Address of the customer.
Orders

Stores information related to customer orders.
Fields:
OrderID: Unique identifier for each order (Primary Key).
CustomerID: References the CustomerID from the Customers table.
OrderDate: The date when the order was placed.
TotalAmount: The total amount for the order.
Products

Stores information about the products available for purchase.
Fields:
ProductID: Unique identifier for each product (Primary Key).
ProductName: Name of the product.
Price: Price of the product.
Stock: Number of items in stock.
OrderDetails

Stores details about the products ordered in each order.
Fields:
OrderDetailID: Unique identifier for each order detail (Primary Key).
OrderID: References the OrderID from the Orders table.
ProductID: References the ProductID from the Products table.
Quantity: Number of products ordered.
SubTotal: Total cost for the particular product (Quantity * Price).
SQL Scripts
1. Database Setup
The Abc_company database is created along with four primary tables (Customers, Orders, Products, and OrderDetails). SQL queries for creating the tables, defining relationships (foreign keys), and inserting initial records are provided.

2. Insert Records
The INSERT INTO queries populate the Customers, Orders, Products, and OrderDetails tables with sample data for testing and development purposes.

3. Select Queries
Various SELECT queries retrieve data from the tables. These queries include:

Retrieve all customers.
Retrieve orders by a specific customer.
Retrieve products sorted by price.
Retrieve order details for specific orders.
Retrieve orders placed in the last 30 days.
4. Update and Delete Operations
There are UPDATE and DELETE queries to demonstrate how to modify or delete records:

Update customer addresses.
Delete a customer using CustomerID.
Update an order's total amount.
Delete products if they are out of stock.
5. Aggregate Functions
The SQL queries use aggregate functions like MAX(), MIN(), AVG(), SUM(), and COUNT() to perform analysis, such as:

Retrieve the highest, lowest, and average order amounts.
Calculate total revenue.
Retrieve the most ordered products.
How to Use
Database Setup:

Run the CREATE DATABASE command to set up the Abc_company database.
Execute the CREATE TABLE commands to create all necessary tables (Customers, Orders, Products, OrderDetails).
Insert Sample Data:

Execute the INSERT INTO commands to populate the tables with sample data.
Run Queries:

You can execute the SELECT, UPDATE, and DELETE queries to retrieve, modify, and delete data.
Analysis:

Use the aggregate functions (e.g., SUM(), MAX(), COUNT()) to perform basic analytics on the data.

Prerequisites
A MySQL or compatible relational database system installed.
Access to a MySQL client (e.g., MySQL Workbench, phpMyAdmin, or command-line interface).
