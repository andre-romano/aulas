
--  ----------------------------------------
--    COMANDOS DDL (Definicao de dados)
--  ----------------------------------------

-- Apagar o banco de dados antigo (se existir)
DROP DATABASE IF EXISTS Loja;

-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Loja;
USE Loja;

-- A PRIMARY KEY é uma restrição que garante que cada linha em uma tabela tenha um identificador único.
-- No caso abaixo, cada cliente possui um id unico.
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    idade INT,
    cidade VARCHAR(255),
    saldo DECIMAL(10, 2)
);

-- A FOREIGN KEY é uma restrição que garante que o valor de uma coluna em uma tabela corresponda a um valor na coluna de outra tabela.
-- No caso abaixo, o valor de clientes_id deve existir no atributo clientes(id)
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- A NOT NULL é uma restrição que garante que uma coluna não pode conter valores nulos.
-- No caso abaixo, nem nome nem preco podem valores NULOS.
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DOUBLE NOT NULL
);

-- A DEFAULT é uma restrição que define um valor padrão para uma coluna se nenhum valor for especificado.
-- No caso abaixo, o saldo inicial (padrao) de um cliente é 0.00
-- e a data de abertura é o dia de hoje.
CREATE TABLE contas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    saldo FLOAT DEFAULT 0.00,
    data_abertura DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- A UNIQUE é uma restrição que garante que todos os valores em uma coluna (ou um conjunto de colunas) sejam únicos.
-- A diferença entre UNIQUE e PRIMARY KEY é que os atributos UNIQUE são
-- as chaves candidatas que o projetista nao selecionou como chaves primárias.
-- Isto é, o atributo PRIMARY KEY é a chave candidata que o projetista do banco 
-- escolheu como chave primária. Em ambos os casos, o valores devem ser únicos no DB. 
-- A escolha entre UNIQUE e PRIMARY KEY é puramente para facilitar o entendimento do projetista do DB
-- acerca de quem é a chave primária da tabela!
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- A CHECK é uma restrição que garante que todos os valores em uma coluna satisfaçam uma condição específica.
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2) CHECK (salario >= 0),
    idade INT CHECK (idade >= 18)
);

--  ----------------------------------------
--    COMANDOS DML (Manipulacao de dados)
--  ----------------------------------------

-- Inserir dados na tabela clientes
INSERT INTO clientes (nome, email, idade, cidade, saldo) VALUES
('João Silva', 'joao@example.com', 28, 'São Paulo', 100.50),
('Maria Souza', 'maria@example.com', 34, 'Rio de Janeiro', 200.75),
('Carlos Lima', 'carlos@example.com', 22, 'São Paulo', 300.00),
('Ana Pereira', 'ana@example.com', 40, 'Belo Horizonte', 150.25),
('Luiz Costa', 'luiz@example.com', 29, 'Curitiba', 120.50),
('Paulo Almeida', NULL, 45, 'Recife', 220.00),
('Fernanda Costa', 'fernanda@example.com', NULL, 'Salvador', 180.50),
('Xenia Ferreira', 'xenia@example.com', 32, 'Rio de Janeiro', 0.00)
;

-- Inserir dados na tabela pedidos
INSERT INTO pedidos (cliente_id, valor, data_pedido) VALUES
(1, 150.00, '2024-01-15'),
(2, 250.00, '2024-02-20'),
(3, 350.00, '2024-03-10'),
(4, 450.00, '2024-04-05'),
(5, 550.00, '2024-05-25')
;

-- Inserir dados na tabela produtos
INSERT INTO produtos (nome, preco) VALUES
('Laptop', 2500.00),
('Smartphone', 1500.00),
('Tablet', 1200.00),
('Monitor', 800.00),
('Teclado', 150.00)
;

-- TENTE ADICIONAR UM produto COM nome OU preco NULOS
-- isso deve dar erro no banco de dados por conta das restricoes de integridade NOT NULL 
-- da tabela produto

-- Inserir dados na tabela contas
INSERT INTO contas (cliente_id, saldo, data_abertura) VALUES
(1, 500.00, '2024-01-01'),
(2, 1000.00, '2024-01-02'),
(3, 1500.00, '2024-01-03'),
(4, 2000.00, '2024-01-04'),
(5, 2500.00, '2024-01-05')
;

-- Podemos adicionar contas sem passar a data_abertura
-- Nesses casos os valores DEFAULT serao usados (data_abertura = HOJE)
INSERT INTO contas (cliente_id, saldo) VALUES
(6, 200.00)
;

-- Podemos adicionar contas sem passar saldo e data_abertura
-- Nesses casos os valores DEFAULT serao usados (saldo = 0, data_abertura = HOJE)
INSERT INTO contas (cliente_id) VALUES
(7)
;

-- Inserir dados na tabela usuarios
INSERT INTO usuarios (nome_usuario, email, senha) VALUES
('joaosilva', 'joao.silva@example.com', 'senha123'),
('mariasantos', 'maria.santos@example.com', 'senha456'),
('carloslima', 'carlos.lima@example.com', 'senha789'),
('anapereira', 'ana.pereira@example.com', 'senha012'),
('luizcosta', 'luiz.costa@example.com', 'senha345')
;

-- TENTE ADICIONAR USUARIOS COM mesmo nome OU com mesmo email
-- isso deve dar erro no banco de dados por conta das restricoes de integridade UNIQUE 
-- da tabela usuarios

-- Inserir dados na tabela funcionarios
INSERT INTO funcionarios (nome, salario, idade) VALUES
('Ana Santos', 3500.00, 30),
('Carlos Mendes', 4500.00, 28),
('Maria Oliveira', 5000.00, 32),
('Pedro Silva', 4000.00, 25),
('Juliana Costa', 6000.00, 35)
;

-- TENTE ADICIONAR UM FUNCIONARIO COM SALARIO <= 0 OU COM IDADE < 18
-- isso deve dar erro no banco de dados por conta das restricoes de integridade CHECK 
-- da tabela funcionarios

--  ---------------------
--       IMPORTANTE
--  ---------------------

-- Os comandos CREATE ASSERTION e CREATE DOMAIN nao sao suportados pelo MySQL
-- É possivel simular seu comportamento usando TRIGGERS e PROCEDURES 
-- (veremos esses assuntos em breve)

