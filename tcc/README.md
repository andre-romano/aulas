# Trabalho de Conclusão de Curso

**Sumário**:

- [Trabalho de Conclusão de Curso](#trabalho-de-conclusão-de-curso)
  - [1. Escolha do Tema](#1-escolha-do-tema)
  - [2. Estrutura do TCC](#2-estrutura-do-tcc)
  - [3. Escrita Acadêmica](#3-escrita-acadêmica)
  - [4. Orientação e Feedback](#4-orientação-e-feedback)
  - [5. Apresentação do TCC](#5-apresentação-do-tcc)
  - [6. Exemplos de Estrutura para TCC](#6-exemplos-de-estrutura-para-tcc)
  - [7. Ferramenta de Edição de Texto](#7-ferramenta-de-edição-de-texto)
    - [7.1. Word, LibreOffice, Google Docs ou Similares](#71-word-libreoffice-google-docs-ou-similares)
      - [7.1.1. Modelos para ADS/COMPUT (cursos superiores)](#711-modelos-para-adscomput-cursos-superiores)
      - [7.1.2. Modelos para COINF (curso integrado)](#712-modelos-para-coinf-curso-integrado)
    - [7.2. LaTeX](#72-latex)
      - [7.2.1. IDE para edição e compilação LaTeX](#721-ide-para-edição-e-compilação-latex)
      - [7.2.2. Documentos para Defesa de TCC (IFBA Valença)](#722-documentos-para-defesa-de-tcc-ifba-valença)
      - [7.2.3. Modelo de TCC (IFBA Valença)](#723-modelo-de-tcc-ifba-valença)
      - [7.2.4. Documentações e Tutoriais](#724-documentações-e-tutoriais)
  - [8. Considerações Finais](#8-considerações-finais)

## 1. Escolha do Tema

- **Relevância**: Escolha um tema que seja relevante para a sua área de estudo e que desperte seu interesse.
- **Originalidade**: Tente encontrar um ângulo original ou uma abordagem inovadora para o tema escolhido.
- **Viabilidade**: Certifique-se de que você tem acesso aos recursos e dados necessários para realizar a pesquisa.

## 2. Estrutura do TCC

Estruture o texto com seções e subseções claramente definidas, utilizando numeração para facilitar a navegação.

  - **Exemplo (escrito em LaTeX)**: 
    ```latex
    \section{Fundamentação Teórica}
    \subsection{Inteligencia Artificial}
    \subsubsection{IA Restrita}
    ```
  - **Exemplo (escrito em Word)**: 
    ```txt
    2) Fundamentação Teórica
    2.1) Inteligencia Artificial
    2.1.1) IA Restrita
    ```

Um trabalho de conclusão de curso (TCC) possui os seguintes capítulos, seções e subseções:
- **Capa**: Inclui o título do trabalho, seu nome, nome do orientador, nome da instituição, curso e ano.

- **Folha de Rosto**: Contém as mesmas informações da capa, com a adição do nome da instituição e curso na parte superior.
- **Dedicatória (opcional)**: Opção para dedicar o trabalho a alguém.
- **Agradecimentos (opcional)**: Opção para agradecer a quem contribuiu para a realização do TCC.
- **Resumo**: Breve descrição do objetivo, metodologia, resultados e conclusões do trabalho (aproximadamente 250 palavras).
- **Abstract**: Versão do resumo em inglês.
- **Sumário**: Lista das seções e subseções com os respectivos números de página.
- **Lista de Figuras e Tabelas (opcional)**: Se necessário, inclua listas de figuras, tabelas e abreviaturas usadas no trabalho.
- **Introdução**: Apresenta o tema, a justificativa, os objetivos e a estrutura do trabalho. Você pode separar esses tópicos em seções no seu trabalho, a fim de organizá-lo melhor, da seguinte forma:
  - **Contextualização e Motivação**: Apresenta o tema e a justificativa do trabalho, trazendo a sua motivação e relevância.
  - **Problema**: Breve descrição do problema ser solucionado pela proposta do TCC. 
  - **Proposta de Solução**: Breve descrição da proposta de solução do TCC.
  - **Objetivo Geral**: Um parágrafo que define o que se deseja alcançar com a solução proposta.
  - **Objetivos Específicos**: Detalha o objetivo geral, fornecendo uma lista de objetivos específicos que se deseja alcançar. Cada item da lista deve começar com um verbo no infinitivo que você possa avaliar ao final do seu TCC, na seção de *Resultados e Discussão*. 
    - **Ex**:
      - Reduzir tráfego de rede de Internet das Coisas (IoT)
      - Aumentar a autonomia de bateria de um dispositivo IoT.
    - **IMPORTANTE 01**: Esta seção deve possui APENAS a descrição do que se deseja alcançar com o trabalho, e nada mais. Aqui nao é o local para descrever a metodologia usada no trabalho (ex: "realizar a revisão de literatura", "construir ou implementar a solução", "comparar a solução proposta com XYZ"). Isto é, o "passo-a-passo" realizado ao longo do trabalho pertence a seção de metodologia e nao aos objetivos.
    - **IMPORTANTE 02**: Nesta seção (objetivos gerais e específicos) evite verbos que gerem ambiguidade ou que sejam difíceis de avaliar, tais como, "compreender", "estudar", "facilitar a compreensão", "avaliar a compreensão de", "interpretar", dentre outros. Os verbos devem ser sempre claros, sem ambiguidade, e que possam ser avaliados com objetividade na seção de *Resultados e Discussão*.
    
- **Fundamentação Teórica**: Discute o estado atual do conhecimento sobre o tema, citando estudos relevantes. 
  - Aqui devemos nos ater SOMENTE ao que existe na literatura. Isto é, ao que foi descrito em algum artigo, livro ou outro material. 
  - Devemos SEMPRE citar a fonte das informações no texto.
- **Metodologia (ou Procedimentos Metodológicos)**: Descreve os métodos e procedimentos utilizados para conduzir a pesquisa.
  - *"Passo-a-passo realizado para construir a proposta e escrever o TCC"*
- **Resultados e Discussão (ou Análise dos Resultados)**: Apresenta e analisa os dados coletados, discutindo-os à luz da literatura revisada.
  - Aqui você DEVE avaliar se seus objetivos foram alcançados, de acordo com os resultados obtidos.
  - Você também pode comparar sua solução com outras existentes na literatura, ressaltando os aspectos em que a sua proposta é melhor que as demais. 
- **Conclusão (ou Considerações Finais)**: Resume os principais achados, discute suas implicações e sugere futuras pesquisas. Geralmente possui alguns poucos parágrafos.
  - *"Pequeno e (bem) breve resumo do seu trabalho, incluindo contextualização, justificativa, proposta, resultados, limitações da sua pesquisa, e próximos passos."*
- **Referências**: Lista todas as fontes citadas no trabalho, seguindo as normas da ABNT exigidas pela instituição. 
  - Essas normas podem ser consultadas [neste link](https://usp.br/sddarquivos/arquivos/abnt6023.pdf) da USP e [neste outro](https://www.ufpe.br/documents/40070/1837975/ABNT+NBR+6023+2018+%281%29.pdf/3021f721-5be8-4e6d-951b-fa354dc490ed) da UFPE.
- **Anexos (opcional)**: Inclui materiais suplementares que não foram incluídos no corpo principal do texto, como questionários, gráficos detalhados, etc.

## 3. Escrita Acadêmica

- **Clareza e Objetividade**: Escreva de forma clara e direta, evitando jargões e termos técnicos desnecessários.
- **Formalidade**: Use linguagem formal e evite gírias ou expressões coloquiais. 
  - **Exemplo**: Em vez de "A IA está bombando", use "A Inteligência Artificial está em crescente desenvolvimento".
- **Evite Primeira Pessoa**: Utilize a terceira pessoa ou a voz passiva para manter a formalidade.
  - **Exemplo**: Em vez de "Neste trabalho, eu discuto...", use "Neste trabalho, discute-se..." 
- **Vocabulário Técnico**: Utilize terminologia específica e técnica apropriada para o campo de estudo.
  - **Exemplo**: Utilize "processamento de linguagem natural" em vez de "análise de textos".
- **Coesão e Coerência**: Estruture suas ideias de maneira lógica e mantenha a coerência ao longo do texto.
- **Parágrafos Coesos (Autocontidos)**: Cada parágrafo deve abordar um único tópico ou ideia principal, com sentenças claras e coesas. Evite ambiguidades.
- **Transições Claras**: Use frases de transição para ligar parágrafos e seções, mantendo o fluxo de ideias lógico.
  - **Exemplo**: "Além disso, o aprendizado não supervisionado oferece métodos para a análise de dados sem rótulos pré-definidos."
- **Sentenças Coesas (Pequenas)**: Sentenças menores sao mais claras e coesas, o que facilita a leitura e entendimento do texto. Evite ambiguidades.
- **Definições Claras**: Defina termos técnicos na primeira vez que aparecem e use-os consistentemente. Evite ambiguidades.
  - **Exemplo**: "Aprendizado de Máquina (ML, do inglês Machine Learning) é..."
- **Uso de Abreviações e Siglas**: Ao usar siglas ou abreviações, defina-as na primeira ocorrência e utilize a forma abreviada posteriormente.
  - **Exemplo**: "Redes Neurais Artificiais (RNA) são... As RNA são amplamente utilizadas..."
- **Consistência Terminológica**: Use os mesmos termos e expressões ao longo do texto para evitar confusões.
  - **Exemplo**: Se optar por usar "IA" para Inteligência Artificial, mantenha esse uso consistentemente. Nao use IA e AI dentro do mesmo texto.
- **Citações e Referências**: Cite todas as fontes consultadas e siga rigorosamente as normas de citação e referência da ABNT, exigidas pela instituição. Essas normas podem ser consultadas [neste link](https://usp.br/sddarquivos/arquivos/abnt6023.pdf) da USP e [neste outro](https://www.ufpe.br/documents/40070/1837975/ABNT+NBR+6023+2018+%281%29.pdf/3021f721-5be8-4e6d-951b-fa354dc490ed) da UFPE.
  - **Exemplo**: "Segundo Haugeland (1985), a IA..."
  - **Exemplo 2**: "A IA é ... (HAUGELAND, 1985)."  
- **Revisão e Edição**: Revise o texto várias vezes para corrigir erros gramaticais, ortográficos e de formatação.   

## 4. Orientação e Feedback
- **Orientador**: Mantenha contato regular com seu orientador e siga suas orientações.
- **Feedback de Colegas**: Peça a colegas para revisar seu trabalho e oferecer sugestões de melhoria.
- **Feedback de Outros Trabalhos**: Leia outros trabalhos de conclusão para identificar pontos de melhoria no seu trabalho.
  - **Sugestão**: Busque os trabalhos nos repositórios públicos da sua instituição.
    - **Exemplo**: [Repositório Institucional da UFBA](https://repositorio.ufba.br/simple-search).

## 5. Apresentação do TCC
- **Preparação**: Prepare uma apresentação clara e concisa do seu trabalho, destacando os pontos principais.
- **Slides**: Use os modelos de slides propostos para apoiar sua apresentação, evitando excesso de texto.
  - Os slides devem estar em formato de tópicos, contendo figuras que facilitem o entendimento da discussão. Veja a sugestão abaixo de ordem de apresentação de cada tópico:
    - **Introdução / Contextualização**
    - **Problema**
    - **Trabalhos relacionados**
    - **Justificativa**
    - **Proposta**
    - **Objetivos e Metodologia**
    - **Discussão e Resultados**
    - **Conclusão**
- **Prática**: Pratique a apresentação várias vezes para ganhar confiança e fluência. 
  - **Tempo de Apresentação:** Se atente ao tempo de apresentação para nao exceder o limite máximo previsto no regimento da instituição.

## 6. Exemplos de Estrutura para TCC
- **Exemplo 1: Área de Ciências Exatas**
  - **Título**: "Desenvolvimento de um Sistema de Monitoramento de Rede Utilizando NMAP e Conformidade com as Normas ISO 27001 e 27002"
  - **Introdução**: Contextualização da importância da segurança de redes.
  - **Revisão de Literatura**: Estudos sobre NMAP e normas ISO 27001 e 27002.
  - **Metodologia**: Descrição do desenvolvimento do sistema e testes realizados.
  - **Resultados e Discussão**: Análise dos resultados obtidos com o sistema.
  - **Conclusão**: Resumo dos principais achados e sugestões para futuros aprimoramentos.

## 7. Ferramenta de Edição de Texto

Existem varias ferramentas para edição, correção ortográfica e semântica de texto. As mais utilizadas são o Word (ou LibreOffice) ou LaTeX ([Overleaf](http://www.overleaf.com)).

### 7.1. Word, LibreOffice, Google Docs ou Similares

Permitem editar e visualizar rapidamente o documento. O usuário consegue ver a formatação e layout do documento final conforme ele é editado.

- **Vantagens**:
  - Praticidade.
  - Facilidade de uso.
  - Extensa documentação online sobre como utilizar.
  
- **Desvantagens**:
  - Dificuldade para criação de sumários e listas de figuras.
  - Dificuldade para organizar as referências de um trabalho científico (TCC, artigos, etc).
  - Dificuldade para numerar figuras e tabelas (o usuário deve numerá-los manualmente).
  - Nao fornece suporte a citações ABNT (o usuário deve criar as citações manualmente, seguindo as normas da ABNT).

#### 7.1.1. Modelos para ADS/COMPUT (cursos superiores)

Modelos (formato DOC / DOCX) para escrita da monografia, bem como demais documentos necessários para defesa (Ata de defesa, Termo de aprovação, etc) de TCC de ADS/COMPUT podem ser encontrados na pasta [./ads_comput/](./ads_comput/).


#### 7.1.2. Modelos para COINF (curso integrado)

Modelos (formato DOC / DOCX) para escrita da monografia, bem como demais documentos necessários para defesa de TCC de COINF (curso integrado em Informática) podem ser encontrados na pasta [./coinf/](./coinf/).

### 7.2. LaTeX

O LaTeX (se fala: "*latech*") permite editar um documento de texto, sem se preocupar com aspectos estéticos, estilísticos, de layout, de formatação, de numeração, de organização (de seções, figuras ou tabelas), ou de citação (ABNT, Chicago, Vancouver, etc). Isto é, o foco está no conteúdo do texto, sendo que o restante é realizado pela ferramenta LaTeX através de comandos e modelos previamente definidos.

- **Vantagens**:
  - Facilidade para organizar o texto em capítulos, seções, e subseções.
  - Facilidade para numerar figuras, tabelas, algoritmos, diagramas e anexos.
  - Facilidade para inserir citações e referencial bibliográfico padronizado (ABNT, IEEE, etc).
  - Facilidade para inserir trechos de códigos (Python, Java, etc).
  - Facilidade para inserir fórmulas, equações ou funções matemáticas.
  - Extensa documentação online sobre como utilizar.
  
- **Desvantagens**:
  - É necessário compilar o documento para visualizar seu layout e formatação finais.
  - O documento gerado é em formato PDF ou EPS.
  - Requer uma curva de aprendizado para utilizar a linguagem de edição de texto LaTeX, que em muitos aspectos é parecida com uma linguagem de programação convencional.

#### 7.2.1. IDE para edição e compilação LaTeX

A ferramenta [Overleaf](http://www.overleaf.com) é a IDE LaTeX mais simples e fácil de utilizar.  Trata-se de um editor de texto LaTeX online que facilita a escrita e compilação de textos acadêmicos, permitindo que uma ou mais pessoas editem o mesmo documento LaTeX simultaneamente. 
  
O Overleaf permite a compilação e edição de:
  - Monografias
  - Trabalhos acadêmicos
  - Relatórios
  - Slides
  - Entre outros

#### 7.2.2. Documentos para Defesa de TCC (IFBA Valença)

Para acessar o modelo LaTeX para criar os documentos necessários para a defesa de TCC do IFBA campus Valença (Ata de defesa, Termo de Aprovação, Carta convite para membros da banca, entre outros), siga as instruções contidas no repositório do GitHub abaixo:

[https://github.com/andre-romano/ifba_val_defesa/](https://github.com/andre-romano/ifba_val_defesa/)

#### 7.2.3. Modelo de TCC (IFBA Valença)

Para acessar o modelo LaTeX para TCC do IFBA campus Valença, siga as instruções contidas no repositório do GitHub abaixo:

[https://github.com/andre-romano/ifba_val_latex/](https://github.com/andre-romano/ifba_val_latex/)

#### 7.2.4. Documentações e Tutoriais

- **Documentação**:
  - [Documentação oficial do Overleaf e LaTeX](https://www.overleaf.com/learn)
  - [Documentação (breve) do LaTeX](https://en.wikibooks.org/wiki/LaTeX)
- **Tutoriais**:
  1. [Oveleaf e LaTeX (em Português)](https://www.youtube.com/watch?v=YhHAlfeysxg&list=PLBTAWVWo60AsrO5ulDb3ZF_kk0z1uKo2_)
  2. [Overleaf e LaTeX (em Português)](https://www.youtube.com/watch?v=zR-QuNf3agQ&list=PLb735fZHArLamJiCIXsQT6BiHM1IgYQ43)
  3. [Overleaf e LaTeX (em Ingles)](https://www.youtube.com/watch?v=Jp0lPj2-DQA&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73)
  4. [SOMENTE LaTeX (em Português)](https://www.youtube.com/watch?v=xQ3yYqLlHcQ&list=PLa_2246N48_p9ndUHlO255uvKtSR8mshE)

**Sugestão**: Cada tutorial foi feito por uma pessoa diferente, usando técnicas de ensino diferentes. Dessa forma, recomendo que escolha um dos tutoriais acima para você acompanhar. 

## 8. Considerações Finais

Um trabalho de conclusão de curso (TCC) segue uma estrutura e estilo de escrita similar, independente de ser para um curso de nível técnico, de graduação, ou de pós-graduação. Contudo, podem existir algumas diferenças. 

Assim, veja os modelos de TCC contidos nas pastas [COINF](coinf) (para alunos do curso técnico em informática), e [ADS_COMPUT](ads_comput) (para os alunos dos cursos superiores em Análise e Desenvolvimento de Sistemas e Licenciatura em Computação).

Lembre-se de que a escrita de um TCC é um processo que exige tempo, dedicação e atenção aos detalhes. Planeje suas atividades, siga as orientações de seu orientador e não hesite em buscar ajuda quando necessário. 
