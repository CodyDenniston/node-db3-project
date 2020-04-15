-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

Select p.ProductName, c.CategoryName
FROM Product as p
JOIN Category as c ON p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id, Shipper.CompanyName, o.OrderDate 
FROM [Order] as o
JOIN Shipper on o.ShipVia = Shipper.Id
WHERE o.OrderDate < date("2012-08-09")

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, od.Quantity 
FROM Product as p,
    [ORDER] as o
JOIN OrderDetail as od 
Where o.Id = od.OrderId and od.ProductId = p.Id and o.id = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id, c.CompanyName, e.LastName 
FROM Customer as c,
    Employee as e
JOIN [ORDER] as o
Where o.CustomerId = c.Id and
    o.EmployeeId = e.Id
