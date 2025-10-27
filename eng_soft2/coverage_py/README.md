# Projeto Calculadora com Coverage.py

Este projeto visa demonstrar como medir a cobertura de testes com `coverage.py` em um projeto Python.

## Instruções

### 1. Instale as dependências

```bash
pip install pytest coverage
```

### 2. Execute os testes 

```bash
python -m coverage run -m pytest
```

### 3. Gere o relatório de cobertura no terminal

```bash
python -m coverage report -m
```

### 4. Gere um relatório em HTML

```bash
python -m coverage html
```

Depois, abra o arquivo `htmlcov/index.html` no navegador.

## Observação

Nem todas as funções estão cobertas por testes! 

Modifique esse projeto para testar os trechos de código que ainda não foram testados, conforme identificados nos relatóriso do ``coverage.py``.

Após **QUALQUER** modificação nos arquivos, voce precisará reexecutar os testes usando o ``coverage.py`` (**passo 2**) antes de gerar os relatórios novamente!
