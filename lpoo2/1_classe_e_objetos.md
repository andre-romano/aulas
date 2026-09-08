# Classes e Objetos: Guia de Estudos

**Sumário**
- [Classes e Objetos: Guia de Estudos](#classes-e-objetos-guia-de-estudos)
  - [1. O que é Programação Orientada a Objetos?](#1-o-que-é-programação-orientada-a-objetos)
  - [2. Mapa mental](#2-mapa-mental)
  - [3. Classe e objeto](#3-classe-e-objeto)
    - [3.1. Criando uma classe em Python](#31-criando-uma-classe-em-python)
  - [4. Atributos](#4-atributos)
    - [4.1 Atributos de objetos diferentes](#41-atributos-de-objetos-diferentes)
  - [5. O método `__init__()`](#5-o-método-__init__)
    - [5.1. O que significa `self`?](#51-o-que-significa-self)
  - [6. Atributos de classe](#6-atributos-de-classe)
  - [7. Métodos](#7-métodos)
  - [8. Métodos de classe](#8-métodos-de-classe)
  - [9. Estado e comportamento](#9-estado-e-comportamento)
  - [Exercícios para fixação](#exercícios-para-fixação)
    - [Exercício 1](#exercício-1)
    - [Exercício 2](#exercício-2)
    - [Exercício 3](#exercício-3)
    - [Exercício 4](#exercício-4)


## 1. O que é Programação Orientada a Objetos?

Antes de falar de classe e objetos, é importante entender primeiro o que é **programacao orientada a objetos**.

Programação Orientada a Objetos (POO) é um paradigma de programação no qual o sistema é estruturado a partir de objetos, que representam entidades do domínio do problema.

Um objeto reúne:

* **dados**, chamados de atributos;
* **comportamentos**, representados por métodos.

A ideia central é aproximar a estrutura do programa dos elementos que existem no problema que está sendo modelado.

Por exemplo, em um sistema acadêmico podemos ter:

```text
Aluno
Professor
Disciplina
Turma
Curso
```

Cada entidade pode possuir características e comportamentos próprios.

Um `Aluno`, por exemplo, pode possuir:

```text
nome
matricula
email
```

e comportamentos como:

```text
matricular()
cancelar_matricula()
calcular_media()
```

## 2. Mapa mental

A programacao orientada a objetos (POO) é uma área que demanda vários conceitos e abstracoes, que iremos investigar nessa disciplina.

Em particular, nossa enfase estará nos assuntos de DESIGN para baixo, conforme mapa mental abaixo:

```text
PROGRAMÇÃO ORIENTADA A OBJETOS
│
├── Classes
│   ├── Atributos
│   ├── Métodos
│   └── Construtores
│
├── Objetos
│   ├── Estado
│   └── Comportamento
│
├── PILARES
│   ├── Encapsulamento
│   ├── Abstração
│   ├── Herança
│   └── Polimorfismo
│
├── RELACIONAMENTOS
│   ├── Associação
│   ├── Agregação
│   └── Composição
│
├── DESIGN
│   ├── Alta coesão
│   ├── Baixo acoplamento
│   ├── SOLID
│   ├── DRY
│   ├── KISS
│   └── YAGNI
│
├── ARQUITETURAS
│   ├── MVC
│   ├── Camadas
│   ├── Cliente-Servidor
│   ├── Repositório
│   └── ...
│
└── PADROES DE PROJETO
    ├── Strategy
    ├── Builder
    ├── DAO
    ├── Command
    └──  ...
```

Mas antes de adentrarmos nesses tópicos mais avancados de design e projeto de software, precisamos primeiro revisitar conceitos básicos da disciplina (Classes, Objetos, Herança, etc).

## 3. Classe e objeto

Uma das distinções mais importantes da POO é:

> **Classe é o molde.**

> **Objeto é uma instância desse molde.**

Imagine uma classe **`Aluno`** como uma especificação:

```text
Classe Aluno
 ├── nome
 ├── matrícula
 ├── email
 ├── matricular()
 └── calcular_media()
```

Quando criamos alunos concretos, temos objetos:

```text
Aluno("João")
Aluno("Maria")
Aluno("Pedro")
```

Todos são objetos da classe `Aluno`. 
- Logo todos tem informacões como `nome` , `matricula` , e `email` 
- O que vai mudar de um objeto para outro é o conteudo dessas informacõees 
  - **Ex:** ``Aluno("João")`` tem ``nome = "João"``
  - **Ex:** ``Aluno("Maria")`` tem ``nome = "Maria"``
  - Isto é `Aluno("Joao")` != `Aluno("Maria")` (os objetos sao diferentes, e portanto armazenam informacões diferentes)
- Todos os objetos tem EXATAMENTE os mesmos metodos `matricular()`, e `calcular_media()`

### 3.1. Criando uma classe em Python

Em Python, usamos a palavra-chave `class`.

```python
class Aluno:
    pass
```

Podemos criar objetos dessa classe:

```python
aluno1 = Aluno()
aluno2 = Aluno()
```

Neste momento:

```text
Aluno
  ↓
classe

aluno1 → objeto
aluno2 → objeto
```

Os dois objetos pertencem à mesma classe, mas são entidades independentes.

## 4. Atributos

Atributos representam o **estado** de um objeto.

Exemplo:

```python
class Aluno:
    pass


aluno = Aluno()

aluno.nome = "João"
aluno.idade = 20
aluno.matricula = "20260001"

print(aluno.nome)
print(aluno.idade)
```

Embora seja possível fazer isso em Python, normalmente preferimos inicializar os objetos utilizando o método `__init__()` que atua como **Construtor** da classe.
  - Isto é o **Construtor** `__init__()` é responsável pela criação dos objetos da classe.

### 4.1 Atributos de objetos diferentes

Objetos diferentes armazenam informacões diferentes. 
- Isto é, o **estado** que está armazenado nos atributos do objeto é diferente. 

Exemplo:

```python
class Aluno:
    pass


aluno = Aluno()

aluno.nome = "João"
aluno.idade = 20

outro_aluno = Aluno()
outro_aluno.nome = "Maria"
outro_aluno.idade = 16

print("ALUNO")
print(aluno.nome) 
print(aluno.idade) 

print("OUTRO ALUNO")
print(outro_aluno.nome)
print(outro_aluno.idade)

# Trocando a idade de aluno para 10 anos
aluno.idade = 10

# devemos ver a nova idade de aluno ao rodar o codigo abaixo
print("ALUNO")
print(aluno.nome)
print(aluno.idade)

# outro aluno nao mudou (veremos os mesmos dados de antes)
print("OUTRO ALUNO")
print(outro_aluno.nome)
print(outro_aluno.idade)
```

Note que os nomes e as idades são diferentes nos objetos `aluno` e `outro_aluno`. 
- Observe também que se eu alterar a idade de ``aluno``, apenas a idade dele muda (``outro_aluno`` continua com 16 anos).

## 5. O método `__init__()`

O método `__init__()` é uma funcao especial, utilizada para inicializar um objeto quando ele é criado.
- `__init__()` tambem é chamado de **Construtor da classe** (pois permite construir um objeto)

Exemplo:

```python
class Aluno:

    def __init__(self, nome, idade, matricula):
        self.nome = nome
        self.idade = idade
        self.matricula = matricula
```

Agora podemos criar objetos passando seus dados diretamente para o construtor:

```python
aluno1 = Aluno("João", 20, "20260001")

# note que em aluno1 o construtor recebe os dados na ordem que informamos:
# nome = "João"
# idade = 20
# matricula = "20260001"
print(aluno1.nome)
print(aluno1.idade)
print(aluno1.matricula)

# mesma logica vale para quando queremos criar outro aluno (Maria, por exemplo)
aluno2 = Aluno("Maria", 22, "20260002")
print(aluno2.nome)
print(aluno2.idade)
print(aluno2.matricula)
```

**IMPORANTE**: A notacao ``nome_do_objeto.atributo`` permite que acessemos os dados armazenados nesse atributo do objeto `nome_do_objeto`

Exemplo:

```python
# acessando nome do objeto aluno1
print(aluno1.nome)

# acessando nome do objeto aluno2
print(aluno2.nome)
```

### 5.1. O que significa `self`?

`self` representa a **instância atual do objeto**. 
- Isto é, ``self`` é uma forma que temos de acessar **dados** (atributos), ou **métodos** do objeto.

Quando escrevemos:

```python
self.nome = nome
```

estamos dizendo:

> "O atributo `nome` deste objeto receberá o valor informado."

Por isso:

```python
aluno1.nome
```

e

```python
aluno2.nome
```

podem possuir valores diferentes.

## 6. Atributos de classe

Atributos de classe pertencem à própria classe.
- Isto é, sao comuns a TODOS os objetos.

```python
class Produto:
    categoria = "Eletrônicos"

    def __init__(self, nome):
        self.nome = nome
```

Uso:

```python
p1 = Produto("Notebook")
p2 = Produto("Monitor")

print(p1.categoria)
print(p2.categoria)
```

Resultado:
```text
Eletrônicos
Eletrônicos
```

Ambos podem acessar o atributo definido na classe. 
- Note que **se qualquer objeto alterar o atributo de classe, essa alteracao ocorre para todos os outros objetos** tambem (pois o atributo de classe é compartilhado por todos os objetos)

Exemplo:

```python
p1 = Produto("Notebook")
p2 = Produto("Monitor")

print(p1.categoria)
print(p2.categoria)

p1.categoria = "Casa"

print(p1.categoria)
print(p2.categoria)
```

Resultado:
```text
Eletrônicos
Eletrônicos
Casa
Casa
```

## 7. Métodos

Métodos são funções pertencentes a uma classe.

Exemplo:

```python
class Aluno:

    def __init__(self, nome, nota1, nota2):
        self.nome = nome
        self.nota1 = nota1
        self.nota2 = nota2

    def calcular_media(self):
        return (self.nota1 + self.nota2) / 2.0
```

Uso:

```python
aluno = Aluno("João", 8.0, 7.0)

media = aluno.calcular_media()

print(media)
```

Resultado:

```text
7.5
```

Observe a diferença:

```python
aluno.nome
```

é um **atributo**.

```python
aluno.calcular_media()
```

é um **método**.

Veja que TODO METODO deve ser chamado pelo seu nome, seguido de parenteses, podendo ter dentro deles algum **parametro**. 

Exemplo:

```python
class Aluno:

    def __init__(self, nome, nota1, nota2):
        self.nome = nome
        self.nota1 = nota1
        self.nota2 = nota2

    # frase aqui é um parametro do metodo falar()
    def falar(self, frase):
        print(self.nome, ":", frase)
```

## 8. Métodos de classe

Python permite criar métodos associados à classe utilizando `@classmethod`.

```python
class Pessoa:
    quantidade = 0

    def __init__(self, nome):
        self.nome = nome
        Pessoa.quantidade += 1

    @classmethod
    def total_pessoas(cls):
        return cls.quantidade
```

Uso:

```python
p1 = Pessoa("João")
p2 = Pessoa("Maria")

print("Foram criadas: ", Pessoa.total_pessoas(), "pessoas")
```

Resultado:
```text
Foram criadas: 2 pessoas
```

O parâmetro `cls` representa a classe.

Normalmente **usamos metodos de classe** quando temos algum **comportamento que nao depende do estado do objeto** (dados armazenados no atributo).
- No exemplo acima, o total de pessoas (``Pessoa.quantidade`) nao depende de uma pessoa em especifico.
- Pelo contrario, ele conta quantas pessoas foram criadas no sistema.

## 9. Estado e comportamento

Um objeto normalmente pode ser entendido como uma combinação de:

```text
OBJETO
│
├── Estado (ou Dados armazenados)
│   ├── nome
│   ├── saldo
│   └── idade
│
└── Comportamento
    ├── depositar()
    ├── sacar()
    └── atualizar()
```

Exemplo:

```python
class Conta:

    def __init__(self, titular, saldo=0):
        self.titular = titular
        self.saldo = saldo

    def depositar(self, valor):
        self.saldo += valor

    # observe que consultar_saldo() retorna o saldo armazenado na conta
    def consultar_saldo(self):
        return self.saldo

# vamos criar uma conta para "Joao" com 1000 de saldo inicial
conta = Conta("João", 1000)

# joao recebe 500 reais
conta.depositar(500)

# o resultado retornado por consultar_saldo() é mostrado na tela
print(conta.consultar_saldo())
```

Resultado que deve aparecer na tela:

```text
1500
```

## Exercícios para fixação

Faça os exercícios abaixo para testar seus conhecimentos de 

### Exercício 1

Crie uma classe `Pessoa` com:

```text
nome
idade
email
```

Implemente um método:

```text
apresentar()
```

que produza uma mensagem apresentando a pessoa.

### Exercício 2
Crie uma classe `ContaBancaria` com:

```text
titular
saldo
```

Implemente:

```text
depositar(valor)
sacar(valor)
consultar_saldo()
```

Regras:

* depósito deve ser positivo;
* saque deve ser positivo;
* não permitir saque superior ao saldo.
* ``consulta_saldo()`` deve retornar o saldo da conta, para que possamos mostrar na tela com ``print()``

### Exercício 3

Crie uma classe `Aluno` com:

```text
nome
matricula
notas
```

Implemente:

```text
adicionar_nota()
calcular_media()
situacao()
```

Considere:

```text
média >= 7 → Aprovado
média >= 5 → Recuperação
média < 5  → Reprovado
```

- ``situacao()`` retornar o status do aluno ("Aprovado", "Recuperacao", "Reprovado")

### Exercício 4

Antes de executar o codigo abaixo, leia-o e escreva, no papel ou em um comentário, qual será a saída impressa. Só depois rode o código para conferir.

```python
class Aluno:

    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade


aluno_a = Aluno("Carla", 19)
aluno_b = Aluno("Bruno", 21)
aluno_c = Aluno("Carla", 19)

aluno_a.idade = 20

print(aluno_a.nome, aluno_a.idade)
print(aluno_b.nome, aluno_b.idade)
print(aluno_c.nome, aluno_c.idade)
```

Depois de conferir a saída, responda: 
- ``aluno_a`` e ``aluno_c`` foram criados com os mesmos valores de nome e idade. Eles são o mesmo objeto? Por quê?
