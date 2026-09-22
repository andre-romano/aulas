# Solucao dos Exercicios

**Sumário**:
- [Solucao dos Exercicios](#solucao-dos-exercicios)
  - [Exercicio 1](#exercicio-1)
  - [Exercicio 2](#exercicio-2)
  - [Exercicio 3](#exercicio-3)
  - [Exercicio 4](#exercicio-4)
  - [Exercicio 5](#exercicio-5)
  - [Exercicio 6](#exercicio-6)
- [Solucao dos Estudos de Caso](#solucao-dos-estudos-de-caso)
  - [Estudo de caso 1](#estudo-de-caso-1)
  - [Estudo de caso 2](#estudo-de-caso-2)
  - [Estudo de caso 3](#estudo-de-caso-3)
  - [Estudo de caso 4](#estudo-de-caso-4)
  - [Estudo de caso 5](#estudo-de-caso-5)
    - [1. Problemas identificados no código original:](#1-problemas-identificados-no-código-original)
    - [2. **Problema do ``Medico`` e ``Profissional``**:](#2-problema-do-medico-e-profissional)
    - [3. O bug de get\_diagnostico()](#3-o-bug-de-get_diagnostico)
    - [4. **Reescrevendo ``realizar_atendimento()``**](#4-reescrevendo-realizar_atendimento)
    - [5. Código completo refatorado:](#5-código-completo-refatorado)


## Exercicio 1

Código para a solução do exercício 1:
```python
class Funcionario:
    def __init__(self, nome, salario):
        self._nome = nome
        self._salario = salario
    
    def calcular_beneficio(self):
        # pass significa que o método não tem implementação (nesta classe) 
        # logo ele deve ser implementado nas classes filhas
        pass

class Professor(Funcionario):
    def calcular_beneficio(self):
        # percentual assumido (não especificado neste exercício)
        beneficio = self._salario * 0.20
        print(self._nome, "(Professor) - Benefício: R$", beneficio)


class Tecnico(Funcionario):
    def calcular_beneficio(self):
        # percentual assumido (não especificado neste exercício)
        beneficio = self._salario * 0.10
        print(self._nome, "(Técnico) - Benefício: R$", beneficio)

funcionarios = []

professor = Professor("Fulano", 3000)
tecnico = Tecnico("Cicrano", 2000)
professor2 = Professor("Beltrano", 3500)
tecnico2 = Tecnico("Sicrano", 2200)

funcionarios.append(professor)
funcionarios.append(tecnico)
funcionarios.append(professor2)
funcionarios.append(tecnico2)

for funcionario in funcionarios:
    funcionario.calcular_beneficio()
```

Respostas:
1. Quem é a classe pai? 
   - `Funcionario`
2. Quais sao as classes filhas? 
   - `Professor` e `Tecnico`
3. Os atributos sao publicos, protegidos ou privados? Porque?
   - São protegidos (``_nome``, ``_salario``), pois o enunciado exigiu explicitamente esse nível de acesso. Assim, ao colocarmos um único ``_`` (underline) na frente, definimos que esses atributos sao protegidos, por convenção do Python.
4. As classes filhas tem acesso aos atributos definidos na classe pai? Explique e justifique.
   - Sim. Como ``_nome`` e ``_salario`` são protegidos (e não privados), ``Professor`` e ``Tecnico``, por serem subclasses de ``Funcionario``, podem acessá-los diretamente (``self._nome``, ``self._salario``) dentro de seus próprios métodos, como visto em ``calcular_beneficio()``. Isto é, atributos protegidos podem ser usados pela própria classe e por suas subclasses, mas não podem ser acessados por outras classes e códigos externos.

## Exercicio 2

Código para a solução do exercício 2:

```python
class Veiculo:
    def __init__(self, consumo_km_por_litro):
        self.__consumo_km_por_litro = consumo_km_por_litro

    def calcular_consumo(self, km_rodados):
        return km_rodados / self.__consumo_km_por_litro

class Moto(Veiculo):
    def __init__(self):
        super().__init__(25)  # Consumo de 25 km/l

class Carro(Veiculo):
    def __init__(self):
        super().__init__(12)  # Consumo de 12 km/l

class Caminhao(Veiculo):
    def __init__(self):
        super().__init__(8)  # Consumo de 8 km/l

veiculos = []
km = float(input("Km rodados: "))

veiculos.append(Carro())
veiculos.append(Moto())
veiculos.append(Caminhao())

for veiculo in veiculos:
    # pega o nome da classe do objeto veiculo
    nome_classe = type(veiculo).__name__
    # mostra o consumo calculado usando o método de classe
    print(nome_classe, "- Litros consumidos:", veiculo.calcular_consumo(km), "L")
```

## Exercicio 3

Código para a solução do exercício 3:

```python
class Funcionario:
    def __init__(self, nome, salario):
        self.__nome = nome
        self._salario = salario

    def calcular_beneficio(self):
        pass

    def mostrar_dados(self):
        print("Nome:", self.__nome, "- Salário: R$", self._salario)

class Professor(Funcionario):
    def calcular_beneficio(self):
        # o codigo comentado abaixo deve dar erro (descomente para testar):
        # print(self.__nome)
        return self._salario * 0.20


class Tecnico(Funcionario):
    def calcular_beneficio(self):
        # o codigo comentado abaixo deve dar erro (descomente para testar):
        # print(self.__nome)
        return self._salario * 0.10


professor = Professor("Ana", 3000)
tecnico = Tecnico("Bruno", 2000)

professor.mostrar_dados()
print("Benefício:", professor.calcular_beneficio())

tecnico.mostrar_dados()
print("Benefício:", tecnico.calcular_beneficio())
```

## Exercicio 4

```python
class Funcionario:
    def __init__(self, nome, salario):
        self._nome = nome
        self._salario = salario

    def mostrar_dados(self):
        print("Nome:", self._nome, "- Salário: R$", self._salario)


class Professor(Funcionario):
    def __init__(self, nome, salario, disciplina):
        super().__init__(nome, salario)
        self.disciplina = disciplina

    def mostrar_dados(self):
        super().mostrar_dados()
        print("Disciplina:", self.disciplina)


class Tecnico(Funcionario):
    def __init__(self, nome, salario, setor):
        super().__init__(nome, salario)
        self.setor = setor

    def mostrar_dados(self):
        super().mostrar_dados()
        print("Setor:", self.setor)

professor = Professor("Ana", 3000, "Banco de Dados")
tecnico = Tecnico("Bruno", 2000, "TI")

professor.mostrar_dados()
tecnico.mostrar_dados()
```

## Exercicio 5

```python
class Funcionario:
    def __init__(self, nome, salario):
        self.__nome = nome
        self.__salario = salario

    def get_nome(self):
        return self.__nome

    def get_salario(self):
        return self.__salario

    def mostrar_dados(self):
        print("Nome:", self.get_nome(), "- Salário: R$", self.get_salario())


class Professor(Funcionario):
    def __init__(self, nome, salario, disciplina):
        super().__init__(nome, salario)
        self.__disciplina = disciplina

    def calcular_beneficio(self):
        return self.get_salario() * 0.20


class Tecnico(Funcionario):
    def __init__(self, nome, salario, setor):
        super().__init__(nome, salario)
        self.__setor = setor

    def calcular_beneficio(self):
        return self.get_salario() * 0.10


funcionarios = []

funcionarios.append(Professor("Ana", 3000, "Banco de Dados"))
funcionarios.append(Professor("Beatriz", 3200, "POO"))
funcionarios.append(Professor("Carla", 2900, "Redes"))
funcionarios.append(Tecnico("Bruno", 2000, "TI"))
funcionarios.append(Tecnico("Diego", 2100, "Manutenção"))
funcionarios.append(Tecnico("Elias", 1950, "Laboratório"))

for funcionario in funcionarios:
    funcionario.mostrar_dados()
    print("Benefício: R$", funcionario.calcular_beneficio())
    print("---")
```

## Exercicio 6

Considerando o código abaixo (conforme consta no exercício):
```python
class Conta:
    def __init__(self):
        self.saldo = 0

    def depositar(self, valor):
        if valor > 0:
            self.saldo += valor

    def sacar(self, valor):
        if 0 < valor <= self.saldo:
            self.saldo -= valor
```

Respostas:

**I.** Quem usa ``conta.depositar(100)`` precisa conhecer como o ``saldo`` é armazenado internamente. 
- **Falso**. O usuário da classe ``Conta`` não precisa saber como o saldo é armazenado internamente, ele apenas interage com os métodos públicos ``depositar()`` e ``sacar()`` para modificar o saldo. Isto é um exemplo de encapsulamento.
- Exemplo:
```python
conta = Conta()
conta.depositar(100)  # O usuário apenas chama o método depositar, sem precisar conhecer a implementação interna do saldo (self.saldo , neste caso).
```

**II.** A abstração está relacionada a esconder do usuário da classe os detalhes de implementação de depositar() e sacar(). 
- **Verdadeiro**. A abstração permite que o usuário da classe interaja com os métodos públicos **sem precisar conhecer os detalhes de implementação** desses métodos. O usuário sabe apenas que pode depositar e sacar valores, mas não precisa saber como esses métodos funcionam internamente.

**III.** Se a classe ``Conta`` for reescrita internamente (por exemplo, guardando o saldo em centavos), o código que apenas chama conta.depositar(100) não precisa mudar, desde que a interface do método permaneça a mesma. 
- **Verdadeiro**. Se a implementação interna da classe ``Conta`` mudar (por exemplo, armazenando o saldo em centavos), mas a interface dos métodos ``depositar()`` e ``sacar()`` permanecer a mesma, o código que utiliza esses métodos não precisará ser alterado. Isso é um exemplo de encapsulamento e abstração, onde a implementação interna pode mudar sem afetar o código externo que usa a classe.
- Exemplo:
```python
class Conta:
    def __init__(self):
        self.__saldo_em_centavos = 0  # Mudança na implementação interna

    def depositar(self, valor_em_reais):
        if valor_em_reais > 0:
            self.__saldo_em_centavos += int(valor_em_reais * 100)  # Armazenando em centavos

    def sacar(self, valor_em_reais):
        if 0 < valor_em_reais*100 <= self.__saldo_em_centavos:
            self.__saldo_em_centavos -= int(valor_em_reais * 100)

    # necessario getter pra pegar o saldo em reais (ja que saldo agora é armazenado como atributo privado)
    def get_saldo(self):
        return self.__saldo_em_centavos / 100
```

**IV.** Abstração e Encapsulamento são exatamente a mesma coisa, apenas com nomes diferentes.
- **Falso**. Abstração e encapsulamento são conceitos relacionados, mas distintos. 
- A abstração se refere a **esconder detalhes de implementação** e mostrar apenas a interface necessária para o usuário da classe. 
- O encapsulamento, por outro lado, se refere a **proteger os dados internos** da classe, controlando o acesso a eles através de métodos públicos (**getters/setters**) e definindo níveis de acesso (público, protegido, privado).

# Solucao dos Estudos de Caso

## Estudo de caso 1

**Erros identificados:**
- Atributos nao devem ser publicos (pois isso é uma violacao do encapsulamento de POO). ELes devem ser protegidos (``_titulo``, ``_autor``) ou privados (``__titulo``, ``__autor``). 
- ``Livro.__init__`` não chama ``super().__init__(titulo, autor)`` — logo ``self.titulo`` e ``self.autor`` nunca são criados em Livro. A linha ``print(livro1.titulo)`` gera ``AttributeError`` (erro de atributo nao definido).
- ``Livro.emprestar(self, dias)`` tem assinatura diferente da classe pai (``emprestar(self)``). Isso quebra a consistência necessária para uso polimórfico. Isto é, nao podemos chamar o metodo `emprestar()` para todas as classes concretas (``Livro`` e ``Revista``), pois `livro.emprestar(dias)` precisa do parametro ``dias``, enquanto ``revista.emprestar()`` nao tem argumentos. gera TypeError.

**Código refatorado (corrigido)**:
```python
class ItemAcervo:
    def __init__(self, titulo, autor):
        self._titulo = titulo
        self._autor = autor

    def get_titulo(self):
        return self._titulo

    def get_autor(self):
        return self._autor

    def emprestar(self):
        print("Item emprestado")

class Livro(ItemAcervo):
    def __init__(self, titulo, autor, numero_paginas, dias_emprestimo=14):
        # chamando o construtor da classe pai para inicializar 
        # os atributos titulo e autor ( metodo ItemAcervo.__init__() )
        super().__init__(titulo, autor)
        self.__numero_paginas = numero_paginas
        self.__dias_emprestimo = dias_emprestimo

    def emprestar(self):
        print("Livro '", self._titulo, "' contem ", self.__numero_paginas, " paginas e esta emprestado por ", self.__dias_emprestimo, " dias")

class Revista(ItemAcervo):
    def emprestar(self):
        print("Revista '", self._titulo, "' emprestada por 7 dias")


revista1 = Revista("Superinteressante", "Vários autores")
revista1.emprestar()

livro1 = Livro("Dom Casmurro", "Machado de Assis", 256)
print(livro1.get_titulo())

itens_do_acervo = [livro1, revista1]
for item in itens_do_acervo:
    item.emprestar()
```

## Estudo de caso 2

**Problema**: 
- Atributos nao devem ser publicos (pois isso é uma violacao do encapsulamento de POO). Eles devem ser protegidos ou privados.
- o código usa um atributo ``tipo`` (string) e uma cadeia de ``if/elif`` para decidir o comportamento. 
  - Isso não é polimorfismo: é o chamado **"type code"** disfarçado de POO. Sempre que um novo tipo de personagem for criado (ex.: "clérigo"), será necessário editar a função atacar() já existente, em vez de apenas adicionar uma nova classe.

**Solução (código refatorado)**:
```python
class Personagem:
    def __init__(self, nome):
        self._nome = nome

    def atacar(self):
        print(self._nome, "não sabe atacar")


class Guerreiro(Personagem):
    def atacar(self):
        print(self._nome, "ataca com a espada")


class Mago(Personagem):
    def atacar(self):
        print(self._nome, "ataca com uma bola de fogo")


class Arqueiro(Personagem):
    def atacar(self):
        print(self._nome, "ataca com flechas")


personagens = [
    Guerreiro("Thorin"),
    Mago("Elara"),
    Arqueiro("Robin"),
]

for p in personagens:
    p.atacar()
```

## Estudo de caso 3

**Problema**:
- ``produto``, ``quantidade`` e ``preco_unitario`` são atributos públicos, sem nenhuma validação (quebra do encapsulamento de POO). Isso permite ``item.quantidade = -5`` e ``item.preco_unitario = 0``, produzindo subtotais inválidos (negativo e zero), sem que a classe possa impedir esse estado inconsistente.

**Codigo refatorado**:
```python
class ItemPedido:
    def __init__(self, produto, quantidade, preco_unitario):
        self.__produto = produto
        # inicializa os atributos privados com valores default (0)
        self.__quantidade = 0
        self.__preco_unitario = 0
        # chama os setters para validar os valores passados pelo construtor
        self.set_quantidade(quantidade)
        self.set_preco_unitario(preco_unitario)

    def get_produto(self):
        return self.__produto

    def get_quantidade(self):
        return self.__quantidade

    def set_quantidade(self, valor):
        if valor >= 0:
            self.__quantidade = valor
        else:
            print("Quantidade inválida, valor ignorado:", valor)

    def get_preco_unitario(self):
        return self.__preco_unitario

    def set_preco_unitario(self, valor):
        if valor > 0:
            self.__preco_unitario = valor
        else:
            print("Preço inválido, valor ignorado:", valor)

    def calcular_subtotal(self):
        return self.get_quantidade() * self.get_preco_unitario()


item = ItemPedido("Mouse", 2, 50)
print("Produto:", item.get_produto(),"- Preco: ", item.get_preco_unitario(), " - Quantidade: ", item.get_quantidade(), " - Subtotal: ", item.calcular_subtotal())

# aceito, valores dentro do esperado
item.set_quantidade(10)
item.set_preco_unitario(40)     
print("Produto:", item.get_produto(),"- Preco: ", item.get_preco_unitario(), " - Quantidade: ", item.get_quantidade(), " - Subtotal: ", item.calcular_subtotal())

# rejeitado — mantém o valor anterior
item.set_quantidade(-5)     
print("Produto:", item.get_produto(),"- Preco: ", item.get_preco_unitario(), " - Quantidade: ", item.get_quantidade(), " - Subtotal: ", item.calcular_subtotal())

# rejeitado — mantém o valor anterior
item.set_preco_unitario(0)  
print("Produto:", item.get_produto(),"- Preco: ", item.get_preco_unitario(), " - Quantidade: ", item.get_quantidade(), " - Subtotal: ", item.calcular_subtotal())
```

## Estudo de caso 4

**Problema**:
- Atributos publicos, sem nenhuma validação (quebra do encapsulamento de POO). Isso permite ``usuario.minutos_assistidos = -5``, produzindo minutos restantes inválidos.
- a regra de negócio ("premium = 10000 min, outros planos = 300 min") está fora da classe ``Usuario``, no código que a utiliza (problema de encapsulamento e abstracao).
  - Se essa mesma regra for necessária em outras telas do sistema, ela seria duplicada em vários lugares; se o limite mudar, todos esses lugares precisariam ser atualizados.
- O ideal é usar classes concretas para cada tipo de plano, cada uma com seu próprio limite, e a classe ``Usuario`` apenas delega a responsabilidade de calcular o limite para o objeto do tipo de plano (dessa forma, usamos herança e polimorfismo para simplificar o sistema).

**Codigo refatorado**:
```python
class Plano:
    def obter_limite(self):
        pass

    def calcular_minutos_restantes(self, minutos_assistidos):
        return self.obter_limite() - minutos_assistidos

class PlanoPremium(Plano):
    def obter_limite(self):
        return 10000

class PlanoBasico(Plano):
    def obter_limite(self):
        return 300

class Usuario:
    def __init__(self, nome, tipo_plano):
        self.__nome = nome
        # default para plano básico, caso o tipo_plano passado seja inválido
        self.__tipo_plano = PlanoBasico()
        # chama o setter para validar o tipo de plano
        self.set_tipo_plano(tipo_plano)

    def get_nome(self):
        return self.__nome

    def set_tipo_plano(self, tipo_plano):
        if isinstance(tipo_plano, Plano):
            self.__tipo_plano = tipo_plano
        else:
            print("Tipo de plano inválido, mantendo o plano atual")

    # -- esse metodo aqui serve apenas para facilitar o acesso externo,
    # sem precisar expor o tipo de plano do usuario (ex: criar um
    # get_tipo_plano() que retornaria o objeto do tipo de plano)
    def calcular_minutos_restantes(self, minutos_assistidos):        
        # delega a responsabilidade de calcular os minutos restantes para esse objeto
        # usuario tem um tipo de plano (objeto) e
        return self.__tipo_plano.calcular_minutos_restantes(minutos_assistidos)


usuario1 = Usuario("Bianca", PlanoPremium())
minutos_assistidos = 300
minutos_restantes = usuario1.calcular_minutos_restantes(minutos_assistidos)

print(usuario1.get_nome(), "ainda pode assistir", minutos_restantes, "minutos")
```

## Estudo de caso 5

**Respostas:**
### 1. Problemas identificados no código original:

| #   | Onde                                            | Pilar          | O que está errado                                                                                                                                                                                                    |
| --- | ----------------------------------------------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | ``Medico.__init__()``                           | Herança        | ``self.especialidade = especialidade`` é executado antes de ``super().__init__(nome, registro)``. A ordem recomendada é chamar o construtor da classe pai primeiro.                                                  |
| 2   | ``Paciente.__init__()`` / ``get_diagnostico()`` | Encapsulamento | O construtor cria ``self.diagnostico`` (público), mas ``get_diagnostico()`` tenta retornar ``self.__diagnostico``, que nunca foi definido (por causa do ``__`` do atributo protegido). Isso gera ``AttributeError``. |
| 3   | ``paciente1.diagnostico = "Sem diagnóstico"``   | Encapsulamento | Por ``diagnostico`` ser público, qualquer código externo pode sobrescrevê-lo diretamente, sem nenhuma validação.                                                                                                     |
| 4   | ``realizar_atendimento()``                      | Polimorfismo   | Usa ``isinstance()`` para decidir o que fazer, duplicando no ``if/elif`` uma lógica que já deveria estar dentro de ``atender()`` de cada classe.                                                                     |
| 5   | ``realizar_atendimento()``                      | Abstração      | Por depender de ``isinstance()``, a função precisa conhecer as subclasses concretas de ``Profissional`` (``Medico``, ``Enfermeiro``), em vez de depender apenas da interface comum ``atender()``.                    |

### 2. **Problema do ``Medico`` e ``Profissional``**:

 Se ``Profissional.__init__()`` tivesse uma validação (por exemplo, recusar registro vazio), essa validação só seria executada quando ``super().__init__()`` fosse chamado. 
 
Como no código original ``self.especialidade`` é atribuído antes disso, qualquer erro/exceção lançada dentro de ``Profissional.__init__()`` deixaria o objeto Medico "pela metade": 
- com ``especialidade`` definida, mas sem ``nome``/``registro``. 

Por isso a recomendação é sempre chamar ``super().__init__()`` antes de qualquer outra operação no construtor da subclasse.

### 3. O bug de get_diagnostico()

Ao executar ``print(paciente1.get_diagnostico())``, o Python lança ``AttributeError``: ``'Paciente' object has no attribute '_Paciente__diagnostico'``.

Isto ocorre pois ``__diagnostico`` é um atributo protegido, porem o construtor criou ``self.diagnostico`` (sem ``__``). Logo, o construtor criou um atributo publico ``diagnostico``.
- Assim, temos um problema de encapsulamento: o atributo foi pensado como privado (daí o getter), mas foi implementado como público, deixando a classe inconsistente e ainda quebrada.

### 4. **Reescrevendo ``realizar_atendimento()``**

Precisamos usar polimorfismo, para que cada subclasse de ``Profissional`` implemente seu próprio método ``atender()``. 

```python
class Profissional:
    def __init__(self, nome, registro):
        self.nome = nome
        self.registro = registro

    def atender(self, paciente):
        pass

class Medico(Profissional):
    def __init__(self, nome, registro, especialidade):
        super().__init__(nome, registro)
        self.especialidade = especialidade

    def atender(self, paciente):
        print(self.nome, "(médico) atende", paciente.get_nome())

class Enfermeiro(Profissional):
    def atender(self, paciente):
        print(self.nome, "(enfermeiro) faz triagem de", paciente.get_nome())
```

Assim, ``realizar_atendimento()`` não precisa conhecer as subclasses concretas, apenas chama o método comum ``atender()`` da interface.

```python
def realizar_atendimento(profissional, paciente):
    profissional.atender(paciente)
```


### 5. Código completo refatorado:
```python
class Profissional:
    def __init__(self, nome, registro):
        self.nome = nome
        self.registro = registro

    def atender(self, paciente):
        print(self.nome, "atende", paciente.get_nome())


class Medico(Profissional):
    def __init__(self, nome, registro, especialidade):
        super().__init__(nome, registro)
        self.especialidade = especialidade

    def atender(self, paciente):
        print(self.nome, "(médico) atende", paciente.get_nome())


class Enfermeiro(Profissional):
    def atender(self, paciente):
        print(self.nome, "(enfermeiro) faz triagem de", paciente.get_nome())


class Paciente:
    def __init__(self, nome, diagnostico):
        self.__nome = nome
        self.__diagnostico = diagnostico

    def get_nome(self):
        return self.__nome

    def get_diagnostico(self):
        return self.__diagnostico

    def set_diagnostico(self, novo_diagnostico):
        self.__diagnostico = novo_diagnostico


def realizar_atendimento(profissional, paciente):
    profissional.atender(paciente)


medico1 = Medico("Dra. Helena", "CRM123", "Cardiologia")
enfermeiro1 = Enfermeiro("João", "COREN456")
paciente1 = Paciente("Sr. Ari", "Hipertensão")

realizar_atendimento(medico1, paciente1)
realizar_atendimento(enfermeiro1, paciente1)

paciente1.set_diagnostico("Sem diagnóstico")
print(paciente1.get_diagnostico())
```