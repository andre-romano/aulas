
# **Documento de Especificação Funcional (DEF)**

---

## 0. Visão geral do projeto

- **Nome do Software**: Calculadora simples
- **Versão:** 1.0
- **Data:** \[DD/MM/YYYY\]
- **Autor(es):** \[Seu Nome ou Equipe\]
- **Aprovado por:** \[Responsável pelo projeto\]

## 1. Introdução

### 1.1 Propósito

Este documento descreve as funcionalidades, interfaces e comportamentos esperados para o sistema **Calculadora**, cujo objetivo é permitir que usuários realizem operações aritméticas básicas e avançadas com facilidade e precisão.

### 1.2 Escopo

O sistema "Calculadora" será uma aplicação de interface gráfica (GUI) que permitirá ao usuário realizar as seguintes operações:

* Operações básicas: soma, subtração, multiplicação e divisão;
* Operações científicas: potência, raiz quadrada, logaritmo, seno, cosseno, tangente;
* Histórico de operações;
* Suporte a parênteses e precedência de operadores;
* Interface amigável, responsiva e acessível.

A aplicação será multiplataforma (Windows, Linux, macOS) e poderá ser utilizada tanto por estudantes quanto por profissionais.

### 1.3 Definições, acrônimos e abreviações

| Termo   | Definição                                         |
| ------- | ------------------------------------------------- |
| GUI     | Interface Gráfica do Usuário                      |
| IEEE    | Institute of Electrical and Electronics Engineers |
| DEF     | Documento de Especificação Funcional              |
| Usuário | Pessoa que interage com o sistema calculadora     |

## 2. Descrição Geral

### 2.1 Perspectiva do Produto

O sistema será desenvolvido como uma aplicação independente, podendo ser executado localmente. Será desenvolvido em linguagem Python com biblioteca gráfica (ex: PyQt5 ou Tkinter).

### 2.2 Funções do Produto

O sistema deve oferecer as seguintes funcionalidades:

* Permitir entrada de números e operações via botões na interface;
* Exibir o resultado de uma expressão;
* Validar expressões matemáticas;
* Exibir mensagens de erro em caso de entrada inválida;
* Manter um histórico das últimas 10 operações;
* Suporte a operações científicas em modo avançado.

### 2.3 Características dos Usuários

O público-alvo abrange usuários com familiaridade básica com sistemas operacionais e matemática. Nenhum conhecimento técnico adicional é exigido.

### 2.4 Restrições

* O sistema deverá ser compatível com Python 3.8 ou superior;
* A interface deverá ser responsiva e acessível (uso de fontes legíveis, contraste adequado);
* Não será necessário conexão com a internet para operar;
* O sistema não armazenará dados em nuvem.

### 2.5 Suposições e Dependências

* A máquina do usuário possui Python instalado;
* O sistema operacional possui permissões para executar o programa;
* O usuário não digitará fórmulas diretamente, mas sim usará a interface gráfica.

---

## 3. Requisitos Funcionais (RF)

| Código | Descrição                                                                                            |
| ------ | ---------------------------------------------------------------------------------------------------- |
| RF001  | O sistema deve permitir realizar operações de adição, subtração, multiplicação e divisão.            |
| RF002  | O sistema deve exibir o resultado após o pressionamento do botão "=".                                |
| RF003  | O sistema deve validar e rejeitar expressões matemáticas inválidas, exibindo mensagem de erro.       |
| RF004  | O sistema deve manter um histórico das últimas 10 operações realizadas.                              |
| RF005  | O sistema deve suportar o uso de parênteses e respeitar a precedência de operadores.                 |
| RF006  | O sistema deve oferecer funções científicas como seno, cosseno, tangente, raiz quadrada e logaritmo. |
| RF007  | O sistema deve permitir limpar a tela de entrada com um botão "C".                                   |
| RF008  | O sistema deve permitir alternar entre modo básico e modo científico.                                |

---

## 4. Requisitos Não Funcionais (RNF)

| Código | Descrição                                                                              |
| ------ | -------------------------------------------------------------------------------------- |
| RNF001 | O tempo de resposta da operação deve ser inferior a 0,5 segundos.                      |
| RNF002 | A interface gráfica deve seguir princípios de usabilidade e acessibilidade.            |
| RNF003 | O sistema deve ocupar no máximo 50 MB em disco.                                        |
| RNF004 | O sistema deve estar disponível para os sistemas operacionais Windows, Linux e macOS.  |
| RNF005 | O sistema deve estar em conformidade com a norma IEEE 829 para documentação de testes. |

---

## 5. Interfaces do Sistema

### 5.1 Interface do Usuário

A interface deve conter:

* Um visor para entrada e exibição de resultados;
* Botões numéricos (0 a 9);
* Botões de operações básicas e científicas;
* Botão de limpar (C);
* Botão "=";
* Alternância entre modos: básico e científico;
* Seção de histórico.

### 5.2 Interfaces de Hardware

Não se aplicam.

### 5.3 Interfaces de Software

* Python 3.8+
* Biblioteca gráfica: PyQt5 ou Tkinter

### 5.4 Interfaces de Comunicação

Não se aplicam (sistema local, offline).


## 6. Requisitos de Qualidade

| Atributo         | Descrição                                                         |
| ---------------- | ----------------------------------------------------------------- |
| Usabilidade      | Interface intuitiva e simples, adequada para usuários iniciantes. |
| Confiabilidade   | Precisão nos cálculos com validação de erros.                     |
| Manutenibilidade | Código modular e documentado, facilitando atualizações futuras.   |
| Portabilidade    | Suporte a múltiplos sistemas operacionais.                        |
| Eficiência       | Baixo consumo de recursos computacionais.                         |

## 7. Casos de Uso

### 7.1. Realizar uma Soma

- O usuário digita o primeiro número.
- O usuário pressiona "+".
- O usuário digita o segundo número.
- O usuário pressiona "=".
- O sistema exibe o resultado.

## **8. Casos de Teste (CT)**  

| **Caso de Teste**        | **Entrada** | **Resultado Esperado** |
| ------------------------ | ----------- | ---------------------- |
| CT001 (Soma)             | 5 + 3       | 8                      |
| CT002 (Divisão por zero) | 10 / 0      | "Erro"                 |
| CT003 (Raiz quadrada)    | √9          | 3                      |
