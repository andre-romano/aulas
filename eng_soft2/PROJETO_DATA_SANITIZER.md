

# Tema: Suíte de Processamento e Anonimização de Dados (Data Sanitizer)

Seguem abaixo as especificações deste tema de projeto. Leia cada instrução com atenção para evitar erros e interpretações erradas.

**ATENÇÃO**: A interpretação da atividade é parte integral da avaliação.

**Sumario:**
- [Tema: Suíte de Processamento e Anonimização de Dados (Data Sanitizer)](#tema-suíte-de-processamento-e-anonimização-de-dados-data-sanitizer)
  - [Uso de IAs no Projeto](#uso-de-ias-no-projeto)
  - [Descrição do Projeto](#descrição-do-projeto)
  - [Papéis e Responsabilidades da Equipe](#papéis-e-responsabilidades-da-equipe)
    - [Requisitos Funcionais (RF)](#requisitos-funcionais-rf)
    - [Requisitos Não Funcionais (RNF)](#requisitos-não-funcionais-rnf)
    - [Regras de Negócio (RN)](#regras-de-negócio-rn)


## Uso de IAs no Projeto
O uso de inteligencias artificiais generativas é facultado a equipe, desde que o mesmo seja feito de forma **ética, transparente e responsável**, seguindo as diretrizes abaixo: 
- A equipe deve **seguir as políticas de uso de IAs estabelecidas pela instituição**, garantindo que o uso dessas tecnologias esteja alinhado com os valores éticos e acadêmicos da comunidade.
- A equipe deve garantir que o **conteúdo gerado por IA seja revisado e validado** para assegurar a qualidade, precisão e conformidade com os requisitos do projeto. 
- O **uso de IAs** para geração de código, documentação ou qualquer outro artefato do projeto **deve ser claramente indicado na documentação final**, especificando quais partes foram geradas por IA e quais foram criadas manualmente pela equipe. 
- O uso de IAs **não deve comprometer a originalidade do trabalho da equipe**, devendo ser utilizado como uma ferramenta de apoio e não como um substituto para o esforço criativo e técnico dos membros da equipe.
- A equipe deve estar **ciente das limitações e vieses potenciais das IAs**, utilizando-as de forma crítica e consciente para evitar a propagação de informações incorretas ou inadequadas (i.e., alucinações de IA).
- **A equipe será indagada durante as apresentações do projeto sobre o a funcionalidade do código e a arquitetura** usada no projeto. Assim, a equipe deve ser capaz de explicar a arquitetura e finalidade de cada função, método, ou classe, bem como as ferramentas foram utilizadas na construção do projeto.
- **A equipe deve documentar o uso de IAs no projeto**, indicando quais foram os benefícios e desafios enfrentados, e como a equipe garantiu a integridade e a qualidade do trabalho final.
- **A falha em seguir essas diretrizes pode resultar em penalidades acadêmicas**, incluindo a desqualificação do projeto ou outras sanções conforme as políticas da instituição.

## Descrição do Projeto
O objetivo da equipe é construir uma **Suíte de Anonimização e Limpeza de Dados (Data Sanitizer)**. O software deve **analisar arquivos** de dados (como CSV, JSON ou planilhas) e **aplicar regras** de mascaramento, criptografia ou remoção de dados sensíveis (alinhado a normativas como a LGPD). O sistema funcionará obrigatoriamente através de duas frentes: uma **Interface de Linha de Comando (CLI)** e uma **Interface Gráfica de Usuário (GUI)**, ambas consumindo o mesmo núcleo de processamento isolado.

## Papéis e Responsabilidades da Equipe
Para garantir a divisão equitativa do trabalho e a aplicação de boas práticas de engenharia de software, a equipe de deve obrigatoriamente se dividir nos seguintes papéis, atuando de forma integrada:
- **Engenheiro de Core (Regras de Negócio)**: Responsável por projetar e implementar o motor interno do sistema (leitura, processamento e gravação de arquivos). Deve garantir que a API interna seja robusta, independente de interface e utilize padrões de projeto, conforme estes sejam necessários (ex: Strategy, Observer, DAO, Action, etc).
- **Engenheiro de CLI (Command Line Interface)**: Responsável por construir a interface de terminal. Deve implementar o roteamento de comandos, o parsing seguro de argumentos, flags de configuração e garantir que a CLI consuma perfeitamente os eventos disparados pelo Core (ex: exibindo barras de progresso no console).
- **Engenheiro de GUI (Graphical User Interface)**: Responsável por desenhar e implementar a interface gráfica interativa. Deve lidar com o gerenciamento de estado da tela, a usabilidade (UX/UI), o isolamento de threads para não congelar a aplicação e o consumo da API do Core para feedback visual.
- **Engenheiro de CI/CD (Qualidade e DevOps)**: Responsável por garantir a confiabilidade do sistema inteiro. Deve configurar pipelines automatizados (ex: GitHub Actions), garantir a cobertura de testes automatizados (unitários e de integração), definir o linting (qualidade estática) e orquestrar a geração dos pacotes executáveis para as diferentes plataformas.

### Requisitos Funcionais (RF)
1. **Sanitização de Dados Sensíveis**: O sistema deve permitir a aplicação de diferentes operações sobre colunas/chaves específicas dos arquivos, como: mascaramento de CPF/E-mail, hashing de senhas, adição de ruído estatístico em valores numéricos, ou exclusão completa de colunas.
2. **Interface de Linha de Comando (CLI)**: O sistema deve fornecer uma CLI rica, suportando a execução das regras de anonimização via subcomandos no terminal, com passagem do caminho do arquivo, definição das regras (via arquivo de configuração JSON/YAML ou flags no próprio comando) e tipagem rigorosa de parâmetros.
3. **Interface Gráfica de Usuário (GUI)**: O sistema deve fornecer uma interface gráfica interativa, permitindo a seleção visual dos arquivos, o mapeamento de quais colunas sofrerão quais regras de sanitização (através de menus dropdown ou caixas de seleção) e o acompanhamento visual do processamento.
4. **Processamento em Lote (Batch)**: Ambas as interfaces devem permitir a seleção de múltiplos arquivos de dados idênticos em estrutura, ou um diretório inteiro, aplicando a mesma "receita" de anonimização sequencialmente ou paralelamente.
5. **Feedback de Execução e Relatórios**: O núcleo deve emitir eventos sobre o andamento (linhas processadas vs. total de linhas) e, ao final, gerar um breve sumário executivo indicando a quantidade de registros alterados e potenciais dados corrompidos ignorados.

### Requisitos Não Funcionais (RNF)
1. **Desacoplamento Arquitetural**: O motor de anonimização de dados deve ser estritamente isolado das camadas de apresentação. As lógicas de CLI e GUI não podem conter regras de parsing de CSV ou de mascaramento de dados; elas apenas injetam configurações e disparam processos em uma biblioteca central.
2. **Responsividade da GUI (Concorrência)**: O processamento de arquivos grandes (ex: CSVs com milhões de linhas) não pode travar a tela. O trabalho pesado deve ser delegado a threads de trabalho (workers), emitindo sinais seguros (signals/slots ou callbacks) para a thread principal para a atualização da barra de progresso.
3. **Extensibilidade via Padrões de Projeto**: O sistema deve ser desenhado para que novos formatos de arquivo (ex: suporte a XML) ou novas estratégias de mascaramento (ex: pseudonimização reversível) possam ser adicionados criando novas classes no domínio, sem necessidade de reescrever a GUI ou a CLI (aplicação dos [Princípios SOLID](https://www.alura.com.br/artigos/solid)).
4. **Portabilidade e Distribuição**: O sistema deve ser empacotável de forma a rodar de maneira autônoma, idealmente através de executáveis ou pacotes facilmente instaláveis no sistema operacional alvo (PyInstaller, PyApp ou Docker), gerenciando adequadamente as dependências de interface e do motor interno (Core).
5. **Documentação e Testes**: O código fonte deve ser coberto por testes automatizados, atingindo cobertura de 80% ou mais. O código fonte (classes, métodos, funções) deve ser documentado de forma clara, para facilitar a manutenção e servir para escalabilidade do projeto no futuro.

### Regras de Negócio (RN)
1. **Validação de Schema Pré-Processamento**: O sistema deve inspecionar rapidamente as primeiras linhas ou o cabeçalho do arquivo para garantir que as colunas informadas pelo usuário para anonimização realmente existam, falhando rapidamente (fail-fast) com erro descritivo antes de alocar memória para o processamento em massa.
2. **Imutabilidade do Dado Original (Prevenção de Sobrescrita)**: O arquivo de origem nunca deve ser alterado sob nenhuma circunstância. O sistema deve sempre gerar um novo arquivo de saída em um diretório de destino designado ou adicionando um sufixo (ex: clientes_anonimizado.csv).
3. **Paridade de Recursos (CLI = GUI)**: Toda e qualquer configuração de sanitização, filtro ou funcionalidade de lote existente na interface gráfica (GUI) deve poder ser executada através da interface de linha de comando (CLI).