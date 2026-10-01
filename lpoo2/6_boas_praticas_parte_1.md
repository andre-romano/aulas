
# Modulo 6 - Diretrizes e Boas Praticas de Desenvolvimento de Software - PARTE 1

**Sumário** 
- [Modulo 6 - Diretrizes e Boas Praticas de Desenvolvimento de Software - PARTE 1](#modulo-6---diretrizes-e-boas-praticas-de-desenvolvimento-de-software---parte-1)
- [1. O que é uma boa classe?](#1-o-que-é-uma-boa-classe)
- [2. O que evitar](#2-o-que-evitar)
  - [2.1. Classe "Deus"](#21-classe-deus)
  - [2.2. Herança excessiva](#22-herança-excessiva)
  - [2.3. Métodos gigantes](#23-métodos-gigantes)
    - [2.3.1. Solução 01 (Refatorar em métodos menores)](#231-solução-01-refatorar-em-métodos-menores)
    - [2.3.2. Solução 02 (Refatorar em classes menores)](#232-solução-02-refatorar-em-classes-menores)
  - [2.4. Condicionais excessivas](#24-condicionais-excessivas)
  - [2.5. Nomes sem semântica (sem significado)](#25-nomes-sem-semântica-sem-significado)
    - [2.5.1. Convenções de nomenclatura](#251-convenções-de-nomenclatura)
  - [2.6. Comentários óbvios](#26-comentários-óbvios)
  - [Exercício 1](#exercício-1)
    - [Exercício 1-A](#exercício-1-a)
    - [Exercício 1-B](#exercício-1-b)
  - [Exercício 2](#exercício-2)
  - [Exercício 3](#exercício-3)
  - [Exercício 4](#exercício-4)

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

**Exercicios de Fixacao**: 
- [Exercício 1-A](#exercício-1a)

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

**Exercicios de Fixacao**: 
- [Exercício 1-B](#exercício-1b)

## 2.3. Métodos gigantes

Evite métodos com centenas de linhas.

Um método deve:
- representar uma operação relativamente bem definida
- conter uma quantidade de linhas razoável
  - **DICA**: se um método tiver mais de linhas do que voce consegue ou ver com facilidade na sua tela, provavelmente ele está grande demais
- ter complexidade gerenciável
  - **DICA**: se voce precisa de um diagrama para entender o que o método faz, provavelmente ele está complexo demais

**Problema** - Considere o seguinte método, que processa um pedido de compra:
  
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

O método `processar_pedido()` está realizando muitas operações diferentes, o que dificulta a manutenção e compreensão do código.
- Isto é, para entender ``processar_pedido()``, o programador precisa analisar uma grande quantidade de código.

Além disso, **uma alteração em uma das etapas pode**:
- exigir modificar um método muito grande
- causar **erros em outras partes do código** (por exemplo, se a etapa de cálculo de desconto for alterada, pode afetar o cálculo do frete ou do pagamento, sem querer)

**Regra de Ouro:** Quando um método começa a fazer muitas coisas diferentes, se pergunte o seguinte:
> "Posso dividir essa operação em partes menores e mais bem definidas?"

### 2.3.1. Solução 01 (Refatorar em métodos menores)
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

### 2.3.2. Solução 02 (Refatorar em classes menores)
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

**Exercicios de Fixacao - Métodos gigantes**: 
- [Exercício 2](#exercício-2)

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
- Isso não significa que `if` seja ruim.

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

**Solução**: 

Podemos criar uma classe abstrata `Desconto`, para servir de interface. E, em seguida, criar implementações diferentes (uma para cada tipo de desconto):

```python
from abc import ABC, abstractmethod

class Desconto(ABC):
    @abstractmethod
    def calcular(self, valor):
        pass

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

Agora podemos usar essas classes e funcoes da seguinte forma:
```python
valor = 1000
desconto = DescontoVIP() # podemos trocar pra qualquer objeto desconto
preco_final = valor - desconto.calcular(valor)
print(preco_final)
```

O calculo de ``preco_final`` não precisa saber qual classe concreta ele esta usando (``DescontoVIP``, ``DescontoNormal``, ou ``DescontoFuncionario``), pois seja qual for a classe, ela implementa o método ``calcular(valor)`` que é comum a todas.
- Isto é, todas as classes de desconto **implementam a mesma interface** (definida pela classe-pai ``Desconto``).
- Assim, todas as classes de desconto são **polimórficas**, pois **podem ser usadas de forma intercambiável**.

Essa ideia é exatamente o que o padrão de projeto **Strategy** sugere (como veremos mais a frente na disciplina).

**Exercicios de Fixacao**: 
- [Exercício 3](#exercício-3)

## 2.5. Nomes sem semântica (sem significado)

Prefira **nomes que expressem intenção**.

```python
# codigo ruim
x = 10
y = 20

def calc(x, y):
    ...

# codigo melhor
quantidade = 10
preco = 20

def calcular_total(preco, quantidade):
    ...
```

Um **bom nome reduz a necessidade de comentários** explicativos, indicando claramente:
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

**Exercicios de Fixacao**: 
- [Exercício 4](#exercício-4)

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

**Comentários** são mais úteis quando **explicam uma decisão que não está clara** apenas pela leitura do código.

**Exercicios de Fixacao**: 
- [Exercício 4](#exercício-4)

## Exercício 1

### Exercício 1-A

Analise a classe abaixo, extraída de um sistema de gerenciamento de uma biblioteca.

```python
class Biblioteca:
    def cadastrar_livro(self, titulo, autor):
        pass

    def cadastrar_usuario(self, nome, cpf):
        pass

    def realizar_emprestimo(self, usuario, livro):
        pass

    def calcular_multa_atraso(self, dias_atraso):
        pass

    def enviar_email_lembrete(self, usuario):
        pass

    def gerar_relatorio_mensal(self):
        pass

    def salvar_no_banco(self, dados):
        pass
```

**Responda:**
1. Aponte porque ter muitas responsabilidades misturadas nessa classe pode ser um problema.
2. Reescreva o sistema acima dividindo-o em classes menores, cada uma com uma única responsabilidade (ex: `CatalogoService`, `UsuarioService`, `EmprestimoService`, `MultaService`, `NotificacaoService`, `RelatorioService`, `RepositorioService`). Não é necessário implementar a lógica interna dos métodos, apenas a estrutura das classes e a assinatura de cada método.

**DICA**:
- **Assinatura** é o nome do método e seus parâmetros (atributos que sao passados como argumentos).
  - **Ex**: `def cadastrar_livro(self, titulo, autor):` é a assinatura do método `cadastrar_livro`.

### Exercício 1-B

Considere a hierarquia abaixo, também de um sistema de biblioteca:

```python
class Item:
    pass

class ItemFisico(Item):
    pass

class ItemEmprestavel(ItemFisico):
    pass

class Publicacao(ItemEmprestavel):
    pass

class Livro(Publicacao):
    pass

class LivroRaro(Livro):
    pass
```

**Responda:**
1. Para saber tudo o que uma instância de `LivroRaro` pode fazer, quantas classes é preciso ler?
2. Reescreva essa hierarquia utilizando **composição**, mantendo apenas os níveis de herança que realmente representam uma relação de especialização relevante para o domínio.

**DICA**: **Domínio** é o conjunto de conhecimentos e regras específicas de um determinado campo de atuação.
- **Ex**: No domínio de uma biblioteca, as regras incluem: catalogar livros, empréstar livros, calcular multas, etc. 
- A **implementacao** dessas regras (ex: herança vs composição) **não faz parte do domínio**.

## Exercício 2

Analise o método abaixo, que pertence a um sistema de matrícula escolar. Considere que:
- `aluno` é um dicionário com informações do aluno (ex: `{"nome": "João", "cpf": "123.456.789-00", "bolsista": True}`);  
  - ``aluno.get("nome")`` retorna o valor associado à chave ``"nome"`` (no exemplo acima, ele retorna ``"João"``). 
  - Caso a chave não exista (`aluno.get("rg")`), ele retorna `None`.
  - `aluno["nome"]` também acessa o valor associado à chave ``"nome"`` (no exemplo acima, ele retorna ``"João"``). Porem , se a chave nao existir (`aluno["rg"]`), ele gera um erro no Python, do tipo `KeyError`.
- `curso` é um dicionário com informações do curso (ex: `{"nome": "Matemática", "vagas_totais": 30, "vagas_ocupadas": 25, "valor_base": 1000}`).
  - Como ``curso`` tambem é um dicionario, ele tambem tem o metodo `.get()` e o operador `[]`. 
  - No exemplo acima, `curso.get("nome")` retorna ``"Matemática"``. E ``curso["nome"]`` também retorna ``"Matemática"``. 

```python
class Secretaria:
    def matricular_aluno(self, aluno, curso):
        # validar dados do aluno
        if not aluno.get("nome") or not aluno.get("cpf"):
            raise ValueError("Dados incompletos")
        # verificar vagas disponiveis
        if curso["vagas_ocupadas"] >= curso["vagas_totais"]:
            raise ValueError("Sem vagas")
        # calcular valor da mensalidade com desconto
        valor = curso["valor_base"]
        if aluno.get("bolsista"):
            valor = valor * 0.5
        # gerar boleto
        boleto = {"aluno": aluno["nome"], "valor": valor}
        # salvar matricula (simulado)
        matriculas = []
        matriculas.append({"aluno": aluno, "curso": curso})
        # enviar email de confirmacao
        print(f"Email enviado para {aluno['nome']}")
        return boleto
```

**Responda:**
1. Identifique todas as responsabilidades distintas que o metodo acima está executando.
2. Reescreva `matricular_aluno` dividindo-o em métodos menores (ex: `validar_aluno`, `verificar_vagas`, `calcular_mensalidade`, `gerar_boleto`, `salvar_matricula`, `enviar_confirmacao`), seguindo a [Solução 01 da seção 2.3](#231-solução-01-refatorar-em-métodos-menores). 
3. Em seguida, responda se essa refatoração, sozinha, já resolve o problema da classe `Secretaria` acumular muitas responsabilidades diferentes (*Classe "Deus"*), ou apenas organiza os métodos por dentro? Justifique.
4. Qual das duas soluções apresentadas na seção 2.3 (métodos menores vs. classes menores) você aplicaria nesse caso? Há alguma vantagem em aplicar as duas em conjunto? Refatore a classe `Secretaria` utilizando a solução que você considera mais adequada, justificando sua escolha.

## Exercício 3

Seja o codigo abaixo:

```python
def calcular_frete(tipo_envio, peso):
    if tipo_envio == "normal":
        return peso * 2.0
    elif tipo_envio == "expresso":
        return peso * 5.0
    elif tipo_envio == "internacional":
        return peso * 12.0
    elif tipo_envio == "retirada":
        return 0.0
```

Responda:
1. Explique por que esse código tende a se tornar um problema de manutenção à medida que a loja passa a oferecer novos tipos de envio.
2. Reescreva o cálculo de frete utilizando **polimorfismo**. Para isso, crie uma classe abstrata `Frete` e uma subclasse para cada tipo de envio, cada uma implementando seu próprio método `calcular(peso)`.

## Exercício 4

Seja o código abaixo:

```python
class C:
    def __init__(self, n, v, e):
        self.n = n  # nome
        self.v = v  # variavel v
        self.e = e

    def calc(self, q):
        # multiplica v por q
        r = self.v * q
        # retorna r
        return r
```

Responda:
1. É possivel entender o que a classe representa apenas lendo o código? Justifique.
2. Aponte todos os problemas de nomenclatura e de comentários presentes nesse trecho.
3. Reescreva a classe acima assumindo que:
   - a classe ``C`` representa um `Produto` de uma loja, com ``nome``, ``valor_unitario`` e ``estoque``. 
   - `calc(quantidade)` calcula o valor total para uma dada ``quantidade``. 
   - Use nomes com significado e aplique as convenções de nomenclatura (``PascalCase`` para a classe, ``snake_case`` para atributos e métodos). 
   - Remova comentários óbvios, mantendo apenas os que expliquem decisões não evidentes, se houver.
4. Depois da refatoração, ainda restou algum comentário no código? Se sim, ele explica *o quê* o código faz ou *por que* ele foi feito daquela forma? Quais deste comentários você considera útil e quais você considera desnecessário? Justifique.
