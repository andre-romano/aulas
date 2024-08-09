-- Apagar o banco de dados antigo (se existir)
DROP DATABASE IF EXISTS Biblioteca;

-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

-- Criação da Tabela de Livros
CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ano YEAR,
    genero VARCHAR(100)
);

-- Criação da Tabela de Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)
);

-- Criação da Tabela de Empréstimos
CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_livro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_livro) REFERENCES livros(id)
);

-- Inserção de Dados Exemplo
INSERT INTO livros (titulo, autor, ano, genero) VALUES
('1984',               'George Orwell',    1949, 'Ficção Científica'),
('O Senhor dos Anéis', 'J.R.R. Tolkien',   1954, 'Fantasia'),
('Dom Casmurro',       'Machado de Assis', 1899, 'Romance')
;

INSERT INTO clientes (nome, email, telefone) VALUES
('João Silva',     'joao.silva@example.com',     '123456789'),
('Maria Oliveira', 'maria.oliveira@example.com', '987654321')
;

INSERT INTO emprestimos (id_cliente, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 1, '2024-07-01', '2024-07-15'),
(2, 2, '2024-07-03', '2024-07-17')
;

-- Criação de uma View para Visualizar Empréstimos
CREATE VIEW vw_emprestimos AS
SELECT e.id, c.nome AS cliente, l.titulo AS livro, e.data_emprestimo, e.data_devolucao
FROM emprestimos e
JOIN clientes c ON e.id_cliente = c.id
JOIN livros l ON e.id_livro = l.id;

-- A partir de agora podemos usar a VIEW vw_emprestimos em qualquer lugar onde uma tabela comum seria utilizada
SELECT * 
FROM vw_emprestimos;

-- Criação de um Trigger para Atualizar a Tabela de Livros Quando um Empréstimo é Adicionado
DELIMITER //
CREATE TRIGGER tr_emprestimo_adicionado
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    UPDATE livros 
    SET ano = YEAR(NEW.data_emprestimo)
    WHERE id = NEW.id_livro;
END //
DELIMITER ;

-- Criação de uma Stored Procedure para Adicionar Novo Empréstimo
DELIMITER //
CREATE PROCEDURE sp_adicionar_emprestimo (
    IN p_id_cliente INT,
    IN p_id_livro INT,
    IN p_data_emprestimo DATE,
    IN p_data_devolucao DATE
)
BEGIN
    INSERT INTO emprestimos (id_cliente, id_livro, data_emprestimo, data_devolucao)
    VALUES (p_id_cliente, p_id_livro, p_data_emprestimo, p_data_devolucao);
END //
DELIMITER ;

-- Exemplo de Execução da Stored Procedure
CALL sp_adicionar_emprestimo(1, 3, '2024-08-01', '2024-08-15');
