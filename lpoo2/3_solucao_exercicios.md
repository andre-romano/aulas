# Solucao dos Exercicios - Módulo 3 (Classes Abstratas, Composição e Conceitos avançados)

**Sumário**:
- [Solucao dos Exercicios - Módulo 3 (Classes Abstratas, Composição e Conceitos avançados)](#solucao-dos-exercicios---módulo-3-classes-abstratas-composição-e-conceitos-avançados)
  - [Exercicio 1](#exercicio-1)
  - [Exercício 2](#exercício-2)
  - [Exercício 3](#exercício-3)
  - [Exercício 4](#exercício-4)
    - [Exercício 4-A](#exercício-4-a)
    - [Exercício 4-B](#exercício-4-b)
    - [Exercício 4-C](#exercício-4-c)
  - [Exercício 5](#exercício-5)
  - [Exercício 6](#exercício-6)
  - [Exercício 7](#exercício-7)
  - [Exercício 8](#exercício-8)
    - [Exercício 8-A](#exercício-8-a)
    - [Exercício 8-B](#exercício-8-b)
    - [Exercício 8-C](#exercício-8-c)
  - [Estudo de caso 1](#estudo-de-caso-1)
  - [Estudo de caso 2](#estudo-de-caso-2)
  - [Estudo de caso 3](#estudo-de-caso-3)

## Exercicio 1

```python
from abc import ABC, abstractmethod

class FormaGeometrica(ABC):
    @abstractmethod
    def calcular_area(self):
        pass


class Retangulo(FormaGeometrica):
    def __init__(self, base, altura):
        self.__base = base
        self.__altura = altura

    def calcular_area(self):
        return self.__base * self.__altura


class Circulo(FormaGeometrica):
    def __init__(self, raio):
        self.__raio = raio

    def calcular_area(self):
        return 3.14159 * self.__raio ** 2

class Triangulo(FormaGeometrica):
    pass

retangulo = Retangulo(4, 5)
circulo = Circulo(3)

print(retangulo.calcular_area())
print(circulo.calcular_area())

# tentando instanciar a classe abstrata diretamente:
# (descomente o codigo abaixo para testa-lo)
# forma = FormaGeometrica()

# Tente instanciar ``FormaGeometrica`` diretamente e descreva o que aconteceu.
# (descomente o codigo abaixo para testa-lo)
# triangulo = Triangulo()
```

**O que acontece ao tentar `FormaGeometrica()`:** o Python lança `TypeError: Can't instantiate abstract class FormaGeometrica with abstract method calcular_area`. 
- Isso ocorre porque a classe possui um método marcado com `@abstractmethod` sem implementação (``calcular_area()``).
- O Python impede a criação de objetos até que uma subclasse concreta o implemente.

**O que acontece ao tentar `Triangulo()`:** o mesmo erro ocorre. Como `Triangulo` herda de `FormaGeometrica` mas não sobrescreve `calcular_area()`, ela continua "carregando" o método abstrato sem implementação.
- Ou seja, `Triangulo` também é, na prática, uma classe abstrata, mesmo sem ter sido declarada explicitamente com `ABC`. 
- `Triangulo` só se torna concreta quando implementarmos todos os metodos abstratos  (neste caso, teríamos que implementar apenas `calcular_area()`).

## Exercício 2

```python
class Medico:
    def __init__(self, nome):
        self.__nome = nome

    def to_string(self):
        return self.__nome

class Consulta:
    def __init__(self, medico, paciente):
        self.__medico = medico
        self.__paciente = paciente

    def get_medico(self):
        return self.__medico

    def get_paciente(self):
        return self.__paciente

    def to_string(self):
        return f"Consulta com {self.__medico.to_string()} para {self.__paciente}"

medico1 = Medico("Dr. Ricardo")
consulta = Consulta(medico1, "Sr. Ari")

print(consulta.to_string())

consulta = None
print(medico1.to_string())

# descomente o codigo abaixo para ver que consulta já nao existe mais (o codigo deve dar erro)
# print(consulta.get_paciente())
```

**Resultado**: 
```text
Dr. Ricardo
```

Isso mostra que `medico1` foi criado **fora** do construtor de `Consulta` (e apenas recebido como parâmetro).
- Por isso, ``medico1`` continua existindo normalmente mesmo depois que `consulta` deixa de existir (``consulta = None``).
- Isto é um exemplo de **associação**.

## Exercício 3

```python
class Livro:
    def __init__(self, titulo):
        self.__titulo = titulo

    def to_string(self):
        return self.__titulo

class Biblioteca:
    def __init__(self):
        self.__livros = []

    def adicionar_livro(self, livro):
        self.__livros.append(livro)

    def to_string(self):
        res = "A biblioteca tem os seguintes livros:\n"
        for livro in self.__livros:
            res += livro.to_string() + "\n"
        return res


livro1 = Livro("Dom Casmurro")
livro2 = Livro("Iracema")

biblioteca = Biblioteca()
biblioteca.adicionar_livro(livro1)
biblioteca.adicionar_livro(livro2)

print(biblioteca.to_string())

biblioteca = None

print("Ja nao ha mais biblioteca, mas os livros ainda existem:")
print(livro1.to_string())
print(livro2.to_string())
```

Resultado:
```text
A biblioteca tem os seguintes livros:
Dom Casmurro
Iracema

Ja nao ha mais biblioteca, mas os livros ainda existem:
Dom Casmurro
Iracema
```

**Por que é agregação:** os objetos `Livro` são criados fora do construtor de `Biblioteca` e apenas adicionados a uma lista interna via `adicionar_livro()`. 
- `Biblioteca` não controla o ciclo de vida dos livros. Ela só guarda referências a objetos que já existiam antes.
- Se `Biblioteca` deixar de existir, os livros continuam existindo normalmente (veja a parte final do codigo de solucao).
- Se fosse **composição**, os livros seriam criados dentro do construtor de `Biblioteca` e deixariam de existir junto com ela.

## Exercício 4 

### Exercício 4-A

```python
class Processador:
    def processar(self):
        print("Processando dados")


class MemoriaRAM:
    def armazenar(self):
        print("Armazenando dados na memória")

    def ler(self):
        print("Lendo dados da memória")


class Computador:
    def __init__(self):
        self.processador = Processador()
        self.memoria = MemoriaRAM()

    def ligar(self):
        self.memoria.ler()
        self.processador.processar()

    def salvar_dados(self):
        self.memoria.armazenar()


computador = Computador()
computador.ligar()
# saida:
# Lendo dados da memória
# Processando dados

computador.salvar_dados()
# saida:
# Armazenando dados na memória

# podemos acessar processador e memoria diretamente, pois sao atributos publicos de Computador
computador.processador.processar()
computador.memoria.armazenar()

# ao destruirmos computador
computador = None

# perdemos o acesso ao processador ou memoria (pois foram criados dentro de Computador) 
# (descomente o codigo abaixo pra testar)
# computador.processador.processar()  
```

O exemplo acima mostra a **composição**: `Computador` cria internamente os objetos `Processador` e `MemoriaRAM`, e controla o ciclo de vida deles.
- Quando computador deixa de existir, `self.processador` e `self.memoria` também deixam de existir.

### Exercício 4-B

```python
class ProcessadorIntel:
    def processar(self):
        print("Processador Intel processando")

class ProcessadorAMD:
    def processar(self):
        print("Processador AMD processando")

class MemoriaRAM:
    def ler(self):
        print("Lendo dados da memória")

    def armazenar(self):
        print("Armazenando dados na memória")

class Computador:
    def __init__(self):
        self.processador = ProcessadorIntel()  # troque para ProcessadorAMD() para mudar o comportamento
        self.memoria = MemoriaRAM()

    def ligar(self):
        self.memoria.ler()
        self.processador.processar()

    def salvar_dados(self):
        self.memoria.armazenar()


computador = Computador()
computador.ligar()
```

Note que `ligar()` **não muda**:
- Basta trocar a linha `self.processador = ProcessadorIntel()` por `ProcessadorAMD()` para mudar o comportamento de `ligar()`
- Isso só é possível porque ambas as classes implementam `processar()` (que faz parte da **interface** de toda classe Processador), tornando o nosso código **polimórfico**.

**Resposta à pergunta 1:** se `computador` deixar de existir, `self.processador` e `self.memoria` também deixam de existir. 
- Essa é justamente a marca da **composição**: o objeto **"todo"** (``computador``) controla o ciclo de vida de suas **"partes"** (``processador`` e ``memoria``), pois elas foram criadas dentro do próprio construtor do **todo** e não são referenciadas de mais nenhum outro lugar do programa (diferente de associação/agregação, em que as partes existem independentemente).

### Exercício 4-C

```python
from abc import ABC, abstractmethod

class Dispositivo(ABC):
    @abstractmethod
    def processar(self):
        pass

    @abstractmethod
    def armazenar(self):
        pass

class ComputadorIntel(Dispositivo):
    def processar(self):
        print("Processador Intel processando")

    def armazenar(self):
        print("Armazenando dados na memória")


class ComputadorAMD(Dispositivo):
    def processar(self):
        print("Processador AMD processando")

    def armazenar(self):
        print("Armazenando dados na memória")


computador = ComputadorIntel()
computador.processar()
computador.armazenar()
```

**Qual abordagem exigiu menos código para trocar o processador?** 
- A **composição**. Para trocar de **Intel** para **AMD** na versão composta, bastou alterar **uma linha** dentro do construtor de `Computador`:
  - `self.processador = ProcessadorIntel()` → `ProcessadorAMD()`
- Na versão com herança, foi necessário criar uma classe inteiramente nova (`ComputadorIntel` ou `ComputadorAMD`), reimplementando `processar()` **e** `armazenar()` em cada uma, sem conseguir reaproveitar nem "processador" nem "memória" como peças independentes e intercambiáveis:
  - Isto é, se tivessemos duas memória diferentes (por exemplo, `MemoriaDDR4` e `MemoriaDDR5`), teríamos que criar **quatro classes** diferentes para cobrir todas as combinações possíveis de processador e memória (``IntelDDR4``, ``IntelDDR5``, ``AmdDDR4``, ``AmdDDR5``), enquanto na versão com composição bastaria trocar os objetos passados para o construtor de `Computador`.

## Exercício 5 

| Assertiva | V/F            | Justificativa                                                                                                                                                                                |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| I         | **Falsa**      | Não é possível instanciar `Instrumento()` diretamente porque a classe possui um método abstrato (`tocar()`) sem implementação; a presença ou ausência de atributos não tem relação com isso. |
| II        | **Verdadeira** | `Violao` implementa `tocar()`, cumprindo o contrato definido pela classe abstrata. Por isso, `Violao` é uma classe concreta.                                                                 |
| III       | **Falsa**      | Como `Flauta` não implementa `tocar()`, ela continua sendo tratada como abstrata; tentar criar `Flauta()` gera `TypeError`, e **não** é possível instanciá-la.                               |
| IV        | **Verdadeira** | Um método abstrato define, de fato, um contrato que toda subclasse concreta é obrigada a cumprir.                                                                                            |

---

## Exercício 6

| Assertiva | V/F            | Justificativa                                                                                                                                                     |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| I         | **Falsa**      | `motorista1` é criado **fora** do construtor de `Corrida` (`motorista1 = Motorista("Renato")`) e apenas passado como parâmetro, não é criado dentro de `Corrida`. |
| II        | **Verdadeira** | `Motorista` existe independentemente de `Corrida`, o que caracteriza uma associação.                                                                              |
| III       | **Verdadeira** | Como o motorista existe de forma independente, `print(motorista1.nome)` funciona normalmente mesmo após `corrida1 = None`.                                        |
| IV        | **Falsa**      | Não é composição, **é associação**. Em uma composição, o objeto "parte" deixaria de existir junto com o "todo", o que não acontece aqui.                          |

---

## Exercício 7 

O mapeamento correto entre termo e definição é:

| Termo                   | Definição correta                                                                                                                             |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| 1. Classe abstrata      | **f)** Classe que não pode ser instanciada diretamente, geralmente por conter métodos abstratos.                                              |
| 2. Método abstrato      | **i)** Método sem implementação, definido em uma classe abstrata, que atua como um "contrato" a ser cumprido pelas subclasses.                |
| 3. Classe concreta      | **d)** Classe que implementa todos os métodos abstratos herdados, podendo ter objetos instanciados.                                           |
| 4. Associação           | **e)** Relação entre objetos que existem de forma independente um do outro.                                                                   |
| 5. Agregação            | **j)** Tipo de associação envolvendo vários objetos relacionados, que continuam existindo mesmo se o "todo" deixar de existir.                |
| 6. Composição           | **a)** Relação em que um objeto existe dentro de outro e depende dele para existir.                                                           |
| 7. Relação "é um"       | **c)** Relação típica da herança, em que uma subclasse é um tipo mais específico da superclasse.                                              |
| 8. Relação "tem um"     | **g)** Relação típica da composição, em que um objeto guarda outro como parte de si mesmo.                                                    |
| 9. Ciclo de vida        | **h)** Conceito relacionado a quando um objeto é criado e quando deixa de existir, usado para diferenciar composição de agregação/associação. |
| 10. ``@abstractmethod`` | **b)** Decorador do módulo `abc` usado para marcar um método que não tem implementação, e deve ser obrigatoriamente sobrescrito.              |

---

## Exercício 8

### Exercício 8-A

Saida esperada:
```text
Detectando calor
```

seguido de erro ao executar `sensor_generico = Sensor()`:
- ``TypeError: Can't instantiate abstract class Sensor without an implementation for abstract method 'detectar'``

*(a mensagem de erro pode variar um pouco conforme a versão do Python, mas será sempre um `TypeError` informando que a classe abstrata não pode ser instanciada.)*

### Exercício 8-B

```text
Som via bluetooth
Som via cabo
```

### Exercício 8-C

```text
Marcos joga no time Alfa
Paulo joga no time Alfa
Marcos
```

`jogador1` continua existindo e mantém seu `nome` mesmo depois de `time1 = None`, pois a relação `Time` → `Jogador` é uma agregação (o jogador não depende do time para existir).

## Estudo de caso 1 

**Erro identificado:** o método `tocar()` dentro de `Instrumento` **não** está decorado com `@abstractmethod`.
- ``tocar()`` é um método comum, com corpo `pass` (que retorna `None`). 
- Por isso, mesmo herdando de `ABC`, `Instrumento` não impõe de fato nenhum contrato: `Violao` pode ser instanciada sem implementar `tocar()` de verdade
- Isto é, `instrumento.tocar()` para um `Violao` simplesmente retorna `None` para o ``print()`` pois nao ha implementacao do metodo ``tocar()``.

**Saída do código original:**
```text
None
Tocando piano
```

**Código refatorado:**

```python
from abc import ABC, abstractmethod

class Instrumento(ABC):
    @abstractmethod
    def tocar(self):
        pass

class Violao(Instrumento):
    def tocar(self):
        return "Dedilhando as cordas"

class Piano(Instrumento):
    def tocar(self):
        return "Tocando piano"

instrumentos = [Violao(), Piano()]

for instrumento in instrumentos:
    print(instrumento.tocar())
```

**Justificativa:** com `@abstractmethod`, o Python passa a impedir a instanciação de qualquer subclasse que não implemente `tocar()`, garantindo que o contrato definido pela classe abstrata seja realmente cumprido por todas as classes concretas.

## Estudo de caso 2 

**Erros identificados:** 
1. `Corrida.__init__` cria um **novo** objeto `Motorista(nome_motorista)` a cada chamada, em vez de receber um objeto `Motorista` já existente. 
   - Por isso, `corrida1.motorista` e `corrida2.motorista` acabam sendo dois objetos diferentes, mesmo representando a "mesma pessoa" (Renato) - `corrida1.motorista is corrida2.motorista` retorna `False`. A relação, que deveria ser uma associação, acaba modelada como se `Corrida` "possuísse" seu próprio motorista (o que esta errado, pois um motorista deve ser compartilhado entre as varias corridas).
2. Os atributos `motorista` e `destino` são públicos, permitindo que sejam alterados de fora da classe. Isso quebra o encapsulamento e permite que o estado do objeto seja modificado de forma inesperada.

**Código refatorado:**

```python
class Motorista:
    def __init__(self, nome):
        self.__nome = nome

    def get_nome(self):
        return self.__nome

class Corrida:
    def __init__(self, motorista, destino):
        self.__motorista = motorista
        self.__destino = destino

    def get_motorista(self):
        return self.__motorista

    def get_destino(self):
        return self.__destino

motorista1 = Motorista("Renato")
corrida1 = Corrida(motorista1, "Aeroporto")
corrida2 = Corrida(motorista1, "Rodoviária")

print(corrida1.get_motorista() is corrida2.get_motorista())      # True
print(corrida1.get_motorista().get_nome() == corrida2.get_motorista().get_nome())  # True
```

**Justificativa:** ao receber o objeto `Motorista` já pronto (em vez de criá-lo internamente), `Corrida` passa a representar corretamente uma associação:
- Isto é, o mesmo motorista pode estar vinculado a várias corridas diferentes, refletindo fielmente a realidade que se pretende modelar.

## Estudo de caso 3

**Erro identificado:** `Drone` não guarda de fato um objeto `Motor` — guarda apenas uma `string` (`"eletrico"` ou `"combustao"`) e decide o que imprimir usando `if/elif` dentro de `decolar()`. 
- Isso não é composição: **é uma duplicação de lógica** que deveria estar encapsulada em classes de motor próprias, além de exigir alterar `decolar()` sempre que um novo tipo de motor for criado.

**Código refatorado:**

```python
class MotorEletrico:
    def girar(self):
        print("Motor elétrico girando")

class MotorCombustao:
    def girar(self):
        print("Motor a combustão girando")

class Drone:
    def __init__(self, motor):
        self.motor = motor

    def decolar(self):
        self.motor.girar()

drone1 = Drone(MotorEletrico())
drone1.decolar()

drone2 = Drone(MotorCombustao())
drone2.decolar()
```

**Justificativa:** agora `Drone` guarda de fato um objeto `Motor` (composição), e `decolar()` apenas delega a chamada via `self.motor.girar()` — aproveitando o polimorfismo entre `MotorEletrico` e `MotorCombustao`. Isso elimina o `if/elif` e permite adicionar novos tipos de motor sem alterar `Drone.decolar()`.
