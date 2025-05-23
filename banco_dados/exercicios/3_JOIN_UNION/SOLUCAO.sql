
-- Mostre o nome das disciplinas e nome dos professores que as lecionam.
-- Use INNER JOIN para juntar essas tabelas.
SELECT disciplinas.nome AS disciplina, disciplinas.id_professor, professores.id, professores.nome AS professor
FROM disciplinas
INNER JOIN professores ON disciplinas.id_professor = professores.id
;

-- Mostre o nome das disciplinas e nome dos professores que as lecionam.
-- Use WHERE no lugar de INNER JOIN para juntar essas tabelas.
SELECT disciplinas.nome AS disciplina, disciplinas.id_professor, professores.id, professores.nome AS professor
FROM disciplinas, professores 
WHERE disciplinas.id_professor = professores.id
;

-- Mostre o nome de todos os professores e suas respectivas disciplinas. Aqueles que nao ministram disciplinas tambem devem aparecer.
-- Use RIGHT JOIN na consulta.
SELECT disciplinas.nome AS disciplina, professores.nome AS professor
FROM disciplinas 
RIGHT JOIN professores ON disciplinas.id_professor = professores.id
;

-- Mostre o nome dos professores que nao ministram disciplinas.
-- Use RIGHT EXCLUDING JOIN na consulta.
SELECT disciplinas.id_professor, professores.nome
FROM disciplinas 
RIGHT JOIN professores ON disciplinas.id_professor = professores.id
WHERE disciplinas.id_professor IS NULL
;

-- Mostre o nome das disciplinas e nome dos alunos que estao matriculados.
-- Use INNER JOIN na consulta.
SELECT disciplinas.nome AS disciplina, alunos.nome AS aluno
FROM matriculas 
INNER JOIN alunos ON matriculas.id_aluno = alunos.id
INNER JOIN disciplinas ON matriculas.id_disciplina = disciplinas.id
;

-- Mostre o nome dos alunos que nao estao matriculados em nenhuma disciplina.
-- Use INNER JOIN na consulta.
SELECT matriculas.id_aluno, alunos.nome AS aluno
FROM matriculas 
RIGHT JOIN alunos ON matriculas.id_aluno = alunos.id
WHERE matriculas.id_aluno IS NULL
;