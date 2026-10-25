--1.create the database and schema
-- PostgreSQL
CREATE DATABASE company_sales_db;

-- Connect to company_sales_db before running the rest.
CREATE SCHEMA company;
SET search_path TO company;
2. Create Tables
CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50),
    budget NUMERIC(12,2)
);
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    job_title VARCHAR(60) NOT NULL,
    salary NUMERIC(10,2) CHECK (salary > 0),
    manager_id INT REFERENCES employee(employee_id),
    department_id INT REFERENCES department(department_id)
);
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE NOT NULL,
    customer_type VARCHAR(20) CHECK (customer_type IN ('Retail','Business','VIP'))
);
CREATE TABLE supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50),
    rating NUMERIC(3,1) CHECK (rating BETWEEN 0 AND 5)
);
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(60) NOT NULL UNIQUE
);
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES category(category_id),
    supplier_id INT REFERENCES supplier(supplier_id),
    unit_price NUMERIC(10,2) CHECK (unit_price >= 0),
    stock_quantity INT CHECK (stock_quantity >= 0),
    reorder_level INT DEFAULT 10
);
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customer(customer_id),
    employee_id INT REFERENCES employee(employee_id),
    order_date DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')),
    shipping_city VARCHAR(50),
    total_amount NUMERIC(12,2) DEFAULT 0
);
CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES product(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
);
    unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
    discount NUMERIC(5,2) DEFAULT 0 CHECK (discount BETWEEN 0 AND 100)
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id),
    payment_date DATE,
    payment_method VARCHAR(20) CHECK (payment_method IN ('Card','UPI','Cash','Bank Transfer')),
    amount NUMERIC(12,2) CHECK (amount >= 0),
    payment_status VARCHAR(20) CHECK (payment_status IN ('Paid','Pending','Failed','Refunded'))
);
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES department(department_id),
    start_date DATE NOT NULL,
    end_date DATE,
    budget NUMERIC(12,2)
);
CREATE TABLE employee_project (
    employee_id INT REFERENCES employee(employee_id) ON DELETE CASCADE,
    project_id INT REFERENCES project(project_id) ON DELETE CASCADE,
    role_name VARCHAR(60),
    hours_worked NUMERIC(8,2) DEFAULT 0,
    PRIMARY KEY (employee_id, project_id)
);
3. Insert Realistic Practice Data-- Departments
INSERT INTO department (department_name, location, budget) VALUES
('IT','Hyderabad',1500000),('HR','Bangalore',600000),
('Finance','Mumbai',900000),('Sales','Hyderabad',1800000),
('Marketing','Chennai',1000000),('Operations','Pune',1300000);-- Employees
INSERT INTO employee
(first_name,last_name,email,phone,hire_date,job_title,salary,manager_id,department_id) VALUES
('Rahul','Sharma','rahul.sharma@company.com','9000000001','2018-01-15','IT Manager',120000, NULL,1),
('Priya','Reddy','priya.reddy@company.com','9000000002','2019-03-20','Senior Developer',95000,1,1),
('Arjun','Kumar','arjun.kumar@company.com','9000000003','2021-06-11','Developer',70000,1,1),
('Sneha','Patel','sneha.patel@company.com','9000000004','2022-02-14','Developer',68000,1,1),
('Kiran','Rao','kiran.rao@company.com','9000000005','2020-08-19','HR Manager',105000,NULL,2),
('Anjali','Mehta','anjali.mehta@company.com','9000000006','2023-01-10','HR Executive',55000,5,2),
('Vikram','Singh','vikram.singh@company.com','9000000007','2017-11-01','Finance Manager',115000,NULL,3),
('Meena','Iyer','meena.iyer@company.com','9000000008','2021-04-22','Financial Analyst',72000,7,3),
('Rohit','Verma','rohit.verma@company.com','9000000009','2019-07-08','Sales Manager',110000,NULL,4),
('Pooja','Nair','pooja.nair@company.com','9000000010','2022-05-16','Sales Executive',62000,9,4),
('Amit','Das','amit.das@company.com','9000000011','2023-02-21','Sales Executive',58000,9,4),
('Divya','Joshi','divya.joshi@company.com','9000000012','2020-09-30','Marketing Manager',100000,NULL,5),
('Suresh','Babu','suresh.babu@company.com','9000000013','2022-12-05','Marketing Executive',60000,12,5),
('Neha','Kapoor','neha.kapoor@company.com','9000000014','2018-10-17','Operations Manager',108000,NULL,6),
('Manoj','Pillai','manoj.pillai@company.com','9000000015','2021-12-13','Operations Analyst',65000,14,6);-- Customers
INSERT INTO customer
(customer_name,email,phone,city,state,signup_date,customer_type) VALUES
('ABC Technologies','abc@tech.com','9100000001','Hyderabad','Telangana','2021-01-10','Business'),
('Bright Retail','bright@retail.com','9100000002','Bangalore','Karnataka','2022-03-12','Retail'),
('City Mart','city@mart.com','9100000003','Chennai','Tamil Nadu','2020-07-19','Retail'),
('Delta Systems','delta@sys.com','9100000004','Mumbai','Maharashtra','2023-02-01','Business'),
('Elite Solutions','elite@sol.com','9100000005','Pune','Maharashtra','2019-11-23','VIP'),
('Future Traders','future@trade.com','9100000006','Hyderabad','Telangana','2022-08-14','Business'),
('Green Stores','green@stores.com','9100000007','Kochi','Kerala','2021-09-05','Retail'),
('Horizon Ltd','horizon@ltd.com','9100000008','Delhi','Delhi','2020-05-17','Business'),
('India Office Hub','india@office.com','9100000009','Bangalore','Karnataka','2023-04-20','VIP'),
('Jupiter Retail','jupiter@retail.com','9100000010','Chennai','Tamil Nadu','2024-01-15','Retail'),
('Kaveri Enterprises','kaveri@ent.com','9100000011','Hyderabad','Telangana','2021-06-25','Business'),
('Lotus Market','lotus@market.com','9100000012','Pune','Maharashtra','2024-03-18','Retail');-- Suppliers
INSERT INTO supplier (supplier_name,city,country,rating) VALUES
('TechSource','Hyderabad','India',4.6),('Global Office','Mumbai','India',4.2),
('Prime Electronics','Bangalore','India',4.8),('Smart Supplies','Chennai','India',3.9),
('Asia Components','Pune','India',4.4),('Office World','Delhi','India',4.1);-- Categories
INSERT INTO category (category_name) VALUES
('Laptops'),('Monitors'),('Accessories'),('Printers'),('Networking'),('Storage');-- Products
INSERT INTO product
(product_name,category_id,supplier_id,unit_price,stock_quantity,reorder_level) VALUES
('ThinkPro Laptop',1,1,75000,25,10),
('UltraBook 14',1,3,68000,18,8),
('Business Laptop X',1,1,82000,12,6),
('24 Inch Monitor',2,2,14500,40,12),
('27 Inch Monitor',2,3,22000,16,8),
('Wireless Mouse',3,4,1200,120,30),
('Mechanical Keyboard',3,4,3500,65,20),
('USB-C Dock',3,5,6500,28,10),
('Laser Printer',4,2,18500,14,6),
('Color Printer',4,6,26000,9,5),
('WiFi Router',5,5,4200,55,15),
('Network Switch',5,1,7800,24,8),
('1TB SSD',6,3,6200,70,20),
('2TB SSD',6,3,10800,35,12),
('External HDD',6,2,7500,45,15);-- Orders
INSERT INTO orders
(customer_id,employee_id,order_date,status,shipping_city,total_amount) VALUES
(1,10,'2024-01-10','Delivered','Hyderabad',89700),
(2,11,'2024-01-18','Shipped','Bangalore',36200),
(3,10,'2024-02-05','Delivered','Chennai',26700),
(4,11,'2024-02-19','Pending','Mumbai',82000),
(5,10,'2024-03-02','Delivered','Pune',104000),
(6,11,'2024-03-14','Cancelled','Hyderabad',18500),
(7,10,'2024-04-01','Delivered','Kochi',21600),
(8,11,'2024-04-12','Shipped','Delhi',33000),
(9,10,'2024-05-09','Delivered','Bangalore',75000),
(10,11,'2024-05-21','Pending','Chennai',10800),
(11,10,'2024-06-04','Delivered','Hyderabad',95000),
(12,11,'2024-06-18','Shipped','Pune',26000);-- Order Items
INSERT INTO order_item (order_id,product_id,quantity,unit_price,discount) VALUES
(1,1,1,75000,0),(1,6,2,1200,0),(1,8,1,6500,0),
(2,4,2,14500,0),(2,7,2,3500,0),
(3,10,1,26000,0),(3,6,1,1200,0),
(4,3,1,82000,0),
(5,5,2,22000,0),(5,13,2,6200,0),
(6,9,1,18500,0),
(7,11,3,4200,0),(7,6,1,1200,0),
(8,9,1,18500,0),(8,7,2,3500,0),(8,6,2,1200,0),
(9,1,1,75000,0),
(10,14,1,10800,0),
(11,2,1,68000,0),(11,5,1,22000,0),(11,6,1,1200,0),
(12,10,1,26000,0);-- Payments
INSERT INTO payment (order_id,payment_date,payment_method,amount,payment_status) VALUES
(1,'2024-01-10','UPI',89700,'Paid'),
(2,'2024-01-18','Card',36200,'Paid'),
(3,'2024-02-05','Cash',26700,'Paid'),
(4,'2024-02-19','Bank Transfer',82000,'Pending'),
(5,'2024-03-02','Card',104000,'Paid'),
(6,'2024-03-14','UPI',18500,'Refunded'),
(7,'2024-04-01','UPI',21600,'Paid'),
(8,'2024-04-12','Card',33000,'Paid'),
(9,'2024-05-09','Bank Transfer',75000,'Paid'),
(10,'2024-05-21','UPI',10800,'Pending'),
(11,'2024-06-04','Card',95000,'Paid'),
(12,'2024-06-18','Cash',26000,'Paid');-- Projects
INSERT INTO project (project_name,department_id,start_date,end_date,budget) VALUES
('ERP Upgrade',1,'2024-01-01','2024-09-30',500000),
('Recruitment Portal',2,'2024-02-01','2024-07-31',180000),
('Financial Dashboard',3,'2024-01-15','2024-08-31',250000),
('Sales CRM',4,'2024-03-01','2024-12-31',450000),
('Digital Campaign',5,'2024-04-01','2024-10-31',220000),
('Warehouse Automation',6,'2024-02-15','2024-11-30',400000);
INSERT INTO employee_project (employee_id,project_id,role_name,hours_worked) VALUES
(1,1,'Project Manager',420),(2,1,'Lead Developer',520),(3,1,'Developer',480),
(4,1,'Developer',390),(5,2,'Project Manager',280),(6,2,'HR Specialist',310),
(7,3,'Project Manager',360),(8,3,'Analyst',410),(9,4,'Project Manager',450),
(10,4,'Sales Analyst',330),(11,4,'Sales Executive',290),(12,5,'Project Manager',300),
(13,5,'Marketing Executive',350),(14,6,'Project Manager',440),(15,6,'Operations Analyst',500);