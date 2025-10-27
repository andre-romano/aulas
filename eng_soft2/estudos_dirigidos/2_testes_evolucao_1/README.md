
## Estudo Dirigido 

### 1. Desenvolvimento Incremental (TDD)

**Exemplo Inicial:**
```python
# test_string_utils.py
import unittest
from string_utils import inverter_string

class TestStringUtils(unittest.TestCase):
    def test_inverter_string(self):
        self.assertEqual(inverter_string("abc"), "cba")
        self.assertEqual(inverter_string(""), "")

# string_utils.py
def inverter_string(s):
    # Implemente aqui para fazer os testes passarem
    pass
```

**Tarefa:** 
1. Implemente `inverter_string(s)` para passar nos testes
2. Adicione a função `contar_vogais(s)` seguindo TDD:
   - Primeiro escreva os testes
   - Depois implemente a função

### 2. Teste de Validação vs Defeitos

**Exemplo Inicial:**
```python
# validadores.py
def validar_idade(idade):
    # Implemente a validação (idade entre 0 e 120)
    pass
```

**Tarefa:**
```python
# test_validadores.py
class TestValidarIdade(unittest.TestCase):
    # Testes de validação (2 casos)
    def test_idade_valida_1(self):
        # Complete aqui
    
    # Testes de defeitos (3 casos)
    def test_idade_negativa(self):
        # Complete aqui
```

### 3. Teste Caixa-Preta vs Caixa-Branca

**Exemplo Inicial:**
```python
# math_utils.py
def eh_quadrado_perfeito(n):
    # Implemente a função
    pass
```

**Tarefa:**
```python
# test_math_utils.py
class TestQuadradoPerfeito(unittest.TestCase):
    # Testes caixa-preta (3 casos)
    def test_numero_quadrado_perfeito(self):
        # Complete aqui
    
    # Testes caixa-branca (2 casos baseados na implementação)
    def test_numero_zero(self):
        # Complete aqui
```

### 4. Mock Object

**Exemplo Inicial:**
```python
# sistema_arquivos.py
class GerenciadorArquivos:
    def __init__(self, sistema_operacional):
        self.so = sistema_operacional
    
    def criar_arquivo(self, nome):
        return self.so.criar(nome)
```

**Tarefa:**
```python
# test_sistema_arquivos.py
from unittest.mock import Mock

class TestGerenciadorArquivos(unittest.TestCase):
    def test_criar_arquivo_sucesso(self):
        # Crie um mock para sistema_operacional
        # Configure o mock para retornar True
        # Teste o cenário de sucesso
        pass
```

### 5. Testes Unitários

**Exemplo Inicial:**
```python
# banco.py
class ContaCorrente:
    def __init__(self, saldo=0):
        self.saldo = saldo
    
    def depositar(self, valor):
        pass  # Implemente
```

**Tarefa:**
```python
# test_banco.py
class TestContaCorrente(unittest.TestCase):
    def test_depositar_valor_positivo(self):
        # Complete aqui
    
    def test_depositar_valor_negativo(self):
        # Complete aqui (como deve se comportar?)

    def test_depositar_valor_nao_numerico(self):
        # Complete aqui (como deve se comportar?)
```

### 6. Testes de Componentes

**Exemplo Inicial:**
```python
# estoque.py
class Estoque:
    def __init__(self):
        self.itens = {}
    
    def adicionar_item(self, nome, quantidade):
        pass  # Implemente

# pedidos.py
class ProcessadorPedidos:
    def __init__(self, estoque):
        self.estoque = estoque
    
    def fazer_pedido(self, item, quantidade):
        pass  # Implemente
```

**Tarefa:**
```python
# test_pedidos.py
class TestIntegracaoPedidosEstoque(unittest.TestCase):
    def test_pedido_com_estoque_suficiente(self):
        # Complete aqui (teste o fluxo completo)
    
    def test_pedido_sem_estoque(self):
        # Complete aqui
```

### 7. Testes de Sistema 

**Exemplo Inicial:**
```python
# sistema.py
class SistemaCadastro:
    def __init__(self):
        self.usuarios = []
    
    def cadastrar(self, nome, email):
        # Implemente (não permita emails duplicados)
        pass
    
    def listar_usuarios(self):
        return self.usuarios
```

**Tarefa:**
```python
# test_sistema.py
class TestSistemaCadastro(unittest.TestCase):
    def test_fluxo_completo(self):
        # Teste desde o cadastro até a listagem
        sistema = SistemaCadastro()
        # Complete o teste
```

## Como Executar:

1. Para cada arquivo de teste, complete os testes e implementações
2. Execute os testes com:
```bash
python -m unittest discover -s . -p "test_*.py"
```

**DICA: Estude os princípios abaixo.**
- *RED-GREEN-REFACTOR* (TDD)
- Um teste = uma verificação
- Teste comportamentos, não implementações
