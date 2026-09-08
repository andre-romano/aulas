
# Acoplamento, Coesao e Principios DRY, KISS, YAGNI

**Sumário** 
- [Acoplamento, Coesao e Principios DRY, KISS, YAGNI](#acoplamento-coesao-e-principios-dry-kiss-yagni)
  - [1. Acoplamento](#1-acoplamento)
  - [2. Coesão](#2-coesão)
  - [3. Injeção de dependência](#3-injeção-de-dependência)
  - [4. Princípio DRY (Don't Repeat Yourself -- Nao Se Repita)](#4-princípio-dry-dont-repeat-yourself----nao-se-repita)
    - [4.1. Nem todo código repetido deve ser abstraído](#41-nem-todo-código-repetido-deve-ser-abstraído)
  - [5. Principio KISS (Keep It Simple -- Mantenha O Código Simples)](#5-principio-kiss-keep-it-simple----mantenha-o-código-simples)
  - [6. Principio YAGNI (You Aren't Gonna Need It -- Voce Nao Vai Precisar Disso)](#6-principio-yagni-you-arent-gonna-need-it----voce-nao-vai-precisar-disso)
  - [Exercícios para fixação](#exercícios-para-fixação)
    - [Exercício 1](#exercício-1)
    - [Exercício 2](#exercício-2)
    - [Exercício 3](#exercício-3)
    - [Exercício 4](#exercício-4)
    - [Exercício 5](#exercício-5)


## 1. Acoplamento

Acoplamento mede o q**uanto uma parte do sistema depende de outra**.

Exemplo de alto acoplamento:

```text
Classe A
↓ usa
Classe B
↓ usa
Classe C
↓ usa
Classe D
```

Uma pequena alteração pode produzir efeitos em diversas partes do programa.

Buscamos, em geral **BAIXO ACOPLAMENTO**.
- Isto é, tornar o sistema **menos dependente possível de implementacoes concretas, e mais voltado a interfaces/polimorfismo**.
- **Reduzir hierarquias grandes** (classe A que herda de B que herda de C e assim sucessivamente), e utilizar **mais composicao**.
- Composição pode ajudar a reduzir o acoplamento porque permite substituir componentes utilizados por um objeto sem precisar alterar a hierarquia de classes.

**Codigo com BAIXO ACOPLAMENTO é mais facil de dar manutencao**

## 2. Coesão

Coesão está relacionada à concentração das responsabilidades de um componente.

Uma classe **altamente coesa** possui **responsabilidades relacionadas entre si**.
- Uma classe com **baixa coesao** possui responsabilidades que nao deveria ter.

Exemplo com BAIXA COESAO:

```python
class ContaBancaria:
    def __init__(self, saldo, agencia):
        self.__saldo = 0.0
        self.__agencia = agencia

    def depositar(self):
        pass

    def sacar(self):
        pass

    def consultar_saldo(self):
        pass

    def alterar_gerente_agencia(self, novo_gerente):
        pass
    
    def alterar_endereco_agencia(self, novo_endereco):
        pass
```

Exemplo com ALTA COESA:

```python
# agencia faz a parte de ajuste administrativo de gerente e endereco
class AgenciaBancaria:
    def __init__(self, codigo_agencia, gerente):
        self.codigo_agencia = codigo_agencia
        self.gerente = gerente

    def alterar_gerente(self, novo_gerente):
        pass
        
    def alterar_endereco(self, novo_endereco):
        pass

# enquanto Conta faz o controle de saldo, depositos e saques
class ContaBancaria:
    def __init__(self, saldo, agencia):
        self.__saldo = 0.0
        self.__agencia = agencia

    def depositar(self):
        pass

    def sacar(self):
        pass

    def consultar_saldo(self):
        pass
```

Nosso alvo aqui é atingir **ALTA COESAO** em **todas as classes**.
- Codigo altamente coeso é mais facil de dar manutencao (alterar o codigo, seja pra corrigir bugs ou inserir recursos no sistema)

## 3. Injeção de dependência

A injeção de dependência acontece quando um objeto recebe externamente os componentes de que necessita.
- Em geral, é um recurso que **facilita o polimorfismo e reuso de codigo**, tornando o código mais facil de dar manutencao.

Exemplo:

```python
class Repositorio:
    def salvar(self, usuario):
        print("Usuário", usuario, "salvo")


class UsuarioService:
    def __init__(self, repositorio):
        self.repositorio = repositorio

    def cadastrar(self, usuario):
        self.repositorio.salvar(usuario)
```

Uso:

```python
repositorio = Repositorio()
service = UsuarioService(repositorio)
```

``Repositorio`` tem responsabilidade bem definida, servindo para salvar os dados do usuário.

A classe `UsuarioService` não precisa criar seu próprio repositório (melhor usar um que ja existe).

Isso reduz o acoplamento e melhora coesao.
- **Baixo Acoplamento**: ``UsuarioService`` chama ``Repositorio`` pra salvar usuario (``UsuarioService`` nao precisa saber como ``Repositorio`` funciona)
- **Alta Coesao**: `Repositorio` so salva usuario, `UsuarioService` cadastra e chama `Repositorio` pra salvar.


## 4. Princípio DRY (Don't Repeat Yourself -- Nao Se Repita)

**Evite duplicação desnecessária de lógica**.

Código ruim:

```python
def calcular_total_produto(preco, quantidade):
    return preco * quantidade

def calcular_total_servico(preco, quantidade):
    return preco * quantidade
```

Se a mesma regra/código aparece em diversos lugares, podemos tentar centralizar o codigo em um local apenas.
> ***"Mesma regra/lógica, mesmo local de implementação".***

Exemplo:

```python
def calcular_total(preco, quantidade):
    return preco * quantidade
```

Agora podemos utilizar:

```python
total_produto = calcular_total(100, 3)
total_servico = calcular_total(50, 2)
```

Assim, a lógica de ``preço * quantidade`` fica definida em um único lugar.
- Se a regra precisar ser modificada, podemos alterar somente a funcao ``calcular_total()`` em vez de procurar e modificar várias implementações semelhantes.

Outro exemplo:

```python
class Professor:
    def calcular_salario(self, salario):
        return salario + salario * 0.20

class Tecnico:
    def calcular_salario(self, salario):
        return salario + salario * 0.20
```

A mesma regra aparece nas duas classes. Podemos centralizar a operação:

```python
class Funcionario:
    def aplicar_aumento(self, salario, percentual):
        return salario + salario * percentual
```

E utilizar:

```python
class Professor(Funcionario):
    def calcular_salario(self, salario):
        return self.aplicar_aumento(salario, 0.20)

class Tecnico(Funcionario):
    def calcular_salario(self, salario):
        return self.aplicar_aumento(salario, 0.20)
```

### 4.1. Nem todo código repetido deve ser abstraído

> Nem toda repetição de código deve ser abstraída imediatamente.

Considere:

```python
def mostrar_nome_aluno(nome):
    print(nome)

def mostrar_nome_professor(nome):
    print(nome)
```

Pode parecer que devemos obrigatoriamente criar uma função genérica para isso.

Porém, a pequena repetição pode ser mais simples de compreender do que uma abstração criada apenas para eliminar duas linhas semelhantes.

> Uma abstração ruim pode tornar o sistema mais complicado do que a própria repetição.

Por exemplo, não seria interessante criar uma arquitetura enorme apenas para evitar uma pequena repetição de código:

```text
Classe
    ↓
Interface
    ↓
Implementação
    ↓
Factory
    ↓
Strategy
```

quando uma simples função seria suficiente.

A pergunta importante é:
> A repetição representa realmente a mesma regra ou apenas parece semelhante?

Se duas partes do código representam a mesma regra de negócio, eliminá-la pode ser importante.
- Do contrário, **se a repetição é apenas superficial**, a abstração pode ser desnecessária e até prejudicial.

## 5. Principio KISS (Keep It Simple -- Mantenha O Código Simples)

**Prefira soluções simples** quando elas atendem aos requisitos.

Não transforme:

```python
resultado = a + b
```

em uma arquitetura de 15 classes apenas para demonstrar POO.

> POO é uma ferramenta, não um objetivo em si.

Exemplo:

```python
def calcular_total(preco, quantidade):
    return preco * quantidade
```

Essa implementação é simples e atende ao requisito.

Não existe necessidade de criar:

```text
CalculadoraDePreco
       ↓
InterfaceCalculadora
       ↓
CalculadoraDeProduto
       ↓
FabricaCalculadora
       ↓
StrategyCalculadora
```

apenas para executar ``preco * quantidade``

Outro exemplo:

```python
def verificar_maioridade(idade):
    resultado = False

    if idade >= 18:
        resultado = True

    return resultado
```

Pode ser substituído por uma solução mais simples:

```python
def verificar_maioridade(idade):
    return idade >= 18
```

As duas soluções podem produzir o mesmo resultado.

Entretanto, a segunda é mais simples de entender, consequentemente esse código é:
- **mais fácil de dar manutenção** 
- **menos propensa a erros**.

Código **simples não significa** código **desorganizado**
- O *Principio KISS* não significa escrever tudo em uma única função ou ignorar boas práticas.
- Uma classe ainda deve possuir responsabilidades bem definidas.

> O objetivo é utilizar a **menor complexidade necessária para resolver** corretamente o problema.

## 6. Principio YAGNI (You Aren't Gonna Need It -- Voce Nao Vai Precisar Disso)

É comum pensar em um sistema:

"Talvez eu precise das funcionalidades X, Y, Z futuramente, então vou implementar agora."

O problema é que:
- talvez a funcionalidade nunca seja utilizada;
- o requisito futuro pode ser diferente do imaginado;
- o código adicional aumenta a complexidade;
- mais código agora significa mais código para testar e manter (sem benefício real para o sistema).

Portanto:

> **Implemente o que o sistema realmente precisa agora.**
- Quando um novo requisito surgir, o código poderá ser estendido.

Exemplo:

Imagine que um sistema X atualmente precise **apenas calcular o total a ser pago pelo cliente**:

```python
def calcular_preco(preco, quantidade):
    return preco * quantidade
```

Não existe necessidade de implementar imediatamente recursos como:
- desconto futuro
- impostos futuros
- moeda estrangeira
- cupom
- programa de fidelidade
- integração com cinquenta bancos

sem que essas funcionalidades sejam requisitos atuais.

Exemplo:

Suponha que o professor peça: 
- "Crie uma classe Aluno com nome e matrícula."

Uma implementação adequada seria:

```python
class Aluno:
    def __init__(self, nome, matricula):
        self.nome = nome
        self.matricula = matricula
```

Não seria necessário criar:

```python
class Aluno:
    def __init__(
        self,
        nome,
        matricula,
        cpf,
        rg,
        endereco,
        telefone,
        salario,
        banco,
        idioma,
        passaporte
    ):
        ...
```

caso essas informações não façam parte do requisito.

Outro exemplo:

Se atualmente o sistema possui apenas ``PagamentoPIX``, não precisamos necessariamente criar desde já:
- ``PagamentoCartao``
- ``PagamentoBoleto``
- ``PagamentoCriptomoeda``
- ``PagamentoCheque``
- ``PagamentoTransferenciaInternacional``

sem que exista um requisito para essas formas de pagamento.

**Primeiro resolva os problemas/requisitos reais.**
- Quando um novo requisito surgir, o código poderá ser ampliado para dar conta da nova demanda.

## Exercícios para fixação

### Exercício 1

Considere:

```python
class BancoDeDados:
    pass

class Sistema:
    def __init__(self):
        self.banco = BancoDeDados()
```
Responda:
1. Qual é as dependências entre classes?
2. Quem é responsável por criar a instância de ``BancoDeDados``? Justifique.
3. Existe acoplamento entre ``Sistema`` e ``BancoDeDados``? Ele é baixo ou alto? Justifique.
4. O que aconteceria se fosse necessário substituir ``BancoDeDados`` por outra implementação? Explique e justifique.
5. Como você poderia melhorar o código acima?

### Exercício 2

Considere:

```python
class Usuario:
    def cadastrar(self):
        pass

    def alterar_senha(self):
        pass

    def enviar_email(self):
        pass

    def gerar_relatorio(self):
        pass

    def salvar_banco(self):
        pass
```
Responda:
1. A classe possui alta ou baixa coesão?
2. Qual(is) as responsabilidades que não deveriam estar na classe?
3. Refatore o código acima, criando classes conforme necessário.
4. Explique por que sua solução possui maior coesão.

### Exercício 3

Considere:

```python
def calcular_area_quadrado(lado):
    return lado * lado

def calcular_total_compra(preco, quantidade):
    return preco * quantidade
```

Responda:
1. Há duplicação nesse código? Justifique.
2. Existe alguma regra de negócio que se repete? Explique.
3. Refatore o código acima, criando funções conforme necessário.
4. A sua solução está de acordo com o princípio DRY? Justifique.

### Exercício 4

Considere:

```python
def verificar_maioridade(idade):
    resultado = False

    if idade >= 18:
        resultado = True
    else:
        resultado = False

    return resultado
```

Responda:
1. O código acima pode ser simplificado, mantendo exatamente o mesmo comportamento?
2. Refatore o código acima, criando funções, classes, metodos, atributos, e outros elementos conforme necessário.
3. Qual princípio está sendo aplicado na refatoração? Justifique.

### Exercício 5

Um sistema foi solicitado com o seguinte requisito:
> "Cadastre alunos contendo nome, matrícula e endereço."

O programador criou:

```python
class Aluno:
    def __init__(
        self,
        nome,
        matricula,
        cpf,
        rg,
        endereco,
        telefone,
        email,
        passaporte,
        idioma,
        nacionalidade
    ):
        ...
```
Responda:
1. Qual princípio está sendo desrespeitado?
2. Como você simplificaria a classe?
3. Explique por que sua solução é melhor do que a apresentada pelo programador. Justifique.