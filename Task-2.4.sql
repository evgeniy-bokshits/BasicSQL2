USE Northwind
/*1.	Выдать всех поставщиков (колонка CompanyName в таблице Suppliers), у которых нет хотя бы одного продукта на складе (UnitsInStock в таблице Products равно 0). Использовать вложенный SELECT для этого запроса с использованием оператора IN. */
SELECT CompanyName FROM Suppliers
	WHERE SupplierID in (SELECT SupplierID FROM Products 
							WHERE UnitsInStock = 0)
GO
/*2.	Выдать всех продавцов, которые имеют более 150 заказов. Использовать вложенный SELECT.*/
SELECT * FROM Employees
	WHERE EmployeeID in (SELECT EmployeeID FROM Orders
							GROUP BY EmployeeID
							HAVING COUNT(OrderID) > 150)
GO
/*3.	Выдать всех заказчиков (таблица Customers), которые не имеют ни одного заказа (подзапрос по таблице Orders). Использовать оператор EXISTS.*/
SELECT * FROM Customers as c
	WHERE EXISTS (SELECT * FROM Orders as o
							WHERE c.CustomerID = o.CustomerID
							GROUP BY o.CustomerId
							HAVING COUNT(o.OrderID) = 0 Or (COUNT(o.OrderID) > 0 AND COUNT(o.OrderID) < 10))