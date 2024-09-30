-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2024 at 09:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payrolldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `AttendanceDate` date NOT NULL,
  `Status` varchar(10) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceID`, `EmployeeID`, `AttendanceDate`, `Status`, `CreatedAt`) VALUES
(1, 1, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(2, 2, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(3, 3, '2024-09-01', 'Absent', '2024-09-29 10:46:57'),
(4, 4, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(5, 5, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(6, 6, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(7, 7, '2024-09-01', 'Absent', '2024-09-29 10:46:57'),
(8, 8, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(9, 9, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(10, 10, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(11, 11, '2024-09-01', 'Absent', '2024-09-29 10:46:57'),
(12, 12, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(13, 13, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(14, 14, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(15, 15, '2024-09-01', 'Absent', '2024-09-29 10:46:57'),
(16, 16, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(17, 17, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(18, 18, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(19, 19, '2024-09-01', 'Absent', '2024-09-29 10:46:57'),
(20, 20, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(21, 21, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(22, 22, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(23, 23, '2024-09-01', 'Absent', '2024-09-29 10:46:57'),
(24, 24, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(25, 25, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(26, 26, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(27, 27, '2024-09-01', 'Absent', '2024-09-29 10:46:57'),
(28, 28, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(29, 29, '2024-09-01', 'Present', '2024-09-29 10:46:57'),
(30, 30, '2024-09-01', 'Present', '2024-09-29 10:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `DeductionID` int(11) NOT NULL,
  `DeductionName` varchar(100) NOT NULL,
  `DeductionType` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`DeductionID`, `DeductionName`, `DeductionType`, `Amount`, `CreatedAt`) VALUES
(1, 'Federal Tax', 'Tax', 500.00, '2024-09-29 10:50:56'),
(2, 'Health Insurance', 'Insurance', 200.00, '2024-09-29 10:50:56'),
(3, 'State Tax', 'Tax', 300.00, '2024-09-29 10:50:56'),
(4, 'Retirement Plan', 'Insurance', 150.00, '2024-09-29 10:50:56'),
(5, 'Social Security Tax', 'Tax', 250.00, '2024-09-29 10:50:56'),
(6, 'Life Insurance', 'Insurance', 100.00, '2024-09-29 10:50:56'),
(7, 'Federal Tax', 'Tax', 400.00, '2024-09-29 10:50:56'),
(8, 'Health Insurance', 'Insurance', 180.00, '2024-09-29 10:50:56'),
(9, 'State Tax', 'Tax', 280.00, '2024-09-29 10:50:56'),
(10, 'Retirement Plan', 'Insurance', 120.00, '2024-09-29 10:50:56'),
(11, 'Social Security Tax', 'Tax', 220.00, '2024-09-29 10:50:56'),
(12, 'Life Insurance', 'Insurance', 90.00, '2024-09-29 10:50:56'),
(13, 'Federal Tax', 'Tax', 350.00, '2024-09-29 10:50:56'),
(14, 'Health Insurance', 'Insurance', 230.00, '2024-09-29 10:50:56'),
(15, 'State Tax', 'Tax', 310.00, '2024-09-29 10:50:56'),
(16, 'Retirement Plan', 'Insurance', 160.00, '2024-09-29 10:50:56'),
(17, 'Social Security Tax', 'Tax', 270.00, '2024-09-29 10:50:56'),
(18, 'Life Insurance', 'Insurance', 110.00, '2024-09-29 10:50:56'),
(19, 'Federal Tax', 'Tax', 480.00, '2024-09-29 10:50:56'),
(20, 'Health Insurance', 'Insurance', 240.00, '2024-09-29 10:50:56'),
(21, 'State Tax', 'Tax', 290.00, '2024-09-29 10:50:56'),
(22, 'Retirement Plan', 'Insurance', 140.00, '2024-09-29 10:50:56'),
(23, 'Social Security Tax', 'Tax', 260.00, '2024-09-29 10:50:56'),
(24, 'Life Insurance', 'Insurance', 95.00, '2024-09-29 10:50:56'),
(25, 'Federal Tax', 'Tax', 420.00, '2024-09-29 10:50:56'),
(26, 'Health Insurance', 'Insurance', 220.00, '2024-09-29 10:50:56'),
(27, 'State Tax', 'Tax', 330.00, '2024-09-29 10:50:56'),
(28, 'Retirement Plan', 'Insurance', 165.00, '2024-09-29 10:50:56'),
(29, 'Social Security Tax', 'Tax', 240.00, '2024-09-29 10:50:56'),
(30, 'Life Insurance', 'Insurance', 105.00, '2024-09-29 10:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(100) NOT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DepartmentID`, `DepartmentName`, `ManagerID`, `CreatedAt`) VALUES
(1, 'President', NULL, '2024-09-29 10:07:03'),
(2, 'CEO', NULL, '2024-09-29 10:07:03'),
(3, 'COO', NULL, '2024-09-29 10:07:03'),
(4, 'CFO', NULL, '2024-09-29 10:07:03'),
(5, 'HR', 5, '2024-09-29 10:07:03'),
(6, 'Marketing', 14, '2024-09-29 10:07:03'),
(7, 'Sales', 19, '2024-09-29 10:07:03'),
(8, 'IT Department', 7, '2024-09-29 10:07:03'),
(9, 'Finance', 23, '2024-09-29 10:07:03'),
(10, 'Operations', 27, '2024-09-29 10:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `HireDate` date NOT NULL,
  `JobTitle` varchar(50) NOT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `HireDate`, `JobTitle`, `DepartmentID`, `ManagerID`) VALUES
(1, 'John', 'Doe', 'president@example.com', '1234567890', '2020-01-01', 'President', 1, NULL),
(2, 'Jane', 'Smith', 'ceo@example.com', '1234567891', '2020-01-01', 'CEO', 2, 1),
(3, 'Alan', 'Brown', 'coo@example.com', '1234567892', '2020-01-01', 'COO', 3, 2),
(4, 'Alice', 'Johnson', 'cfo@example.com', '1234567893', '2020-01-01', 'CFO', 4, 2),
(5, 'Mary', 'Williams', 'hr@example.com', '1234567894', '2020-01-01', 'HR Manager', 5, 2),
(6, 'Susan', 'Anderson', 'hr_assistant@example.com', '1234567897', '2020-02-01', 'HR Assistant', 5, 5),
(7, 'Diana', 'Morris', 'recruiter@example.com', '1234567898', '2020-02-15', 'Recruiter', 5, 5),
(8, 'David', 'Wilson', 'it@example.com', '1234567896', '2020-01-01', 'IT Specialist', 8, 2),
(9, 'James', 'Clark', 'network_admin@example.com', '1234567801', '2020-03-01', 'Network Administrator', 8, 7),
(10, 'Chris', 'Lopez', 'security_analyst@example.com', '1234567802', '2020-04-01', 'IT Security Analyst', 8, 7),
(11, 'Rebecca', 'Wright', 'software_engineer@example.com', '1234567803', '2020-05-01', 'Software Engineer', 8, 7),
(12, 'Daniel', 'Green', 'it_support@example.com', '1234567804', '2020-06-01', 'IT Support Technician', 8, 7),
(13, 'Jessica', 'Adams', 'marketing_manager@example.com', '1234567805', '2020-07-01', 'Marketing Manager', 6, 2),
(14, 'Laura', 'Baker', 'content_creator@example.com', '1234567806', '2020-08-01', 'Content Creator', 6, 14),
(15, 'Ryan', 'Martinez', 'seo_specialist@example.com', '1234567807', '2020-09-01', 'SEO Specialist', 6, 14),
(16, 'Alex', 'Parker', 'social_media_manager@example.com', '1234567808', '2020-10-01', 'Social Media Manager', 6, 14),
(17, 'Emma', 'Campbell', 'graphic_designer@example.com', '1234567809', '2020-11-01', 'Graphic Designer', 6, 14),
(18, 'Ethan', 'Perez', 'sales_manager@example.com', '1234567810', '2021-01-01', 'Sales Manager', 7, 2),
(19, 'Megan', 'Sanchez', 'account_executive@example.com', '1234567811', '2021-02-01', 'Account Executive', 7, 19),
(20, 'Tyler', 'Reed', 'sales_rep@example.com', '1234567812', '2021-03-01', 'Sales Representative', 7, 19),
(21, 'Samantha', 'Foster', 'sales_assistant@example.com', '1234567813', '2021-04-01', 'Sales Assistant', 7, 19),
(22, 'Grace', 'Cruz', 'finance_manager@example.com', '1234567814', '2021-05-01', 'Finance Manager', 9, 4),
(23, 'Benjamin', 'Garcia', 'accountant@example.com', '1234567815', '2021-06-01', 'Accountant', 9, 23),
(24, 'Lucas', 'Torres', 'payroll_specialist@example.com', '1234567816', '2021-07-01', 'Payroll Specialist', 9, 23),
(25, 'Natalie', 'Diaz', 'budget_analyst@example.com', '1234567817', '2021-08-01', 'Budget Analyst', 9, 23),
(26, 'Eli', 'Sullivan', 'operations_manager@example.com', '1234567818', '2021-09-01', 'Operations Manager', 10, 3),
(27, 'Madison', 'Lee', 'operations_analyst@example.com', '1234567819', '2021-10-01', 'Operations Analyst', 10, 27),
(28, 'Caleb', 'Jenkins', 'supply_chain_manager@example.com', '1234567820', '2021-11-01', 'Supply Chain Manager', 10, 27),
(29, 'Victoria', 'Ramirez', 'logistics_coordinator@example.com', '1234567821', '2021-12-01', 'Logistics Coordinator', 10, 27),
(30, 'Liam', 'Harris', 'liam.harris@example.com', '1234567822', '2024-09-29', 'Data Analyst', 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `PayrollID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `SalaryID` int(11) DEFAULT NULL,
  `PayDate` date NOT NULL,
  `GrossPay` decimal(10,2) NOT NULL,
  `NetPay` decimal(10,2) NOT NULL,
  `DeductionsApplied` decimal(10,2) DEFAULT 0.00,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`PayrollID`, `EmployeeID`, `SalaryID`, `PayDate`, `GrossPay`, `NetPay`, `DeductionsApplied`, `CreatedAt`) VALUES
(1, 1, 1, '2024-09-30', 25000.00, 18605.00, 6395.00, '2024-09-29 10:24:41'),
(2, 2, 2, '2024-09-30', 22500.00, 16105.00, 6395.00, '2024-09-29 10:24:41'),
(3, 3, 3, '2024-09-30', 19000.00, 12605.00, 6395.00, '2024-09-29 10:24:41'),
(4, 4, 4, '2024-09-30', 17500.00, 11105.00, 6395.00, '2024-09-29 10:24:41'),
(5, 5, 5, '2024-09-30', 12500.00, 6105.00, 6395.00, '2024-09-29 10:24:41'),
(6, 6, 6, '2024-09-30', 7500.00, 1105.00, 6395.00, '2024-09-29 10:24:41'),
(7, 7, 7, '2024-09-30', 8200.00, 1805.00, 6395.00, '2024-09-29 10:24:41'),
(8, 8, 8, '2024-09-30', 10000.00, 3605.00, 6395.00, '2024-09-29 10:24:41'),
(9, 9, 9, '2024-09-30', 9300.00, 2905.00, 6395.00, '2024-09-29 10:24:41'),
(10, 10, 10, '2024-09-30', 11500.00, 5105.00, 6395.00, '2024-09-29 10:24:41'),
(11, 11, 11, '2024-09-30', 12500.00, 6105.00, 6395.00, '2024-09-29 10:24:41'),
(12, 12, 12, '2024-09-30', 8500.00, 2105.00, 6395.00, '2024-09-29 10:24:41'),
(13, 13, 13, '2024-09-30', 15000.00, 8605.00, 6395.00, '2024-09-29 10:24:41'),
(14, 14, 14, '2024-09-30', 8000.00, 1605.00, 6395.00, '2024-09-29 10:24:41'),
(15, 15, 15, '2024-09-30', 8600.00, 2205.00, 6395.00, '2024-09-29 10:24:41'),
(16, 16, 16, '2024-09-30', 9300.00, 2905.00, 6395.00, '2024-09-29 10:24:41'),
(17, 17, 17, '2024-09-30', 7400.00, 1005.00, 6395.00, '2024-09-29 10:24:41'),
(18, 18, 18, '2024-09-30', 13700.00, 7305.00, 6395.00, '2024-09-29 10:24:41'),
(19, 19, 19, '2024-09-30', 10000.00, 3605.00, 6395.00, '2024-09-29 10:24:41'),
(20, 20, 20, '2024-09-30', 9300.00, 2905.00, 6395.00, '2024-09-29 10:24:41'),
(21, 21, 21, '2024-09-30', 6200.00, -195.00, 6395.00, '2024-09-29 10:24:41'),
(22, 22, 22, '2024-09-30', 16500.00, 10105.00, 6395.00, '2024-09-29 10:24:41'),
(23, 23, 23, '2024-09-30', 10700.00, 4305.00, 6395.00, '2024-09-29 10:24:41'),
(24, 24, 24, '2024-09-30', 9300.00, 2905.00, 6395.00, '2024-09-29 10:24:41'),
(25, 25, 25, '2024-09-30', 11500.00, 5105.00, 6395.00, '2024-09-29 10:24:41'),
(26, 26, 26, '2024-09-30', 15500.00, 9105.00, 6395.00, '2024-09-29 10:24:41'),
(27, 27, 27, '2024-09-30', 8200.00, 1805.00, 6395.00, '2024-09-29 10:24:41'),
(28, 28, 28, '2024-09-30', 11000.00, 4605.00, 6395.00, '2024-09-29 10:24:41'),
(29, 29, 29, '2024-09-30', 7000.00, 605.00, 6395.00, '2024-09-29 10:24:41'),
(30, 30, 30, '2024-09-30', 6000.00, 205.00, 6395.00, '2024-09-29 10:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `SalaryID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `BasicSalary` decimal(10,2) NOT NULL,
  `Allowances` decimal(10,2) DEFAULT 0.00,
  `EffectiveDate` date NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`SalaryID`, `EmployeeID`, `BasicSalary`, `Allowances`, `EffectiveDate`, `CreatedAt`) VALUES
(1, 1, 20000.00, 5000.00, '2020-01-01', '2024-09-29 10:01:56'),
(2, 2, 18000.00, 4500.00, '2020-01-01', '2024-09-29 10:01:56'),
(3, 3, 15000.00, 4000.00, '2020-01-01', '2024-09-29 10:01:56'),
(4, 4, 14000.00, 3500.00, '2020-01-01', '2024-09-29 10:01:56'),
(5, 5, 10000.00, 2500.00, '2020-01-01', '2024-09-29 10:01:56'),
(6, 6, 6000.00, 1500.00, '2020-02-01', '2024-09-29 10:01:56'),
(7, 7, 6500.00, 1700.00, '2020-02-15', '2024-09-29 10:01:56'),
(8, 8, 8000.00, 2000.00, '2020-01-01', '2024-09-29 10:01:56'),
(9, 9, 7500.00, 1800.00, '2020-03-01', '2024-09-29 10:01:56'),
(10, 10, 9000.00, 2500.00, '2020-04-01', '2024-09-29 10:01:56'),
(11, 11, 9500.00, 3000.00, '2020-05-01', '2024-09-29 10:01:56'),
(12, 12, 7000.00, 1500.00, '2020-06-01', '2024-09-29 10:01:56'),
(13, 13, 12000.00, 3000.00, '2020-07-01', '2024-09-29 10:01:56'),
(14, 14, 6500.00, 1500.00, '2020-08-01', '2024-09-29 10:01:56'),
(15, 15, 7000.00, 1600.00, '2020-09-01', '2024-09-29 10:01:56'),
(16, 16, 7500.00, 1800.00, '2020-10-01', '2024-09-29 10:01:56'),
(17, 17, 6000.00, 1400.00, '2020-11-01', '2024-09-29 10:01:56'),
(18, 18, 11000.00, 2700.00, '2021-01-01', '2024-09-29 10:01:56'),
(19, 19, 8000.00, 2000.00, '2021-02-01', '2024-09-29 10:01:56'),
(20, 20, 7500.00, 1800.00, '2021-03-01', '2024-09-29 10:01:56'),
(21, 21, 5000.00, 1200.00, '2021-04-01', '2024-09-29 10:01:56'),
(22, 22, 13000.00, 3500.00, '2021-05-01', '2024-09-29 10:01:56'),
(23, 23, 8500.00, 2200.00, '2021-06-01', '2024-09-29 10:01:56'),
(24, 24, 7500.00, 1800.00, '2021-07-01', '2024-09-29 10:01:56'),
(25, 25, 9000.00, 2500.00, '2021-08-01', '2024-09-29 10:01:56'),
(26, 26, 12500.00, 3000.00, '2021-09-01', '2024-09-29 10:01:56'),
(27, 27, 8500.00, 2200.00, '2021-10-01', '2024-09-29 10:01:56'),
(28, 28, 11000.00, 2700.00, '2021-11-01', '2024-09-29 10:01:56'),
(29, 29, 6500.00, 1700.00, '2021-12-01', '2024-09-29 10:01:56'),
(30, 30, 6500.00, 1500.00, '2021-12-01', '2024-09-29 10:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `password`) VALUES
('admin', 'admin@payrolldb.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`DeductionID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD KEY `ManagerID` (`ManagerID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `ManagerID` (`ManagerID`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`PayrollID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `SalaryID` (`SalaryID`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`SalaryID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `SalaryID` (`SalaryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `DeductionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `PayrollID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `SalaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendanceEmployyeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `employeeDepartmentIDConnection` FOREIGN KEY (`DepartmentID`) REFERENCES `employees` (`DepartmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employeeManagerIDConnection` FOREIGN KEY (`ManagerID`) REFERENCES `employees` (`ManagerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payrolllEmployeeID-Connection` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `employeeID-Connection` FOREIGN KEY (`EmployeeID`) REFERENCES `payroll` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salaryID-Connection` FOREIGN KEY (`SalaryID`) REFERENCES `payroll` (`SalaryID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
