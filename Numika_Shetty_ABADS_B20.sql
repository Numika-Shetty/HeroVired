use northwind;

/* IMPORTANT INSTRUCTIONS FOR LEARNERS
1) DO NOT CHANGE THE ORDER OF COLUMNS.
2) YOUR QUERY SHOULD DISPLAY COLUMNS IN THE SAME ORDER AS MENTIONED IN ALL QUESTIONS.
3) YOU CAN FIND THE ORDER OF COLUMNS IN QUESTION TEMPLATE SECTION OF EACH QUESTION.
4) USE ALIASING AS MENTIONED IN QUESTION TEMPLATE FOR ALL COLUMNS
5) DO NOT CHANGE COLUMN NAMES*/
                   
-- Question 1 (Marks: 2)
-- Objective: Retrieve data using basic SELECT statements
-- List the names of all customers in the database.
-- Question Template: Display CustomerName Column

-- Write your SQL solution here
select CustomerName
from customers;

-- Question 2 (Marks: 2)
-- Objective: Apply filtering using the WHERE clause
-- Retrieve the names and prices of all products that cost less than $15.
-- Question Template: Display ProductName Column

-- Write your SQL solution here
select ProductName 
from products
where Price < 15;

-- Question 3 (Marks: 2)
-- Objective: Use SELECT to extract multiple fields
-- Display all employees first and last names.
-- Question Template: Display FirstName, LastName Columns

-- Write your SQL solution here
select FirstName , LastName
from employees;


-- Question 4 (Marks: 2)
-- Objective: Filter data using a function on date values
-- List all orders placed in the year 1997.
-- Question Template: Display OrderID, OrderDate Columns

-- Write your SQL solution here
select OrderID , OrderDate
from orders o
where year(OrderDate) = 1997;

-- Question 5 (Marks: 2)
-- Objective: Apply numeric filters
-- List all products that have a price greater than $50.
-- Question Template: Display ProductName, Price Column

-- Write your SQL solution here
select ProductName , Price
from products
where Price > 50;

-- Question 6 (Marks: 3)
-- Objective: Perform multi-table JOIN operations
-- Show the names of customers and the names of the employees who handled their orders.
-- Question Template: Display CustomerName, FirstName, LastName Columns

-- Write your SQL solution here
select c.CustomerName , e.FirstName , e.LastName
from orders o
inner join employees e on e.EmployeeID = o.EmployeeID
inner join customers c on c.CustomerID = o.CustomerID;

-- Question 7 (Marks: 3)
-- Objective: Use GROUP BY for aggregation
-- List each country along with the number of customers from that country.
-- Question Template: Display Country, CustomerCount Columns

-- Write your SQL solution here

select Country , count(CustomerID) as 'CustomerCount'
from customers
group by Country;

-- Question 8 (Marks: 3)
-- Objective: Group data by a foreign key relationship and apply aggregation
-- Find the average price of products grouped by category.
-- Question Template: Display CategoryName, AvgPrice Columns

-- Write your SQL solution here
select c.CategoryName , avg(p.Price) as 'AvgPrice'
from products p
inner join categories c on c.CategoryID = p.CategoryID
group by c.CategoryName;

-- Question 9 (Marks: 3)
-- Objective: Use aggregation to count records per group
-- Show the number of orders handled by each employee.
-- Question Template: Display EmployeeID, OrderCount Columns

-- Write your SQL solution here
select e.EmployeeID , count(OrderID) as 'OrderCount'
from employees e
inner join orders o on o.EmployeeID = e.EmployeeID
group by e.EmployeeID ;

-- Question 10 (Marks: 3)
-- Objective: Filter results using values from a joined table
-- List the names of products supplied by "Exotic Liquids".
-- Question Template: Display ProductName Column

-- Write your SQL solution here
select ProductName
from products p
inner join suppliers s on s.SupplierID = p.SupplierID
where s.SupplierName ='Exotic Liquid';

-- Question 11 (Marks: 5)
-- Objective: Rank records using aggregation and sort
-- List the top 3 most ordered products (by quantity).
-- Question Template: Display ProductID, TotalOrdered Columns

-- Write your SQL solution here
select ProductID , sum(Quantity) as 'TotalOrdered'
from orderdetails o
group by ProductID
order by sum(Quantity) desc
LIMIT 3;


-- Question 12 (Marks: 5)
-- Objective: Use GROUP BY and HAVING to filter on aggregates
-- Find customers who have placed orders worth more than $10,000 in total.
-- Question Template: Display CustomerName, TotalSpent Columns

-- Write your SQL solution here
select c.CustomerName , sum(od.Quantity * p.price) as 'TotalSpent'
from customers c
inner join orders o on o.CustomerID = c.CustomerID
inner join orderdetails od on od.OrderID = o.OrderID
inner join products p on p.ProductID = od.ProductID
group by CustomerName 
having TotalSpent > 10000;


-- Question 13 (Marks: 5)
-- Objective: Aggregate and filter at the order level
-- Display order IDs and total order value for orders that exceed $2,000 in value.
-- Question Template: Display OrderID, OrderValue Columns

-- Write your SQL solution here
select od.OrderID , sum(od.Quantity * p.Price) as 'OrderValue'
from orderdetails od 
inner join products p on p.ProductID = od.ProductID
group by od.OrderID 
having OrderValue > 2000;


-- Question 14 (Marks: 5)
-- Objective: Use subqueries in HAVING clause
-- Find the name(s) of the customer(s) who placed the largest single order (by value).
-- Question Template: Display CustomerName, OrderID, TotalValue Column

-- Write your SQL solution here
select c.CustomerName, o.OrderID, SUM(od.Quantity * p.Price) AS TotalValue
from orders o
inner join customers c ON o.CustomerID = c.CustomerID
inner join orderdetails od ON o.OrderID = od.OrderID
inner join products p ON od.ProductID = p.ProductID
group by o.OrderID, c.CustomerName
having TotalValue = (
						select MAX(TotalOrder)
						from (
									select o.OrderID,SUM(od.Quantity * p.Price) AS TotalOrder
									from orders o
									inner join orderdetails od ON o.OrderID = od.OrderID
									inner join products p ON od.ProductID = p.ProductID
									group by o.OrderID
							) AS TotalOrder
);


-- Question 15 (Marks: 5)
-- Objective: Identify records using NOT IN with subquery
-- Get a list of products that have never been ordered.
-- Question Template: Display ProductName Columns

-- Write your SQL solution here
select ProductName
from products p
where p.ProductID NOT IN (
							select distinct ProductID from orderdetails
						 )
