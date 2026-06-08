-- 1. Display all customers
SELECT CustomerID, FirstName, LastName, Email
FROM Customers;

-- 2. Display all orders with customer names
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 3. Display products and their categories
SELECT p.ProductName, p.Price, c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;

-- 4. Display employees and their departments
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;
