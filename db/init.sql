CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DOUBLE NOT NULL,
    role ENUM('Admin', 'Employee') NOT NULL,
    phone VARCHAR(20),
    hire_date DATE,
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT IGNORE INTO employees VALUES 
(1, 'Admin User', 'admin@company.com', 'admin123', 'Engineering', 120000, 'Admin', '+1-555-0101', '2020-01-15', 'Active', NOW()),
(2, 'John Doe', 'john@company.com', 'pass123', 'Engineering', 75000, 'Employee', '+1-555-0102', '2021-03-10', 'Active', NOW()),
(3, 'Jane Smith', 'jane@company.com', 'pass123', 'HR', 65000, 'Employee', '+1-555-0103', '2021-06-22', 'Active', NOW()),
(4, 'Mike Johnson', 'mike@company.com', 'pass123', 'Sales', 70000, 'Employee', '+1-555-0104', '2022-01-08', 'Active', NOW());
