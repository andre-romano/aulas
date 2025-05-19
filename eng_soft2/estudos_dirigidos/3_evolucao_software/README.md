
## Estudo Dirigido Prático – Avaliação Crítica de Código e Manutenibilidade

**Tema:** Avaliação de Código Python segundo Leis de Lehman, Tipos de Defeitos, Manutenibilidade e Reengenharia

**Objetivo Geral:** Desenvolver nos alunos a capacidade de identificar problemas de manutenção, evolução e qualidade de software, com base em código legado, utilizando critérios da Engenharia de Software.

---

### Código legado com problemas

```python
class SistemaNotas:
    def __init__(self):
        self.alunos = []  # lista de tuplas (nome, [notas])

    def adicionar_aluno(self, nome, notas):
        self.alunos.append((nome, notas))

    def media_geral(self):
        total = 0
        count = 0
        for aluno in self.alunos:
            for nota in aluno[1]:
                total += nota
                count += 1
        return total / count

    def status_aprovacao(self):
        for aluno in self.alunos:
            media = sum(aluno[1]) / len(aluno[1])
            if media >= 6:
                print(f"{aluno[0]}: Aprovado")
            else:
                print(f"{aluno[0]}: Reprovado")

    def imprimir_relatorio(self):
        for aluno in self.alunos:
            print(f"Aluno: {aluno[0]}")
            print("Notas:", aluno[1])
            print("Média:", sum(aluno[1]) / len(aluno[1]))
            if sum(aluno[1]) / len(aluno[1]) >= 6:
                print("Situação: Aprovado")
            else:
                print("Situação: Reprovado")
            print("---")
```

---

## Etapas do Estudo Dirigido

### Etapa 1 – Leitura Crítica do Código (30 min)

**Atividade em grupo:**

Em **DUPLA**:
* Analise o código fornecido.
* Discuta sua estrutura, legibilidade, repetição de lógica, modularidade e clareza de propósito.

**Questões:**

1. O código é fácil de entender? Por quê?
2. Quais funcionalidades estão misturadas em um mesmo método?
3. Há repetição de lógica ou má separação de responsabilidades?

---

### Etapa 2 – Avaliação com base nas Leis de Lehman (30 min)

Relacione o código com pelo menos **4 Leis de Lehman**. Exemplos:

* **Lei da Mudança Contínua**: esse sistema é preparado para evoluir com novos critérios de avaliação?
* **Lei do Crescimento**: o código cresce mantendo ou perdendo sua estrutura?
* **Lei da Complexidade Crescente**: o sistema parece se tornar mais complexo a cada adição?
* **Lei da Estabilidade Organizacional**: o ritmo de desenvolvimento se mantém ou depende da experiência da equipe?

**Registro:**
Responder em folha ou documento digital quais leis foram analisadas e como se manifestam no código.

---

### Etapa 3 – Classificação dos Defeitos (40 min)

Identificar e propor correções nos defeitos do código.

- **Ex:** mistura de código de *view* com lógica 
  - **Correção**: separação de responsabilidades em classes distintas

---

### Etapa 4 – Fatores que Afetam a Manutenção (30 min)

Discutir como os seguintes fatores poderiam impactar a manutenção desse código:

1. Estabilidade da equipe
2. Más práticas de desenvolvimento
3. Qualificação do pessoal
4. Idade do programa
5. Estrutura de dados e modularidade


---

### Etapa 5 – Reengenharia e Refatoração (40 min)

Reescrever parte ou todo o sistema aplicando:

* Princípios de **SOLID** e boas práticas
* Criação de uma classe `Aluno`
* Separação de lógica de apresentação e regra de negócio
* Modularização

---

### 📈 Etapa 6 – Discussão em sala (30 min)

Cada grupo deve apresentar:

* Principais defeitos identificados
* Leis de Lehman relacionadas
* Refatorações aplicadas
* O que aprenderam sobre manutenibilidade e reengenharia
