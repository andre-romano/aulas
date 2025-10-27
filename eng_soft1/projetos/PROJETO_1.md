# Projeto de Sistema de Gerenciamento de Tarefas (TaskFlow)
---

**Sumário**:
- [Projeto de Sistema de Gerenciamento de Tarefas (TaskFlow)](#projeto-de-sistema-de-gerenciamento-de-tarefas-taskflow)
  - [1. Título do Projeto](#1-título-do-projeto)
  - [2. Objetivo do Projeto](#2-objetivo-do-projeto)
  - [3. Funcionalidades do Sistema](#3-funcionalidades-do-sistema)
  - [4. Metodologias e Tecnologias Utilizadas](#4-metodologias-e-tecnologias-utilizadas)
  - [5. Entregáveis](#5-entregáveis)
  - [6. Apresentação](#6-apresentação)
  - [7. Avaliação](#7-avaliação)
    - [Critérios avaliativos](#critérios-avaliativos)

## 1. Título do Projeto  
Sistema de Gerenciamento de Tarefas (TaskFlow)  

## 2. Objetivo do Projeto  
Desenvolver um sistema de gerenciamento de tarefas pessoais, permitindo a criação, organização, priorização e acompanhamento de atividades, com funcionalidades como:  
- Cadastro de usuários e autenticação.  
- Criação, edição e exclusão de tarefas.  
- Categorização por projetos, tarefas e usuários.  
- Notificações e lembretes.  
- Relatórios de produtividade.  

## 3. Funcionalidades do Sistema
- Cadastro e login de usuários
  - Usuários podem ter papeis no sistema (Gerente, Desenvolvedor ou Analista de Q/A)
- CRUD (Create, Read, Update, Delete) de projetos e tarefas 
  - Somente o Gerente pode criar ou apagar tarefas e projetos
- Classificação de tarefas por prioridade (alta, média, baixa)
  - Somente o Gerente pode fazer isso
- Atribuição de tarefas a projetos e usuários específicos
  - Somente o Gerente pode fazer isso
  - Podem ter mais de um usuário vinculado a uma mesma tarefa
  - Podem ter mais de uma tarefa vinculada a um mesmo projeto
- Tarefas tem prazos para serem concluídas (deadlines)
- Geração de relatórios de desempenho
  - Percentual de tarefas criadas x concluídas x deadline ultrapassado do total de tarefas de um projeto especifico
  - Média de tarefas atribuídas a cada usuário
  - Desempenho de cada usuário (percentual de tarefas concluídas dentro do prazo)

## 4. Metodologias e Tecnologias Utilizadas
- **Metodologia Ágil:** XP + Scrum (pode usar Kanban e 6-Sigma como técnicas complementares)
- **Frontend**: HTML + CSS + Javascript
- **Backend**: Python
- **Controle de Versão:** Git + GitHub
- **Documentação**: [PDoc](../pdoc/) + [PlantUML](../plantuml/)
- **Protótipos e Mockups (telas)**: Figma, Canva e/ou Draw.io

## 5. Entregáveis

- Cronograma previsto de atividades
  - Gráfico de GANTT (veja exemplo no [PlantUML](../plantuml/))
  - Formato `.pdf`, `.png`, ou `.jpg`
- Documento de Especificação Funcional (DEF)
  - Deve seguir as normas da IEEE/ISO
  - Formato ``.pdf``
- Diagramas UML
  - Diagramas de casos de uso 
  - Diagramas de classes
  - Diagramas de sequencia (pelo menos 2 diagramas)
  - Formato `.pdf`, `.png`, ou `.jpg`
- Repositório do Projeto no GitHub
  - Código fonte do projeto
  - Documentação do sistema na pasta `docs/`
    - Documentação automatizada gerada por ferramentas como o [PDoc](../pdoc/)
    - Formato `.html` (com CSS, JS e demais arquivos)  
- Relatório técnico
  - Deve **seguir os padrões mais recentes da ABNT**
  - **Conteúdo**:
    - Nome dos integrantes
    - Link para o repositório do projeto no GitHub
    - Descrição do projeto e das funcionalidades
    - Descrição das funcionalidades implementadas em cada *sprint* do Scrum
    - Telas do sistema (*mockups* e exemplos de uso)
  - Formato `.pdf`

**OBS**: Os entregáveis serão divididos em entregas parciais ao longo da disciplina, conforme cronograma previsto de aulas e instruções do professor.

## 6. Apresentação

- **Tempo**: 15 a 25 min
- **Formato**: Livre
  - Apresentação com slides (``.ppt`` ou `.pdf`)
  - Abertura de arquivos de diagramas UML, documentação do sistema, mockups, etc 
  - Execução do sistema durante a apresentação
- **Conteúdo**:
  - Explicação dos diagramas UML.    
  - Explicação detalhada acerca das tecnologias e metodologias usadas no projeto.
    - Quais tecnologias, ferramentas e metodologias foram usadas?
    - Como foram usadas?
  - Demonstração dos recursos do sistema.  

## 7. Avaliação

- **Apresentação:** peso 5
  - Avaliação é composta pelo desempenho do grupo e de cada membro (individual)
- **Relatório:** peso 5

### Critérios avaliativos
- Clareza na apresentação
- Coesão na apresentação das ideias
- Domínio do conteúdo
- Uso da norma culta da lingua portuguesa (ortografia, gramatica, etc)
- Uso adequado das normas da ABNT para escrita de trabalhos acadêmicos
- Uso adequado das normas, diretrizes e padrões de engenharia de software
  - Diagramas seguindo padrões UML,  
  - Normas ISO / IEEE,
  - etc

**DICAS**: 
- Consulte o material disponibilizado no GitHub da disciplina e no Google Classroom. 
- Assista as video-aulas e leia os tutoriais. 
- Se organize para conseguir cumprir as etapas do projeto dentro dos prazos previstos, conforme cronograma de atividades criado pelo grupo.

**Seguem abaixo artigos sobre a importância da organização e disciplina na vida pessoal / profissional e acadêmica:**
  - [5S: o método japonês para melhoria da produtividade](https://www.wizard.com.br/carreira/5s-o-metodo-japones-que-promete-melhorar-a-produtividade-no-trabalho/)
  - [6-Sigma: ferramenta de gestão para melhoria contínua de processos](https://sebrae.com.br/sites/PortalSebrae/artigos/seis-sigma-e-ferramenta-de-melhoria-continua-para-as-empresas,688ebbd38f896810VgnVCM1000001b00320aRCRD)
