# Exemplos em LaTeX

**Sumário**:

- [Exemplos em LaTeX](#exemplos-em-latex)
  - [Exemplo de TCC](#exemplo-de-tcc)
  - [Referências (Padrão ABNT)](#referências-padrão-abnt)
  - [Figuras](#figuras)
    - [Sub-figuras (várias figuras, uma após a outra)](#sub-figuras-várias-figuras-uma-após-a-outra)
  - [Tabelas](#tabelas)
    - [Tabelas com células mescladas (*Multirow* e *Multicolumn*)](#tabelas-com-células-mescladas-multirow-e-multicolumn)
  - [Notas de Rodapé](#notas-de-rodapé)
  - [Citações](#citações)
- [Documentações e Tutoriais](#documentações-e-tutoriais)
  - [Documentação](#documentação)
  - [Tutoriais](#tutoriais)


## Exemplo de TCC

O modelo de TCC abaixo é apenas um guia. Ele **NÃO ESTÁ** de acordo com as normas, modelos, layout e formatação exigidos pela instituição. Você precisará ajustar ele para a sua necessidade (i.e., TCC de Análise e Desenvolvimento de Sistemas, Licenciatura em Computação, Curso Integrado de Informática ) e para o formato da instituição (IFBA).

Para criar um documento LaTeX, crie um arquivo ``main.tex`` com o seguinte conteúdo:

```latex
\documentclass[a4paper,12pt]{report}
\usepackage[brazil]{babel}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage{float}
\usepackage{caption}
\usepackage{cite}
\usepackage{abntex2cite} % Para referências no padrão ABNT
\usepackage{subfigure} % pacote subfigura
\usepackage{graphicx} % pacote figura
\usepackage{multirow} % Pacote para multirow
\usepackage[top=3cm, bottom=2cm, left=3cm, right=2cm]{geometry}

\begin{document}

% Capa
\title{Título do Trabalho}
\author{Seu Nome}
\date{Mês e Ano}
\maketitle

% Resumo
\begin{abstract}
    Este é o resumo do trabalho, descrevendo brevemente o objetivo, metodologia, resultados e conclusões.
\end{abstract}

% Sumário
\tableofcontents

\chapter{Introdução}
Aqui você escreve a introdução do seu TCC.

\chapter{Revisão de Literatura}
Aqui você escreve a revisão de literatura.

\chapter{Metodologia}
Aqui você descreve a metodologia utilizada.

\chapter{Resultados e Discussão}
Aqui você apresenta os resultados e os discute.

\chapter{Conclusão}
Aqui você escreve a conclusão do seu TCC.

% Referências
\bibliographystyle{abntex2-alf}
\bibliography{referencias}

\end{document}
```

## Referências (Padrão ABNT)

Crie um arquivo ``referencias.bib`` com o seguinte conteúdo:

```bibtex
@book{autor2023,
    author    = {Nome do Autor},
    title     = {Título do Livro},
    year      = {2023},
    publisher = {Editora},
    address   = {Cidade}
}

@article{autor2023b,
    author  = {Nome do Autor},
    title   = {Título do Artigo},
    journal = {Nome do Periódico},
    year    = {2023},
    volume  = {12},
    number  = {3},
    pages   = {45-67}
}
```

E no arquivo principal ``main.tex``, use:

```latex
\bibliographystyle{abntex2-alf}
\bibliography{referencias}
```

## Figuras

Para inserir uma figura em um documento LaTeX, use o código abaixo:

```latex
\begin{figure}[!htb]
    \centering
    \includegraphics[width=0.8\textwidth]{caminho/para/imagem.jpg}
    \caption{Legenda da figura.}
    \label{fig:exemplo_label_de_figura}
\end{figure}
```

Você pode se referir a essa figura no seu texto usando o código abaixo:
```latex
A Figura \ref{fig:exemplo_label_de_figura} ilustra que os resultados obtidos ...
```

### Sub-figuras (várias figuras, uma após a outra)

Para inserir uma figura ao lado da outra, use:

```latex
\begin{figure}[!htb]
    \centering
    \subfigure[Legenda da subfigura 1]{
        \includegraphics[width=0.45\textwidth]{caminho/para/imagem1.jpg}
        \label{fig:exemplo_label_subfigura1}
    }
    \subfigure[Legenda da subfigura 2]{
        \includegraphics[width=0.45\textwidth]{caminho/para/imagem2.jpg}
        \label{fig:exemplo_label_subfigura2}
    }
    \caption{Legenda da figura completa.}
    \label{fig:exemplo_label_subfiguras}
\end{figure}
```

Você pode se referir às sub-figuras no seu texto usando o código abaixo:
```latex
A Figura \ref{fig:exemplo_label_subfigura1} ilustra ...
```

## Tabelas

Para inserir uma tabela no LaTeX, use:

```latex
\begin{table}[!htb]
    \centering
    \caption{Legenda da tabela.}
    \label{tab:exemplo_label_de_tabela}
    \begin{tabular}{|c|c|c|}
        \hline
        Coluna 1 & Coluna 2 & Coluna 3 \\
        \hline
        Dado 1 & Dado 2 & Dado 3 \\
        Dado 4 & Dado 5 & Dado 6 \\
        \hline
    \end{tabular}
\end{table}
```

Você pode se referir a essa tabela no seu texto usando o código abaixo:
```latex
A Tabela \ref{tab:exemplo_label_de_tabela} ilustra que os resultados obtidos ...
```

### Tabelas com células mescladas (*Multirow* e *Multicolumn*)

Para criar tabelas com células mescladas, use os comandos `\multirow` e `\multicolumn`, conforme exemplo a seguir:

```latex
\begin{table}[!htb]
    \centering
    \caption{Tabela de Exemplo com Multirow e Multicolumn}
    \label{tab:multirow_multicolumn}
    \begin{tabular}{|c|c|c|c|}
        \hline
        \textbf{Coluna 1} & \textbf{Coluna 2} & \textbf{Coluna 3} & \textbf{Coluna 4} \\
        \hline
        \multirow{2}{*}{Dado 1} & \multicolumn{2}{c|}{Dado 2 e 3 combinados} & Dado 4 \\
        \cline{2-4}
        & Dado 5 & Dado 6 & Dado 7 \\
        \hline
        Dado 8 & \multirow{2}{*}{Dado 9} & \multicolumn{2}{c|}{Dado 10 e 11 combinados} \\
        \cline{1-1} \cline{3-4}
        Dado 12 & & Dado 13 & Dado 14 \\
        \hline
    \end{tabular}
\end{table}
```

## Notas de Rodapé

```latex
Texto com nota de rodapé.\footnote{Este é um exemplo de nota de rodapé.}
```

## Citações

Se a citação for parte do texto, use o seguinte código:

```latex
Segundo \citeonline{autor2023}, ...
```

Se a citação NÃO pertencer ao texto, use o seguinte:

```latex
Este conceito foi discutido por \cite{autor2023}.
```

# Documentações e Tutoriais

## Documentação

A documentação do Overleaf e LaTeX podem ser encontradas nos seguintes sites:

- [Documentação oficial do Overleaf e LaTeX](https://www.overleaf.com/learn)
- [Documentação (breve) do LaTeX](https://en.wikibooks.org/wiki/LaTeX)

Além desses sites, existem outros que podem ser de grande valia para buscar ajuda, tais como StackOverflow e similares.

## Tutoriais

Existem vários tutoriais de como utilizar o Overleaf e LaTeX.
Cada tutorial abaixo possui vários vídeos explicando como usar essas tecnologias:

1. [Tutorial 01 do Oveleaf e LaTeX (em Português)](https://www.youtube.com/watch?v=YhHAlfeysxg&list=PLBTAWVWo60AsrO5ulDb3ZF_kk0z1uKo2_)
2. [Tutorial 02 do Overleaf e LaTeX (em Português)](https://www.youtube.com/watch?v=zR-QuNf3agQ&list=PLb735fZHArLamJiCIXsQT6BiHM1IgYQ43)
3. [Tutorial 03 do Overleaf e LaTeX (em Ingles)](https://www.youtube.com/watch?v=Jp0lPj2-DQA&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73)
4. [Tutorial 04 - SOMENTE LaTeX (em Português)](https://www.youtube.com/watch?v=xQ3yYqLlHcQ&list=PLa_2246N48_p9ndUHlO255uvKtSR8mshE)

**Sugestão**: Cada tutorial foi feito por uma pessoa diferente, usando técnicas de ensino diferentes. Dessa forma, recomendo que escolha um dos tutoriais acima para você acompanhar. 