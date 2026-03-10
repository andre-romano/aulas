# Estudo Dirigido Prático: Evolução de software

## 1. Correção de Erros de Diferentes Custos

**Exercício:** Implemente um sistema bancário simples e identifique tipos de erros.

```python
class ContaBancaria:
    def __init__(self, saldo_inicial=0):
        self.saldo = saldo_inicial
    
    # Erro de codificação (fácil corrigir)
    def depositar(self, valor):
        self.saldo -= valor  # Erro: deveria ser +=
    
    # Erro de projeto (mais custoso)
    def sacar(self, valor):
        # Faltou verificar saldo suficiente
        self.saldo -= valor
    
    # Erro de requisitos (muito custoso)
    # O cliente não pediu extrato, mas é necessário

# Tarefa:
# 1. Corrija o erro de codificação
# 2. Melhore o método sacar para tratar saldo insuficiente
# 3. Adicione funcionalidade de extrato (erro de requisitos)
```

## 2. Fatores que Interferem na Manutenção

**Exercício:** Analise um código mal escrito e identifique problemas de manutenção.

```python
# Código com problemas de manutenção
class ProcessadorDados:
    def __init__(self):
        self.d = []  # Nome ruim para dados
    
    def p(self, x):  # Método mal nomeado
        # Lógica complexa e não documentada
        r = []
        for i in range(len(self.d)):
            if self.d[i] > x:
                r.append(self.d[i]*2.5)
            else:
                r.append(self.d[i]/2.5)
        return sum(r)/len(r) if len(r) > 0 else 0

# Tarefa: Identifique:
# 1. Problemas de nomes ruins
# 2. Falta de documentação
# 3. Complexidade desnecessária
# 4. Sugira melhorias para cada problema encontrado
```

## 3. Reengenharia de Software

**Exercício:** Reescreva um sistema legado com nova arquitetura.

```python
# Sistema legado - tudo em uma função
def processar_pedido(itens, cliente, pagamento):
    # Lógica complexa e acoplada
    total = sum(item['preco'] * item['quantidade'] for item in itens)
    # ... muitas linhas de código ...
    return {"status": "sucesso", "total": total}

# Tarefa:
# 1. Divida em classes especializadas (Pedido, Item, Cliente, Pagamento)
# 2. Aplique princípios SOLID
# 3. Mantenha a mesma funcionalidade com melhor estrutura
```

## 4. Refatoração de Software

**Exercício:** Refatore um código com problemas comuns.

```python
# Código para refatorar
def calcular(valores, op, extra=None):
    r = []
    if op == "soma":
        for v in valores:
            r.append(v + (extra if extra else 0))
    elif op == "multi":
        for v in valores:
            r.append(v * (extra if extra else 1))
    elif op == "quad":
        for v in valores:
            r.append(v ** 2)
    return r

# Tarefa:
# 1. Elimine código duplicado
# 2. Divida em funções menores
# 3. Melhore a legibilidade
```

## 5. Problemas Comuns de Código

**Exercício:** Corrija problemas específicos em trechos de código.

### 5.1 Código Duplicado
```python
# Versão com duplicação
def calcular_area_retangulo(l, a):
    return l * a

def calcular_perimetro_retangulo(l, a):
    return 2 * (l + a)

def calcular_area_circulo(r):
    return 3.14 * r * r

def calcular_perimetro_circulo(r):
    return 2 * 3.14 * r

# Tarefa: Elimine a duplicação de constantes e lógica comum
```

### 5.2 Métodos Longos
```python
def processar_relatorio(dados):
    # Cálculos
    total = sum(dados)
    media = total / len(dados)
    maximo = max(dados)
    minimo = min(dados)
    
    # Formatação
    relatorio = "RELATÓRIO FINAL\n"
    relatorio += f"Total: {total}\n"
    relatorio += f"Média: {media:.2f}\n"
    relatorio += f"Maximo: {maximo}\n"
    relatorio += f"Minimo: {minimo}\n"
    
    # Filtros
    acima = [d for d in dados if d > media]
    abaixo = [d for d in dados if d < media]
    
    relatorio += f"Acima da média: {len(acima)}\n"
    relatorio += f"Abaixo da média: {len(abaixo)}\n"
    
    return relatorio

# Tarefa: Divida em métodos menores com única responsabilidade
```

### 5.3 Aglutinação de Dados
```python
# Classe com muitos campos não relacionados
class Funcionario:
    def __init__(self):
        self.nome = ""
        self.salario = 0
        self.departamento = ""
        self.endereco = ""
        self.telefone = ""
        self.tipo_contrato = ""
        self.horas_extras = 0
        self.equipamento = ""

# Tarefa: Aplique o princípio da responsabilidade única e divida em classes
```

### 5.4 Generalidade Especulativa
```python
# Código com funcionalidades não usadas
class CalculadoraEstatistica:
    def media(self, dados):
        return sum(dados)/len(dados)
    
    def moda(self, dados):
        # Implementação complexa nunca usada
        from collections import Counter
        freq = Counter(dados)
        return freq.most_common(1)[0][0]
    
    def fatorial(self, n):
        # Por que isso está aqui?
        if n == 0:
            return 1
        return n * self.fatorial(n-1)

# Tarefa: Remova funcionalidades não utilizadas e documente decisões
```

## Como Executar o Estudo Dirigido:
1. Para cada seção, analise o código fornecido
2. Implemente as melhorias sugeridas
3. Compare as versões antes/depois
4. Documente as decisões tomadas

**Dicas:**
- Sempre execute testes após modificações
- Faça mudanças incrementais
- Documente o racional para cada decisão
- Priorize os problemas que mais impactam a manutenibilidade