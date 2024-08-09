-- Comentarios no SQL comecam com -- 
-- Podemos fazer comentarios com multiplas linhas usando o /* e terminando o comentario com */

--
-- Banco de dados: https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc
--

-- Mostre os consumidores que tem nome 'Ana'
SELECT * 
FROM Customers
WHERE CustomerName = 'Ana'
;

-- Mostre os consumidores cujo nome começa com 'Ana'
SELECT * 
FROM Customers
WHERE CustomerName LIKE 'Ana%'
;

-- Mostre os consumidores cujo nome começa com 'Ana' OU 
-- a cidade é 'México D.F.'
SELECT * 
FROM Customers
WHERE CustomerName LIKE 'Ana%' OR City = 'México D.F.'
;

-- Mostre os consumidores cujo nome contem a string 'an'
SELECT * 
FROM Customers
WHERE CustomerName LIKE '%an%'
;

-- Mostre os consumidores cujo nome contem a string 'an' E
-- a cidade é 'México D.F.'
SELECT * 
FROM Customers
WHERE CustomerName LIKE '%an%' AND City = 'México D.F.'
;

-- Conte quantos consumidores existem em cada pais.
SELECT COUNT(*),Country 
FROM Customers
GROUP BY Country
;

-- Conte quantos consumidores existem em cada pais.
-- Atribua o nome 'Qtd' para o atributo com a contagem de consumidores.
SELECT COUNT(*) AS Qtd, Country 
FROM Customers
GROUP BY Country
;

-- Conte quantos consumidores existem em cada pais.
-- Mostre apenas aqueles com contagem > 5.
SELECT COUNT(*) AS Qtd, Country 
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 5
;

-- Conte quantos consumidores existem em cada pais.
-- Mostre apenas aqueles com contagem > 5 e cujo pais comece com 'U'.
SELECT COUNT(*) AS Qtd, Country 
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 5 AND Country LIKE 'U%'
;

-- Conte quantos consumidores existem em cada pais.
-- Mostre apenas aqueles com contagem > 1.
-- Ordene por ordem decrescente.
SELECT COUNT(*) AS Qtd, Country
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC
;

-- Conte quantos consumidores existem em cada pais.
-- Filtre pelos consumidores que comecam com 'A'.
-- Mostre apenas aqueles com contagem > 1.
SELECT COUNT(*) AS Qtd, Country 
FROM Customers
WHERE CustomerName LIKE 'A%'
GROUP BY Country
HAVING COUNT(*) > 1
;

-- Ordene os pedidos pela quantidade (do maior para o menor) e 
-- pegue o primeiro registro
-- O TOP NÃO FUNCIONA NO MYSQL (FUNCIONA NO ORACLE E OUTROS DBMSs)
SELECT TOP 1 *
FROM OrderDetails
ORDER BY Quantity DESC
;

-- Ordene os pedidos pela quantidade (do maior para o menor) e 
-- pegue o primeiro registro
-- O LIMIT SO FUNCIONA NO MYSQL
SELECT *
FROM OrderDetails
ORDER BY Quantity DESC
LIMIT 1
;

-- Calcule a media de precos dos produtos para 
-- cada categoria de produto
SELECT AVG(Price) AS MediaPreco, CategoryID
FROM Products
GROUP BY CategoryID
;

-- Coloque o nome dos consumidores em MAIUSCULO e minusculo
SELECT UPPER(CustomerName), LOWER(CustomerName)
FROM Customers
;

-- Mostre todos os atributos dos produtos mais caros de cada categoria.
-- Ordene o resultado pelo ID de categoria.
    -- Dentro do FROM temos uma subconsulta SQL que mostra o Produto com maior
    -- preco de cada categoria 
    -- A categoria é identificada por CategoriaIdMax
    -- Ja o preco é identificado por PrecoMax
SELECT Products.*
FROM (
    SELECT CategoryID AS CategoriaIdMax, MAX(Price) AS PrecoMax
    FROM Products
    GROUP BY CategoryID
), Products
WHERE Price = PrecoMax AND CategoryID = CategoriaIdMax
ORDER BY CategoryID
;

-- Mostre todos os produtos que pertencem à ultima categoria do DB
-- (isto é, ao maior numero de categoriaID)
SELECT *
FROM  Products
WHERE CategoryID IN (
    SELECT MAX(CategoryID)
    FROM Products
)
ORDER BY CategoryID
;

-- Mostre todos os produtos que pertencem às categorias 5, 7 e 8
SELECT *
FROM  Products
WHERE CategoryID IN (5, 7, 8)
ORDER BY CategoryID
;

-- Mostre as compras realizadas pelo clienteID 85 ou pelo empregadoID 9.
-- (as compras estao na tabela Orders).
-- Crie sua consulta sem usar operadores lógicos (AND, OR ou NOT).
(
    SELECT *
    FROM  Orders
    WHERE CustomerID = 85
) UNION (
    SELECT *
    FROM  Orders
    WHERE EmployeeID = 9
)
ORDER BY EmployeeID
;





