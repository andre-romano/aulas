
# Modelo conceitual
O modelo conceitual (também chamado de ``modelo entidade-relacionamento`` ou ``modelo E-R``) é uma representação abstrata e de alto nível da estrutura de um banco de dados. 

Ele descreve, de forma independente da tecnologia de implementação, os principais elementos e relacionamentos.

**Sumário**:
- [Modelo conceitual](#modelo-conceitual)
  - [Objetivo do modelo](#objetivo-do-modelo)
  - [Componentes](#componentes)
    - [1. Entidades](#1-entidades)
    - [2. Atributos](#2-atributos)
      - [2.1. Atributos Simples vs Compostos](#21-atributos-simples-vs-compostos)
      - [2.2. Atributos de Valor Único vs Multi-valorado](#22-atributos-de-valor-único-vs-multi-valorado)
      - [2.2. Atributos Determinantes vs Não-determinantes](#22-atributos-determinantes-vs-não-determinantes)
    - [3. Relacionamentos (com cardinalidades)](#3-relacionamentos-com-cardinalidades)
      - [3.1. Relacionamentos 1:1 (Um para Um)](#31-relacionamentos-11-um-para-um)
      - [3.2. Relacionamentos 1:N (Um para Muitos)](#32-relacionamentos-1n-um-para-muitos)
      - [3.3. Relacionamentos N:N (Muitos para Muitos)](#33-relacionamentos-nn-muitos-para-muitos)
    - [4. Generalização e Especialização](#4-generalização-e-especialização)
  - [O que um bom modelo conceitual deve conter](#o-que-um-bom-modelo-conceitual-deve-conter)
    - [1. Dados, não ações](#1-dados-não-ações)

## Objetivo do modelo
- *"Descrever quais dados precisam ser armazenados no sistema para que ele seja capaz de realizar as funções/requisitos descritos no projeto".*

## Componentes

<img width="450px" src="img/entidade_relacionamento.jpg" alt="">

### 1. Entidades

Representam os **objetos** principais sobre os quais se deseja armazenar informações no sistema. Cada entidade corresponde a um conceito do mundo real.
- **Exemplos**: Cliente, Produto, Pedido, Funcionário

O nome das entidades devem seguir algumas **regras**:
- Deve ser um **substantivo no singular**
- Começa com letras
- Não pode ter espaços
- Não pode ter caracteres especiais (com exceção do underline)
- O nome deve ser único dentro do banco de dados
  - *"Nao pode ter mais de uma entidade com mesmo nome"*


### 2. Atributos

São as **propriedades** ou características que descrevem uma entidade. 

Por exemplo, um ``Cliente`` pode ter atributos como ``CPF`` (atributo identificador), ``nome``, ``data_nascimento`` e ``endereço`` (vide imagem abaixo).

<img width="200px" src="img/atributos_exemplo.jpg" alt="">

``Atributos identificadores`` sao aqueles que identificam de maneira única uma entidade específica. Eles devem estar marcados com um **circulo totalmente preenchido** (vide `CPF` na imagem acima).

O nome de cada atributo também deve seguir as mesmas regras usadas nas entidades. Além disso, **não pode ter dois atributos com mesmo nome dentro de uma mesma entidade**.

Os atributos podem ser classificados de diversas maneiras, conforme descrito abaixo. 

#### 2.1. Atributos Simples vs Compostos

| Atributo Simples       | Atributo Composto                     |
| ---------------------- | ------------------------------------- |
| Sao indivisíveis       | Podem ser subdivididos                |
| **Ex**: CPF, RG, idade | **Ex**: nome, endereco, dt_nascimento |

Em geral, um bom banco de dados **evita o uso de atributos compostos**, fazendo uso de atributos simples em seu lugar (vide imagem abaixo).

<img width="550px" src="img/atributos_compostos.jpg" alt="">

#### 2.2. Atributos de Valor Único vs Multi-valorado

| Atributo de Valor Único            | Atributo Composto                      |
| ---------------------------------- | -------------------------------------- |
| Contém um único valor por registro | Contem varios valores em cada registro |
| **Ex**: nome, idade, cpf           | **Ex**: telefone, email, endereco      |

Em geral, um bom banco de dados **evita o uso de atributos multi-valorados**. Para isso devemos:
- Remover o atributo multi-valorado da entidade
- Criar uma nova entidade para o atributo multi-valorado
- Conectar esse nova entidade com a entidade anterior, usando um relacionamento (veja imagem abaixo)

<img width="800px" src="img/atributos_multivalorados_correcao.jpg" alt="">

#### 2.2. Atributos Determinantes vs Não-determinantes

| Atributo Determinante                                 | Atributo Não-determinante                                    |
| ----------------------------------------------------- | ------------------------------------------------------------ |
| Há apenas um registo com o mesmo valor deste atributo | Pode existir vários registros com um mesmo valor do atributo |
| **Ex**: cpf, rg, chassi_carro                         | **Ex**: nome, data_nascimento, modelo_carro                  |

### 3. Relacionamentos (com cardinalidades)

Representam associações entre duas ou mais entidades. Um relacionamento descreve como as entidades se conectam.

- **Exemplo**: ``Cliente`` **faz** ``Pedido``, ``Aluno`` **está** matriculado em ``Disciplina``.

Todo relacionamento deve ser um **verbo singular no infinitivo**. 

Além disso, relacionamentos **não representam funcionalidades do sistema**, mas sim como as entidades (dados) estão associadas umas com as outras.

Relacionamentos podem conter **cardinalidades** (mínimas e máximas), que indicam quantos registros de cada entidade estão associados entre si (veja imagens abaixo).

A depender da cardinalidade MÁXIMA, podemos classificar os  relacionamentos como:
- **Relacionamento 1:1** (Um para Um)
- **Relacionamento 1:N** (Um para Muitos)
- **Relacionamento N:N** (Muitos para Muitos)

#### 3.1. Relacionamentos 1:1 (Um para Um)

Ocorre quando um registro de uma entidade interage com no máximo um registro de outra entidade.
 
<img width="550px" src="img/relacionamento_um_para_um.jpg" alt="">

#### 3.2. Relacionamentos 1:N (Um para Muitos)

Ocorre quando um registro de uma entidade interage com vários (N) registros da outra entidade.

<img width="550px" src="img/relacionamento_um_para_n.jpg" alt="">

#### 3.3. Relacionamentos N:N (Muitos para Muitos)

Ocorre quando vários registros (N) de uma entidade podem se relacionar com vários outros (N) registros de outra entidade.

<img width="550px" src="img/relacionamento_n_para_n.jpg" alt="">

### 4. Generalização e Especialização

<img width="550px" src="img/generalizacao_especializacao.jpg" alt="">

- **Generalização**: é o processo de abstrair características comuns de duas ou mais entidades distintas, agrupando-as em uma entidade mais genérica.
  - **Ex**: ``Pessoa_Fisica`` e ``Pessoa_Juridica`` podem ser generalizadas em uma entidade mais genérica chamada ``Cliente``, que contém os atributos comuns como ``nome``.

- **Especialização** é o processo inverso: a partir de uma entidade genérica, identificam-se subconjuntos que possuem características específicas, criando assim entidades especializadas.
  - **Ex:** a entidade ``Cliente`` pode ser especializada em ``Pessoa_Fisica`` e `Pessoa_Juridica`, cada uma com atributos ou relacionamentos próprios, como `Pessoa_Fisica.cpf` e `Pessoa_Juridica.cnpj`.

## O que um bom modelo conceitual deve conter

### 1. Dados, não ações

- **Modelo conceitual**: representa a **estrutura** do sistema
  - Possui SOMENTE dados (entidades, atributos e relacionamentos)
- **Requisitos ou funcionalidades de um sistema:** representa o **comportamento** do sistema 
  - Descreve ações (funcionalidades, comportamentos, e processos)

**Exemplos:**

| **Elemento do sistema** | **Tipo certo**                                      | **Por quê?**                                                                                |
| ----------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| Cliente                 | Entidade                                            | Representa um objeto com dados                                                              |
| Nome do cliente         | Atributo                                            | É uma característica da entidade Cliente                                                    |
| Efetuar Compra          | Funcionalidade / Ação                               | É uma **ação** que o sistema realiza, não algo armazenado como dado diretamente             |
| Compra                  | Entidade (ou Relacionamento com atributos)          | Armazena dados da ação de compra (feita pelo cliente)                                       |
| Data da compra          | Atributo                                            | É uma característica da entidade Compra                                                     |
| Login                   | Funcionalidade / requisito                          | É um processo de acesso ao sistema                                                          |
| Histórico de Compras    | Relatório (requisito funcional ou saída do sistema) | Não é uma entidade. É gerado a partir de dados já modelados (instancias da entidade Compra) |
| Relatório de vendas     | Relatório (requisito funcional ou saída do sistema) | Não é uma entidade. É gerado a partir de dados já modelados                                 |

**DICA**: Para distinguir melhor dados de funcionalidades, siga a regra abaixo: 
- **Dado**: é algo que precisa ser **armazenado**.
- **Funcionalidade**: é algo que o usuário **faz** ou espera que o sistema faça.