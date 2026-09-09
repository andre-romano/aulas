# Padrões de Arquitetura de Software

**Sumário**
- [Padrões de Arquitetura de Software](#padrões-de-arquitetura-de-software)
  - [1. Arquitetura em camadas (Layered Architecture)](#1-arquitetura-em-camadas-layered-architecture)
    - [1.1. Camada de apresentação (Presentation layer)](#11-camada-de-apresentação-presentation-layer)
    - [1.2. Camada de serviço ou de aplicacao (Service ou Application layer)](#12-camada-de-serviço-ou-de-aplicacao-service-ou-application-layer)
    - [1.3. Camada de domínio (Domain layer)](#13-camada-de-domínio-domain-layer)
    - [1.4. Camada de persistência (Persistence layer)](#14-camada-de-persistência-persistence-layer)
    - [1.5. Vantagens e desvantagens](#15-vantagens-e-desvantagens)
  - [2. Padrao de Arquitetura MVC (Model-View-Controller)](#2-padrao-de-arquitetura-mvc-model-view-controller)
    - [2.1. Onde MVC é utilizado?](#21-onde-mvc-é-utilizado)
    - [2.2. Vantagens e desvantagens](#22-vantagens-e-desvantagens)
  - [Exercícios de fixação](#exercícios-de-fixação)
    - [Exercício 1](#exercício-1)
    - [Exercício 2](#exercício-2)
    - [Exercício 3](#exercício-3)
    - [Exercício 4](#exercício-4)
    - [Exercício 5](#exercício-5)
    - [Exercício 6](#exercício-6)
    - [Exercício 7](#exercício-7)
    - [Exercício 8](#exercício-8)


## 1. Arquitetura em camadas (Layered Architecture)

Uma das arquiteturas mais conhecidas.

O software é organizado em camadas, da seguinte forma:

```text
┌─────────────────────────────┐
│       Apresentação          │
├─────────────────────────────┤
│       Aplicação/Serviço     │
├─────────────────────────────┤
│       Domínio/Negócio       │
├─────────────────────────────┤
│       Persistência          │
├─────────────────────────────┤
│       Banco de Dados        │
└─────────────────────────────┘
```

Cada camada:
- se **comunica com as camadas adjacentes**,
- possui **responsabilidades diferentes** (veja descricao abaixo).

### 1.1. Camada de apresentação (Presentation layer)

Responsável pela **interação com o usuário**, utilizando para isso:
- HTML + CSS
- GUI (Qt, Tkinter, etc)
- CLI (linha de comando)
- API REST
- aplicativo mobile
- outra tecnologia de interface humano computador, com a qual o usuário interage.

**Convencao de nomes**: para classes de apresentação, é recomendado utilizar o sufixo ``Controller`` (ou ``Controlador`` em português).
- `Controller` vem de controlador, pois a camada de apresentação controla a interação com o usuário.

### 1.2. Camada de serviço ou de aplicacao (Service ou Application layer)

**Coordena operações** da aplicação, orquestrando os recursos das outras camadas.

Exemplo:
```python
class UsuarioService:
    def __init__(self, repositorio):
        self.repositorio = repositorio

    def cadastrar(self, usuario):
        self.repositorio.salvar(usuario)
```

**Convencao de nomes**: para classes de serviço, é recomendado utilizar o sufixo ``Service`` (ou ``Servico`` em português).

### 1.3. Camada de domínio (Domain layer)

**Contém regras de negocio** relacionadas ao problema.

Exemplo:
```python
class ContaDomain:
    def __init__(self, saldo):
        self.saldo = saldo

    def sacar(self, valor):
        if valor > self.saldo:
            raise ValueError("Saldo insuficiente")

        self.saldo -= valor
```
Na pratica, a camada de domínio pode ser composta por várias classes, cada uma com suas próprias regras de negócio.
- Ela também pode ser mesclada com a camada de serviço, dependendo do tamanho e complexidade do sistema.

**Convencao de nomes**: para classes de domínio, é recomendado utilizar o sufixo ``Domain`` (ou ``Dominio`` em português).

### 1.4. Camada de persistência (Persistence layer)

Responsável pelo armazenamento de dados, implementando as operações de leitura e escrita no sistema de armazenamento (banco de dados SQL, NoSQL, arquivos, etc).

```python
class UsuarioRepository:
    def salvar(self, usuario):
        ...
```

**Convencao de nomes**: para classes de persistência, é recomendado utilizar o sufixo ``Repository`` (ou ``Repositorio`` em português).

---

### 1.5. Vantagens e desvantagens

**Vantagens:**
* simples de entender;
* bastante conhecida;
* fácil de ensinar;
* boa para sistemas pequenos e médios;
* separa responsabilidades.

**Desvantagens:**
* pode adicionar complexidade ao sistema;
* requer mais código para implementar;
* regras de negócio espalhadas;
* camadas gigantes (excesso de classes);
* pode dar mais trabalho do que o necessário para sistemas simples.

## 2. Padrao de Arquitetura MVC (Model-View-Controller)

MVC é **um dos padrões de arquitetura de software mais comuns**, sendo usadas em aplicacoes Web, Desktop, Mobile e até frameworks.

MVC divide a aplicação em 3 partes:
- **Model**: representa dados e regras relacionadas ao domínio.
  - Acessa o banco de dados, valida dados, aplica regras de negócio.
- **View**: responsável pela apresentação (ex: HTML + CSS).
  - Recebe dados do Model e mostrar para o usuário na tela.
- **Controller**: recebe ações do usuário e coordena a operação (conversa com o Model e a View).
  - Recebe ações do usuário, consulta o Model e envia dados para a View.

```text
Usuário
   ↓ interage
  View
   ↓ aciona
Controller
   ↓ consulta
 Model   
```

Convencao de nomes:
- **Model**: classes que representam dados e regras de negócio, com o sufixo ``Model`` ou ``Modelo`` (em português).
- **View**: classes que fornecem a representação visual da tela para o Usuario, com o sufixo ``View`` ou ``Visao`` (em português).
- **Controller**: classes que recebem ações do usuário e coordenam a operação, com o sufixo ``Controller``, `Ctrl` ou ``Controlador`` (em português).
  
Exemplo:

```python
class UsuarioModel:
    def __init__(self, nome):
        self.nome = nome

class UsuarioView:
    def mostrar_usuario(self, usuario):
        print(usuario.nome)

class UsuarioController:
    def __init__(self):
        self.view = UsuarioView()

    def cadastrar_usuario(self, nome):
        usuario = UsuarioModel(nome)
        self.view.mostrar_usuario(usuario)
```

### 2.1. Onde MVC é utilizado?


Exemplo:

```text
Browser
   ↓
Controller
   ↓
Model
   ↓
View
```

### 2.2. Vantagens e desvantagens

**Vantagens:**
* separação de responsabilidades;
* facilita manutenção;
* separa apresentação das regras;
* útil para aplicações com interface.

**Desvantagens:**
* pode adicionar complexidade ao sistema;

## Exercícios de fixação

### Exercício 1

Considere um sistema de cadastro de alunos, que possui as seguintes funcionalidades:
- Cadastrar aluno
- Consultar aluno
- Alterar aluno
- Excluir aluno

Considere que a equipe responsável pelo desenvolvimento do sistema construiu os seguintes componentes:
- AlunoController
- AlunoService
- AlunoDomain
- AlunoRepository

Responda:
1. Identifique o padrao de arquitetura utilizado.
2. Explique a responsabilidade de cada componente.
3. Exemplifique como cada componente se comunica com os outros.

### Exercício 2

Considere as operações de um sistema academico para gerencimaneto de alunos:

1. Receber o nome digitado pelo usuário
2. Verificar se o nome está vazio
3. Cadastrar o aluno
4. Salvar o aluno no banco
5. Exibir mensagem na tela
6. Calcular a média do aluno

Distribua cada operação entre:

- Presentation
- Service
- Domain
- Persistence

Explique por que uma operação não deve ser colocada em qualquer camada simplesmente porque é mais fácil implementá-la naquele local.

### Exercício 3 

Crie uma classe:

```python
class AlunoDomain:
    ...
```

Ela deve possuir:
- ``nome`` 
- ``matricula``
- ``validar()``

O método ``validar()`` deve verificar se:
- o nome não está vazio;
- a matrícula não está vazia.

Utilize uma exceção quando os dados forem inválidos.

Ems seguida, crie uma classe Controller que utilize a classe AlunoDomain para cadastrar um aluno.
- Trate a exceção no Controller, exibindo uma mensagem de erro para o usuário.

### Exercício 4

Considere:

```python
class AlunoController:
    def cadastrar(self, nome, matricula):
        if nome == "":
            print("Nome inválido")

        aluno = {
            "nome": nome,
            "matricula": matricula
        }

        banco = MySQL()
        banco.salvar(aluno)

        print("Aluno cadastrado")
```

Identifique as responsabilidades que estão misturadas nesse código.

Classifique cada trecho como:
- Apresentação
- Serviço
- Domínio
- Persistência

Depois explique por que essa implementação não representa adequadamente uma arquitetura em camadas.

Refatore o código para separar as responsabilidades em classes diferentes, de acordo com o padrão de arquitetura em camadas.

### Exercício 5

Crie:
```python
class AlunoModel:
    ...
```

Ele deve possuir:
- nome
- matricula
- curso
- mostrar_dados()

O método ``mostrar_dados()`` deve retornar os dados do aluno.

### Exercício 6

Crie:
```python
class AlunoView:
    ...
```

Implemente:
- mostrar_aluno(aluno)
- mostrar_mensagem(mensagem)

``mostrar_aluno(aluno)`` deve receber um objeto AlunoModel e exibir os dados do aluno usando ``print()``.

``mostrar_mensagem(mensagem)`` deve exibir uma mensagem na tela, usando ``print()``.

Exemplo:
``view.mostrar_mensagem("Aluno cadastrado")``

### Exercício 7

Crie:
```python
class AlunoController:
    ...
```

Implemente:
- ``cadastrar_aluno(nome, matricula, curso)``

O Controller deve utilizar as classes abaixo para realizar o cadastro do aluno:
- ``AlunoModel``
- ``AlunoView``

O Controller tambem deve:
- receber os dados;
- criar o Model;
- enviar o Model para a View;
- apresentar a informação.

### Exercício 8

Observe:
```python
class AlunoView:

    def cadastrar(self):

        nome = input("Nome: ")
        matricula = input("Matrícula: ")

        aluno = AlunoModel(nome, matricula)

        banco = MySQL()
        banco.salvar(aluno)
```

Responda:
1. Identifique os problemas dessa implementação.
2. As responsabilidades que estao contidas na View estão adequadas? Explique.
3. Refatore o código, de acordo com o padrão de arquitetura MVC.