USE Northwind
/*1.	������ ���� ����������� (������� CompanyName � ������� Suppliers), � ������� ��� ���� �� ������ �������� �� ������ (UnitsInStock � ������� Products ����� 0). ������������ ��������� SELECT ��� ����� ������� � �������������� ��������� IN. */
SELECT CompanyName FROM Suppliers
	WHERE SupplierID in (SELECT SupplierID FROM Products 
							WHERE UnitsInStock = 0)
GO
/*2.	������ ���� ���������, ������� ����� ����� 150 �������. ������������ ��������� SELECT.*/
SELECT * FROM Employees
	WHERE EmployeeID in (SELECT EmployeeID FROM Orders
							GROUP BY EmployeeID
							HAVING COUNT(OrderID) > 150)
GO
/*3.	������ ���� ���������� (������� Customers), ������� �� ����� �� ������ ������ (��������� �� ������� Orders). ������������ �������� EXISTS.*/
SELECT * FROM Customers as c
	WHERE EXISTS (SELECT * FROM Orders as o
							WHERE c.CustomerID = o.CustomerID
							GROUP BY o.CustomerId
							HAVING COUNT(o.OrderID) = 0 Or (COUNT(o.OrderID) > 0 AND COUNT(o.OrderID) < 10))