

# Tema: Suíte de Processamento de Imagens (VisionForge Suite)

Seguem abaixo as especificações deste tema de projeto. Leia cada instrução com atenção para evitar erros e interpretações erradas.

**ATENÇÃO**: A interpretação da atividade é parte integral da avaliação.

**Sumario:**
- [Tema: Suíte de Processamento de Imagens (VisionForge Suite)](#tema-suíte-de-processamento-de-imagens-visionforge-suite)
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
O objetivo da equipe é construir uma **Suíte de Processamento de Imagens em Lote (VisionForge Suite)**. O software deve permitir que fotógrafos, designers ou analistas de dados **apliquem rotinas pesadas de edição e padronização visual** em milhares de imagens de uma só vez (ex: aplicar marca d'água, converter para tons de cinza e redimensionar para 1080p). O sistema funcionará obrigatoriamente através de duas frentes: uma **Interface de Linha de Comando (CLI)** e uma **Interface Gráfica de Usuário (GUI)**, ambas consumindo o mesmo núcleo de processamento (Core).


## Papéis e Responsabilidades da Equipe
Para garantir a divisão equitativa do trabalho e a aplicação de boas práticas de engenharia de software, a equipe de deve obrigatoriamente se dividir nos seguintes papéis, atuando de forma integrada:
- **Engenheiro de Core (Regras de Negócio)**: Responsável por projetar o motor de processamento de imagens. Deve implementar algoritmos de transformação (ex: redimensionamento, marcas d'água, conversão de espaço de cor, detecção de bordas) e construir um orquestrador que permita encadear múltiplos filtros matemáticos na mesma imagem de forma eficiente.
- **Engenheiro de CLI (Command Line Interface)**: Responsável por construir a interface de terminal (CLI). Deve implementar a leitura de argumentos que permitam passar um arquivo JSON/YAML com o "pipeline" de filtros, o diretório de origem e o diretório de destino, exibindo o progresso do processamento no terminal.
- **Engenheiro de GUI (Graphical User Interface)**: Responsável por desenhar e implementar a interface gráfica interativa. Deve construir uma tela onde o usuário possa carregar imagens, visualizar um preview antes e depois do processamento, e empilhar filtros visualmente, garantindo que a interface não congele durante a aplicação dos efeitos.
- **Engenheiro de CI/CD (Qualidade e DevOps)**: Responsável por garantir a confiabilidade do sistema inteiro. Deve configurar pipelines automatizados (ex: GitHub Actions), garantir a cobertura de testes automatizados (unitários e de integração), definir o linting (qualidade estática) e orquestrar a geração dos pacotes executáveis para as diferentes plataformas.

### Requisitos Funcionais (RF)
1. **Pipelines de Processamento (Encadeamento)**: O sistema deve permitir ao usuário aplicar não apenas um, mas múltiplos filtros sequenciais em uma imagem (ex: Filtro 1: Cortar -> Filtro 2: Desfoque -> Filtro 3: Comprimir).
2. **Interface de Linha de Comando (CLI)**: O sistema deve fornecer uma CLI rica que permita rodar fluxos de trabalho completos por comando. 
   - **Exemplo**: ``vision --input ./fotos --output ./prontas --filters "resize:1920x1080" --filters "grayscale" --filters "watermark:logo.png"``.
3. **Interface Gráfica de Usuário (GUI)**: O sistema deve fornecer uma interface onde o usuário possa ver uma galeria de miniaturas (*thumbnails*) dos arquivos selecionados, um construtor visual de *pipeline* (adicionando ou removendo os filtros desejados) e um botão de execução em lote.
4. **Processamento em Lote (Batch)**: O sistema deve ser capaz de ler um diretório inteiro de imagens (ex: pastas com centenas de arquivos JPG, PNG, etc.) e processar todas simultaneamente, tirando proveito de concorrência (*threads* ou *processes*).
5. **Feedback Visuais e de Progresso**: Durante a execução em lote, a GUI e CLI devem atualizar uma barra de progresso em tempo real, indicando o arquivo atual sendo processado. Ambas nao devem travar ou congelar durante o processamento, mesmo para tarefas pesadas (usar *multithreading* ou *multiprocessing*).

### Requisitos Não Funcionais (RNF)
1. **Desacoplamento Arquitetural**: O motor de processamento (Core) não deve ter acoplamento com a GUI ou CLI. Os dados fluem das camadas de apresentação (CLI / GUI) para a API interna do Core (ex: envio de caminhos de arquivo, dicionários de configuração, flags, etc), para então serem processados pelo núcleo do app.
2. **Eficiência de Memória e Concorrência**: O sistema nunca deve carregar todas as imagens do diretório para a memória RAM de uma só vez. O processamento deve ocorrer em esquema de pool de threads/workers (Processamento Assíncrono), lendo, processando e salvando imagem por imagem (ou em pequenos lotes).
3. **Tratamento de Exceções Rigoroso**: Se uma imagem específica dentro de um lote de 1000 imagens estiver corrompida, o sistema deve registrar o erro em um log, ignorar a imagem defeituosa e continuar o lote sem quebrar a execução global. Ao termino da execução, o sistema deve exibir um resumo dos arquivos processados com sucesso e os que falharam (tanto no CLI quanto no GUI), indicando os motivos de falha (ex: "imagem corrompida", "formato não suportado", etc).
4. **Extensibilidade via Padrões de Projeto**: O sistema deve ser desenhado para que novos filtros de imagem possam ser adicionados facilmente. Para isso a equipe deve aplicar o [**padrão de arquitetura Duto e Filtro** (*Pipe and Filter*)](https://www.alura.com.br/artigos/padroes-arquiteturais-arquitetura-software-descomplicada) combinado com padrões de projeto (ex: Strategy, Action, Factory, Facade, e/ou DAO, dentre outros) para suportar a inclusão de novos filtros matemáticos, sem necessidade de reescrever a logica interna do Core, da GUI ou da CLI (aplicação dos [Princípios SOLID](https://www.alura.com.br/artigos/solid).
5. **Portabilidade e Distribuição**: O sistema deve ser empacotável de forma a rodar de maneira autônoma, idealmente através de executáveis ou pacotes facilmente instaláveis no sistema operacional alvo (PyInstaller, PyApp ou Docker), gerenciando adequadamente as dependências de interface e do motor interno (Core).
6. **Documentação e Testes**: O código fonte deve possuir testes automatizados, atingindo taxa de cobertura de 80% ou mais. O código fonte (classes, métodos, funções) deve ser documentado de forma clara, para facilitar a manutenção e servir para escalabilidade do projeto no futuro.

### Regras de Negócio (RN)
1. **Imutabilidade e Segurança de Arquivos Originais**: O sistema deve ser estritamente não destrutivo. Sob nenhuma hipótese os arquivos de entrada originais devem ser alterados ou deletados. Todo processamento deve resultar na criação de novos arquivos em um diretório de saída distinto, sem sobrescrever os arquivos originais (ex: ./fotos/originais/ -> ./fotos/processadas/).
2. **Validação de Formato e Dimensões (Fail-Fast)**: O sistema deve checar rapidamente o formato dos arquivos (MimeTypes e extensões) antes de repassá-los ao motor de processamento, ignorando arquivos que não sejam mídias válidas (ex: arquivos com extensões inválidas, MimeTypes inválidos, formatos não suportados).
3. **Paridade de Recursos (CLI = GUI)**: Qualquer filtro visual, opção de compressão ou ajuste de parâmetros (ex: grau de desfoque) disponível nos controles deslizantes da GUI deve possuir um parâmetro de comando correspondente e funcional na CLI.