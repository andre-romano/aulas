
# Modulo 6 - Diretrizes e Boas Praticas de Desenvolvimento de Software - PARTE 2

**Sumário** 
- [Modulo 6 - Diretrizes e Boas Praticas de Desenvolvimento de Software - PARTE 2](#modulo-6---diretrizes-e-boas-praticas-de-desenvolvimento-de-software---parte-2)
  - [2.7. Falta de tratamento de erros](#27-falta-de-tratamento-de-erros)
  - [2.8. Ausencia de testes no código](#28-ausencia-de-testes-no-código)
  - [2.9. Duplicação de código](#29-duplicação-de-código)
  - [2.10. Evite "Valores Mágicos"](#210-evite-valores-mágicos)
  - [2.11. Tipagem de variáveis (type hints)](#211-tipagem-de-variáveis-type-hints)
    - [2.11.1. Configurando VSCode para detectar type hints](#2111-configurando-vscode-para-detectar-type-hints)
  - [2.12. Nunca retornar variaveis mutáveis (listas, dicionarios, sets, etc) diretamente](#212-nunca-retornar-variaveis-mutáveis-listas-dicionarios-sets-etc-diretamente)
- [Exercícios para fixação](#exercícios-para-fixação)
  - [Exercício 1](#exercício-1)
    - [Exercício 1-A](#exercício-1-a)
    - [Exercício 1-B](#exercício-1-b)
  - [Exercício 2](#exercício-2)
    - [Exercício 2-A](#exercício-2-a)
    - [Exercício 2-B](#exercício-2-b)
  - [Exercício 3](#exercício-3)
    - [Exercício 3-A](#exercício-3-a)
    - [Exercício 3-B](#exercício-3-b)

## 2.7. Falta de tratamento de erros

Um código deve tratar erros de forma adequada, para que o usuário receba mensagens claras e compreensíveis.

Exemplo de código que não trata erros:

```python
def sacar(valor):
    # valor negativo ou zero não deveria ser permitido, 
    # mas o código abaixo não verifica isso
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
- Quando uma excecao é gerada, o Python **interrompe a execução do código** e **mostra o erro** na tela.
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

**Exercicios de Fixacao**:
- [Exercício 1-A](#exercício-1-a)

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

**Exercicios de Fixacao**: 
- [Exercício 1-B](#exercício-1-b)

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

total1 = calcular_total(preco1, quantidade1)
total2 = calcular_total(preco2, quantidade2)
total3 = calcular_total(preco3, quantidade3)
total4 = calcular_total(preco4, quantidade4)
```

A ideia é evitar que uma mesma regra precise ser corrigida em vários lugares.

Se quisermos podemos reduzir a duplicação de código ainda mais, utilizando **loops**:

```python
dados = [
    (preco1, quantidade1), (preco2, quantidade2),
    (preco3, quantidade3), (preco4, quantidade4),
]
for preco, quantidade in dados:
    total = calcular_total(preco, quantidade)
```

**CUIDADO:** Nem toda repetição deve ser eliminada imediatamente.
> Uma abstração excessivamente complexa pode ser pior do que uma pequena repetição.

O objetivo é **eliminar duplicação relevante**, especialmente quando existe uma **mesma regra de negócio repetida**.

**Exercicios de Fixacao**: 
- [Exercício 2-A](#exercício-2-a)

## 2.10. Evite "Valores Mágicos"

**Valores mágicos são valores literais** que aparecem no código **sem explicação**, dificultando a sua compreensão.

Exemplo:

```python
if idade >= 18:
    ...
```

O valor ``18`` pode ter um significado importante no sistema (idade mínima para votar, por exemplo). Mas **da forma como está escrito, não é possível saber o que significa**.

Podemos torná-lo mais explícito:

```python
IDADE_MINIMA = 18

if idade >= IDADE_MINIMA:
    ...
```

Outro exemplo:

```python
# código ruim
desconto = salario * 0.20

# código melhor
PERCENTUAL_DESCONTO = 0.20
desconto = salario * PERCENTUAL_DESCONTO
```

Isso deixa mais evidente o significado dos valores utilizados. 
- Isso vale para números, strings, booleanos e quaisquer outros tipos de dados.

**Exercicios de Fixacao**: 
- [Exercício 2-B](#exercício-2-b)

## 2.11. Tipagem de variáveis (type hints)

*Type hints* (dicas de tipo) indicam, de forma explícita, **quais tipos de dados uma variável, parâmetro ou retorno de função devem assumir**. 

O Python **não obriga o cumprimento desses tipos** em tempo de execução (isto é, eles não são validados automaticamente) mas trazem benefícios importantes:
- deixam a **intenção do código mais clara**, sem precisar ler a implementação inteira;
- **permitem que o editor de código (IDE) ofereça autocompletar mais preciso e sinalize erros** antes mesmo de rodar o programa;
- **permitem o uso de ferramentas de verificação estática**, como o `mypy`, que detectam incompatibilidades de tipo durante o desenvolvimento.

Ruim (sem type hints):
```python
def calcular_total(preco, quantidade):
    return preco * quantidade
```

Só de olhar a assinatura, não é possível saber se `preco` deve ser `int`, `float`, ou mesmo uma `string`. Assim, um erro no uso da funcao só apareceria em tempo de execução (quando a funcao for executada).

Melhor (com type hints):
```python
def calcular_total(preco: float, quantidade: int) -> float:
    return preco * quantidade
```
Agora a assinatura já documenta, por si só, os tipos esperados e o tipo retornado. Note que:
- a sintaxe é `variavel: tipo` para parâmetros e `-> tipo` para o retorno da função;
- **Ex**: `preco: float` indica que a variável `preco` deve ser do tipo `float`; `quantidade: int` indica que a variável `quantidade` deve ser do tipo `int`; `-> float` indica que a função retorna um valor do tipo `float`.

**NOTA**: Quando nao informamos o tipo de retorno, o Python assume que a função retorna `None` (ou seja, não retorna nada):
```python
# imprime uma mensagem na tela, não retorna nada (retorna None)
def imprimir_mensagem(mensagem: str):
    print(mensagem)

res = imprimir_mensagem("Olá")
print(res)  # None
```

Também podemos tipar atributos de classes:
```python
class Produto:
    def __init__(self, nome: str, preco: float, estoque: int) -> None:
        self.__nome = nome
        self.__preco = preco
        self.__estoque = estoque
```

Podemos **tipar atributos ou parametros com qualquer tipo de dado**, incluindo tipos definidos pelo usuário e classes (ex: `Produto`, `CarrinhoCompras`, etc):
```python
class CarrinhoCompras:
    def __init__(self):
        # atributo privado que guarda os produtos do carrinho
        # (lista de objetos do tipo Produto)
        self.__itens: list[Produto] = []
    
    def adicionar_produto(self, produto: Produto):
        self.__itens.append(produto)
```

Quando queremos informar que um atributo, retorno de funcao ou parametro pode ser vazio (``None``), usamos o `|` seguido do tipo `None`:

```python
class CatalogoProdutos:
    def __init__(self):
        self.__produtos: list[Produto] = []

    # aqui estamos buscando um produto pelo seu nome, que é uma string
    # se o produto for encontrado, retornamos um objeto do tipo Produto
    # se não for encontrado, retornamos None
    def buscar_produto(self, nome: str) -> Produto | None:
        for produto in self.__produtos:
            if produto.nome == nome:
                return produto # retorna um objeto do tipo Produto
        return None # retorna None (se não encontramos o produto)
```

Tambem podemos usar `|` para indicar que um **parâmetro pode receber mais de um tipo** de dado:

```python
# somar dois numeros, que podem ser inteiros ou decimais
# o resultado tambem pode ser inteiro ou decimal
def somar(a: int | float, b: int | float) -> int | float:
    return a + b
```

**Importante:** type hints **não têm efeito nenhum durante a execução** do programa, o Python não impede você de passar um `str` onde o *hint* diz `int`. 
- Eles funcionam como documentação do código e como dicas para ferramentas externas (IDE, `mypy`), para ajudar no desenvolvimento e identificacao de erros, e não como validação em tempo de execução.
Exemplo:
```python
def somar(a: int, b: int) -> int:
    return a + b

# isso vai funcionar, mesmo que o type hint diga
# que a e b devem ser int
res = somar("2", "3")  
# mostra 23 (e nao 5, como seria esperado se 
# a e b fossem numeros inteiros)
print(res)  
```

### 2.11.1. Configurando VSCode para detectar type hints

Para configurar o VSCode para detectar e exibir warnings relacionados a type hints, siga os passos abaixo:
1. Abra o VSCode e pressione o comando `CTRL + ,` para abrir as configurações.
2. No campo de pesquisa, digite:
   1. ``Python › Analysis: Diagnostic Mode`` e selecione a opção `workspace`
   2. ``Python › Analysis: Type Checking Mode`` e selecione a opção `standard`

**Exercicios de Fixacao**: 
- [Exercício 3-A](#exercício-3-a)

## 2.12. Nunca retornar variaveis mutáveis (listas, dicionarios, sets, etc) diretamente

Quando um método retorna diretamente uma referência para um atributo mutável (lista, dicionário, set, etc.), quem recebe esse retorno passa a poder **alterar o estado interno do objeto sem passar por nenhum método da classe** (quebrando o encapsulamento).

Código ruim:
```python
class Turma:
    def __init__(self):
        self._alunos: list[str] = []

    def matricular(self, aluno: str):
        self._alunos.append(aluno)

    def get_alunos(self) -> list[str]:
        return self._alunos  # retorna a referência real da lista interna

turma = Turma()
turma.matricular("Ana")

alunos = turma.get_alunos()
alunos.append("Bruno")  # alterou o estado interno da Turma sem passar por matricular()!

# ['Ana', 'Bruno'] -- Bruno "entrou" sem qualquer validação do metodo matricular()
print(turma.get_alunos())  
```

O código externo conseguiu alterar `_alunos` diretamente, contornando qualquer regra que `matricular()` pudesse aplicar (ex: limite de vagas, verificação de duplicidade).

Código correto:
```python
class Turma:
    def __init__(self):
        self._alunos: list[str] = []

    def matricular(self, aluno: str):
        self._alunos.append(aluno)

    def get_alunos(self) -> list[str]:
        return list(self._alunos)  # retorna uma cópia da lista

turma = Turma()
turma.matricular("Ana")

alunos = turma.get_alunos()
alunos.append("Bruno")  # altera apenas a cópia crida por get_alunos(), não a lista interna da Turma

print(turma.get_alunos())  # ['Ana'] -- Turma não foi afetada
```

A mesma lógica se aplica a dicionários (`dict(self._dados)`) e a sets (`set(self._itens)`). 
- O princípio geral é: **um objeto só deve ser alterado através dos métodos que a própria classe expõe** para essa finalidade, **nunca por acesso direto** a uma estrutura interna retornada.

**Exercicios de Fixacao**: 
- [Exercício 3-B](#exercício-3-b)

# Exercícios para fixação

## Exercício 1

Seja o código:
```python
class ContaCorrente:
    def __init__(self, saldo):
        self.saldo = saldo

    def transferir(self, valor, conta_destino):
        self.saldo -= valor
        conta_destino.saldo += valor
```

### Exercício 1-A

Responda:
1. Identifique pelo menos duas situações de entrada inválida que esse método não trata.
2. Explique o que pode acontecer em cada uma das situacoes identificadas.
3. Reescreva `__init__()` e `transferir()` para validar as situações identificadas no item anterior, utilizando `raise` com exceções apropriadas (ex: `ValueError`) e mensagens claras.

### Exercício 1-B

Considerando o código do exercicio, responda:
1. Escreva, usando `assert` ([seção 2.8](#28-ausencia-de-testes-no-código)), pelo menos 3 casos de teste para o método `transferir()` já corrigido: 1 caso de sucesso , 2 casos que devem lançar exceção.    

## Exercício 2

Seja:
```python
class CalculadoraImposto:
    def calcular_imposto_produto_a(self, valor):
        return valor * 0.15 + 2.50

    def calcular_imposto_produto_b(self, valor):
        return valor * 0.15 + 2.50

    def calcular_imposto_produto_c(self, valor):
        return valor * 0.22 + 2.50
```

### Exercício 2-A
Responda:
1. Aponte: 
   1. onde há duplicação de código relevante;
   2. onde há valores mágicos, e o que cada um provavelmente representa.
2. Reescreva `CalculadoraImposto` eliminando a duplicação (usando um único método parametrizado) 

### Exercício 2-B
Considerando o código do exercício, responda:
1. Modifique a classe `CalculadoraImposto` do exercício anterior, substituindo os valores mágicos por constantes (ex: `TAXA_BASE`, `ALIQUOTA_PADRAO`, `ALIQUOTA_PRODUTO_C`).

## Exercício 3

Seja:
```python
class CarrinhoCompras:
    def __init__(self):
        self._itens = []

    def adicionar(self, item, preco):
        self._itens.append((item, preco))

    def get_itens(self):
        return self._itens

    def calcular_total(self):
        total = 0
        for item, preco in self._itens:
            total += preco
        return total
```

### Exercício 3-A
Responda:
1. Identifique: 
   1. quais metodos nao tem *type hints* em suas assinaturas;    
2. Reescreva `CarrinhoCompras`, fazendo o seguinte:
   1. adicionando *type hints* em todos os parâmetros e retornos (use `list[tuple[str, float]]` para representar a lista de itens)   

### Exercício 3-B
Responda:
1. Identifique: 
   1. a violação do retorno de variaveis mutáveis presente no método `get_itens()`; 
   2. um cenário concreto em que código externo poderia corromper o estado do `CarrinhoCompras` explorando o problema da violacao de retorno de variaveis mutáveis.
2. Reescreva `get_itens()` para não expor a lista interna diretamente (retornando uma cópia da lista).