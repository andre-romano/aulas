DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;
USE banco;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    UNIQUE(cpf)
);

CREATE TABLE agencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    UNIQUE(nome)
);

CREATE TABLE contas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    saldo FLOAT NOT NULL DEFAULT 0 CHECK (saldo >= 0),
    id_agencia INT NOT NULL,
    id_cliente INT NOT NULL, 
    UNIQUE(numero, id_agencia),
    FOREIGN KEY (id_agencia) REFERENCES agencias(id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE transacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_conta_origem INT NOT NULL,
    id_conta_destino INT NOT NULL,
    valor FLOAT NOT NULL CHECK (valor > 0),
    FOREIGN KEY (id_conta_origem) REFERENCES contas(id),
    FOREIGN KEY (id_conta_destino) REFERENCES contas(id)
);

-- INSERIR DADOS

INSERT INTO clientes (nome, cpf) VALUES 
('Jose','000.111.222-33'),
('Maria','444.555.666-77')
;

INSERT INTO agencias (nome) VALUES 
('Agencia Valença'),
('Agencia Salvador')
;

INSERT INTO contas (numero, id_agencia, id_cliente, saldo) VALUES 
(3456, 1, 2, 1500),
(7891, 2, 1, 200)
;