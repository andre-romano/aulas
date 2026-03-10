-- criar banco de dados aqui

-- CRIAR TABELAS AQUI
CREATE TABLE clientes (
    id ,
    nome ,
    cpf ,
    -- PREENCHER COM RESTRICAO UNIQUE DE CPF
);

CREATE TABLE agencias (
    id ,
    nome ,
    -- PREENCHER COM RESTRICAO UNIQUE DE NOME
);

CREATE TABLE contas (
    id ,
    numero ,
    saldo , -- saldo deve ser um valor fracionario > 0
    id_agencia,
    id_cliente, 
    -- PREENCHER COM RESTRICAO UNIQUE DE NUMERO E ID_AGENCIA
    -- PREENCHER COM RESTRICAO FOREIGN KEYS
);

CREATE TABLE transacoes (
    id,
    id_conta_origem ,
    id_conta_destino ,
    valor -- valor deve ser um numero fracionario > 0
    -- PREENCHER COM RESTRICAO CHECK VALOR > 0
    -- PREENCHER COM RESTRICAO FOREIGN KEYS
);