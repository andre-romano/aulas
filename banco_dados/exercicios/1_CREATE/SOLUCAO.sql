
---------------------------------
-- ### Parte 1: Criação do Banco de Dados e Tabelas
---------------------------------

-- 1. Crie um banco de dados chamado `rh_empresa`
CREATE DATABASE rh_empresa;
USE rh_empresa;

-- 2. Crie uma tabela `departamentos` com os seguintes campos:
CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    orcamento NUMERIC(10, 2),
    data_criacao DATE,
    ativo BOOLEAN DEFAULT TRUE
);

-- 3. Crie uma tabela `funcionarios` com os seguintes campos:
CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    salario NUMERIC(10, 2),
    data_admissao DATETIME,
    horario_trabalho TIME,
    id_departamento INT,
    observacoes TEXT,
);

---------------------------------
-- ### Parte 2: Inserção de Dados
---------------------------------

-- 1. Insira 3 departamentos diferentes na tabela `departamentos`:
INSERT INTO departamentos (nome, orcamento, data_criacao, ativo) VALUES
('TI', 500000.00, '2010-05-15', TRUE),
('Recursos Humanos', 300000.00, '2010-05-15', TRUE),
('Financeiro', 450000.00, '2011-02-20', TRUE);

-- 2. Insira 5 funcionários na tabela `funcionarios`, distribuídos entre os departamentos:
INSERT INTO funcionarios (nome, cpf, salario, data_admissao, horario_trabalho, id_departamento, observacoes) VALUES
('João Silva', '12345678901', 4500.00, '2020-03-10 08:00:00', '08:00:00', 1, 'Desenvolvedor Senior'),
('Maria Santos', '23456789012', 3800.00, '2021-05-15 09:00:00', '09:00:00', 2, NULL),
('Carlos Oliveira', '34567890123', 5200.00, '2019-11-20 08:30:00', '08:30:00', 1, 'Arquiteto de Software'),
('Ana Pereira', '45678901234', 4200.00, '2022-01-05 08:00:00', '08:00:00', 3, NULL),
('Pedro Costa', '56789012345', 3500.00, '2022-06-18 09:30:00', '09:30:00', 2, 'Estagiário');

---------------------------------
-- ### Parte 3: Alterações na Estrutura
---------------------------------

-- 1. Adicione uma coluna `email` na tabela `funcionarios` que deve ser um texto com até 100 caracteres:
ALTER TABLE funcionarios ADD COLUMN email VARCHAR(100);

-- 2. Modifique a coluna `orcamento` na tabela `departamentos` para usar DOUBLE:
ALTER TABLE departamentos MODIFY COLUMN orcamento DOUBLE;

-- 3. Renomeie a coluna `observacoes` para `descricao` na tabela `funcionarios`:
ALTER TABLE funcionarios RENAME COLUMN observacoes TO descricao;

---------------------------------
-- ### Parte 4: Atualização de Dados
---------------------------------

-- 1. Atualize o email dos funcionários (use nomes fictícios):
UPDATE funcionarios SET email = 'joao.silva@empresa.com' WHERE id_funcionario = 1;
UPDATE funcionarios SET email = 'maria.santos@empresa.com' WHERE id_funcionario = 2;
UPDATE funcionarios SET email = 'carlos.oliveira@empresa.com' WHERE id_funcionario = 3;
UPDATE funcionarios SET email = 'ana.pereira@empresa.com' WHERE id_funcionario = 4;
UPDATE funcionarios SET email = 'pedro.costa@empresa.com' WHERE id_funcionario = 5;

-- 2. Aumente o salário em 10% para todos os funcionários do departamento de TI:
UPDATE funcionarios SET salario = salario * 1.10 WHERE id_departamento = 1;

---------------------------------
-- ### Parte 5: Exclusão de Dados
---------------------------------

-- 1. Delete o funcionário Pedro Costa:
DELETE FROM funcionarios WHERE nome = 'Pedro Costa';

-- 2. Crie e depois delete uma tabela de teste:
CREATE TABLE teste (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);
DROP TABLE teste;

-- 3. Adicione uma coluna `data_nascimento` na tabela `funcionarios`:
ALTER TABLE funcionarios ADD COLUMN data_nascimento DATE;

-- 4. Atualize os registros existentes com datas de nascimento fictícias:
UPDATE funcionarios SET data_nascimento = '1985-07-20' WHERE id_funcionario = 1;
UPDATE funcionarios SET data_nascimento = '1990-03-15' WHERE id_funcionario = 2;
UPDATE funcionarios SET data_nascimento = '1982-11-30' WHERE id_funcionario = 3;
UPDATE funcionarios SET data_nascimento = '1988-05-10' WHERE id_funcionario = 4;