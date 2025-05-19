
## Código com Erros 

```python
import math

class Function:
    def __init__(self, name):
        self.name = name

    def evaluate(self, x):
        raise NotImplementedError(
            "This function must be implemented in subclass")

class LinearFunction(Function):
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def evaluate(self, x):
        return a * x + b

class QuadraticFunction(Function):
    def __init__(self, a, b, c):
        super().__init__("Sine")
        self.a = a
        self.b = b
        self.c = c

    def evaluate(self):
        return self.a * x**2 + self.b * x + self.c

class SineFunction(Function):
    def __init__(self):
        super().__init__("Sine")

    def evaluate(self, x):
        return math.sin(x)

class FunctionCalculator:
    def __init__(self):
        self.functions = []

    def add_function(self, f):
        self.functions.append(f)

    def calculate_all(self, x):
        result = {}
        for f in self.functions:
            try:
                result[f.name] = f.evaluate()
            except Exception as e:
                result[f.name] = f"Error: {e}"
        return result

# Código de execução (testes manuais)
if __name__ == "__main__":
    calc = FunctionCalculator()
    calc.add_function(LinearFunction(2, 3))
    calc.add_function(QuadraticFunction(1, -2, 1))
    calc.add_function(SineFunction())

    results = calc.calculate_all(2)
    print(results)
```

---

### 📘 Roteiro de Estudo Dirigido (Testes unitários, de componentes e de sistemas)

**Tema:** Diagnóstico e Correção de Erros em Código com Aplicação de Testes em Engenharia de Software

**Objetivo:** Desenvolver a capacidade de identificar erros de projeto, implementação e integração em um sistema orientado a objetos, aplicando diferentes níveis de testes de software.

#### Etapa 1 – Compreensão do Código (20 min)

* Leitura atenta do código Python fornecido nesta página.
* Identificação da estrutura de classes e suas responsabilidades.
* Identificação das funcionalidades esperadas.

#### Etapa 2 – Identificação dos Erros (20 min)

Em duplas, responder:

* Quais erros você encontra no código? Classifique-os como:

  * Erro de lógica
  * Erro de sintaxe
  * Erro de projeto (design)
  * Erro de integração/comunicação entre classes

*Dica: execute o código e leia cuidadosamente as mensagens de erro.*

#### Etapa 3 – Proposição de Correções (20 min)

* Corrija os erros identificados em uma nova cópia do código.
* Mantenha o uso de herança e polimorfismo.
* Comente no código corrigido o que foi alterado e por quê.

#### Etapa 4 – Desenvolvimento de Testes (40 min)

Verifique se os erros foram eliminados corretamente através de testes automatizados.

Para isso, crie os seguintes testes:

**a) Testes Unitários**

- Para cada classe concreta (`LinearFunction`, `QuadraticFunction`, etc), escreva testes com `unittest`.

**b) Testes de Componente**

- Teste a classe `FunctionCalculator` isoladamente, simulando funções mockadas (crie ``MockObjects`` conforme necessário).

**c) Testes de Sistema**

- Execute um teste *end-to-end* que adicione funções e avalie os resultados de `calculate_all`.

#### Etapa 5 – Reflexão Final (30 min)

Em grupo, discuta:

- Como os testes ajudaram na identificação dos erros?
- Qual o impacto de uma herança mal implementada?
- Quais boas práticas poderiam ter evitado esses erros?
- Como a modularidade e a separação de responsabilidades ajudam na testabilidade?

