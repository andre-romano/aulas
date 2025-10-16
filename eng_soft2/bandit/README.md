# Projeto Calculadora com Bandit

Este projeto visa demonstrar o uso do `bandit`, uma ferramenta de análise estática de segurança para código Python.

## Objetivo

Identificar e corrigir trechos de código inseguros, detectados pelo Bandit como vulnerabilidades de segurança:
- Função insegura `executar_comando()`, que utiliza a chamada de sistema `subprocess.call` com `shell=True`

## Instruções

### 1. Instale as dependências

```bash
pip install bandit
```

### 2. Execute o Bandit neste projeto

```bash
python -m bandit -r calculadora
```

### 3. Correção das vulnerabilidades identificadas

- Interprete os resultados fornecidos pelo Bandit
- Pesquise porque ``subprocess.call(shell=True)`` é considerada como uma vulnerabilidade
- Refatore o código inseguro
- Confirme que a nova versão passou sem alertas (execute o **passo 2** novamente)

