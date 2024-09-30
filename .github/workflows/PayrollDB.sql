CREATE DATABASE PayrollDB;
USE PayrollDB;

-- Departments 
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY, 
    DepartmentName VARCHAR(100) NOT NULL,
    ManagerID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY, 
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    HireDate DATE NOT NULL,
    JobTitle VARCHAR(50),
    DepartmentID INT,
    ManagerID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Salaries table
CREATE TABLE Salaries (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    BasicSalary DECIMAL(10, 2) NOT NULL,
    Allowances DECIMAL(10, 2) DEFAULT 0,
    EffectiveDate DATE NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create Deductions table
CREATE TABLE Deductions (
    DeductionID INT AUTO_INCREMENT PRIMARY KEY,
    DeductionName VARCHAR(100) NOT NULL,
    DeductionType VARCHAR(50),  -- e.g., Tax, Insurance
    Amount DECIMAL(10, 2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payroll table
CREATE TABLE Payroll (
    PayrollID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    SalaryID INT,
    PayDate DATE NOT NULL,
    GrossPay DECIMAL(10, 2) NOT NULL,
    NetPay DECIMAL(10, 2) NOT NULL,
    DeductionsApplied DECIMAL(10, 2) DEFAULT 0,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (SalaryID) REFERENCES Salaries(SalaryID)
);

-- Attendance table
CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    Date DATE NOT NULL,
    Status VARCHAR(10) NOT NULL,  -- e.g., Present, Absent, Leave
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert Data Into Departments table
INSERT INTO Departments (DepartmentName, ManagerID) VALUES
    ('President', NULL),
    ('CEO', NULL),
    ('COO', NULL),
    ('CFO', NULL),
    ('HR', 5),              -- HR Manager as the head of HR
    ('Marketing', 14),       -- Marketing Manager as the head of Marketing
    ('Sales', 19),           -- Sales Manager as the head of Sales
    ('IT Department', 7),    -- IT Specialist as the head of IT
    ('Finance', 23),         -- Finance Manager as the head of Finance
    ('Operations', 27);      -- Operations Manager as the head of Operations

-- Employees Table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, DepartmentID, ManagerID) VALUES
-- Executives
    ('1','John', 'Doe', 'president@example.com', '1234567890', '2020-01-01', 'President', 1, NULL),
    ('2','Jane', 'Smith', 'ceo@example.com', '1234567891', '2020-01-01', 'CEO', 2, 1),
    ('3','Alan', 'Brown', 'coo@example.com', '1234567892', '2020-01-01', 'COO', 3, 2),
    ('4','Alice', 'Johnson', 'cfo@example.com', '1234567893', '2020-01-01', 'CFO', 4, 2),

-- HR Department
    ('Mary', 'Williams', 'hr@example.com', '1234567894', '2020-01-01', 'HR Manager', 5, 2),
    ('Susan', 'Anderson', 'hr_assistant@example.com', '1234567897', '2020-02-01', 'HR Assistant', 5, 5),
    ('Diana', 'Morris', 'recruiter@example.com', '1234567898', '2020-02-15', 'Recruiter', 5, 5),

-- IT Department
    ('David', 'Wilson', 'it@example.com', '1234567896', '2020-01-01', 'IT Specialist', 8, 2),
    ('James', 'Clark', 'network_admin@example.com', '1234567801', '2020-03-01', 'Network Administrator', 8, 7),
    ('Chris', 'Lopez', 'security_analyst@example.com', '1234567802', '2020-04-01', 'IT Security Analyst', 8, 7),
    ('Rebecca', 'Wright', 'software_engineer@example.com', '1234567803', '2020-05-01', 'Software Engineer', 8, 7),
    ('Daniel', 'Green', 'it_support@example.com', '1234567804', '2020-06-01', 'IT Support Technician', 8, 7),

-- Marketing Department
    ('Jessica', 'Adams', 'marketing_manager@example.com', '1234567805', '2020-07-01', 'Marketing Manager', 6, 2),
    ('Laura', 'Baker', 'content_creator@example.com', '1234567806', '2020-08-01', 'Content Creator', 6, 14),
    ('Ryan', 'Martinez', 'seo_specialist@example.com', '1234567807', '2020-09-01', 'SEO Specialist', 6, 14),
    ('Alex', 'Parker', 'social_media_manager@example.com', '1234567808', '2020-10-01', 'Social Media Manager', 6, 14),
    ('Emma', 'Campbell', 'graphic_designer@example.com', '1234567809', '2020-11-01', 'Graphic Designer', 6, 14),

-- Sales Department
    ('Ethan', 'Perez', 'sales_manager@example.com', '1234567810', '2021-01-01', 'Sales Manager', 7, 2),
    ('Megan', 'Sanchez', 'account_executive@example.com', '1234567811', '2021-02-01', 'Account Executive', 7, 19),
    ('Tyler', 'Reed', 'sales_rep@example.com', '1234567812', '2021-03-01', 'Sales Representative', 7, 19),
    ('Samantha', 'Foster', 'sales_assistant@example.com', '1234567813', '2021-04-01', 'Sales Assistant', 7, 19),

-- Finance Department
    ('Grace', 'Cruz', 'finance_manager@example.com', '1234567814', '2021-05-01', 'Finance Manager', 9, 4),
    ('Benjamin', 'Garcia', 'accountant@example.com', '1234567815', '2021-06-01', 'Accountant', 9, 23),
    ('Lucas', 'Torres', 'payroll_specialist@example.com', '1234567816', '2021-07-01', 'Payroll Specialist', 9, 23),
    ('Natalie', 'Diaz', 'budget_analyst@example.com', '1234567817', '2021-08-01', 'Budget Analyst', 9, 23),
    
-- Operations Department
    ('Eli', 'Sullivan', 'operations_manager@example.com', '1234567818', '2021-09-01', 'Operations Manager', 10, 3),
    ('Madison', 'Lee', 'operations_analyst@example.com', '1234567819', '2021-10-01', 'Operations Analyst', 10, 27),
    ('Caleb', 'Jenkins', 'supply_chain_manager@example.com', '1234567820', '2021-11-01', 'Supply Chain Manager', 10, 27),
    ('Victoria', 'Ramirez', 'logistics_coordinator@example.com', '1234567821', '2021-12-01', 'Logistics Coordinator', 10, 27);

-- Salaries table
INSERT INTO Salaries (EmployeeID, BasicSalary, Allowances, EffectiveDate) VALUES
-- Executives
    (1, 20000.00, 5000.00, '2020-01-01'),  -- President
    (2, 18000.00, 4500.00, '2020-01-01'),  -- CEO
    (3, 15000.00, 4000.00, '2020-01-01'),  -- COO
    (4, 14000.00, 3500.00, '2020-01-01'),  -- CFO

-- HR Department
    (5, 10000.00, 2500.00, '2020-01-01'),  -- HR Manager
    (6, 6000.00, 1500.00, '2020-02-01'),   -- HR Assistant
    (7, 6500.00, 1700.00, '2020-02-15'),   -- Recruiter

-- IT Department
    (8, 8000.00, 2000.00, '2020-01-01'),   -- IT Specialist
    (9, 7500.00, 1800.00, '2020-03-01'),   -- Network Administrator
    (10, 9000.00, 2500.00, '2020-04-01'),  -- IT Security Analyst
    (11, 9500.00, 3000.00, '2020-05-01'),  -- Software Engineer
    (12, 7000.00, 1500.00, '2020-06-01'),  -- IT Support Technician

-- Marketing Department
    (13, 12000.00, 3000.00, '2020-07-01'), -- Marketing Manager
    (14, 6500.00, 1500.00, '2020-08-01'),  -- Content Creator
    (15, 7000.00, 1600.00, '2020-09-01'),  -- SEO Specialist
    (16, 7500.00, 1800.00, '2020-10-01'),  -- Social Media Manager
    (17, 6000.00, 1400.00, '2020-11-01'),  -- Graphic Designer

-- Sales Department
    (18, 11000.00, 2700.00, '2021-01-01'), -- Sales Manager
    (19, 8000.00, 2000.00, '2021-02-01'),  -- Account Executive
    (20, 7500.00, 1800.00, '2021-03-01'),  -- Sales Representative
    (21, 5000.00, 1200.00, '2021-04-01'),  -- Sales Assistant

-- Finance Department
    (22, 13000.00, 3500.00, '2021-05-01'), -- Finance Manager
    (23, 8500.00, 2200.00, '2021-06-01'),  -- Accountant
    (24, 7500.00, 1800.00, '2021-07-01'),  -- Payroll Specialist
    (25, 9000.00, 2500.00, '2021-08-01'),  -- Budget Analyst

-- Operations Department
    (26, 12500.00, 3000.00, '2021-09-01'), -- Operations Manager
    (27, 8500.00, 2200.00, '2021-10-01'),  -- Operations Analyst
    (28, 11000.00, 2700.00, '2021-11-01'), -- Supply Chain Manager
    (29, 6500.00, 1700.00, '2021-12-01');  -- Logistics Coordinator

