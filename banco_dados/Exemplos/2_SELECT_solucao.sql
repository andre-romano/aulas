
--  ----------------------------------------
--    COMANDOS DDL (Definicao de dados)
--  ----------------------------------------

-- Apagar o banco de dados antigo (se existir)
DROP DATABASE IF EXISTS Banco;

-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Banco;
USE Banco;

-- Criacao da tabela clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    idade INT,
    cidade VARCHAR(255),
    saldo DOUBLE
);

-- Adicionar uma nova coluna chamada telefone:
ALTER TABLE clientes
ADD telefone VARCHAR(15);

-- Excluir a coluna telefone:
ALTER TABLE clientes
DROP COLUMN telefone;

-- Renomear a coluna cidade para localidade:
ALTER TABLE clientes
CHANGE cidade localidade VARCHAR(255);

-- Renomear a coluna localidade para cidade:
ALTER TABLE clientes
CHANGE localidade cidade VARCHAR(255);

--  ----------------------------------------
--    COMANDOS DML (Manipulacao de dados)
--  ----------------------------------------

-- Inserir dados na tabela clientes
INSERT INTO clientes (nome, email, idade, cidade, saldo) VALUES
('João Silva', 'joao@example.com', 28, 'São Paulo', 100.50),
('Maria Souza', 'maria@example.com', 34, 'Rio de Janeiro', 200.75),
('Carlos Lima', 'carlos@example.com', 22, 'São Paulo', 300.00),
('Ana Pereira', 'ana@example.com', 40, 'Belo Horizonte', 150.25),
('Arnaldo Junior', 'arnaldo@example.com', 24, 'São Paulo', 330.00),
('Luiz Costa', 'luiz@example.com', 29, 'Curitiba', 120.50),
('Paulo Almeida', NULL, 45, 'Recife', 220.00),
('Fernanda Costa', 'fernanda@example.com', NULL, 'Salvador', 180.50),
('Xenia Ferreira', 'xenia@example.com', 32, 'Rio de Janeiro', 0.00)
;

-- Atualizar o saldo do cliente cujo id = 1:
UPDATE clientes
SET saldo = 101.80
WHERE id = 1;

-- Incrementar a idade de todos os clientes que estão em 'São Paulo' em em 1 ano :
UPDATE clientes
SET idade = idade + 1
WHERE cidade = 'São Paulo';

-- Incrementar a idade de todos os clientes que estão em 'São Paulo' em em 1 ano :
UPDATE clientes
SET idade = idade - 1
WHERE cidade = 'São Paulo';

-- Atualizar a cidade de todos os clientes que estão em 'São Paulo' para 'SP':
UPDATE clientes
SET cidade = 'SP'
WHERE cidade = 'São Paulo';

-- Atualizar a cidade de todos os clientes que estão em 'SP' para 'São Paulo':
UPDATE clientes
SET cidade = 'São Paulo'
WHERE cidade = 'SP';

-- Excluir o cliente cujo id = 1:
DELETE FROM clientes
WHERE id = 1;

-- Excluir todos os clientes que têm saldo zero:
DELETE FROM clientes
WHERE saldo = 0;

-- Mostre todas as colunas da tabela clientes:
SELECT * 
FROM clientes;

-- Mostre somente as colunas nome, email, cidade de clientes
SELECT nome, email, cidade 
FROM clientes;

-- Ordenar os clientes por nome em ordem alfabética:
SELECT * FROM clientes
ORDER BY nome;

-- Ordenar os clientes por idade em ordem decrescente:
SELECT * FROM clientes
ORDER BY idade DESC;

-- Ordenar os clientes por cidade em ordem alfabética e, 
-- dentro de cada cidade, por saldo em ordem decrescente:
SELECT * FROM clientes
ORDER BY cidade, saldo DESC;

-- Selecionar clientes que são de 'São Paulo':
SELECT * FROM clientes 
WHERE cidade = 'São Paulo';

-- Selecionar clientes com idade maior que 30:
SELECT * FROM clientes 
WHERE idade > 30;

-- Selecionar clientes cujo nome começa com 'A':
SELECT * FROM clientes 
WHERE nome LIKE 'A%';

-- Selecionar clientes cujo primeiro nome tem exatamente 5 caracteres:
SELECT * FROM clientes 
WHERE nome LIKE '_____ %';

-- Selecionar clientes cuja idade é nula:
SELECT * FROM clientes
WHERE idade IS NULL;

-- Selecionar clientes cujo email é nulo:
SELECT * FROM clientes
WHERE email IS NULL;

-- Selecionar clientes cujo email e telefone são não nulos:
SELECT * FROM clientes
WHERE email IS NOT NULL AND idade IS NOT NULL;

-- Selecionar cidades que têm um saldo médio maior que 150:
SELECT cidade, AVG(saldo) AS saldo_medio
FROM clientes
GROUP BY cidade
HAVING AVG(saldo) > 150;

-- Selecionar clientes convertendo seus nomes para minusculas e emails para maiusculas
SELECT LOWER(nome) AS nome_maiusculo, UPPER(email) AS email_minusculo 
FROM clientes;

-- Selecionar a idade máxima dos clientes:
SELECT MAX(idade) AS idade_maxima 
FROM clientes;

-- Selecionar a soma dos saldos de todos os clientes:
SELECT SUM(saldo) AS soma_saldos 
FROM clientes;

-- Selecionar a média das idades dos clientes:
SELECT AVG(idade) AS idade_media 
FROM clientes;

-- Selecionar clientes cujo saldo é maior que a média de saldo de todos os clientes:
SELECT * FROM clientes
WHERE saldo > (
    SELECT AVG(saldo) FROM clientes
);

-- Selecionar a média de idade por cidade e mostrar apenas cidades com média de idade maior que 30:
SELECT cidade, idade_media
FROM (
    SELECT cidade, AVG(idade) AS idade_media
    FROM clientes
    GROUP BY cidade
) AS subconsulta
WHERE idade_media > 30;

-- Selecionar todos os clientes e calcular um saldo atualizado com 10% de acréscimo:
SELECT id, nome, saldo, saldo * 1.10 AS saldo_atualizado
FROM clientes;

-- Selecionar todos os clientes que têm saldo maior que 150 e idade menor que 30:
SELECT * FROM clientes
WHERE saldo > 150 AND idade < 30;

-- Selecionar todos os clientes que são de 'São Paulo' ou 'Rio de Janeiro':
SELECT * FROM clientes
WHERE cidade = 'São Paulo' OR cidade = 'Curitiba';

-- Selecionar todos os clientes que não são de 'Curitiba':
SELECT * FROM clientes
WHERE cidade != 'Curitiba';

-- Selecionar todos os clientes cujo saldo é maior que o saldo de pelo menos um cliente de 'São Paulo':
SELECT * FROM clientes
WHERE saldo > SOME (
    SELECT saldo FROM clientes WHERE cidade = 'São Paulo'
);

-- Selecionar todos os clientes cuja idade é menor que a idade de pelo menos um cliente de 'Rio de Janeiro':
SELECT * FROM clientes
WHERE idade < SOME (
    SELECT idade FROM clientes WHERE cidade = 'Rio de Janeiro'
);

-- Selecionar todos os clientes cujo saldo é maior que o saldo de todos os clientes de 'Curitiba':
SELECT * FROM clientes
WHERE saldo > ALL (
    SELECT saldo FROM clientes WHERE cidade = 'Rio de Janeiro'
);

-- Selecionar todos os clientes cuja idade é menor que a idade de todos os clientes de 'Belo Horizonte':
SELECT * FROM clientes
WHERE idade < ALL (
    SELECT idade FROM clientes WHERE cidade = 'Belo Horizonte'
);







