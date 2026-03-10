# Projeto - Aplicação de Chat Cliente-Servidor

**Sumario**:
- [Projeto - Aplicação de Chat Cliente-Servidor](#projeto---aplicação-de-chat-cliente-servidor)
  - [1. Descrição Geral do Projeto](#1-descrição-geral-do-projeto)
  - [2. Linguagens de programação permitidas](#2-linguagens-de-programação-permitidas)
  - [3. Arquivos do Projeto](#3-arquivos-do-projeto)
    - [3.1. Scripts para gerenciamento de dependências do projeto](#31-scripts-para-gerenciamento-de-dependências-do-projeto)

## 1. Descrição Geral do Projeto

Os alunos devem trabalhar em equipes para implementar um sistema distribuído que atenda aos seguintes requisitos:

- **Escopo do Sistema**: Criar uma aplicação cliente-servidor para uma rede fictícia de compartilhamento de informações, com funcionalidades como:
    - Cadastro de usuários.
    - Envio e recebimento de mensagens em tempo real (chat).
    - Transferência de arquivos entre clientes.
    - Registros e logs de atividade.
- **Requisitos Técnicos**:
   - Implementação de sockets TCP e UDP.
   - Suporte para comunicação simultânea de múltiplos clientes (concorrência com threads ou processos).
   - Mecanismos básicos de autenticação (login/senha).
   - Tratamento de erros e reconexão em caso de falhas.
   - Criptografia básica para troca de mensagens (ex.: AES ou RSA).
   - Controle de tráfego (ex.: limitar o número de conexões simultâneas por cliente).
- **Funcionalidades Extras (Opcional)**:
   - Chat em grupo (multicast).
   - Suporte para comunicação em tempo real com áudio ou vídeo (bônus).
   - Interface gráfica simples (ex.: Tkinter, PyQt ou similar).

## 2. Linguagens de programação permitidas

O grupo pode escolher qualquer linguagem de programação dentre as listadas abaixo:
- C/C++
- Java
- Python 3

**OBS:** O código deve compilar e executar em maquinas com sistema operacional Windows.

## 3. Arquivos do Projeto

A fim de facilitar o inicio do projeto, segue um *template* do projeto para linguagem de programação Python

- **client.py**
  - Contem o código do cliente, que ira se conectar ao servidor de aplicação
- **server.py**
  - Contem o código do servidor, que ira gerenciar a comunicação entre clientes diferentes
- **crypto.py**
  - Contem o código para criptografar as conexões entre clientes e entre cliente-servidor

### 3.1. Scripts para gerenciamento de dependências do projeto
- **install.bat** 
   - Configura o ambiente virtual do Python ``venv`` e instala as dependências listadas no arquivo `requirements.txt`
- **run_client.bat** e **run_server.bat**
   - Ativa o ambiente virtual do Python ``venv`` e executa o cliente ou servidor, respectivamente
