
# Projetos de Bancos de Dados

Este arquivo contem os projetos de bancos de dados (DBs) que podem ser passados para voce no decorrer da disciplina.

**Sumário:**
- [Projetos de Bancos de Dados](#projetos-de-bancos-de-dados)
  - [Instruções Importantes](#instruções-importantes)
    - [1. Responsabilidades dos Projetistas](#1-responsabilidades-dos-projetistas)
    - [2. Formato dos Arquivos (entregáveis)](#2-formato-dos-arquivos-entregáveis)
    - [3. Recursos suportados pelo SGBD](#3-recursos-suportados-pelo-sgbd)
  - [Projetos](#projetos)
    - [1. Sistema de Gestão de Biblioteca](#1-sistema-de-gestão-de-biblioteca)
    - [2. Sistema de Gestão de Restaurante](#2-sistema-de-gestão-de-restaurante)
    - [3. Sistema de Gerenciamento de Projetos](#3-sistema-de-gerenciamento-de-projetos)
    - [4. Sistema de Gestão Escolar](#4-sistema-de-gestão-escolar)
    - [5. Sistema de Reserva de Quartos de Hotel](#5-sistema-de-reserva-de-quartos-de-hotel)
    - [6. Sistema de Vendas Online](#6-sistema-de-vendas-online)
    - [7. Sistema de Agendamento de Consultas Médicas](#7-sistema-de-agendamento-de-consultas-médicas)
    - [8. Sistema de Controle de Manutenção de Veículos](#8-sistema-de-controle-de-manutenção-de-veículos)
    - [9. Sistema de Gestão de Imóveis](#9-sistema-de-gestão-de-imóveis)
    - [10. Sistema de Controle de Frequência Escolar](#10-sistema-de-controle-de-frequência-escolar)
    - [11. Sistema de Gestão de Academia](#11-sistema-de-gestão-de-academia)
    - [12. Sistema de Gestão de Eventos](#12-sistema-de-gestão-de-eventos)
    - [13. Sistema de Gestão de Transportadora](#13-sistema-de-gestão-de-transportadora)

## Instruções Importantes

### 1. Responsabilidades dos Projetistas

As descrições dos projetos abaixo CONTEM **SUGESTÕES** para atributos, entidades e relacionamentos do sistema, de forma que elas **PODEM OU NÃO**:
- Estar nas formas normais (1FN, 2FN ou 3FN).
- Ser suficientes para a implementação de todas funcionalidades descritas no projeto do sistema

**Dessa forma, é dever dos projetistas do banco de dados (vocês):**
- Garantir que o banco esta em conformidade com as formas normais (caso isso seja solicitado na atividade, questão ou projeto que você esta realizando).
- Garantir que os atributos, entidades e relacionamentos são suficientes para a implementação das funcionalidades do sistema.
- Construir modelos (conceitual, lógico e físico), coso eles sejam solicitados na atividade, questão ou projeto que você esta realizando.
- Construir o sistema completo (com conexão com o DBMS, interface gráfica -- GUI, e consultas SQL), coso eles sejam solicitados na atividade, questão ou projeto que você esta realizando.

### 2. Formato dos Arquivos (entregáveis)
  
**Modelos Conceitual e Lógico**:
  - Os modelos (conceitual e lógico) devem estar no formato do **brModelo v3** (arquivo ``.brM3``).
  - Caso nao seja possível instalar / utilizar o BrModelo na máquina do laboratório, serão aceitos arquivos JPG, PNG ou PDF, exportados pelo [Draw.IO](http://www.draw.io)
    - No draw.io, selecione seu modelo e clique em Exportar
    - Selecione a opção "Seleção somente" ou "Recortar / Crop"
    - Exporte seu projeto

**Modelo Físico**:
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

**Sistema**:
  - O sistema deve ser projetado para que usuários leigos possam utilizá-lo com facilidade.
  - O sistema deve funcionar nas máquinas dos laboratórios do IFBA, utilizando o banco de dados MySQL disponível no XAMPP, instalado no sistema operacional Windows.
  - O sistema pode ser construído em qualquer linguagem de programação dentre as listadas abaixo:
    - Python 3 (versão mais atual)
      - O projeto deve ter um arquivo `main.py` de forma a permitir a execução do sistema com o comando `python main.py`
    - Java (versão mais atual)
      - O projeto deve conter os arquivos necessários para compilar e executar o sistema no Eclipse
    - PHP (versão disponível na ultima versão do XAMPP)
      - No caso do PHP, você deve criar uma pasta dentro de `C:\xampp\htdocs` para permitir a execução do seu sistema no XAMPP.

### 3. Recursos suportados pelo SGBD

Utilize SOMENTE os recursos suportados pelo SGBD MySQL, instalado no XAMPP, para implementar as funcionalidades, restrições, e condições exigidas pelo seu projeto.

 Seguem abaixo exemplos de recursos que você pode utilizar, conforme a sua necessidade.
- **Controle de eventos**
  - ``TRIGGER`` 
- **Procedimentos, Funções e Tabelas Virtuais**
  - ``STORED PROCEDURE`` 
  - ``VIEWS`` 
- **Restrições de integridade**   
  - ``AUTO_INCREMENT``
  - ``NOT NULL``
  - ``DEFAULT`` 
  - ``CHECK``
- **Chaves**: 
  - ``UNIQUE`` 
  - ``PRIMARY KEY``
  - ``FOREIGN KEY``
- **Restrições de domínio**  
  - ``BOOLEAN``
  - ``INTEGER``, ``SMALLINT``, ``BIGINT``
  - ``DOUBLE``, ``DECIMAL(P, D)``
  - ``VARCHAR(N)``, ``CHAR(N)``, ``TEXT``
  - ``DATE``, ``TIME``, ``DATETIME``
  - ``YEAR``, ``MONTH``, ``DAY``

## Projetos

Seguem abaixo as especificações de cada projeto de sistema. Leia cada instrução com atenção para evitar erros e interpretações erradas.

### 1. Sistema de Gestão de Biblioteca
**Descrição:** 
Um sistema para gerenciar o empréstimo de livros em uma biblioteca.

**Funcionalidades:**
- Cadastro de livros (título, autor, editora, ano de publicação, ISBN)
  - Gerenciamento de exemplares individuais com identificação única (código de barras)
  - Histórico de aquisições de livros (data, livro, fornecedor, valor)
- Cadastro de usuários (nome, endereço, telefone, email)
- Empréstimo / devolução de livros (data de empréstimo, data de devolução, funcionario, status)
- Pesquisa de livros e usuários
- Relatórios de empréstimos em andamento e históricos

**Condições e Restrições:**
- Usuários com livros pendentes de devolução e em atraso nao devem poder pegar outro livro emprestado até resolverem essas pendencias.
- Podem existir vários exemplares de um mesmo livro.
  - O sistema nao deve permitir o empréstimo de um livro caso nao existam exemplares disponíveis na biblioteca.
  - Ao emprestar ou devolver um livro, o numero de exemplares disponíveis na biblioteca deve ser atualizado automaticamente.

### 2. Sistema de Gestão de Restaurante
**Descrição:**
Um sistema para gerenciar pedidos, mesas e cardápio de um restaurante. 

**Funcionalidades:**
- Cadastro de pratos e bebidas (nome, descrição, preço, tempo de preparo, ingredientes utilizados)
  - Cadastro de Ingredientes (coentro, cominho, frango, glúten, lactose, etc.)  
  - Cadastro de Categorias (entradas, pratos principais, sobremesas, drinks, refrigerantes, etc)
- Cadastro de mesas (número da mesa, capacidade, status de ocupacao)
- Registro de pedidos (mesa, prato, quantidade, status do pedido)
- Controle de pagamento e fechamento de conta
- Relatórios de vendas (diárias, semanais e mensais)

**Condições e Restrições:**
- Podem existir vários meios de pagamento.
- Os relatórios de vendas diário e mensal devem ser feitos usando um ``STORED PROCEDURE`` no DB.
  - O ``STORED PROCEDURE`` deve ter um parâmetro que permita a escolha do intervalo de tempo do relatório de vendas (diário, mensal ou semanal).
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**: 
    - `Pratos.nome` deve ser uma sequencia de caracteres nao NULA
    - `Pedidos.quantidade` deve ser inteiro e maior do que 0
    - ``Pratos.preco`` deve ser maior que 0
    - ``Pratos.tempo_preparo`` em minutos, maior que 0
    - Demais restrições / condições do seu projeto

### 3. Sistema de Gerenciamento de Projetos
**Descrição:**
Um sistema para gerenciar projetos, tarefas e membros da equipe.

**Funcionalidades:**
- Cadastro de projetos (nome, descrição, data de início, data de término, status, nível de prioridade, orçamento, risco, cliente)
- Cadastro de tarefas (nome, descrição, data de início, data de término, status, projeto relacionado)
- Cadastro de membros da equipe (nome, função, email, carga horaria)
- Atribuição de tarefas aos membros da equipe
- Relatórios de progresso dos projetos e tarefas

**Condições e Restrições:**
- O status de um projeto deve ser atualizado automaticamente conforme cada tarefa for finalizada.
  - Se existir ao menos uma tarefa pendente, o projeto nao foi finalizado. 
  - Se todas as tarefas forem finalizadas, o status do projeto deve ser alterado automaticamente para finalizado.
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**: 
    - `Projetos.nome` deve ser uma sequencia de caracteres nao NULA
    - ``data_inicio <= data_fim`` tanto para ``Projetos`` quanto para ``Tarefas``
    - `Tarefas.status` deve ser do tipo booleano, nao NULO, que aceita somente "true" (tarefa concluida) ou "false" (tarefa pendente)
    - `Tarefas.progresso` deve estar entre 0 e 100
    - Demais restrições / condições do seu projeto

### 4. Sistema de Gestão Escolar
**Descrição:**
Um sistema para gerenciar informações de alunos, turmas, professores e notas.

**Funcionalidades:**
- Cadastro de alunos (nome, data de nascimento, endereço, telefone, turma, deficiencias / alergias / condicoes medicas)
- Cadastro de disciplinas (nome, professor, carga horaria)
- Cadastro de professor (nome, data de nascimento, turmas que leciona, carga horaria de trabalho)
- Cadastro de turmas (nome da turma, ano letivo, sala de aula, disciplinas vinculadas a turma)
- Lançamento de notas (aluno, turma, disciplina, unidade, nota)
- Relatórios de desempenho dos alunos por turma e disciplina

**Condições e Restrições:**
- O banco de dados deve garantir que o atributo ``Notas.nota >= 0 E Notas.nota <= 10,00`` e que este atributo é um número fracionário.
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**: 
    - O aluno pode ser submetido a um número N qualquer de avaliações por disciplina.
      - Considere pesos iguais para cada avaliação (media aritmética simples).
    - Um aluno será REPROVADO se ``média < 6,0`` (na disciplina em questão).
    - ``carga_horaria > 0`` tanto para ``professor`` quanto para ``disciplinas``
    - Demais restrições / condições do seu projeto

### 5. Sistema de Reserva de Quartos de Hotel
**Descrição:**
Um sistema para gerenciar a reserva de quartos de um hotel. 

**Funcionalidades:**
- Cadastro de quartos (número do quarto, andar, comodidades, status)
- Cadastro de comodidades dos quartos (nome, descricao)
  - **Ex**: TV, frigobar, ar-condicionado, etc
- Cadastro de tipos de quartos (tipo, configuracao de camas, capacidade maxima de hospedes, preço)
- Cadastro de hóspedes (nome, endereço, telefone, email)
- Registro de reserva (quarto, hóspede, data de reserva, data de entrada, data de saída)
- Relatórios de ocupação de quartos e de reservas, por período e por tipo informados pelo usuário.

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**: 
    - Um quarto só pode ser reservado caso esteja LIVRE.
    - Pode existir vários quartos de um mesmo tipo (ex: standard com cama de solteiro, duplo com cama de casal, premium).
      - Quartos de um mesmo tipo tem o mesmo preço de diária.
    - O status do quarto (ocupado ou livre) deve ser atualizado automaticamente conforme cada registro de entrada/saída for realizado.
    - ``Quarto.numero`` deve ser inteiro, nao nulo, atributo determinante
    - ``tipo_quarto.preco`` > 0
    - ``tipo_quarto.capacidade`` >= 1
    - ``reserva.data_entrada < reserva.data_saida``
    - Demais restrições / condições do seu projeto

### 6. Sistema de Vendas Online
**Descrição:**
Um sistema para gerenciar vendas de produtos online. 

**Funcionalidades:**
- Cadastro de produtos (nome, descrição, categoria, SKU, preco custo, preço venda, quantidade em estoque)
- Cadastro de categorias (nome, descrição)
- Cadastro de clientes (cpf / cnpj, nome, endereço, telefone, email)
- Registro de pedidos (cliente, produto, quantidade, data, status)
- Controle de envio de pedidos (codigo de rastreio, status)
- Relatórios de status de pedidos e de vendas, por período e produto

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:     
    - Um produto so pode ser vendido caso a loja tenha estoque dele (``Produtos.quantidade > 0``).
    - Quando um pedido for inserido no sistema, o DB deve ajustar automaticamente o estoque do produto.
    - ``quantidade >= 0`` e inteiro, para `produtos` e `pedidos`.
    - ``preco_venda > preco_custo`` em ``produtos``
    - `SKU` deve ser atributo determinante, nao nulo
    - Demais restrições / condições do seu projeto

### 7. Sistema de Agendamento de Consultas Médicas
**Descrição:**
Um sistema para gerenciar agendamentos de consultas em uma clínica médica.

**Funcionalidades:**
- Cadastro de médicos (CRM, nome, especialidades, horário de atendimento)
- Cadastro de especialidades (nome, custo da consulta)
- Cadastro de pacientes (nome, endereço, telefone, email, medicacoes em uso, alergias, patologias do paciente)
- Agendamento de consultas (paciente, médico, tipo, data do agendamento, data da consulta, hora de inicio, hora de fim, status)  
- Relatório de consultas realizadas e de receita bruta da clinica

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:     
    - Não é possível realizar várias consultas com o mesmo  médico no mesmo dia e horário.
      - O DB deve garantir que essa condição seja sempre satisfeita.
    - ``Especialidades.custo_consulta > 0``
    - ``horario_inicio < horario_fim`` em `consultas`
    - `consultas.data` deve ser uma data futura (em relacao a data atual) no momento do cadastro da consulta 
    - ``consultas.tipo`` deve ser igual a: 'Primeira consulta', 'Retorno', ou 'Acompanhamento'
    - ``consultas.status`` deve ser igual a: 'agendada', 'confirmada', 'realizada', ou 'cancelada'
    - ``consultas.status`` deve ser alterada de 'agendada' para 'cancelada' automaticamente, quando a data e hora atual for igual a data e hora do inicio da consulta (isto é, o paciente nao compareceu)
    - Demais restrições / condições do seu projeto

### 8. Sistema de Controle de Manutenção de Veículos
**Descrição:**
Um sistema para gerenciar a manutenção de veículos em uma oficina mecânica.

**Funcionalidades:**
- Cadastro de veículos (modelo, ano, placa, chassi, status)
- Cadastro de modelo   (nome, marca)
- Cadastro de peças    (nome, custo de compra, custo de venda)
- Cadastro de clientes (nome, endereço, telefone)
- Cadastro de serviços (nome, custo, tempo medio de execucao)
- Registro de ordens de serviço (veículo, cliente, serviço, data_hora de entrada, data_hora de saida, status)
- Relatórios de receita bruta, de serviços realizados, e de manutenção por veículo e por período.

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:     
    - ``Serviços.custo > 0`` e este atributo aceita apenas números fracionários
    - ``Veiculo.status`` assume os valores: 'AGUARDANDO', 'EM EXECUCAO' ou 'FINALIZADO'.
      - ``Veiculo.status`` deve ser igual a 'EM EXECUCAO', se existir ao menos uma ordem de serviço com ``OrdensServico.status = 'EM EXECUCAO'``
      - ``Veiculo.status`` deve ser igual a 'FINALIZADO', se todas as ordem de serviço possuírem ``OrdensServico.status = FINALIZADO``
      - Do contrario ``Veiculo.status`` deve ser igual a 'AGUARDANDO'
    - ``Veiculo.status`` deve ser atualizado automaticamente pelo DB conforme os registros de ordens de serviço forem atualizados.
    - ``OrdensServico.status =`` 'ORÇAMENTO', 'AUTORIZADA', 'EM EXECUÇÃO', ou 'FINALIZADA'
    - `custo_compra < custo_venda` em `pecas`
    - `placa` e `chassi` devem ser atributos determinantes, nao nulos
    - ``data_hora_entrada <= data_hora_saida`` (quando data_saida for preenchida)
    - Demais restrições / condições do seu projeto

### 9. Sistema de Gestão de Imóveis
**Descrição:**
Um sistema para gerenciar a venda e locação de imóveis.

**Funcionalidades:**
- Cadastro de imóveis (matrícula, endereço, tipo, area util, qtd de dormitorios, vagas de garagem, status)
- Cadastro de proprietários (nome, endereço, telefones)
- Cadastro de corretores (CRECI, nome, endereço, telefones)
- Cadastro de inquilinos/compradores (nome, endereço, telefones, faixa de valor procurada, bairros de interesse)
- Agenda de visitacao (inquilino ou comprador, imovel, data da visita, hora da visita, corretor)
- Cadastro de contratos de venda e locação (operacao, imovel, proprietario, inquilino ou comprador, valor da operacao, data, status)
- Relatórios de imóveis disponíveis e ocupados, e de pagamentos de aluguel

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:     
    - ``Contratos.operacao`` é igual a LOCACAO ou VENDA.
    - ``Contratos.valor > 0`` e esse atributo é um número fracionário.
    - ``Contratos.status`` é igual a CONTRATO ABERTO, ou CONTRATO EFETIVADO.
    - ``Imoveis.status`` é igual a DISPONIVEL, ou INDISPONIVEL.
    - ``Imoveis.status`` deve ser atualizado automaticamente pelo DB conforme um contrato é cadastrado ou removido do sistema.
      - Quando o contrato é cadastrado, o DB deve fazer ``Imoveis.status = INDISPONIVEL``
      - Quando o contrato é removido, o DB deve fazer ``Imoveis.status = DISPONIVEL``
      - Nao e possivel inserir um novo contrato se ja houver um contrato vinculado ao imovel
    - Demais restrições / condições do seu projeto

### 10. Sistema de Controle de Frequência Escolar
**Descrição:**
Um sistema para gerenciar a frequência de alunos em uma escola. 

**Funcionalidades:**
- Cadastro de periodo letivo (ano ou semestre, data de inicio, data de fim, ferias)
- Cadastro de periodo de ferias (periodo letivo, data de inicio, data de fim)
- Cadastro de turmas (nome, periodo letivo)
- Cadastro de disciplina (nome, carga horaria, tipo)
- Cadastro de alunos (nome, data de nascimento, endereço)
- Registro de frequência (aluno, turma, disciplina, data, status de presença)
- Registro de status do aluno (aluno, disciplina, status de reprovacao)
- Relatórios de frequência por aluno e por turma.

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:     
    - ``Frequencia.status`` é igual a 'PRESENTE', 'AUSENTE JUSTIFICADA', 'AUSENTE NAO JUSTIFICADA'.  
    - ``StatusAluno.status`` é igual a REPROVADO, ou APROVADO.  
    - ``StatusAluno.status`` deve ser atualizado automaticamente pelo DB conforme a frequência dele é registrada no sistema.
      - ``StatusAluno.status`` será igual a REPROVADO se o número de faltas do aluno for igual ou superior a 25% do total de aulas. Do contrário, considere o aluno como APROVADO.
    - Somente permita o registro de frequencia se `Frequencia.data` estiver fora do periodo de ferias letivas (isto é, `Frequencia.data < Ferias.data_inicio` e `Frequencia.data < Ferias.data_fim`)
    - Demais restrições / condições do seu projeto
    
### 11. Sistema de Gestão de Academia
**Descrição:**
Um sistema para gerenciar membros e treinos em uma academia. 

**Funcionalidades:**
- Cadastro de membros (CPF, nome, endereço, telefone, data de nascimento, genero, condicoes medicas, plano de mensalidade, status)
- Cadastro de planos de mensalidade (nome, descrição, custo)
- Cadastro de planos de treino (nome, descrição, duração)
- Execicios no treino (treino, exercicio, qtd de series, qtd de repeticoes)
- Atribuição de planos de treino aos membros (data, instrutor, membro, plano de treino)
- Controle de frequência do membro (membro, data)
- Registro de pagamentos de mensalidades 
- Relatórios de frequência dos membros e pagamentos

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:       
    - ``Membro.cpf`` determinante e nao nulo
    - ``Membro.status`` = 'ATIVO', ou 'INATIVO'
    - ``PlanoMensalidade.custo > 0`` 
    - ``PlanoTreino.duracao >= 1`` do tipo DATA.  
    - ``AtribuicaoPlanoMembro.data >= HOJE()``.  
    - ``ExerciciosTreino.series >= 1`` e ``ExerciciosTreino.repeticoes >= 1``.  
    - O aluno nao pode registrar frequencia (entrar na academia) se ele estiver INATIVO (inadimplente, ou com cadastro desativado).
    - Demais restrições / condições do seu projeto

### 12. Sistema de Gestão de Eventos
**Descrição:**
Um sistema para gerenciar eventos, incluindo cadastro de eventos, participantes e controle de inscrições.

**Funcionalidades:**
- Cadastro de eventos (nome, data_hora de inicio, data_hora de fim, local, descrição, custo do ingresso)
- Cadastro de local (nome, endereco, capacidade maxima de pessoas)
- Cadastro de participantes (nome, email, telefone)
- Registro de inscrições em eventos (participante, evento, politica de reembolso, data de inscricao, data de cancelamento)
- Cadastro de politica de reembolso (nome, percentual reembolsado, antecedencia minima)
- Controle de presença nos eventos (participante, evento)
- Relatórios de eventos, participantes inscritos, percentual de cancelamentos, e ocupação do espaço (qtd de inscritos vs capacidade total do espaço)

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:           
    - ``Eventos.custo > 0``
    - ``PoliticaReembolso.percentual`` deve estar entre 0 e 100.  
    - ``PoliticaReembolso.antecedencia_minima >= 0``
    - ``Eventos.data_hora_inicio <= Eventos.data_hora_fim``
    - O DB deve rejeitar múltiplos registros de PRESENÇA de um mesmo participante em um mesmo evento.
      - Isto é, nao podemos ter dois registros com as mesmas informações (participante, evento, PRESENTE).
    - O registros de PRESENÇA de um participante que cancelou sua inscricao (`InscricaoEventos.data_cancelamento <> NULL`).
    - Demais restrições / condições do seu projeto
    
### 13. Sistema de Gestão de Transportadora
**Descrição:**
Um sistema para gerenciar entregas e frotas de uma transportadora. 

**Funcionalidades:**
- Cadastro de veículos (marca, modelo, ano, placa, quilometragem, capacidade maxima em kg, status)
- Cadastro de motoristas (CNH, nome, telefone, categoria da habilitacao, status)
- Cadastro de enderecos (rua, numero, complemento, bairro, cidade, estado)
- Registro de entregas (veículo, motorista, endereco origem, endereco destino, data_hora de saida, data_hora de chegada, carga em kg, custo, status)
- Relatório de entregas pro período
- Relatório de disponibilidade de motoristas e de veículos por período

**Condições e Restrições:**
- Lembre-se de incluir as restrições de integridade, domínio e demais condições do seu projeto, conforme necessário. Seguem alguns exemplos ilustrativos abaixo.
  - **Ex**:                 
    - ``Veiculo.status`` = DISPONÍVEL, EM MANUTENÇÃO, ou INDISPONÍVEL
    - ``Motorista.status`` = DISPONIVEL, ou INDISPONIVEL.  
    - ``Entrega.status`` = A CAMINHO, ou ENTREGUE.
    - ``Entrega.data_hora_saida = AGORA()`` com tipo DATETIME.
    - ``Entrega.data_hora_chegada >= AGORA()`` com tipo DATETIME.
    - ``Motorista.categoriaCNH`` = A, B, C, D ou E
    - ``Veiculo.status = INDISPONÍVEL`` quando: 
      - ``Veiculo.quilometragem >= 200000``
      - Há ``Entrega.status = A CAMINHO`` vinculada ao veiculo 
    - O DB nao deve permitir o registro de uma entrega se `Entrega.carga_kg > Veiculo.capacidade_kg`
    - Demais restrições / condições do seu projeto
