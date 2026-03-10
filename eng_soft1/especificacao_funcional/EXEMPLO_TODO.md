
# **Documento de Especificação Funcional (DEF)**

---

## 0. Visão geral do projeto

* **Nome do Software**: Lista de Tarefas Pessoal (ToDoApp)
* **Versão:** 1.0
* **Data:** 01/07/2025
* **Autor(es):** Fulano, Beltrano, Cicrano
* **Aprovado por:** Beltrano

---

## 1. Introdução

### 1.1 Propósito

Este documento descreve os requisitos funcionais e não funcionais do sistema **ToDoApp**, uma aplicação de lista de tarefas com interface gráfica, focada na organização pessoal do usuário.

### 1.2 Escopo

O sistema “ToDoApp” será uma aplicação local que permitirá aos usuários:

* Criar, editar e excluir tarefas;
* Marcar tarefas como concluídas;
* Organizar tarefas por categorias e datas;
* Filtrar tarefas por status (pendente/concluída);
* Visualizar notificações de tarefas próximas ao vencimento;
* Utilizar interface gráfica simples, responsiva e acessível.

O sistema será multiplataforma e operará offline.

### 1.3 Definições, acrônimos e abreviações

| Termo | Definição                                           |
| ----- | --------------------------------------------------- |
| GUI   | Interface Gráfica do Usuário                        |
| DEF   | Documento de Especificação Funcional                |
| ToDo  | Tarefa a ser realizada                              |
| CRUD  | Criar, Ler, Atualizar e Deletar (operações básicas) |
| UX    | Experiência do Usuário                              |

---

## 2. Descrição Geral

### 2.1 Perspectiva do Produto

O produto será um aplicativo local de gerenciamento de tarefas. Será desenvolvido em **Python 3.8+** utilizando uma biblioteca gráfica como **PyQt5**.

### 2.2 Funções do Produto

* Criar novas tarefas com título, descrição, data e categoria;
* Editar ou excluir tarefas existentes;
* Marcar tarefas como concluídas ou pendentes;
* Filtrar tarefas por status, data ou categoria;
* Exibir lembretes para tarefas com prazo próximo;
* Armazenar os dados localmente, mesmo sem conexão à internet.

### 2.3 Características dos Usuários

Usuários com conhecimentos básicos de informática, desejando melhorar sua organização pessoal. Não são necessários conhecimentos técnicos avançados.

### 2.4 Restrições

* Compatível com Python 3.8 ou superior;
* A interface deve ser responsiva e acessível;
* Não utilizar banco de dados online;
* O sistema deverá armazenar tarefas localmente em formato JSON.

### 2.5 Suposições e Dependências

* O usuário possui permissão para salvar arquivos locais;
* A máquina do usuário possui Python instalado;
* O usuário interage apenas com a GUI, sem linha de comando.

---

## 3. Requisitos Funcionais (RF)

| Código | Descrição                                                                             |
| ------ | ------------------------------------------------------------------------------------- |
| RF001  | O sistema deve permitir a criação de tarefas com título, descrição, data e categoria. |
| RF002  | O sistema deve permitir a edição de tarefas existentes.                               |
| RF003  | O sistema deve permitir a exclusão de tarefas.                                        |
| RF004  | O sistema deve permitir marcar/desmarcar tarefas como concluídas.                     |
| RF005  | O sistema deve listar tarefas por data de vencimento.                                 |
| RF006  | O sistema deve permitir filtragem por status (pendente/concluída).                    |
| RF007  | O sistema deve emitir lembretes para tarefas com prazo de vencimento próximo.         |
| RF008  | O sistema deve salvar todas as tarefas em um arquivo local JSON.                      |
| RF009  | O sistema deve permitir a busca por palavra-chave no título das tarefas.              |

---

## 4. Requisitos Não Funcionais (RNF)

| Código | Descrição                                                                      |
| ------ | ------------------------------------------------------------------------------ |
| RNF001 | O tempo de resposta ao abrir a lista de tarefas deve ser inferior a 1 segundo. |
| RNF002 | O sistema deve utilizar uma interface amigável e responsiva.                   |
| RNF003 | O arquivo local JSON não deve ultrapassar 10 MB.                               |
| RNF004 | A aplicação deve ser compatível com Windows, Linux e macOS.                    |
| RNF005 | O código deve seguir padrões de desenvolvimento limpo e modular.               |

---

## 5. Interfaces do Sistema

### 5.1 Interface do Usuário

A interface deve conter:

* Campo para adicionar nova tarefa;
* Lista de tarefas exibindo status, data e categoria;
* Botões para editar, excluir e marcar como concluída;
* Filtros por status, data e categoria;
* Área de notificações de tarefas urgentes;
* Campo de busca por título.

### 5.2 Interfaces de Hardware

Não se aplicam.

### 5.3 Interfaces de Software

* Python 3.8+
* Biblioteca gráfica: PyQt5 ou Tkinter
* Manipulação de arquivos JSON

### 5.4 Interfaces de Comunicação

Não se aplicam (sistema local, offline).

---

## 6. Requisitos de Qualidade

| Atributo         | Descrição                                                    |
| ---------------- | ------------------------------------------------------------ |
| Usabilidade      | Interface amigável e autoexplicativa, mesmo para iniciantes. |
| Confiabilidade   | Garantia de que as tarefas são salvas corretamente.          |
| Manutenibilidade | Código organizado por módulos e funções bem documentadas.    |
| Portabilidade    | Compatível com múltiplos sistemas operacionais.              |
| Eficiência       | Leve em memória e com baixo consumo de CPU.                  |

---

## 7. Casos de Uso

### 7.1. Criar uma Nova Tarefa

* O usuário preenche os campos de título, descrição, data e categoria.
* O usuário pressiona o botão "Adicionar".
* O sistema salva a tarefa e exibe na lista principal.

### 7.2. Marcar uma Tarefa como Concluída

* O usuário seleciona a tarefa.
* O usuário clica no botão “Concluir”.
* O sistema atualiza o status da tarefa para "Concluída".

---

## 8. Casos de Teste (CT)

| **Caso de Teste**             | **Entrada**                               | **Resultado Esperado**                     |
| ----------------------------- | ----------------------------------------- | ------------------------------------------ |
| CT001 (Criar tarefa)          | Título: “Estudar”, Data: 02/07/2025       | Tarefa é adicionada com sucesso            |
| CT002 (Marcar como concluída) | Selecionar tarefa e pressionar "Concluir" | Status da tarefa muda para “Concluída”     |
| CT003 (Excluir tarefa)        | Selecionar tarefa e pressionar “Excluir”  | Tarefa é removida da lista                 |
| CT004 (Filtro por status)     | Escolher “Pendentes”                      | Apenas tarefas não concluídas são exibidas |
| CT005 (Lembrete de tarefa)    | Tarefa com data de vencimento hoje        | Alerta é exibido na área de notificações   |
