
# Projetos de Bancos de Dados

Este arquivo contem os projetos de bancos de dados (DBs) que podem ser passados para voce no decorrer da disciplina.


**Sumário:**
- [Projetos de Bancos de Dados](#projetos-de-bancos-de-dados)
  - [Dicas Importantes](#dicas-importantes)
  - [Projetos](#projetos)
    - [1. Sistema de Gestão de Biblioteca](#1-sistema-de-gestão-de-biblioteca)
    - [2. Sistema de Gestão de Restaurante](#2-sistema-de-gestão-de-restaurante)
    - [3. Sistema de Gerenciamento de Projetos](#3-sistema-de-gerenciamento-de-projetos)
    - [4. Sistema de Controle de Estoque](#4-sistema-de-controle-de-estoque)
    - [5. Sistema de Gestão Escolar](#5-sistema-de-gestão-escolar)
    - [6. Sistema de Reserva de Quartos de Hotel](#6-sistema-de-reserva-de-quartos-de-hotel)
    - [7. Sistema de Vendas Online](#7-sistema-de-vendas-online)
    - [8. Sistema de Agendamento de Consultas Médicas](#8-sistema-de-agendamento-de-consultas-médicas)
    - [9. Sistema de Controle de Manutenção de Veículos](#9-sistema-de-controle-de-manutenção-de-veículos)
    - [10. Sistema de Gestão de Imóveis](#10-sistema-de-gestão-de-imóveis)
    - [11. Sistema de Controle de Frequência Escolar](#11-sistema-de-controle-de-frequência-escolar)
    - [12. Sistema de Gestão de Academia](#12-sistema-de-gestão-de-academia)
    - [13. Sistema de Gestão de Eventos](#13-sistema-de-gestão-de-eventos)
    - [14. Sistema de Gestão de Transportadora](#14-sistema-de-gestão-de-transportadora)

## Dicas Importantes

As descrições dos projetos abaixo PODEM CONTER SUGESTÕES para atributos, entidades e relacionamentos do sistema, de forma que:
- Elas PODEM OU NÃO estar nas formas normais.
- Elas PODEM OU NÃO ser suficientes para a implementação de todas funcionalidades descritas no projeto do sistema.

É dever do projetista do banco de dados (**você**):
- Garantir que o banco esta em conformidade com as formas normais (caso isso seja solicitado na atividade, questão ou projeto que você esta realizando).
- Garantir que os atributos, entidades e relacionamentos são suficientes para a implementação das funcionalidades do sistema.
- Construir modelos (conceitual, lógico e físico), coso eles sejam solicitados na atividade, questão ou projeto que você esta realizando.
  - Os modelos conceitual e lógico devem estar no formato do **brModelo v3** (arquivo ``.brM3``).
  - O modelo físico deve estar no formato de arquivo ``.SQL``, de forma a permitir a importação do banco de dados para o MySQL através do phpMyAdmin, instalado no programa XAMPP da máquina.
  - O modelo físico deve conter TODAS as instruções necessárias para  criar o DB, e inserir um conjunto de dados fictícios no banco de dados. Veja exemplo abaixo:
    ```sql
    -- APAGAR BANCO DE DADOS ATUAL (SE ELE JA EXISTIR NO MYSQL)
    DROP DATABASE IF EXISTS nome_do_seu_db;

    -- CRIAR BANCO DE DADOS 
    CREATE DATABASE nome_do_seu_db;

    -- SELECIONAR BANCO DE DADOS PARA EXECUTAR INSTRUCOES SQL
    USE nome_do_seu_db;

    -- CRIAR TABELA 1
    CREATE TABLE tabela_1 (
        atributo_1 TIPO RESTRICOES,
        atributo_2 TIPO RESTRICOES,
        ...
    );

    -- CRIAR TABELA 2
    ...

    -- ADD RESTRICOES FOREIGN KEY NA TABELA 1
    ALTER TABLE tabela_1 
    ADD CONSTRAINT restricao_1 FOREIGN KEY (atributo_FK_1_da_tabela_1) REFERENCES tabela_2 (atributo_PK_da_tabela_2)
    ;
    
    -- ADD RESTRICOES FOREIGN KEY NA TABELA 2
    ...

    -- INSERIR UM REGISTRO NA TABELA 1
    INSERT INTO nome_tabela_1 (atributo_1, atributo_2, ...) VALUES
    (valor1, valor2, ...)
    ;

    -- INSERIR OUTRO REGISTRO NA TABELA 1
    ...

    -- gravar dados no DB
    COMMIT
    ;
    ```
- Construir o sistema completo (com conexão com o DBMS, interface gráfica -- GUI, e consultas SQL), coso eles sejam solicitados na atividade, questão ou projeto que você esta realizando.
  - O sistema deve ser projetado para que usuários leigos possam utilizá-lo com facilidade.
  - O sistema deve funcionar nas máquinas dos laboratórios do IFBA, utilizando o banco de dados MySQL disponível no XAMPP, instalado no sistema operacional Windows.
  - O sistema pode ser construído em qualquer linguagem de programação dentre as listadas abaixo:
    - Python 3 (versão mais atual)
      - O projeto deve ter um arquivo `main.py` de forma a permitir a execução do sistema com o comando `python main.py`
    - Java (versão mais atual)
      - O projeto deve conter os arquivos necessários para compilar e executar o sistema no Eclipse
    - PHP (versão disponível na ultima versão do XAMPP)
      - No caso do PHP, você deve criar uma pasta dentro de `C:\xampp\htdocs` para permitir a execução do seu sistema no XAMPP.

## Projetos

Seguem abaixo as especificações de cada projeto de sistema. Leia cada instrução com atenção para evitar erros e interpretações erradas.

### 1. Sistema de Gestão de Biblioteca
**Descrição:** 
Um sistema para gerenciar o empréstimo de livros em uma biblioteca.

**Funcionalidades:**
- Cadastro de livros (título, autor, editora, ano de publicação, ISBN)
- Cadastro de usuários (nome, endereço, telefone, email)
- Empréstimo / devolução de livros (data de empréstimo, data de devolução, status)
- Pesquisa de livros e usuários
- Relatórios de empréstimos em andamento e históricos

**Condições e Restrições:**
- Usuários com livros pendentes de devolução e em atraso nao devem poder pegar outro livro emprestado até resolverem essas pendencias.
- Podem existir vários exemplares de um mesmo livro.
  - O sistema nao deve permitir o empréstimo de um livro caso nao existam exemplares disponíveis na biblioteca.
  - Ao emprestar ou devolver um livro, o numero de exemplares disponíveis na biblioteca deve ser atualizado automaticamente.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 2. Sistema de Gestão de Restaurante
**Descrição:**
Um sistema para gerenciar pedidos, mesas e cardápio de um restaurante. 

**Funcionalidades:**
- Cadastro de pratos (nome, descrição, preço)
- Cadastro de mesas (número da mesa, capacidade)
- Registro de pedidos (mesa, prato, quantidade, status do pedido)
- Controle de pagamento e fechamento de conta
- Relatórios de vendas (diárias, semanais e mensais)

**Condições e Restrições:**
- Podem existir vários meios de pagamento.
- Os relatórios de vendas diário e mensal devem ser feitos usando um ``STORED PROCEDURE`` no DB.
  - O ``STORED PROCEDURE`` deve ter um parâmetro que permita a escolha do intervalo de tempo do relatório de vendas (diário, mensal ou semanal).
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 3. Sistema de Gerenciamento de Projetos
**Descrição:**
Um sistema para gerenciar projetos, tarefas e membros da equipe.

**Funcionalidades:**
- Cadastro de projetos (nome, descrição, data de início, data de término, status)
- Cadastro de tarefas (nome, descrição, data de início, data de término, status, projeto relacionado)
- Cadastro de membros da equipe (nome, função, email)
- Atribuição de tarefas aos membros da equipe
- Relatórios de progresso dos projetos e tarefas

**Condições e Restrições:**
- O status de um projeto deve ser atualizado automaticamente conforme cada tarefa for finalizada.
  - Se existir ao menos uma tarefa pendente, o projeto nao foi finalizado. 
  - Se todas as tarefas forem finalizadas, o status do projeto deve ser alterado automaticamente para finalizado.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` no DB ou ``VIEWS``.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 4. Sistema de Controle de Estoque
**Descrição:**
Um sistema para gerenciar o estoque de uma loja ou armazém. 

**Funcionalidades:**
- Cadastro de produtos (nome, descrição, quantidade, preço de custo, preço de venda, categoria do produto)
- Registro de entrada/saída de produtos (produto, quantidade, data, movimentação)
- Relatórios de estoque atual, produtos mais vendidos e produtos com baixo estoque

**Condições e Restrições:**
- A inserção de um registro de saída de produtos so pode ocorrer se houver quantidade suficiente para realizar a operação (``Produto.quantidade > 0``).
- A quantidade de produtos em estoque deve ser atualizada automaticamente conforme cada registro de entrada/saída for realizado.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 5. Sistema de Gestão Escolar
**Descrição:**
Um sistema para gerenciar informações de alunos, turmas, professores e notas.

**Funcionalidades:**
- Cadastro de alunos (nome, data de nascimento, endereço, telefone, turma)
- Cadastro de disciplinas (nome, professor)
- Cadastro de turmas (nome da turma, ano letivo, disciplinas)
- Lançamento de notas (aluno, turma, disciplina, unidade, nota)
- Relatórios de desempenho dos alunos por turma e disciplina

**Condições e Restrições:**
- O aluno pode ser submetido a um número N qualquer de avaliações por disciplina.
  - Considere pesos iguais para cada avaliação (media aritmética simples).
- Um aluno será REPROVADO em uma disciplina se média < 6,0 (na disciplina em questão).
- O banco de dados deve garantir que o atributo ``Notas.nota >= 0 E Notas.nota <= 10,00`` e que este atributo é um número fracionário.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 6. Sistema de Reserva de Quartos de Hotel
**Descrição:**
Um sistema para gerenciar a reserva de quartos de um hotel. 

**Funcionalidades:**
- Cadastro de quartos (número do quarto, tipo, status)
- Cadastro de tipos de quartos (tipo, preço)
- Cadastro de hóspedes (nome, endereço, telefone, email)
- Registro de entrada/saída (quarto, hóspede, data, entrada / saída)
- Relatórios de ocupação de quartos e de reservas, por período e por tipo informados pelo usuário.

**Condições e Restrições:**
- Um quarto só pode ser reservado caso esteja LIVRE.
- Pode existir vários quartos de um mesmo tipo (ex: standard com cama de solteiro, duplo com cama de casal, premium).
  - Quartos de um mesmo tipo tem o mesmo preço de diária.
- O status do quarto (ocupado ou livre) deve ser atualizado automaticamente conforme cada registro de entrada/saída for realizado.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 7. Sistema de Vendas Online
**Descrição:**
Um sistema para gerenciar vendas de produtos online. 

**Funcionalidades:**
- Cadastro de produtos (nome, descrição, preco custo, preço venda, quantidade)
- Cadastro de clientes (nome, endereço, telefone, email)
- Registro de pedidos (cliente, produto, quantidade, data, status)
- Controle de envio de pedidos
- Relatórios de status de pedidos e de vendas, por período e produto

**Condições e Restrições:**
- Um produto so pode ser vendido caso a loja tenha estoque dele (``Produtos.quantidade > 0``).
- O DB deve garantir que ``Produtos.quantidade >= 0`` e que este atributo é aceita apenas números inteiros.
- Quando um pedido for inserido no sistema, o DB deve ajustar automaticamente o estoque do produto.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 8. Sistema de Agendamento de Consultas Médicas
**Descrição:**
Um sistema para gerenciar agendamentos de consultas em uma clínica médica.

**Funcionalidades:**
- Cadastro de médicos (nome, especialidades, horário de atendimento)
- Cadastro de especialidades (nome, custo da consulta)
- Cadastro de pacientes (nome, endereço, telefone, email)
- Agendamento de consultas (paciente, médico, data, hora, status)
- Relatório de consultas realizadas e de receita bruta da clinica

**Condições e Restrições:**
- Não é possível realizar várias consultas com o mesmo  médico no mesmo dia e horário.
  - O DB deve garantir que essa condição seja sempre satisfeita.
- O DB deve garantir que ``Especialidades.custo_consulta > 0`` e que este atributo é aceita apenas números fracionários.
- O fornecedor deve ser notificado automaticamente conforme o estoque do produto caia para níveis críticos, definidos pelo usuário.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 9. Sistema de Controle de Manutenção de Veículos
**Descrição:**
Um sistema para gerenciar a manutenção de veículos em uma oficina mecânica.

**Funcionalidades:**
- Cadastro de veículos (marca, modelo, ano, placa, status)
- Cadastro de clientes (nome, endereço, telefone)
- Cadastro de serviços (nome, custo)
- Registro de ordens de serviço (veículo, cliente, serviço, data, status)
- Relatórios de receita bruta, de serviços realizados, e de manutenção por veículo e por período.

**Condições e Restrições:**
- O DB deve garantir que ``Serviços.custo > 0`` e que este atributo é aceita apenas números fracionários.
- O DB deve garantir que ``Veiculo.status`` assume os valores EM MANUTENÇÃO ou FINALIZADO.
  - ``Veiculo.status`` deve ser igual a MANUTENÇÃO, se existir ao menos uma ordem de serviço com ``OrdensServico.status = MANUTENÇÃO``
  - ``Veiculo.status`` deve ser igual a FINALIZADO, se todas as ordem de serviço possuírem ``OrdensServico.status = FINALIZADO``
- ``Veiculo.status`` deve ser atualizado automaticamente pelo DB conforme os registros de ordens de serviço forem atualizados.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 10. Sistema de Gestão de Imóveis
**Descrição:**
Um sistema para gerenciar a venda e locação de imóveis.

**Funcionalidades:**
- Cadastro de imóveis (endereço, tipo, status)
- Cadastro de proprietários (nome, endereço, telefone)
- Cadastro de inquilinos/compradores (nome, endereço, telefone)
- Cadastro de contratos de venda e locação (operacao, imovel, proprietario, inquilino ou comprador, valor, data, valor, status)
- Relatórios de imóveis disponíveis e ocupados, e de pagamentos de aluguel

**Condições e Restrições:**
- O DB deve garantir que:
  - ``Imoveis.status`` é igual a DISPONIVEL, ou INDISPONIVEL.
  - ``Contratos.operacao`` é igual a LOCACAO ou VENDA.
  - ``Contratos.valor > 0`` e esse atributo é um número fracionário.
  - ``Contratos.status`` é igual a CONTRATO ABERTO, ou CONTRATO EFETIVADO.
- ``Imoveis.status`` deve ser atualizado automaticamente pelo DB conforme um contrato é cadastrado ou removido do sistema.
  - Quando o contrato é cadastrado, o DB deve fazer ``Imoveis.status = INDISPONIVEL``
  - Quando o contrato é removido, o DB deve fazer ``Imoveis.status = DISPONIVEL``
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 11. Sistema de Controle de Frequência Escolar
**Descrição:**
Um sistema para gerenciar a frequência de alunos em uma escola. 

**Funcionalidades:**
- Cadastro de turmas (nome, ano letivo)
- Cadastro de disciplina (nome, professor)
- Cadastro de alunos (nome, data de nascimento, endereço)
- Registro de frequência (aluno, turma, disciplina, data, status de presença)
- Registro de status do aluno (aluno, disciplina, status de reprovacao)
- Relatórios de frequência por aluno e por turma.

**Condições e Restrições:**
- O DB deve garantir que:
  - ``Frequencia.status`` é igual a PRESENTE, ou AUSENTE.  
  - ``StatusAluno.status`` é igual a REPROVADO, ou APROVADO.  
- ``StatusAluno.status`` deve ser atualizado automaticamente pelo DB conforme a frequência dele é registrada no sistema.
  - ``StatusAluno.status`` será igual a REPROVADO se o número de faltas do aluno for igual ou superior a 25% do total de aulas. Do contrário, considere o aluno como APROVADO.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 12. Sistema de Gestão de Academia
**Descrição:**
Um sistema para gerenciar membros e treinos em uma academia. 

**Funcionalidades:**
- Cadastro de membros (nome, endereço, telefone)
- Criação de planos de treino (nome, descrição, duração, custo)
- Atribuição de planos de treino aos membros (membro, plano, data, instrutor)
- Registro de pagamentos de mensalidades e frequência do membro
- Relatórios de frequência dos membros e pagamentos

**Condições e Restrições:**
- O DB deve garantir que:
  - ``Plano.custo > 0`` e esse atributo é um número fracionário.  
  - ``Plano.duracao > 00:00:00`` e o atributo é do tipo TEMPO.  
- O DB deve verificar a cada dia que o aluno frequenta a academia se o mesmo esta pagando as mensalidades em dia. Caso o membro fique inadimplente, o DB deve remover o plano de treino dele do sistema automaticamente no proximo dia que ele tentar registrar a sua frequência.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 13. Sistema de Gestão de Eventos
**Descrição:**
Um sistema para gerenciar eventos, incluindo cadastro de eventos, participantes e controle de inscrições.

**Funcionalidades:**
- Cadastro de eventos (nome, data, local, descrição, custo do ingresso)
- Cadastro de participantes (nome, email, telefone)
- Registro de inscrições em eventos (participante, evento)
- Controle de presença nos eventos (id, participante, evento, presenca)
- Relatórios de eventos e participantes inscritos e ocupação do espaço (qtd de inscritos vs capacidade total do espaço)

**Condições e Restrições:**
- O DB deve garantir que:
  - ``Eventos.custo > 0`` e esse atributo é um número fracionário.  
  - ``Presenca.presenca`` é igual a AUSENTE, ou PRESENTE.  
- O DB deve rejeitar múltiplos registros de PRESENÇA de um mesmo participante em um mesmo evento.
  - Isto é, nao podemos ter dois registros com as mesmas informações (participante, evento, PRESENTE).
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.

### 14. Sistema de Gestão de Transportadora
**Descrição:**
Um sistema para gerenciar entregas e frotas de uma transportadora. 

**Funcionalidades:**
- Cadastro de veículos (marca, modelo, placa, status)
- Cadastro de motoristas (nome, telefone, categoria da CNH, status)
- Registro de entregas (veículo, motorista, endereco origem, endereco destino, data saida, status)
- Relatório de entregas pro período
- Relatório de disponibilidade de motoristas e de veículos por período

**Condições e Restrições:**
- O DB deve garantir que:
  - ``Veiculo.status`` é igual a DISPONIVEL, ou INDISPONIVEL.  
  - ``Motorista.status`` é igual a DISPONIVEL, ou INDISPONIVEL.  
  - ``Entrega.status`` é igual a A CAMINHO, ou ENTREGUE.
  - ``Motorista.categoriaCNH`` é igual a A, B, C, D ou E.  
- Quando um registro de entrega é atualizado no DB:
  - O DB deve verificar se ``Entrega.status = A CAMINHO``, e se esse for o coso ele deve atualizar ``Motorista.status`` e ``Veiculo.status`` para INDISPONIVEL.
  - Caso ``Entrega.status = ENTREGUE``, o DB deve atualizar ``Motorista.status`` e ``Veiculo.status`` para DISPONIVEL.
- Os relatórios devem ser feitos usando ``STORED PROCEDURES`` ou ``VIEWS`` no DB.
- Adicione ``TRIGGER``, ``STORED PROCEDURE`` e restrições ``NOT NULL``, ``DEFAULT``, ``CHECK``, ``UNIQUE``, ``PRIMARY KEY``, e ``FOREIGN KEY`` no banco de dados, conforme a necessidade do sistema.
