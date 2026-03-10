# Exercício - CREATE / ALTER TABLE

Você trabalha em uma empresa de recursos humanos e precisa criar um sistema para gerenciar informações de funcionários e departamentos. Siga as instruções abaixo para implementar este sistema.

**DICA:** Estude o slide de Comandos SQL (comandos CREATE / ALTER TABLE, CREATE / DROP DATABASE, UPDATE, INSERT INTO, etc).

### Parte 1: Criação do Banco de Dados e Tabelas

1. Crie um banco de dados chamado `rh_empresa`

2. Crie uma tabela `departamentos` com os seguintes campos:
   - `id_departamento`: número inteiro auto-incrementado (chave primária)
   - `nome`: texto com até 50 caracteres (não pode ser nulo)
   - `orcamento`: número decimal com 10 dígitos no total e 2 casas decimais
   - `data_criacao`: data de criação do departamento
   - `ativo`: booleano indicando se o departamento está ativo

3. Crie uma tabela `funcionarios` com os seguintes campos:
   - `id_funcionario`: número inteiro auto-incrementado (chave primária)
   - `nome`: texto com até 100 caracteres (não pode ser nulo)
   - `cpf`: texto com 11 caracteres (não pode ser nulo)
   - `salario`: número decimal com 10 dígitos no total e 2 casas decimais
   - `data_admissao`: data e hora da admissão
   - `horario_trabalho`: horário normal de trabalho (formato HH:MM:SS)
   - `id_departamento`: número inteiro (representa o departamento do funcionário)
   - `observacoes`: texto longo para observações (pode ser nulo)

### Parte 2: Inserção de Dados

1. Insira os departamentos abaixo na tabela `departamentos`:

| Departamento     | Orçamento | Data de Criação | Ativo |
| ---------------- | --------- | --------------- | ----- |
| TI               | 500000.00 | 15/05/2010      | Sim   |
| Recursos Humanos | 300000.00 | 15/05/2010      | Sim   |
| Financeiro       | 450000.00 | 20/02/2011      | Sim   |

1. Insira os funcionários abaixo na tabela `funcionarios`, de acordo com seus departamentos:
   
| Nome            | CPF         | Salário | Data e Hora de Admissão | Horário de Trabalho | Departamento     | Observações           |
| --------------- | ----------- | ------- | ----------------------- | ------------------- | ---------------- | --------------------- |
| João Silva      | 12345678901 | 4500.00 | 08:00 10/03/2020        | 08:00               | TI               | Desenvolvedor Senior  |
| Maria Santos    | 23456789012 | 3800.00 | 09:00 15/05/2021        | 09:00               | Recursos Humanos | NULL                  |
| Carlos Oliveira | 34567890123 | 5200.00 | 08:30 20/11/2019        | 08:30               | TI               | Arquiteto de Software |
| Ana Pereira     | 45678901234 | 4200.00 | 08:00 05/01/2022        | 08:00               | Financeiro       | NULL                  |
| Pedro Costa     | 56789012345 | 3500.00 | 09:30 18/06/2022        | 09:30               | Recursos Humanos | Estagiário            |

### Parte 3: Alterações na Estrutura

1. Adicione uma coluna `email` na tabela `funcionarios` que deve ser um texto com até 100 caracteres

2. Modifique a coluna `orcamento` na tabela `departamentos` para usar ``DOUBLE``

3. Renomeie a coluna `observacoes` para `descricao` na tabela `funcionarios`

### Parte 4: Atualização de Dados

1. Atualize o email dos funcionários (use nomes fictícios)

2. Aumente o salário em 10% para todos os funcionários do departamento de TI

### Parte 5: Exclusão de Dados

1. Delete o funcionário ``Pedro Costa``

2. Crie e depois delete uma tabela de teste

3. Adicione uma coluna `data_nascimento` na tabela `funcionarios`

4. Atualize os registros existentes com datas de nascimento fictícias

## Solução

Confira suas respostas com a solução do exercício, descrita no arquivo [./SOLUCAO.sql](./SOLUCAO.sql)