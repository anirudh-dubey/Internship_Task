  create database HR_department;
use HR_department;


CREATE TABLE Employees (
    EmployeeID INT auto_increment PRIMARY KEY  ,
    FirstName VARCHAR(50) ,
    LastName VARCHAR(50) ,
    Email VARCHAR(100) ,
    Phone VARCHAR(20),
    HireDate DATE ,
 
    ManagerID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);


INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, ManagerID, Salary) VALUES
('Amit', 'Sharma', 'amit.sharma@email.com', '9876543210', '2022-01-10', NULL, 75000.00),
('Priya', 'Verma', 'priya.verma@email.com', '8765432109', '2021-03-15', 1, 70000.00),
('Rahul', 'Gupta', 'rahul.gupta@email.com', '7654321098', '2020-07-20', 1, 70000.00), 
('Sneha', 'Patel', 'sneha.patel@email.com', '6543210987', '2019-11-05', 2, 65000.00),
('Vikram', 'Singh', 'vikram.singh@email.com', '5432109876', '2022-09-12', 2, 65000.00), 
('Neha', 'Joshi', 'neha.joshi@email.com', '4321098765', '2021-06-30', 3, 67000.00),
('Arjun', 'Mehta', 'arjun.mehta@email.com', '3210987654', '2018-12-18', 3, 74000.00),
('Pooja', 'Reddy', 'pooja.reddy@email.com', '2109876543', '2017-10-22', 4, 69000.00),
('Suresh', 'Kumar', 'suresh.kumar@email.com', '1098765432', '2016-05-27', 5, 75000.00),
('Kavita', 'Desai', 'kavita.desai@email.com', '9988776655', '2023-02-10', 5, 71000.00);


ALTER TABLE Employees
ADD COLUMN DepartmentID INT,
ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);




CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID) 
);

INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID) VALUES
(1, 'Human Resources', 2),
(2, 'Finance', 1),
(3, 'IT & Software', 4),
(4, 'Marketing', 6),
(5, 'Sales', 5),
(6, 'Customer Support', 9),
(7, 'Research & Development', 7),
(8, 'Operations', 6),
(9, 'Legal', 9),
(10, 'Procurement', 10);




CREATE TABLE PerformanceReviews (
    ReviewID INT PRIMARY KEY,
    EmployeeID INT ,
    ReviewDate DATE,
    PerformanceScore VARCHAR(20),
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO PerformanceReviews (ReviewID, EmployeeID, ReviewDate, PerformanceScore, Comments) VALUES
(1, 1, '2024-01-15', 'Excellent', 'Consistently exceeds expectations in leadership.'),
(2, 3, '2023-12-10', 'Good', 'Strong performance, but needs improvement in teamwork.'),
(3, 4, '2024-02-20', 'Average', 'Meets expectations but lacks attention to detail.'),
(4, 5, '2023-11-05', 'Excellent', 'Demonstrates exceptional technical skills.'),
(5, 8, '2024-03-01', 'Poor', 'Needs additional training and supervision.'),
(6, 9, '2023-10-25', 'Good', 'Hardworking but requires better time management.'),
(7, 5, '2024-02-10', 'Excellent', 'Outstanding project management skills.'),
(8, 2, '2023-09-30', 'Average', 'Performance is satisfactory but needs improvement in deadlines.'),
(9, 6, '2024-01-05', 'Good', 'Adapts well to changes and new challenges.'),
(10, 2, '2023-12-20', 'Poor', 'Struggles with meeting deadlines and communication.');




CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,  
    EmployeeID INT , 
    PaymentDate DATE , 
    Amount DECIMAL(10,2) ,  
    PaymentMethod VARCHAR(50) , 
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) 
);

INSERT INTO Payroll (PayrollID, EmployeeID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 3, '2024-03-01', 75000.00, 'Bank Transfer'),
(2, 4, '2024-03-01', 70000.00, 'Check'),
(3, 2, '2024-03-01', 70000.00, 'Bank Transfer'),
(4, 1, '2024-03-01', 65000.00, 'Direct Deposit'),
(5, 1, '2024-03-01', 65000.00, 'Bank Transfer'),
(6, 5, '2024-03-01', 67000.00, 'Check'),
(7, 6, '2024-03-01', 74000.00, 'Bank Transfer'),
(8, 7, '2024-03-01', 69000.00, 'Direct Deposit'),
(9, 10, '2024-03-01', 75000.00, 'Check'),
(10, 9, '2024-03-01', 71000.00, 'Bank Transfer');







SELECT FirstName, LastName, Email, Phone, HireDate 
FROM Employees 
WHERE HireDate > '2023-01-01';



SELECT d.DepartmentID, d.DepartmentName, SUM(p.Amount) AS TotalPayroll 
FROM Employees e
JOIN Payroll p ON e.EmployeeID = p.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;



SELECT EmployeeID, FirstName, LastName, Email, Phone, HireDate 
FROM Employees 
WHERE ManagerID IS NULL;



SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentID, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(Salary) 
    FROM Employees 
    WHERE DepartmentID = e.DepartmentID
);



SELECT pr.EmployeeID, e.FirstName, e.LastName, pr.ReviewID, pr.ReviewDate, pr.PerformanceScore, pr.Comments
FROM PerformanceReviews pr
JOIN Employees e ON pr.EmployeeID = e.EmployeeID
WHERE pr.ReviewDate = (
    SELECT MAX(ReviewDate) 
    FROM PerformanceReviews 
    WHERE EmployeeID = pr.EmployeeID
);



SELECT d.DepartmentID, d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;



SELECT e.EmployeeID, e.FirstName, e.LastName, e.Email, e.Phone, pr.ReviewDate, pr.PerformanceScore
FROM Employees e
JOIN PerformanceReviews pr ON e.EmployeeID = pr.EmployeeID
WHERE pr.PerformanceScore = 'Excellent';
		


SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentID, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY e.Salary DESC
LIMIT 5;


SELECT EmployeeID, FirstName, LastName, Email, Phone, HireDate, Salary, DepartmentID
FROM Employees
WHERE ManagerID = 101;


