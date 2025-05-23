-- Apagar o banco de dados antigo (se existir)
DROP DATABASE IF EXISTS Escola;

-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Escola;
USE Escola;

-- Criação da Tabela de Cursos
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Criação da Tabela de Professores
CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Criação da Tabela de Alunos
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- Criação da Tabela de Disciplinas
CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id)
);

-- Criação da Tabela de Matrículas
CREATE TABLE matriculas (
    id_aluno INT,
    id_disciplina INT,
    PRIMARY KEY (id_aluno, id_disciplina),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id)
);

-- Inserção de Dados Exemplo
INSERT INTO cursos (nome) VALUES
('Engenharia'),
('Direito'),
('Medicina')
;

INSERT INTO professores (nome) VALUES
('Prof. Silva'),
('Prof. Oliveira'),
('Prof. Eustáquio')
;

INSERT INTO alunos (nome, id_curso) VALUES
('Alice', 1),
('Bob', 2),
('Carlos', 1),
('José', 3)
;

INSERT INTO disciplinas (nome, id_professor) VALUES
('Matemática', 1),
('Física', 1),
('Direito Constitucional', 2),
('Fisiopatologia', 2),
('Banco de dados', null)
;

INSERT INTO matriculas (id_aluno, id_disciplina) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1)
;