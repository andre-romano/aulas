# Projeto Calculadora com Pylance

Este projeto demonstra como usar o `pylance` para análise estática de código Python.

## Objetivo

Identificar problemas de tipagem estática e boas práticas com `pylance`.

## Passos

### 1. Instalar o Pylance (no VS Code)

- Abra o terminal do VS Code (``Ctrl + P``).
- Digite o seguinte comando para instalar a extensão:

```bash
ext install ms-python.vscode-pylance
```

## Atividade

1. Abra os arquivos ``.py`` no VS Code
2. Verifique os erros identificados pelo ``pylance`` no VS Code.
3. Corrija os erros identificados.
4. Verifique se os erros foram corrigidos.
5. Experimente remover as anotações de tipo e veja o que a ferramenta é capaz de detectar.

## Configuração do pylance

Internamente o ``pylance`` usa várias ferramentas de análise estática de código (incluindo o ``pyright``). Por isso ele consegue ser bastante completo em sua análise.

O ``pylance`` pode ser configurado de duas formas:
- Através do arquivo ``pyrightconfig.json``, que configura o ``pyright`` (veja documentação oficial [aqui](https://microsoft.github.io/pyright/))
- **OU**
- Através do arquivo [.vscode/settings.json](.vscode/settings.json), que configura o VS Code (veja exemplos [aqui](https://code.visualstudio.com/docs/python/editing))

Neste projeto, estamos usando somente o arquivo ``.vscode/settings.json`` para configuração, a fim de evitar problemas no ``pylance``.