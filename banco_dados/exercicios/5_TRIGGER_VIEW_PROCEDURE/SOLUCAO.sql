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
    saldo FLOAT NOT NULL DEFAULT 0,
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

-- CRIAR TRIGGERS, PROCEDURES e VIEWS

DELIMITER $$

CREATE TRIGGER trg_ajuste_salario
AFTER INSERT
ON transacoes
FOR EACH ROW
BEGIN
    -- update que reduz na origem
    UPDATE Contas 
    SET saldo = saldo - NEW.valor 
    WHERE contas.id = NEW.id_conta_origem ;

    -- update que adiciona no destino
    UPDATE Contas 
    SET saldo = saldo + NEW.valor 
    WHERE contas.id = NEW.id_conta_destino ;
END $$


DELIMITER ;

-- CRIAR VIEW AQUI 
-- MOSTRAR nome do cliente, numero da agencia, nome da agencia, numero da conta, e saldo da conta.

CREATE VIEW vw_cliente_conta_agencia(cliente, num_agencia, nome_agencia, num_conta, saldo) AS (
	SELECT clientes.nome, agencias.id, agencias.nome, contas.numero, contas.saldo
	FROM clientes, agencias, contas
    WHERE contas.id_cliente = clientes.id 
        AND
        contas.id_agencia = agencias.id
);

-- PROCEDURE de transacoes
DELIMITER $$
CREATE PROCEDURE InserirTransacao (
    IN p_id_origem INT,
    IN p_id_destino INT,
    IN p_valor FLOAT
)
BEGIN
	INSERT INTO transacoes (
        id_conta_origem, 
        id_conta_destino, 
        valor
    ) VALUES (
        p_id_origem, 
        p_id_destino, 
        p_valor
    );
END $$
DELIMITER ;

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

-- chamar o procedure pra inserir transacoes aqui
CALL InserirTransacao(2, 1, 100);
CALL InserirTransacao(2, 1, 50);
