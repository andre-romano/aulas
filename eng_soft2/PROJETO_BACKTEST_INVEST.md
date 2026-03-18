

# Tema: Motor de Backtesting e Análise de Estratégias Financeiras (QuantInvest Suite)

Seguem abaixo as especificações deste tema de projeto. Leia cada instrução com atenção para evitar erros e interpretações erradas.

**ATENÇÃO**: A interpretação da atividade é parte integral da avaliação.

**Sumario:**
- [Tema: Motor de Backtesting e Análise de Estratégias Financeiras (QuantInvest Suite)](#tema-motor-de-backtesting-e-análise-de-estratégias-financeiras-quantinvest-suite)
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
O objetivo da equipe é construir uma **Suíte de Backtesting Financeiro (QuantInvest Suite)**. O software deve permitir que o usuário **carregue dados históricos de ativos financeiros** (arquivos CSV contendo Data, Preço de Abertura, Máxima, Mínima, Fechamento e Volume - o padrão OHLCV) e **simule o desempenho de estratégias de investimento automatizadas** no passado (ex: Cruzamento de Médias Móveis, Buy and Hold). O sistema funcionará obrigatoriamente através de duas frentes: uma **Interface de Linha de Comando (CLI)** e uma **Interface Gráfica de Usuário (GUI)**, ambas consumindo o mesmo núcleo de processamento.

## Papéis e Responsabilidades da Equipe
Para garantir a divisão equitativa do trabalho e a aplicação de boas práticas de engenharia de software, a equipe de deve obrigatoriamente se dividir nos seguintes papéis, atuando de forma integrada:
- **Engenheiro de Core (Regras de Negócio)**: Responsável por projetar o motor matemático de simulação. Deve construir o parser de dados financeiros (séries temporais) e implementar as estratégias de simulação usando o padrão Strategy , garantindo que os cálculos de lucro, perda e métricas de risco (ex: Drawdown) sejam isolados e precisos.
- **Engenheiro de CLI (Command Line Interface)**: Responsável por construir a interface de terminal. Deve implementar a passagem de argumentos para configurar o capital inicial, as datas de início/fim e a estratégia escolhida, além de renderizar os resultados finais em formato de texto estruturado ou tabelas no console.
- **Engenheiro de GUI (Graphical User Interface)**: Responsável por desenhar e implementar a interface gráfica interativa. Deve lidar com o gerenciamento de estado da tela, a usabilidade (UX/UI) e a plotagem de gráficos visuais (ex: gráficos de candlestick ou curvas de capital) com base nos dados processados pelo Core, mantendo a interface responsiva durante as simulações.
- **Engenheiro de CI/CD (Qualidade e DevOps)**: Responsável por garantir a confiabilidade do sistema inteiro. Deve configurar pipelines automatizados (ex: GitHub Actions), garantir a cobertura de testes automatizados (unitários e de integração), definir o linting (qualidade estática) e orquestrar a geração dos pacotes executáveis para as diferentes plataformas.

### Requisitos Funcionais (RF)
1. **Simulação de Estratégias**: O sistema deve ler séries temporais financeiras e iterar sobre os dados simulando compras e vendas baseadas em lógicas pré-definidas, calculando o saldo final, a taxa de acerto e o rebaixamento máximo (*Max Drawdown*).
2. **Interface de Linha de Comando (CLI)**: O sistema deve fornecer uma CLI permitindo rodar simulações em modo *headless*. 
   - **Exemplo de uso**: ``quant-suite run --file petr4.csv --strategy moving_average --capital 10000``.
3. **Interface Gráfica de Usuário (GUI)**: O sistema deve fornecer uma interface gráfica interativa onde o usuário possa selecionar o arquivo de dados, escolher a estratégia em um menu suspenso (Dropdown / Select), definir o capital inicial e visualizar o resultado em gráficos financeiros estáticos ou interativos.
4. **Processamento em Lote (Batch/Portfolio)**: Ambas as interfaces devem permitir a seleção de múltiplos arquivos de ativos diferentes simultaneamente, simulando a execução da estratégia como uma carteira (portfólio) consolidada.
5. **Relatórios de Saída**: O sistema deve gerar um sumário da execução. Na GUI, isso será exibido em um painel de resultados; na CLI, deve haver a opção de exportar o registro detalhado de todas as "operações" (compras/vendas) simuladas para um novo arquivo JSON ou CSV.

### Requisitos Não Funcionais (RNF)
1. **Desacoplamento Arquitetural**: O motor interno (*Core*) deve ser estritamente isolado das camadas de apresentação (CLI e GUI). As lógicas de CLI e GUI não podem conter lógica de negócio (simulações matemáticas e demais recursos associados ao Core); elas apenas coletam os inputs do usuário e formatam as saídas do Core.
2. **Responsividade da GUI (Concorrência)**: Simulações que envolvem múltiplos arquivos ou estratégias complexas podem levar tempo. A execução da simulação não pode travar a tela principal, exigindo a implementação de processamento assíncrono ou uso de *threads* e *processes* (semáforos e locks, regiões criticas).
3. **Portabilidade e Distribuição**: O sistema deve ser empacotável de forma a rodar de maneira autônoma, idealmente através de executáveis ou pacotes facilmente instaláveis no sistema operacional alvo (PyInstaller, PyApp ou Docker), gerenciando adequadamente as dependências de interface e do motor interno (Core).
4. **Extensibilidade via Padrões de Projeto**: O sistema deve ser desenhado para suportar a inclusão de novas estratégias de investimento no sistema (ex: estratégia baseada em RSI), através da criação de novas classes no domínio, sem necessidade de reescrever a logica interna do Core, da GUI ou da CLI (aplicação dos [Princípios SOLID](https://www.alura.com.br/artigos/solid), e em particular do padrão de projeto Strategy).
5. **Documentação e Testes**: O código fonte deve possuir testes automatizados, atingindo taxa de cobertura de 80% ou mais. O código fonte (classes, métodos, funções) deve ser documentado de forma clara, para facilitar a manutenção e servir para escalabilidade do projeto no futuro.

### Regras de Negócio (RN)
1. **Validação Cronológica (Prevenção de Viés de Antecipação)**: O sistema deve validar se as datas no arquivo CSV estão em ordem cronológica estrita antes de iniciar a simulação. O algoritmo nunca pode usar dados "do futuro" para tomar uma decisão "no presente" da simulação.
2. **Capital Mínimo e Falência**: A simulação deve ser interrompida imediatamente para o ativo atual caso o saldo do investidor simulado chegue a zero ou fique negativo (condição de quebra), disparando um evento, tela de aviso (msgbox), ou log específico, sem quebrar a aplicação.
3. **Paridade de Recursos (CLI = GUI)**: Toda funcionalidade de simulação disponível na GUI deve estar disponível também na CLI, como flags ou argumentos.