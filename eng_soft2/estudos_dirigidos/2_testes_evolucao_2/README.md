
## Código com Erros 

```python
class Pedido:
    def __init__(self, cliente, itens):
        self.cliente = cliente
        self.itens = itens  # Lista de tuplas (nome, quantidade, preço_unitário)
        self.status = "aberto"
        self.total = 0

    def calcular_total(self):
        for item in self.itens:
            nome, quantidade, preco = item
            self.total += quantidade * preco  
        return self.total

    def aplicar_desconto(self, percentual):        
        if self.total == 0:
            self.calcular_total()
        self.total = self.total - self.total * percentual
        return self.total

    def finalizar_pedido(self):        
        self.status = "finalizado"
        return True
```

---

## 🧾 Requisitos e Cenários de Teste

1. **\[REQ1]** O total do pedido deve refletir corretamente o somatório dos itens.
2. **\[REQ2]** O desconto deve ser aplicado corretamente apenas uma vez.
3. **\[REQ3]** O pedido não pode ser finalizado se o valor total for menor ou igual a zero.
4. **\[REQ4]** O método `calcular_total()` pode ser chamado múltiplas vezes sem alterar o resultado total final.

---

## Estudo Dirigido em Sala: "Depuração Baseada em Requisitos"

### Objetivo da Atividade

Identificar e depurar erros escondidos no código usando estratégias de força bruta, *backtracking* e eliminação de causa, com base em testes simulando o comportamento real do sistema.

---

### Etapa 1 – Leitura e Interpretação do Código (20 min)

* Em DUPLAS, leiam o código do sistema de pedidos.
* Identifiquem as responsabilidades de cada método.
* Discutam: onde podem surgir problemas se múltiplas chamadas forem feitas em sequência?

---

### Etapa 2 – Testes Baseados em Requisitos (30 min)

Com base nos requisitos acima, escreva **cenários de uso manuais ou automatizados (usando `assert`)** para testar:

```python
p = Pedido("Alice", [("Caneta", 2, 1.5), ("Caderno", 1, 10)])

# Cenário 1 – Total correto
assert p.calcular_total() == 13.0

# Cenário 2 – Desconto aplicado uma vez
assert p.aplicar_desconto(0.1) == 11.7

# Cenário 3 – Tentativa de finalizar deve funcionar
assert p.finalizar_pedido() == True

# Cenário 4 – Novo total não pode mudar ao chamar calcular_total de novo
assert p.calcular_total() == 13.0  # ← Isso deve falhar
```

* Pergunta: Qual(is) requisito(s) falharam?
* Quais cenários não se comportaram como esperado?
* Em quais linhas/métodos os erros provavelmente estão?

---

### Etapa 3 – Depuração Guiada (40 min)

Cada grupo deve depurar o código usando uma das abordagens:

#### Grupo A – Força Bruta

* Inserir `print()`s em todos os métodos para rastrear valores internos (variáveis, estado).
* Reexecutar os testes após cada `print()` adicionado.
* Chegar ao erro a partir da observação dos valores.

#### Grupo B – Backtracking

* Executar o código até a falha.
* Voltar etapa a etapa, observando onde o valor esperado começou a divergir do obtido.
* Usar ferramentas de depuração (IDE) ou `breakpoint()`.

#### Grupo C – Eliminação de Causa

* Formular hipóteses sobre as causas dos erros (ex: "talvez o erro esteja no calculo do total acumulado").
* Alterar ou isolar o comportamento para testar as hipóteses.
* Confirmar/descartar causas e refinar hipóteses.

---

### Etapa 4 – Correção e Justificativa (20 min)

Cada grupo deve:

* Apresentar o erro encontrado.
* Apresentar a **linha exata ou método** causador do erro.
* Sugerir uma **correção funcional e justificável** (seguindo os requisitos).
* Explicar como sua abordagem de depuração ajudou.

---

### Etapa 5 – Encerramento e Discussão (15 min)

* Qual abordagem foi mais eficiente? Por quê?
* Como os testes baseados em requisitos ajudaram a identificar os erros?
* Qual a importância da previsibilidade de métodos públicos em sistemas orientados a objetos?
