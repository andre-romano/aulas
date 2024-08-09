
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