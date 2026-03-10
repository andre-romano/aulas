
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







