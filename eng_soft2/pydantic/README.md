
# Modelagem e Validação de Dados em Python com Pydantic**

## **Objetivo**

Este estudo tem como objetivo compreender o uso da biblioteca **Pydantic** para **modelagem, validação e serialização de dados** em aplicações Python. 

O Pydantic é amplamente utilizado em sistemas modernos (APIs, microsserviços e backends) por garantir consistência de dados, redução de erros e maior confiabilidade do software.

## **Conteúdo**

---

## **1. O que é o Pydantic?**

O **Pydantic** é uma biblioteca Python que permite definir **modelos de dados fortemente tipados** usando **type hints**. A partir desses modelos, o Pydantic:

* Valida automaticamente os dados de entrada
* Converte tipos quando possível
* Gera mensagens de erro claras
* Facilita serialização e desserialização de dados (JSON ↔ objetos Python)

Ele é muito utilizado em frameworks como **FastAPI**, mas pode ser usado em qualquer projeto Python.

---

## **2. Por que usar Pydantic em Engenharia de Software?**

Em projetos de médio e grande porte, dados incorretos são uma das principais fontes de falhas. O Pydantic contribui para:

* **Qualidade de software**: valida dados antes de serem usados
* **Manutenibilidade**: modelos centralizam regras de negócio
* **Confiabilidade**: reduz erros em tempo de execução
* **Documentação implícita**: os modelos descrevem claramente a estrutura dos dados

---

## **3. Instalação do Pydantic**

Para instalar o Pydantic, utilize o `pip`:

```bash
pip install pydantic
```

---

## **4. Criando Modelos com Pydantic**

### **4.1 Estrutura Básica de um Modelo**

Um modelo Pydantic é uma classe que herda de `BaseModel`.

```python
from pydantic import BaseModel

class Usuario(BaseModel):
    nome: str
    idade: int
    email: str
```

Ao criar um objeto desse modelo, o Pydantic valida automaticamente os dados:

```python
usuario = Usuario(
    nome="Ana",
    idade=25,
    email="ana@email.com"
)
```

Se algum campo tiver tipo inválido, uma exceção será lançada.

---

## **5. Validação Automática de Dados**

### **Exemplo de Erro de Validação**

```python
Usuario(
    nome="Carlos",
    idade="vinte",
    email="carlos@email.com"
)
```

Saída esperada:

```
ValidationError: idade
  value is not a valid integer
```

Esse mecanismo evita que dados inválidos cheguem às camadas internas do sistema.

---

## **6. Conversão Automática de Tipos**

O Pydantic tenta converter tipos quando possível:

```python
usuario = Usuario(
    nome="Maria",
    idade="30",
    email="maria@email.com"
)

print(usuario.idade)  # 30 (int)
```

Essa funcionalidade é útil em APIs, onde os dados geralmente chegam como strings.

---

## **7. Validações Personalizadas**

### **7.1 Usando `@field_validator` (Pydantic v2)**

```python
from pydantic import BaseModel, field_validator

class Produto(BaseModel):
    nome: str
    preco: float

    @field_validator("preco")
    def preco_positivo(cls, valor):
        if valor <= 0:
            raise ValueError("O preço deve ser maior que zero")
        return valor
```

Esse tipo de validação permite implementar regras de negócio diretamente no modelo.

---

## **8. Campos Opcionais e Valores Padrão**

### **Campos Opcionais**

```python
from typing import Optional

class Cliente(BaseModel):
    nome: str
    telefone: Optional[str] = None
```

### **Valores Padrão**

```python
class Pedido(BaseModel):
    quantidade: int = 1
    ativo: bool = True
```

---

## **9. Serialização e Desserialização**

### **Convertendo para Dicionário**

```python
usuario.dict()
```

### **Convertendo para JSON**

```python
usuario.json()
```

Essas funcionalidades facilitam a comunicação com APIs, bancos de dados e arquivos.

---

## **10. Modelos Aninhados (Nested Models)**

O Pydantic suporta modelos dentro de modelos.

```python
class Endereco(BaseModel):
    rua: str
    cidade: str

class Usuario(BaseModel):
    nome: str
    endereco: Endereco
```

Uso:

```python
usuario = Usuario(
    nome="João",
    endereco={
        "rua": "Rua A",
        "cidade": "São Paulo"
    }
)
```

---

## **11. Boas Práticas no Uso do Pydantic**

* Centralizar modelos em um módulo específico (`models.py`)
* Usar validações para regras de negócio críticas
* Evitar lógica complexa dentro dos modelos
* Nomear modelos de forma clara e semântica
* Usar Pydantic como contrato de dados entre camadas do sistema

---

## **12. Aplicações do Pydantic em Projetos de Software**

* APIs REST (validação de requisições e respostas)
* Sistemas distribuídos e microsserviços
* Integração com bancos de dados
* Leitura e validação de arquivos JSON/YAML
* Comunicação entre camadas da aplicação

---

## **13. Conclusão**

O **Pydantic** é uma ferramenta fundamental para projetos modernos em Python, pois oferece validação robusta de dados baseada em tipos, aumentando a confiabilidade e a qualidade do software. Seu uso está alinhado com boas práticas de Engenharia de Software, como separação de responsabilidades, clareza estrutural e prevenção de erros.

---

## **Atividades Complementares**

1. **Prática Individual**
   Crie um modelo Pydantic para representar um sistema acadêmico (Aluno, Disciplina, Matrícula) com validações apropriadas.

2. **Prática em Grupo**
   Modele os dados de uma API fictícia (ex: sistema de pedidos) usando Pydantic e discuta como isso melhora a confiabilidade do sistema.

3. **Reflexão Teórica**
   Compare o uso de dicionários comuns com modelos Pydantic. Quais são os impactos na manutenção e na qualidade do código?
