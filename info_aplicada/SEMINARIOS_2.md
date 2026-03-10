# Seminários de Informática Aplicada

Este arquivo contem os seminários que podem ser passados para você no decorrer da disciplina.

**Sumário:**
- [Seminários de Informática Aplicada](#seminários-de-informática-aplicada)
  - [Objetivos da Atividade](#objetivos-da-atividade)
  - [Tópicos dos Seminários](#tópicos-dos-seminários)
    - [1. O "Gargalo de von Neumann" e a Corrida pela Velocidade](#1-o-gargalo-de-von-neumann-e-a-corrida-pela-velocidade)
    - [2. A Magia da Areia: Como a Quarta Geração Imprime Bilhões de Transistores](#2-a-magia-da-areia-como-a-quarta-geração-imprime-bilhões-de-transistores)
    - [3. O Limite Físico e o Futuro: Da Lei de Moore à Computação Quântica](#3-o-limite-físico-e-o-futuro-da-lei-de-moore-à-computação-quântica)
    - [4. Representação de Texto Digital: De ASCII ao Unicode e a Revolução dos Emojis](#4-representação-de-texto-digital-de-ascii-ao-unicode-e-a-revolução-dos-emojis)
    - [5. O Paradoxo do Armazenamento: Por que meu Pendrive de 16GB só tem 14.9GB?](#5-o-paradoxo-do-armazenamento-por-que-meu-pendrive-de-16gb-só-tem-149gb)


## Objetivos da Atividade

O objetivo destes seminários é avaliar suas competências e aptidões com relação às seguintes habilidades:

- Organização e estruturação do pensamento lógico-dedutivo
  - Clareza, encadeamento, coesão e coerência de ideias e pensamentos
- Fluência na comunicação de ideias de moderada / alta complexidade
  - Capacidade de explicar / ensinar conteúdos de natureza técnica, adaptando as metodologias, jargões, modelos e afins ao público-alvo
  - Capacidade de contextualizar, justificar e descrever suas ideias e soluções
- Capacidades associadas ao trabalho em equipe
  - Divisão e coordenação de esforços entre membros de um equipe, considerando as aptidões e habilidades individuais
- Gerenciamento de projetos e atividades de moderada / alta complexidade
  - Planejamento e organização de calendários / cronogramas de execução de atividades
  - Planejamento, organização e concepção de documentações, relatórios e modelos

## Tópicos dos Seminários

Seguem abaixo as especificações de cada tópico de seminário. Leia cada instrução com atenção para evitar erros e interpretações erradas.

**ATENÇÃO**: A interpretação da atividade é parte integral da avaliação.

### 1. O "Gargalo de von Neumann" e a Corrida pela Velocidade

**Subtópicos**:
- **O Problema Central**: Por que a arquitetura clássica de von Neumann  criou um gargalo estrutural, onde o processador é incrivelmente mais rápido do que a memória, forçando a CPU a ficar ociosa esperando os dados chegarem.
- **As Soluções Modernas**: Como a engenharia contornou isso com a criação da memória Cache (L1, L2, L3) dentro do próprio processador.
- **Arquiteturas Alternativas**: Uma breve comparação com a Arquitetura de Harvard (usada em microcontroladores modernos), que separa fisicamente os barramentos de dados e instruções para evitar esse congestionamento.

### 2. A Magia da Areia: Como a Quarta Geração Imprime Bilhões de Transistores

**Subtópicos**:
- **Do Transistor ao Microprocessador**: Como a indústria passou da Terceira Geração para a Quarta Geração, conseguindo miniaturizar componentes.
- **Fotolitografia**: Uma explicação acessível sobre como os processadores atuais são fabricados a partir do silício (areia), usando luz ultravioleta para "imprimir" circuitos em escala nanométrica.
- **A Lei de Moore e seus Limites**: Discutir a observação de Gordon Moore sobre a duplicação dos transistores e como a miniaturização está esbarrando em leis da física quântica (os transistores estão ficando tão pequenos que os elétrons começam a "vazar").

### 3. O Limite Físico e o Futuro: Da Lei de Moore à Computação Quântica

**Subtópicos**:
- **A Lei de Moore**: O que é, e por que os engenheiros dizem que ela está chegando ao seu limite físico (o tamanho dos átomos).
- **Novas Arquiteturas de Hardware**: A ascensão dos processadores ARM (como nos smartphones e Apple Silicon) em contraste com a arquitetura tradicional x86 dos PCs.
- **Computação Quântica**: Como os qubits funcionam, quebrando o paradigma de representação binária tradicional (bit e byte) que foi ensinado, e o que isso muda no poder de processamento.

### 4. Representação de Texto Digital: De ASCII ao Unicode e a Revolução dos Emojis

**Subtópicos**:
- **O Problema Inicial**: Como os primeiros computadores usavam a tabela ASCII, que com seus 7 ou 8 bits  só conseguia representar os caracteres do idioma inglês.
- **A Solução Global**: A transição para o padrão Unicode (e a codificação UTF-8), que utiliza múltiplos bytes para representar qualquer caractere de qualquer idioma do mundo (árabe, mandarim, cirílico).
- **A Inclusão dos Emojis**: Mostrar de forma técnica como os emojis são, na verdade, códigos Unicode interpretados visualmente pelos sistemas operacionais, provando as vastas possibilidades de representação de dados.

### 5. O Paradoxo do Armazenamento: Por que meu Pendrive de 16GB só tem 14.9GB?

**Subtópicos**:
**O Conflito Base 2 vs. Base 10**: Porque existe uma diferença comercial e técnica das grandezas da informática. O mercado vende armazenamento usando o Sistema Internacional (Base 10: 1 Kilobyte = 1000 bytes), enquanto os computadores leem em sistema binário (Base 2: 1 Kibibyte = 1024 bytes).
- **Além do Terabyte**: Explorar as grandezas que sustentam a internet moderna (Petabytes, Exabytes e Zettabytes) e o que isso representa em termos de volume de dados (ex: quantas horas de vídeo no YouTube equivalem a um Exabyte).
- **Compressão de Dados**: Como a computação lida com esse volume absurdo através de algoritmos de compressão (com perdas, como MP3/JPEG, e sem perdas, como ZIP), otimizando a representação da informação.