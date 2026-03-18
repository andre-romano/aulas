

# Tema: Suíte de Auditoria e Análise de Logs (Log Sentinel)

Seguem abaixo as especificações deste tema de projeto. Leia cada instrução com atenção para evitar erros e interpretações erradas.

**ATENÇÃO**: A interpretação da atividade é parte integral da avaliação.

**Sumario:**
- [Tema: Suíte de Auditoria e Análise de Logs (Log Sentinel)](#tema-suíte-de-auditoria-e-análise-de-logs-log-sentinel)
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
O objetivo da equipe é construir uma **Suíte de Auditoria e Análise de Logs (Log Sentinel)**. O software deve **analisar arquivos de texto bruto ou estruturado** gerados por servidores (como logs do Apache, Nginx, ou Syslog) e extrair métricas de erro, identificar padrões de anomalias (ex: tentativas de ataque de força bruta) e gerar relatórios sumarizados. O sistema funcionará obrigatoriamente através de duas frentes: uma **Interface de Linha de Comando (CLI)** e uma **Interface Gráfica de Usuário (GUI)**, ambas consumindo o mesmo núcleo de processamento isolado.

## Papéis e Responsabilidades da Equipe
Para garantir a divisão equitativa do trabalho e a aplicação de boas práticas de engenharia de software, a equipe de deve obrigatoriamente se dividir nos seguintes papéis, atuando de forma integrada:
- **Engenheiro de Core (Regras de Negócio)**: Responsável por projetar e implementar o motor interno do sistema (leitura, processamento e gravação de arquivos). Deve garantir que a API interna seja robusta, independente de interface e utilize padrões de projeto, conforme estes sejam necessários (ex: Strategy, Observer, DAO, Action, etc).
- **Engenheiro de CLI (Command Line Interface)**: Responsável por construir a interface de terminal. Deve implementar o roteamento de comandos, o parsing seguro de argumentos, flags de configuração e garantir que a CLI consuma perfeitamente os eventos disparados pelo Core (ex: exibindo barras de progresso no console).
- **Engenheiro de GUI (Graphical User Interface)**: Responsável por desenhar e implementar a interface gráfica interativa. Deve lidar com o gerenciamento de estado da tela, a usabilidade (UX/UI), o isolamento de threads para não congelar a aplicação e o consumo da API do Core para feedback visual.
- **Engenheiro de CI/CD (Qualidade e DevOps)**: Responsável por garantir a confiabilidade do sistema inteiro. Deve configurar pipelines automatizados (ex: GitHub Actions), garantir a cobertura de testes automatizados (unitários e de integração), definir o linting (qualidade estática) e orquestrar a geração dos pacotes executáveis para as diferentes plataformas.

### Requisitos Funcionais (RF)
1. **Parsing e Extração de Métricas**: O sistema deve ler arquivos de log, extrair dados usando expressões regulares ou parsers estruturados, e contabilizar métricas como: número de requisições por IP, frequência de códigos de erro (ex: 404, 500) e picos de tráfego por hora.
2. **Interface de Linha de Comando (CLI)**: O sistema deve fornecer uma CLI rica, suportando a execução de análises via subcomandos no terminal, com passagem do caminho do arquivo, uso de flags para filtrar resultados (ex: --status-code 500, --date-range) e saída formatada no terminal (tabelas ou exportação para JSON).
3. **Interface Gráfica de Usuário (GUI)**: O sistema deve fornecer uma interface gráfica interativa, permitindo a seleção visual dos arquivos de log, a aplicação de filtros através de painéis, e a exibição de resultados em tabelas de dados (*data grids*) ou gráficos simplificados.
4. **Processamento em Lote (Batch)**: Ambas as interfaces devem permitir a seleção de múltiplos arquivos de log ou um diretório inteiro, agregando os resultados da análise de todos os arquivos em um único relatório consolidado.
5. **Feedback de Execução e Relatórios**: O núcleo deve emitir eventos sobre o andamento da leitura (MBs processados vs. Tamanho total do arquivo) para atualizar barras de progresso, evitando a impressão de tela "morta" durante o processamento de gigabytes de texto.

### Requisitos Não Funcionais (RNF)
1. **Desacoplamento Arquitetural**: O motor de análise de dados deve ser estritamente isolado das camadas de apresentação. As lógicas de CLI e GUI não podem conter regras de regex ou contagem matemática; elas apenas injetam parâmetros de busca e disparam processos em uma API/biblioteca central.
2. **Responsividade da GUI (Concorrência)**: A leitura de arquivos de log pesados (arquivos de vários gigabytes) não pode travar a tela. A leitura em disco (I/O) e o parsing devem ser delegados a threads de trabalho (workers), emitindo sinais seguros para atualizar a thread principal da interface.
3. **Gerenciamento de Memória Eficiente**: O sistema não deve tentar carregar um arquivo de log inteiro de 5GB para a memória RAM de uma só vez (leitura em chunks ou linha a linha usando generators), garantindo que o programa rode em máquinas com recursos limitados.
4. **Portabilidade e Distribuição**: O sistema deve ser empacotável de forma a rodar de maneira autônoma, idealmente através de executáveis ou pacotes facilmente instaláveis no sistema operacional alvo (PyInstaller, PyApp ou Docker), gerenciando adequadamente as dependências de interface e do motor interno (Core).
5. **Extensibilidade via Padrões de Projeto**: O sistema deve ser desenhado para suportar novos formatos de arquivo e servidores HTTP, através da criação de novas classes no domínio, sem necessidade de reescrever a GUI ou a CLI (aplicação dos [Princípios SOLID](https://www.alura.com.br/artigos/solid)).
6. **Documentação e Testes**: O código fonte deve ser coberto por testes automatizados, atingindo cobertura de 80% ou mais. O código fonte (classes, métodos, funções) deve ser documentado de forma clara, para facilitar a manutenção e servir para escalabilidade do projeto no futuro.

### Regras de Negócio (RN)
1. **Segurança e Imutabilidade (Somente Leitura)**: O sistema deve abrir os arquivos de log estritamente em modo de leitura (read-only). Sob nenhuma circunstância o sistema tem permissão para alterar, limpar ou sobrescrever os arquivos originais analisados.
2. **Validação de Formato (Fail-Fast)**: O sistema deve inspecionar as primeiras linhas do arquivo selecionado para garantir que ele corresponde ao formato de log esperado (ex: se o usuário selecionou "Formato Nginx", validar se a estrutura bate), abortando a operação com uma mensagem clara caso o arquivo seja inválido ou binário.
3. **Paridade de Recursos (CLI = GUI)**: Toda e qualquer capacidade de filtragem (por IP, por data, por tipo de erro) ou funcionalidade de exportação de relatório existente na interface gráfica deve poder ser executada perfeitamente através da interface de linha de comando.