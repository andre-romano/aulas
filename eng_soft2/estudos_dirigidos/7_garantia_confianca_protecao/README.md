
# Estudo Dirigido – Avaliação de Confiança e Proteção

**Objetivo Geral:**
Capacitar os alunos a aplicar práticas de **garantia de proteção, segurança e confiança** no ciclo de vida de software, com foco em análise estática automatizada, inspeção em pares, testes de segurança, casos de confiança e construção de argumentos estruturados de segurança.

---

## Código com Falhas de Segurança e Confiabilidade

```python
class Banco:
    def __init__(self):
        self.saldo = 1000

    def sacar(self, valor):
        assert valor >= 0
        if valor <= self.saldo:
            self.saldo -= valor
            print(f"Saque de R${valor} realizado com sucesso.")
        else:
            print("Saldo insuficiente.")

    def depositar(self, valor):
        self.saldo += valor

    def transferir(self, destino, valor):
        if valor <= self.saldo:
            self.saldo -= valor
            destino.saldo += valor
            print("Transferência realizada.")
        else:
            print("Saldo insuficiente.")
```

---

## Etapas do Estudo Dirigido


### Etapa 1 – Análise Estática Automatizada (30 min)

**Ferramentas sugeridas:** `pylint`, `bandit`, `mypy`, `pyflakes`

**Atividades:**

1. Rodar ferramentas estáticas no código.
2. Anotar alertas e erros identificados.
3. Classificar os problemas segundo:

   * Erros sintáticos
   * Problemas de boas práticas
   * Falhas de proteção
   * Vulnerabilidades potenciais

**Produto esperado:** Tabela de achados da análise estática.

---

### Etapa 2 – Inspeção com Programação em Par (30 min)

**Atividades em duplas:**

* Executar **pair programming reverso**: um aluno lê o código linha por linha, outro valida regras de proteção e confiança.
* Verificar especialmente:

  * Ausência de verificação de tipos
  * Uso inseguro de `assert`
  * Falta de encapsulamento do estado (`saldo` é acessível diretamente)

**Produto esperado:** Relatório simples com observações e sugestões de refatoração.

---

### Etapa 3 – Testes de Proteção Automatizados com Ferramentas (40 min)

**Ferramentas sugeridas:** `bandit`, `pytest`, `hypothesis`

**Atividades:**

* Escrever casos de teste para operações de saque, depósito e transferência.
* Executar testes exploratórios com `hypothesis` para inputs inesperados.
* Rodar `bandit` para detectar falhas comuns de segurança (ex.: uso de `assert` em produção).

**Produto esperado:** Log dos testes e discussão sobre coberturas e falhas.

---

### Etapa 4 – Casos de Confiança e Requisitos Derivados (30 min)

**Conceitos aplicados:**

- Casos de confiança e **cenários críticos de segurança e confiabilidade**
- **Ex**: "O sistema nunca permite saque acima do saldo mesmo com ataque de injeção"

**Atividade:**

* Elaborar **3 casos de confiança** e derivar **requisitos funcionais e não funcionais** de segurança/confiabilidade.

**Exemplo:**

| Caso de Confiança                          | Requisito Derivado                                |
| ------------------------------------------ | ------------------------------------------------- |
| Saque com valor negativo não reduz o saldo | O sistema deve bloquear saques com valor inválido |

---

### Etapa 5 – Argumentos Estruturados e Hierarquia de Afirmações (45 min)

**Atividade:**

* Criar estrutura de argumentos hierárquicos baseada no modelo GSN (*Goal Structured Notation*):

  * Objetivo (ex: Garantir integridade do saldo)
  * Subobjetivos (ex: Validar entradas, evitar acesso direto ao estado)
  * Estratégias (ex: Uso de análise estática, encapsulamento)
  * Evidências (ex: Logs de `bandit`, `pytest`, revisão em pares)

**Produto esperado:**
Árvore de afirmações estruturadas (em papel, em slides ou em ferramentas como draw\.io).

---

### Etapa 6 – Reflexão e Aplicação Crítica (30 min)

**Discussão:**

* O que faltava no código original que comprometia a confiança?
* A análise estática foi suficiente? O que só foi visto na inspeção?
* Como transformar os resultados em melhorias estruturais no sistema?
