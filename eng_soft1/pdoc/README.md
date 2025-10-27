# Projeto Calculadora com pdoc

Este projeto demonstra como documentar funções Python com *docstrings* e gerar documentação HTML automaticamente com `pdoc`.

## Etapas para usar o pdoc

### 1. Instalar o pdoc

```bash
pip install pdoc
```

### 2. Gerar documentação HTML

```bash
python -m pdoc calculadora --output-dir docs
```

Isso cria uma pasta `docs` com a documentação do módulo `calculadora`.

### 3. Abrir a documentação

Abra o arquivo `docs/index.html`, que esta dentro da pasta `docs/`.

## Atividades

- Adicione novas funções com *docstrings* no módulo `operacoes.py`
- Tente adicionar comandos html dentro dos *docstrings* (o ``pdoc`` tem suporte a algumas tags HTML, como a tag ``img``)
- Rode novamente o comando `pdoc` e veja como a documentação muda
- Experimente alterar a formatação das docstrings e veja como isso impacta a documentação gerada
  - Verifique como usar as tags ``:type`` e `:rtype`
