USE Northwind
/*
1.	Определить продавцов, которые обслуживают регион 'Western' (таблица Region). 
*/
SELECT distinct e.EmployeeID, e.FirstName, e.LastName FROM Employees as e
	JOIN EmployeeTerritories as et ON e.EmployeeID = et.EmployeeID
		JOIN Territories as t on et.TerritoryID = t.TerritoryID
			JOIN Regions as r on t.RegionID = r.RegionID
				WHERE r.RegionDescription = 'Western' 
GO
/*
2.	Выдать в результатах запроса имена всех заказчиков из таблицы Customers и суммарное количество их заказов из таблицы Orders. Принять во внимание, что у некоторых заказчиков нет заказов, но они также должны быть выведены в результатах запроса. Упорядочить результаты запроса по возрастанию количества заказов.
*/
SELECT c.CompanyName, COUNT(o.OrderID) as 'Total orders' FROM Customers as c
	LEFT JOIN Orders as o on c.CustomerID = o.CustomerID
		GROUP BY c.CompanyName