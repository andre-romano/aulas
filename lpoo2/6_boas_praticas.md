
# Diretrizes e Boas Praticas de Desenvolvimento de Software

**Sumário** 
- [Diretrizes e Boas Praticas de Desenvolvimento de Software](#diretrizes-e-boas-praticas-de-desenvolvimento-de-software)
- [1. O que é uma boa classe?](#1-o-que-é-uma-boa-classe)
- [2. O que evitar](#2-o-que-evitar)
  - [2.1. Classe "Deus"](#21-classe-deus)
  - [2.2. Herança excessiva](#22-herança-excessiva)
  - [2.3. Métodos gigantes](#23-métodos-gigantes)
    - [2.3.1. Problema](#231-problema)
    - [2.3.2. Solução 01 (Refatorar em métodos menores)](#232-solução-01-refatorar-em-métodos-menores)
    - [2.3.3. Solução 02 (Refatorar em classes menores)](#233-solução-02-refatorar-em-classes-menores)
  - [2.4. Condicionais excessivas](#24-condicionais-excessivas)
    - [Solução 01: Polimorfismo](#solução-01-polimorfismo)
  - [2.5. Nomes sem semântica (sem significado)](#25-nomes-sem-semântica-sem-significado)
    - [2.5.1. Convenções de nomenclatura](#251-convenções-de-nomenclatura)
  - [2.6. Comentários óbvios](#26-comentários-óbvios)
  - [2.7. Falta de tratamento de erros](#27-falta-de-tratamento-de-erros)
  - [2.8. Ausencia de testes no código](#28-ausencia-de-testes-no-código)
  - [2.9. Duplicação de código](#29-duplicação-de-código)
  - [2.10. Evite "Valores Mágicos"](#210-evite-valores-mágicos)
- [Exercícios para fixação](#exercícios-para-fixação)
  - [Exercício 1](#exercício-1)
  - [Exercício 2](#exercício-2)
  - [Exercício 3](#exercício-3)
  - [Exercício 4](#exercício-4)
  - [Exercício 5](#exercício-5)
  - [Exercício 6](#exercício-6)
  - [Exercício 7](#exercício-7)

# 1. O que é uma boa classe?

Uma boa classe normalmente apresenta:

* responsabilidade bem definida;
* estado consistente;
* comportamentos relacionados aos seus dados;
* baixo acoplamento;
* alta coesão;
* interface simples;
* nomes claros;
* poucas responsabilidades;
* dependências controladas.

Pergunta que precisa ser respondida:

> "Essa classe representa uma coisa ou conceito que faz sentido no domínio do problema?"

# 2. O que evitar

## 2.1. Classe "Deus"

Uma classe extremamente grande que faz praticamente tudo:

```text
Sistema
 ├── banco
 ├── autenticação
 ├── relatórios
 ├── interface
 ├── pagamentos
 ├── emails
 ├── arquivos
 └── usuários
```

Esse tipo de classe tende a possuir alta complexidade, alto acoplamento e baixa coesao.

Além disso, alterações em uma funcionalidade podem afetar outras partes da classe.

A solução mais adequada é dividir as responsabilidades em **classes menores, com responsabilidades bem definidas**:

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

class BancoService:
    def salvar(self):
        pass
```

Essa divisão facilita a manutenção, pois pode-se alterar uma classe específica sem afetar as outras.

## 2.2. Herança excessiva

Evite hierarquias excessivamente profundas, pois elas tornam o **código difícil de compreender**.

Por exemplo, imagine:
```python
class Animal:
    pass

class Mamifero(Animal):
    pass

class Carnivoro(Mamifero):
    pass

class Felino(Carnivoro):
    pass

class Gato(Felino):
    pass
```

Para compreender completamente o comportamento de ``Gato``, talvez seja necessário analisar várias classes-pai.

Uma alternativa pode ser **utilizar composição e atributos**:
```python
class Animal:
    def __init__(self, especie, alimentacao):
        self.especie = especie
        self.alimentacao = alimentacao
```

O objetivo não é eliminar a herança, mas utilizá-la quando ela representar adequadamente uma relação de especialização.

## 2.3. Métodos gigantes

Evite métodos com centenas de linhas.

Um método deve:
- representar uma operação relativamente bem definida
- conter uma quantidade de linhas razoável
- ter complexidade gerenciável

Considere:
```python
class Sistema:
    def processar_pedido(self, pedido):
        # validar pedido
        # verificar estoque
        # calcular produtos
        # calcular desconto
        # calcular frete
        # gerar pagamento
        # salvar banco
        # enviar email
        # gerar relatório
        # ...
        pass
```

### 2.3.1. Problema
Esse método está realizando muitas operações diferentes, o que dificulta a manutenção e compreensão do código.

Isto é, para entender ``processar_pedido()``, o programador precisa analisar uma grande quantidade de código.

Além disso, **uma alteração em uma das etapas pode**:
- exigir modificar um método muito grande
- causar **erros em outras partes do código** (por exemplo, se a etapa de cálculo de desconto for alterada, pode afetar o cálculo do frete ou do pagamento, sem querer)

**Regra de Ouro:** Quando um método começa a fazer muitas coisas diferentes, se pergunte o seguinte:
> "Posso dividir essa operação em partes menores e mais bem definidas?"

### 2.3.2. Solução 01 (Refatorar em métodos menores)
A solução para esse problema é **dividir o método em métodos menores**, cada um com uma única responsabilidade.

Exemplo:
```python
class Sistema:
    def processar_pedido(self, pedido):
        self.validar_pedido(pedido)
        self.verificar_estoque(pedido)
        total = self.calcular_total(pedido)
        self.realizar_pagamento(total)
        self.salvar_pedido(pedido)
        self.enviar_confirmacao(pedido)

    def validar_pedido(self, pedido):
        pass

    def verificar_estoque(self, pedido):
        pass

    def calcular_total(self, pedido):
        pass

    def realizar_pagamento(self, total):
        pass

    def salvar_pedido(self, pedido):
        pass

    def enviar_confirmacao(self, pedido):
        pass
```

Agora ``processar_pedido()`` funciona como uma sequência de operações claramente identificáveis, e independentes umas das outras.

### 2.3.3. Solução 02 (Refatorar em classes menores)
Em vez de ter um único método grande, podemos criar **classes menores que representam diferentes responsabilidades**.

Exemplo:
```python
class Validador:
    def validar(self, pedido):
        pass

class Estoque:
    def verificar(self, pedido):
        pass

class Calculadora:
    def calcular(self, pedido):
        pass

class Pagamento:
    def realizar(self, total):
        pass

class Salvar:
    def salvar(self, pedido):
        pass

class Email:
    def enviar(self, pedido):
        pass
```

Agora ``processar_pedido()`` pode ser reescrito como:

```python
class Sistema:
    def __init__(self):
        self.validador = Validador()
        self.estoque = Estoque()
        self.calculadora = Calculadora()
        self.pagamento = Pagamento()
        self.salvar = Salvar()
        self.email = Email()

    def processar_pedido(self, pedido):
        self.validador.validar(pedido)
        self.estoque.verificar(pedido)
        total = self.calculadora.calcular(pedido)
        self.pagamento.realizar(total)
        self.salvar.salvar(pedido)
        self.email.enviar(pedido)
```

## 2.4. Condicionais excessivas

Código como:

```python
if tipo == "A":
    ...
elif tipo == "B":
    ...
elif tipo == "C":
    ...
elif tipo == "D":
    ...
elif tipo == "E":
    ...
```

pode ser um **sinal de que polimorfismo ou estratégias diferentes poderiam ser utilizados**.

Isso não significa que `if` seja ruim.

O problema é quando a estrutura cresce indefinidamente.

Exemplo:
```python
def calcular_desconto(tipo, valor):

    if tipo == "normal":
        return valor * 0.05

    elif tipo == "vip":
        return valor * 0.10

    elif tipo == "funcionario":
        return valor * 0.20
```

Se novos tipos forem adicionados, como ``estudante``, ``aposentado`` ou ``cliente_especial``, a função precisará ser modificada varias vezes.
- A cada modificação, o **risco de introduzir bugs aumenta**

### Solução 01: Polimorfismo

Podemos criar uma classe comum:
```python
class Desconto:
    def calcular(self, valor):
        raise NotImplementedError
```

E criar implementações diferentes (uma para cada tipo de desconto):

```python
class DescontoNormal(Desconto):
    def calcular(self, valor):
        return valor * 0.05

class DescontoVIP(Desconto):
    def calcular(self, valor):
        return valor * 0.10

class DescontoFuncionario(Desconto):
    def calcular(self, valor):
        return valor * 0.20
```

Depois:

```python
def calcular_preco_final(desconto, valor):
    return valor - desconto.calcular(valor)
```

Agora podemos fazer:
```python
valor = 1000
desconto = DescontoVIP()
print(calcular_preco_final(desconto, valor))
```

A função ``calcular_preco_final()`` não precisa saber qual classe concreta recebeu (``DescontoVIP``, ``DescontoNormal``, ou ``DescontoFuncionario``), pois seja qual for a classe, ela implementa o método ``calcular()`` que é comum a todas.
- Isto é, todas as classes de desconto **implementam a mesma interface** (definida pela classe-pai ``Desconto``).
- Logo, o código que usa essas classes não precisa saber qual delas está sendo usada.
- Assim, todas as classes de desconto são **polimórficas**, pois **podem ser usadas de forma intercambiável**.

Essa ideia serve de base para o padrão de projeto **Strategy** (que veremos mais a frente na disciplina).

## 2.5. Nomes sem semântica (sem significado)

Prefira **nomes que expressem intenção**.

Ruim:

```python
x = 10
y = 20
```

Melhor:

```python
quantidade = 10
preco = 20
```

Ruim:

```python
def calc(x, y):
    ...
```

Melhor:

```python
def calcular_total(preco, quantidade):
    ...
```

Um bom nome reduz a necessidade de comentários explicativos.

Os nomes devem indicar claramente:

- o que representa uma variável;
- o que representa uma função;
- o que representa um método;
- o que representa uma classe.

### 2.5.1. Convenções de nomenclatura

Convenções de nomenclatura são importantes para manter a consistência do código:
- **Classes**: usa-se *PascalCase*
  - **Exemplo**: `DescontoNormal`, `UsuarioService`, `Calculadora`
  - **Dicas**: 
    - classes abstratas podem ter o prefixo `Abstract` (ex: `AbstractMinhaClasse`)
    - interfaces podem ter sufixo `Interface` (ex: `DescontoInterface`)
- **Métodos e funções**: usa-se *snake_case* 
  - **Exemplo**: `calcular_total`, `enviar_email`, `processar_pedido`
- **Variáveis**: *snake_case* 
  - **Exemplo**: `quantidade`, `preco`, `usuario_logado`
- **Constantes**: *UPPER_CASE* 
  - **Exemplo**: `TAXA_DESCONTO`, `MAX_USUARIOS`, `URL_BASE`

## 2.6. Comentários óbvios

Comentários devem explicar principalmente **por que algo foi feito**, quando isso não for óbvio.

Comentário Ruim:
```python
# cria uma variável idade (comentario obvio)
idade = 20
```

Comentário Melhor:

```python
# A idade mínima para cadastro é 18 anos (comentario util)
idade = 20
```

**Comentários** são mais úteis quando **explicam uma decisão que não é evidente apenas pela leitura do código**.

## 2.7. Falta de tratamento de erros

Um código deve tratar erros de forma adequada, para que o usuário receba mensagens claras e compreensíveis.

Exemplo de código que não trata erros:

```python
def sacar(valor):
    self.saldo -= valor
```

Uma abordagem melhor seria:

```python
def sacar(self, valor):
    if valor <= 0:
        raise ValueError("O valor deve ser positivo")

    if valor > self.saldo:
        raise ValueError("Saldo insuficiente")

    self.saldo -= valor
```

Essa abordagem permite o uso de **Excecoes**, como **ValueError**, **RuntimeError** e outras, de forma explicita.
- **Excecoes** sao **objetos que indicam** ao Python **que houve um erro** no codigo ou na lógica
- Para gerar excecoes, voce precisa usar a palavra reservada `raise` seguida da construtor da excecao, que sempre recebe uma mensagem de erro na forma de ``string``

Exemplo:
```python
idade = 18
if idade <= 18:
    raise ValueError("Pessoa menor de idade")
```

**Excecoes devem ser capturadas e tratadas no código**, para que elas mostrem o erro de forma mais natural ao usuário. Para isso usamos os comandos ``try``/``except`` do Python:

Exemplo:
```python
idade = 18
# o codigo que vira dentro do try pode ter excecoes, por isso estamos
# sinalizando ao python com o try que iremos tratar elas
try:
    if idade <= 18:
        raise ValueError("Pessoa menor de idade")
# se acontecer uma excecao do tipo ValueError, trate no codigo abaixo
except ValueError as excecao:
    print("Houve um erro ao validar a idade do usuario")
    # excecao é um objeto do tipo ValueError, que contem a msg de erro da excecao
    print(excecao)
```

Existem varias classes de excecoes que podem ser usadas em um programa:
- **RuntimeError**: para indicar erros durante a execução;
- **ValueError**: para indicar valores inválidos;
- **TypeError**: para indicar operações envolvendo tipos inadequados;
- **Exception**: exceção genérica.

Sempre que possível, utilize uma exceção mais específica.

## 2.8. Ausencia de testes no código

Uma boa arquitetura facilita testes.

Por exemplo:

```python
class Calculadora:
    def somar(self, a, b):
        return a + b
```

Pode ser facilmente testada:

```python
calculadora = Calculadora()

assert calculadora.somar(2, 3) == 5
```

`assert` permite testar uma condicao logica:
- se a condicao for VERDADEIRA, tudo certo com o codigo
- se for FALSA, o Python levanta uma excecao da classe ``AssertionError``

Também podemos testar diferentes situações:

```python
calculadora = Calculadora()

assert calculadora.somar(2, 3) == 5
assert calculadora.somar(10, 20) == 30
assert calculadora.somar(-2, 2) == 0
```

**Lembre-se**:
> Quanto mais uma classe depende diretamente de componentes externos, mais difícil tende a ser testá-la.

Por isso, reduzir dependências e utilizar abstrações pode facilitar a criação de testes.

## 2.9. Duplicação de código

Quando a **mesma lógica aparece várias vezes** em diferentes partes do código, temos um sinal de que **é possivel melhorar a organização do código**.

Exemplo:
```python
total1 = preco1 * quantidade1
total2 = preco2 * quantidade2
total3 = preco3 * quantidade3
total4 = preco4 * quantidade4
```

Nesse exemplo, podemos centralizar a operação em uma função, para que a regra de cálculo seja mantida em apenas um lugar:

```python
def calcular_total(preco, quantidade):
    return preco * quantidade
```

Agora:

```python
total1 = calcular_total(preco1, quantidade1)
total2 = calcular_total(preco2, quantidade2)
total3 = calcular_total(preco3, quantidade3)
total4 = calcular_total(preco4, quantidade4)
```

A ideia é evitar que uma mesma regra precise ser corrigida em vários lugares.

Se quisermos podemos reduzir a duplicação de código ainda mais, utilizando **loops**:

```python
for preco, quantidade in [(preco1, quantidade1), (preco2, quantidade2), (preco3, quantidade3), (preco4, quantidade4)]:
    total = calcular_total(preco, quantidade)
```

**CUIDADO:** Nem toda repetição deve ser eliminada imediatamente.
> Uma abstração excessivamente complexa pode ser pior do que uma pequena repetição.

O objetivo é **eliminar duplicação relevante**, especialmente quando existe uma **mesma regra de negócio repetida**.

## 2.10. Evite "Valores Mágicos"

**Valores mágicos são valores literais** que aparecem no código **sem explicação**, dificultando a sua compreensão.

Exemplo:

```python
if idade >= 18:
    ...
```

O valor 18 pode ter um significado importante no sistema (idade mínima para votar, por exemplo). Mas da forma como está escrito, não é possível saber o que significa.

Podemos torná-lo mais explícito:

```python
IDADE_MINIMA = 18

if idade >= IDADE_MINIMA:
    ...
```

Outro exemplo:

Código Ruim:

```python
desconto = salario * 0.20
```

Melhor:

```python
PERCENTUAL_DESCONTO = 0.20
desconto = salario * PERCENTUAL_DESCONTO
```

Isso deixa mais evidente o significado dos valores utilizados. 
- Isso vale para números, strings, booleanos e quaisquer outros tipos de dados.

# Exercícios para fixação

## Exercício 1

Considere:

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

    def processar_pagamento(self):
        pass
```

Responda:
1. Identifique as diferentes responsabilidades da classe.
2. Explique por que essa classe nao esta adequada as diretrizes, boas praticas e princípios de softwares de qualidade, da forma que esta escrita.
3. Refatore a classe para corrigir as inadequações.
4. Explique por que a solução elaborada no item anterior é melhor.

## Exercício 2

Considere:

```python
class Pedido:
    def processar(self):
        print("Validando pedido")
        print("Verificando estoque")
        print("Calculando preço")
        print("Calculando desconto")
        print("Calculando frete")
        print("Processando pagamento")
        print("Salvando pedido")
        print("Enviando email")
        print("Gerando relatório")
```

Responda:

1. Refatore o método ``processar()``, considerando que:
   1. Cada operação deve ser implementada em um método separado.
   3. O método ``processar()`` deve apenas coordenar as operações.
2. Explique por que a solução elaborada no item anterior é melhor.
3. Refatore o método ``processar()`` novamente, considerando que:
   1. Cada operação deve ser implementada em uma classe separada.
   2. O método ``processar()`` deve apenas coordenar as operações.
4. Compare as duas soluções e explique qual delas é melhor e por que.

## Exercício 3 

Considere:
```python
def calcular_desconto(tipo, valor):

    if tipo == "normal":
        return valor * 0.05

    elif tipo == "vip":
        return valor * 0.10

    elif tipo == "funcionario":
        return valor * 0.20

    elif tipo == "estudante":
        return valor * 0.15
```
Responda:
1. Explique qual problema essa implementação apresenta.
2. Refatore utilizando polimorfismo, considerando:
   1. Crie uma classe abstrata.
   2. Crie classes concretas para cada tipo de desconto.
   3. Crie uma função para fazer o calculo do desconto, recebendo um objeto de desconto.

## Exercício 4

Crie uma classe ``Conta`` contendo os seguintes atributos e métodos:
- ``saldo``
- ``depositar()``
- ``sacar()``

Utilize exceções para impedir:
- depósito negativo;
- saque negativo;
- saque maior que o saldo.

Utilize ``try``/``except`` para tratar os erros no programa principal.

## Exercício 5

Implemente a classe (atributos e metodos) abaixo:

```python
class Calculadora:
    def somar(self, a, b):
        ...

    def subtrair(self, a, b):
        ...

    def multiplicar(self, a, b):
        ...

    def dividir(self, a, b):
        ...
```

Crie testes utilizando ``assert``.

Teste:
- somar()
- subtrair()
- multiplicar()
- dividir()

Teste exemplos de situações válidas e inválidas para cada método.
- Considere que a divisão por zero é inválida e deve ser tratada com exceção.
- Utilize ``try``/``except`` para tratar as exceções nos testes.
- Utilize ``assert`` para verificar os resultados dos testes.
- Considere que strings ou outros tipos de dados não numéricos são inválidos para as  operacoes matemáticas acima e devem ser tratados com exceções.

## Exercício 6

Analise o código abaixo:
```python
class Sistema:
    def processar(self, t, x):
        if t == "A":
            y = x * 0.05

        elif t == "B":
            y = x * 0.10

        elif t == "C":
            y = x * 0.20

        if x > 1000:
            print("cliente especial")

        banco = MySQL()
        banco.salvar()

        print("email enviado")

        if x > 500:
            print("relatorio")

        return y
```

Identifique **pelo menos** 5 problemas de qualidade nesse código.
- Para cada problema, informe:

Problema:
________________________

Por que é um problema:
________________________

Como poderia ser melhorado:
________________________

## Exercício 7

Explique, com suas próprias palavras, a seguinte afirmação:

> "Código que funciona não é necessariamente código de boa qualidade."

Na resposta, explique por que um programa pode produzir o resultado correto e, ainda assim, ser difícil de:
- compreender;
- testar;
- modificar;
- reutilizar;
- corrigir;
- manter.

Relacione sua resposta aos conceitos de:
- responsabilidade
- coesão
- acoplamento
- abstração
- encapsulamento
- polimorfismo
- tratamento de erros
- testabilidade