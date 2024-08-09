-- BANCO DE DADOS
-- https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all

-- pegue os dados da tabela clientes e da tabela pedidos e
-- mostre eles em uma tabela só na tela
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID
;

-- Pegue os dados da tabela clientes e da tabela pedidos. 
-- Considere também os clientes que nao realizaram nenhum pedido.
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID=Customers.CustomerID
;

-- pegue todos os clientes que nao pediram nada na loja (nenhuma ordem) 
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE Orders.CustomerID is null
;

-- pegue todos os clientes que nao pediram nada na loja (nenhuma ordem) 
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE Orders.CustomerID is null
;

-- pegue a cidade de ambos os consumidores e fornecedores da loja
(
    SELECT City FROM Customers
) UNION (
    SELECT City FROM Suppliers
)
ORDER BY City
;
