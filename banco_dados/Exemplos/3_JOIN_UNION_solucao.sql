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
('Prof. Oliveira')
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
('Fisiopatologia', 1)
;

INSERT INTO matriculas (id_aluno, id_disciplina) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1)
;

-- Uso de UNION para combinar resultados de duas queries
SELECT nome FROM alunos WHERE id_curso = 1
UNION
SELECT nome FROM alunos WHERE id_curso = 2;

-- Uso de INTERSECT (simulado) para encontrar alunos matriculados em ambas as disciplinas
SELECT a.nome 
FROM alunos a
JOIN matriculas m1 ON a.id = m1.id_aluno
JOIN matriculas m2 ON a.id = m2.id_aluno
WHERE m1.id_disciplina = 1 AND m2.id_disciplina = 2;

-- Uso de EXCEPT (simulado) para encontrar alunos de Engenharia que não estão matriculados em Fisica
SELECT nome 
FROM alunos 
-- curso == ENGENHARIA
WHERE id_curso = 1 AND id NOT IN (
    SELECT id_aluno 
    FROM matriculas 
    WHERE id_disciplina = 2 -- disciplina == FISICA
);

-- Uso de INNER JOIN para encontrar alunos e suas disciplinas
SELECT a.nome AS aluno, d.nome AS disciplina
FROM alunos a
INNER JOIN matriculas m ON a.id = m.id_aluno
INNER JOIN disciplinas d ON m.id_disciplina = d.id;

-- Uso de INNER JOIN para encontrar alunos e suas disciplinas
SELECT a.nome AS aluno, d.nome AS disciplina
FROM alunos a, matriculas m, disciplinas d
WHERE a.id = m.id_aluno AND m.id_disciplina = d.id;

-- Uso de LEFT OUTER JOIN para encontrar todos os alunos e suas disciplinas, incluindo aqueles que não estão matriculados
SELECT a.nome AS aluno, d.nome AS disciplina
FROM alunos a
LEFT JOIN matriculas m ON a.id = m.id_aluno
LEFT JOIN disciplinas d ON m.id_disciplina = d.id;

-- Uso de RIGHT OUTER JOIN para encontrar todas as disciplinas e os alunos matriculados, incluindo disciplinas sem alunos
SELECT a.nome AS aluno, d.nome AS disciplina
FROM alunos a
RIGHT JOIN matriculas m ON a.id = m.id_aluno
RIGHT JOIN disciplinas d ON m.id_disciplina = d.id;

-- Uso de EXCLUDING JOIN (simulado) para encontrar alunos que não estão matriculados em nenhuma disciplina
SELECT nome FROM alunos
WHERE id NOT IN (
    SELECT id_aluno FROM matriculas
);

