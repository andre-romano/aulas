
# Estudo Dirigido – Especificação Dirigida a Riscos

**Tema:** Avaliação de Riscos em Software com Código Python e Construção de Requisitos de Segurança e Confiabilidade

**Objetivo Geral:** Capacitar os alunos a aplicar o processo de especificação dirigido a riscos em software, classificando perigos, decompondo riscos, construindo árvores de defeitos e derivando requisitos funcionais e não funcionais de segurança e confiabilidade.

---

## Código Python com falhas de segurança e confiabilidade

```python
import json

class SistemaLogin:
    def __init__(self):
        self.usuarios = {}

    def cadastrar_usuario(self, usuario, senha):
        self.usuarios[usuario] = senha

    def salvar_dados(self, caminho):
        with open(caminho, 'w') as f:
            json.dump(self.usuarios, f)

    def carregar_dados(self, caminho):
        with open(caminho, 'r') as f:
            self.usuarios = json.load(f)

    def login(self, usuario, senha):
        if self.usuarios.get(usuario) == senha:
            print("Login realizado com sucesso!")
        else:
            print("Usuário ou senha incorretos.")
```

---

## Etapas do Estudo Dirigido


### Etapa 1 – Identificação de Riscos (30 min)

Em **DUPLA**:

* Liste os riscos de segurança, confiabilidade e falhas operacionais embutidos no código.
* Justifique com base no comportamento do sistema.

**Exemplos:**

* Armazenamento de senhas em texto puro
* Ausência de política de bloqueio após tentativas incorretas
* Leitura e escrita de arquivos sem verificação de integridade

---

### Etapa 2 – Classificação de Riscos (30 min)

**Classificar os riscos segundo:**

* **Intoleráveis** – Devem ser eliminados ou mitigados imediatamente
* **ALARP (As Low As Reasonably Practicable)** – Reduzidos ao nível mais baixo razoável
* **Aceitáveis** – Não requerem tratamento imediato

**Exemplo:**

| Risco                       | Categoria   | Justificativa                         |
| --------------------------- | ----------- | ------------------------------------- |
| Senhas armazenadas em texto | Intolerável | Viola práticas básicas de segurança   |
| Exceções de IO não tratadas | Aceitável   | Impacto menor, mas pode ser melhorado |

---

### Etapa 3 – Decomposição de Perigos e Árvore de Defeitos (40 min)

Escolher **um risco intolerável** e construir:

  * A **decomposição do perigo** (causas raiz)
  * A **árvore de defeitos** (representando falhas que levam ao incidente)

**Exemplo:**

**Perigo:** Vazamento de senhas
**Causas:**

* Armazenamento em JSON
* Falta de criptografia
* Acesso direto ao arquivo

---

### Etapa 4 – Especificação de Requisitos Funcionais e Não Funcionais (40 min)

**Atividade:**

* Com base nos riscos identificados, especificar requisitos:

| Tipo          | Requisito                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------- |
| Funcional     | O sistema deve aplicar hash nas senhas antes de armazená-las                                 |
| Não Funcional | O sistema deve ser capaz de resistir a ataques de força bruta por pelo menos 10^6 tentativas |

---

### Etapa 5 – Correlação com Políticas Organizacionais de Proteção (30 min)

Mapear os requisitos aos domínios de uma política organizacional genérica:

* **Autenticação segura**
* **Proteção de dados em repouso**
* **Auditoria de acessos**
* **Continuidade de operação**

**Exemplo:**

| Requisito                   | Política correlata           |
| --------------------------- | ---------------------------- |
| Hash de senha               | Proteção de dados em repouso |
| Registro de falhas de login | Auditoria de acessos         |
| Lockout por tentativas      | Autenticação segura          |

---

### Etapa 6 – Discussão e Reflexão (30 min)

**Questões para debate em sala:**

* Como o processo de análise de riscos muda o modo como projetamos sistemas?
* O que seria diferente se não houvesse essa avaliação antes da implementação?
* Quais riscos foram difíceis de perceber? Por quê?
* Que outras práticas poderiam reforçar a segurança e confiabilidade?
