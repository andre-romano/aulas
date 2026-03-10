# Estudo Dirigido Prático: Técnicas de Teste e Depuração

## Objetivo
Este estudo dirigido visa avaliar o aprendizado sobre técnicas avançadas de teste e depuração através de exercícios práticos em Python.

### 1. Testes Baseados em Requisitos

**Contexto:** Implemente uma função que valide senhas conforme os requisitos:
- Mínimo 8 caracteres
- Pelo menos 1 letra maiúscula
- Pelo menos 1 número
- Pelo menos 1 caractere especial (@#$%^&*)

**Tarefa:**
```python
def validar_senha(senha):
    """Implemente baseado nos requisitos acima"""
    pass

# Teste baseado nos requisitos
def test_validar_senha():
    # Caso válido
    assert validar_senha("Senha123@") == True
    
    # Adicione mais 4 testes que cobrem cada requisito individualmente
    # 1. Teste para tamanho mínimo
    # 2. Teste para letra maiúscula
    # 3. Teste para número
    # 4. Teste para caractere especial
    pass
```

### 2. Testes de Cenário

**Contexto:** Implemente um sistema simples de empréstimo de livros com as classes:
- `Biblioteca` (gerencia livros e empréstimos)
- `Usuario` (representa um usuário)
- `Livro` (representa um livro)

**Tarefa:**
```python
class Livro:
    def __init__(self, titulo, autor, copias):
        pass  # Implemente

class Usuario:
    def __init__(self, nome):
        pass  # Implemente

class Biblioteca:
    def __init__(self):
        self.emprestimos = []
    
    def emprestar_livro(self, usuario, livro):
        """Implemente a lógica de empréstimo"""
        pass

# Crie testes que cubram os seguintes cenários:
def test_cenarios_emprestimo():
    # 1. Empréstimo bem-sucedido
    # 2. Tentativa de empréstimo com livro indisponível
    # 3. Tentativa de empréstimo com usuário que já tem livro emprestado
    # 4. Devolução de livro
    pass
```

### 3. Testes de Desempenho

**Contexto:** Compare duas funções que calculam números primos (uma ingênua e uma otimizada)

**Tarefa:**
```python
import time

def eh_primo_ingenuo(n):
    """Implementação ingênua O(n)"""
    pass

def eh_primo_otimizado(n):
    """Implementação otimizada O(√n)"""
    pass

def testar_desempenho():
    numeros_grandes = [1000003, 2000003, 4000037]
    
    # Teste a função ingênua
    inicio = time.time()
    for n in numeros_grandes:
        eh_primo_ingenuo(n)
    print(f"Tempo ingênuo: {time.time() - inicio}")
    
    # Implemente o mesmo teste para a versão otimizada
    # e compare os resultados
    pass
```

### 4. Depuração por Força Bruta

**Contexto:** Uma função de login está com problemas. Use força bruta para testar combinações.

**Tarefa:**
```python
def login(usuario, senha):
    """Função com bug (sempre retorna False)"""
    # Implementação correta deveria testar se:
    # usuario == "admin" E senha == "12345"
    return False

def forca_bruta_login():
    usuarios = ["admin", "user", "teste"]
    senhas = ["12345", "senha", "admin"]
    
    # Teste todas combinações
    # até encontrar a correta (admin/12345)
    # Pare quando encontrar e mostre a combinação correta
    pass
```

### 5. Depuração por Rastreamento (Backtracking)

**Contexto:** Uma função recursiva de Fibonacci está com problemas.

**Tarefa:**
```python
def fibonacci(n, profundidade=0):
    """Função com bug (não trata casos base corretamente)"""
    print(f"{'  '*profundidade}fib({n})")
    if n == 0:
        return 1
    elif n == 1:
        return 1
    else:
        return fibonacci(n, profundidade+1) + fibonacci(n-1, profundidade+1)

# Use os prints de rastreamento para:
# 1. Identificar onde está o bug
# 2. Corrigir a função
# 3. Mostre o rastreamento para fib(3) antes e depois da correção
```

### 6. Depuração por Eliminação da Causa

**Contexto:** Uma função que processa dados está falhando em alguns casos.

**Tarefa:**
```python
def calcular_media(valores):
    """
    Calcula a média de uma lista de valores com os seguintes requisitos:
    - Ignora valores None
    - Retorna None se a lista estiver vazia ou só contiver None
    - Caso contrário, retorna a média dos valores válidos
    """
    soma = 0
    contagem = 0
    
    for valor in valores:
        if valor is not None:
            soma == valor  
            contagem += 1
    
    if contagem > 0:
        return soma / contagem  
    else:
        return None
```

**Passo 1**: Identificar Comportamento Incorreto

```python
def testar_calcular_media():
    # Caso 1: Teste com lista vazia (revele algum bug?)
    # Caso 2: Teste lista normal
    # Caso 3: Teste com valores None na lista
    # Caso 4: Teste com todos os valores None
    pass
```

**Passo 2**: Isolar as Causas

1. Primeiro execute os testes e observe qual falha
2. Para cada teste que falhar:
   - Adicione prints estratégicos para ver o fluxo de execução
   - Verifique os valores das variáveis em pontos-chave
   - Reduza o problema ao mínimo necessário para reproduzir o bug

**Passo 3**: Corrigir os Bugs 
- Realizar as correções no código

**Passo 4**: Verificar as Correções
- Reexecutar testes 

## Como Executar:

1. Para cada seção, implemente as funções e testes
2. Execute os testes manualmente (ex: `python3 -i estudo_dirigido.py`)
3. Para testes de desempenho, execute diretamente as funções
4. Para depuração, use print statements ou o debugger básico do IDE

**Dicas:**
- Para força bruta, use loops aninhados
- Para *backtracking*, analise a árvore de chamadas (stack trace)
- Para eliminação, isole partes do código
- Documente cada bug encontrado e como foi corrigido