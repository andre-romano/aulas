
# Principios SOLID

**Sumário** 
- [Principios SOLID](#principios-solid)
- [1. Princípios SOLID](#1-princípios-solid)
  - [1.1. S — Single Responsability Principle (SRP ou Princípio da Responsabilidade Única)](#11-s--single-responsability-principle-srp-ou-princípio-da-responsabilidade-única)
  - [1.2. O — Open/Closed Principle (OCP ou Principio Aberto/Fechado)](#12-o--openclosed-principle-ocp-ou-principio-abertofechado)
  - [1.3. L — Liskov Substitution Principle (LSP ou Principio de Substituicao de Liskov)](#13-l--liskov-substitution-principle-lsp-ou-principio-de-substituicao-de-liskov)
  - [1.4. I — Interface Segregation Principle (ISP ou Principio de Segregacao de Interfaces)](#14-i--interface-segregation-principle-isp-ou-principio-de-segregacao-de-interfaces)
  - [1.5. D — Dependency Inversion Principle (DIP ou Principio de Inversao de Dependencia)](#15-d--dependency-inversion-principle-dip-ou-principio-de-inversao-de-dependencia)
- [Exercícios para fixação](#exercícios-para-fixação)
  - [Exercício 1](#exercício-1)
  - [Exercício 2](#exercício-2)
  - [Exercício 3](#exercício-3)
  - [Exercício 4](#exercício-4)
  - [Exercício 5](#exercício-5)
  - [Exercício 6](#exercício-6)
  - [Exercício 7](#exercício-7)
  - [Exercício 8](#exercício-8)


# 1. Princípios SOLID

Além dos pilares tradicionais da POO, é importante estudar os princípios **SOLID**.

SOLID é um acrônimo formado pelas iniciais de cinco princípios:

```text
S → Single Responsibility Principle
O → Open/Closed Principle
L → Liskov Substitution Principle
I → Interface Segregation Principle
D → Dependency Inversion Principle
```

Esses princípios ajudam a produzir código mais:

* fácil de manter;
* testável;
* extensível;
* reutilizável;
* desacoplado.

## 1.1. S — Single Responsability Principle (SRP ou Princípio da Responsabilidade Única)

Uma classe deve possuir **UMA RESPONSABILIDADE** bem definida.

Evite:

```python
class Sistema:
    def cadastrar_usuario(self):
        pass

    def enviar_email(self):
        pass

    def gerar_relatorio(self):
        pass

    def salvar_banco(self):
        pass
```

Essa classe está acumulando responsabilidades diferentes.

É preferível separar:

```python
class UsuarioService:
    def cadastrar_usuario(self):
        pass


class EmailService:
    def enviar_email(self):
        pass


class RelatorioService:
    def gerar_relatorio(self):
        pass
```

O objetivo não é "ter muitas classes".

O objetivo é ter **RESPONSABILIDADES BEM DEFINIDAS**.
- *"Cada classe faz uma tarefa bem feita, e uma somente."*

## 1.2. O — Open/Closed Principle (OCP ou Principio Aberto/Fechado)

Uma entidade deve estar **aberta para extensão e fechada para modificação**.

Imagine um sistema de cálculo de desconto, na qual foi feita seguinte abordagem (pouco escalável):

```python
def calcular_desconto(tipo, valor):
    if tipo == "normal":
        return valor * 0.05

    elif tipo == "vip":
        return valor * 0.10

    elif tipo == "funcionario":
        return valor * 0.20
```

À medida que novos tipos surgem, a função precisa ser constantemente modificada (novos ``elif`` adicionados na funcao).

Para resolver isso, podemos utilizar **polimorfismo**:

```python
class Desconto:
    def calcular(self, valor):
        raise NotImplementedError
```

Depois:

```python
class DescontoNormal(Desconto):
    def calcular(self, valor):
        return valor * 0.05


class DescontoVIP(Desconto):
    def calcular(self, valor):
        return valor * 0.10
```

Agora o sistema pode receber diferentes estratégias de desconto sem modificar o código principal.

Essa abordagem descrita acima é a base que norteia **padroes de projeto** de engenharia de software avançados, como o ``Startegy`` (que veremos mais a frente no curso).

## 1.3. L — Liskov Substitution Principle (LSP ou Principio de Substituicao de Liskov)

O Princípio da Substituição de Liskov estabelece que **objetos de uma subclasse devem poder substituir objetos da classe-base** sem quebrar as expectativas do programa.
- Isto é, uma subclasse **tem que ser um tipo de** classe base

Exemplo:
- Todo `Retangulo` é um tipo de `Quadrado`.
- Logo `Quadrado` deve ser a **classe-pai**
- `Retangulo` é a classe-filha 
- Fazer o contrario disso seria errado 
  - Nem todo ``Retangulo`` é um ``Quadrado``, pois um ``Quadrado`` tem seus lados todos iguais, e `Retangulos` podem ter um dos lados diferentes

A lição principal é:

> Herança deve preservar o comportamento esperado da classe-pai (interface previamente definida).

## 1.4. I — Interface Segregation Principle (ISP ou Principio de Segregacao de Interfaces)

Classes não devem ser obrigados a ter métodos que não utilizam.

Imagine o seguinte cenario:

```python
class Funcionario:
    def trabalhar(self):
        pass

    def dirigir(self):
        pass

    def programar(self):
        pass
```

Agora suponha que temos um ``Funcionário`` que não dirige ou não programa. 
- Nesse caso, o objeto desse funcionario teria esses métodos que não fazem sentido para ele.

Em casos como esse, é melhor **criar abstrações menores e específicas**. 
- Uma maneira de fazer isso é usar **interfaces** menores.
- Ou entao usar **classes abstratas** menores.

```python
from abc import ABC, abstractmethod

class TrabalharInterface(ABC):
    @abstractmethod
    def trabalhar(self):
        pass

class DirigirInterface(ABC):
    @abstractmethod
    def dirigir(self):
        pass

class ProgramarInterface(ABC):
    @abstractmethod
    def programar(self):
        pass

# criamos uma classe concreta que implementa a interface trabalhar() e dirigir()
class FuncionarioTrabalhaDirige(TrabalharInterface, DirigirInterface):
    def trabalhar(self):
        print("Eu trabalho")
    
    def dirigir(self):
        print("Eu dirijo")
```

## 1.5. D — Dependency Inversion Principle (DIP ou Principio de Inversao de Dependencia)

Módulos de alto nível não devem depender diretamente de implementações concretas.
- Eles devem **depender de abstrações** (interfaces, classes abstratas, etc).
- Isto é, **devemos usar polimorfismo**.

Exemplo inadequado:

```python
class Sistema:
    def __init__(self):
        self.banco = MySQL()
```

O sistema fica fortemente acoplado ao MySQL.
- Se precisarmos mudar de banco de dados no futuro, poderemos ter problemas.
- **Acoplamento** significa **dependencia**.

Uma abordagem mais flexível:

```python
class Sistema:
    def __init__(self, banco):
        self.banco = banco
```

Agora podemos fornecer diferentes implementações:
```python
sistema = Sistema(MySQL())
```

ou:

```python
sistema = Sistema(PostgreSQL())
```

Alem de facilitar a troca de sistemas de bancos de dados, uma abordagem como essa tambem facilita a criacao de testes.

Exemplo:
```python
sistema = Sistema(BancoDeDadosDeTeste())
```

# Exercícios para fixação

## Exercício 1

Observe a classe abaixo:

```python
class Sistema:
    def cadastrar_usuario(self):
        pass

    def enviar_email(self):
        pass

    def gerar_relatorio(self):
        pass

    def salvar_banco(self):
        pass
```

Responda:

1. Quantas responsabilidades diferentes essa classe possui?
2. Quais são essas responsabilidades?
3. Qual princípio SOLID está sendo violado?
4. Refatore a classe para estar em conformidade com o princípio SOLID identificado. Sua solução deve preservar a funcionalidade original.

## Exercício 2

Considere o código abaixo:

```python
def calcular_desconto(tipo, valor):

    if tipo == "normal":
        return valor * 0.05

    elif tipo == "vip":
        return valor * 0.10

    elif tipo == "funcionario":
        return valor * 0.20
```

Imagine que o sistema passe a possuir novos tipos de cliente: ``estudante``, ``cliente_especial``, ``aposentado``.

Para implementar cada novo desconto, seria necessário modificar a função.

Responda:
1. Qual é o problema dessa abordagem?
2. Qual princípio SOLID está sendo violado?
3. Como a adição de novos tipos de cliente afeta a manutenção do código?
4. Por que adicionar novos ``elif`` pode não ser escalável?
5. Refatore o código para estar em conformidade com o princípio SOLID identificado. Sua solução deve preservar a funcionalidade original e permitir a adição de novos tipos de cliente de forma escalável e mantenível.

## Exercício 3

Considere a seguinte modelagem:

```text
Retangulo
    ↑
Quadrado
```

Considere que ``Quadrado`` é uma especialização de ``Retangulo``.

Responda:
1. Todo ``Quadrado`` é um ``Retangulo``?
2. Todo ``Retangulo`` é um ``Quadrado``?
3. Qual deveria ser a classe-pai segundo o conceito apresentado no material?
4. O que pode acontecer quando usamos uma herança que não representa corretamente a relação entre os tipos?
5. Por que uma subclasse precisa preservar o comportamento esperado da classe-pai?

## Exercício 4

Considere:

```python
class Professor:
    def ensina(self):
        pass

    def pesquisa(self):
        pass

    def faz_extensao(self):
        pass
```

Imagine que exista um professor que não realiza atividades de extensão.

Responda:
1. Qual é o problema dessa classe?
2. Qual princípio SOLID está sendo violado? Explique e justifique.
3. Como isso afeta a manutenção e a extensibilidade do código?
4. Qual a solução para esse problema?

## Exercício 5

Observe:

```python
class Sistema:
    def __init__(self):
        self.banco = MySQL()
```

Responda:
1. Qual objeto está sendo criado diretamente dentro de ``Sistema``?
2. Qual princípio SOLID está sendo violado? Explique e justifique.
3. Como isso afeta a manutenção e a extensibilidade do código?
4. Como essa implementação dificulta testes?
5. Refatore a classe para estar em conformidade com o princípio SOLID identificado. Sua solução deve preservar a funcionalidade original.

## Exercício 6

Modifique o exemplo anterior para utilizar injeção de dependência, permitindo que diferentes implementações de banco de dados sejam fornecidas ao sistema.

Responda:
1. O que mudou em relação à implementação anterior?
2. Sistema ainda depende diretamente de ``MySQL``?
3. É possível trocar o banco de dados sem modificar a classe ``Sistema``?
4. Essa solução facilita a criação de testes? Justifique.
5. Quais as relações entre injeção de dependência, coesão, acoplamento e manutenção de código? Explique.

## Exercício 7

Associe os principios SOLID abaixo:

1. SRP
2. OCP
3. LSP
4. ISP
5. DIP

Com as situações descritas:

(   ) Uma classe possui várias responsabilidades diferentes.

(   ) O sistema precisa modificar uma função toda vez que aparece
      uma nova forma de desconto.

(   ) Uma subclasse não pode substituir adequadamente sua classe-pai.

(   ) Uma classe é obrigada a possuir métodos que não utiliza.

(   ) Uma classe depende diretamente de uma implementação concreta.

## Exercício 8

Considere:
```python
class Sistema:
    def calcular_desconto(self, tipo, valor):
        if tipo == "normal":
            return valor * 0.05

        elif tipo == "vip":
            return valor * 0.10

        elif tipo == "funcionario":
            return valor * 0.20

    def enviar_email(self):
        pass

    def gerar_relatorio(self):
        pass

    def salvar_banco(self):
        pass
```

Refatore o programa de forma que a solução final:
- separe as responsabilidades;
- evite uso de ``elif`` para os tipos de desconto;
- permita adicionar um novo tipo de desconto sem modificar a função principal;
- utilize polimorfismo.