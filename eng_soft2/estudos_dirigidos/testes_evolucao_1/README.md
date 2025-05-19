
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

