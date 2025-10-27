
## Estudo Dirigido / Estudo de Caso: Testes e Evolução de Software - Estratégias, Desafios e Impacto na Qualidade de Sistemas em Produção

### Objetivos

- Compreender o papel dos testes no ciclo de vida do software.
- Avaliar estratégias de testes em sistemas que passam por evolução constante.
- Identificar falhas nos processos de teste e integração contínua.
- Relacionar a evolução de requisitos e código com refatorações e regressões.
- Desenvolver habilidades práticas para análise de impacto, cobertura e confiabilidade de testes.

---

### Conteúdo Recomendado

- Tipos de testes: unitário, integração, sistema, aceitação, regressão.
- Cobertura de testes (statement, branch, path, mutation).
- Testes orientados a especificação (BDD/TDD) e à evolução.
- Técnicas de seleção e priorização de casos de teste.
- Rastreabilidade e cobertura de testes.
- *Pipeline* CI/CD.
- Efeitos colaterais em módulos dependentes.

---

### Estrutura da Atividade 

#### Parte 1 – Estudo de Caso: Aplicativo de Transporte Urbano Fictício (GoCity)

**Contexto:**

O GoCity é um aplicativo de transporte urbano com sistema de precificação dinâmica e algoritmos de roteamento em tempo real. Após sucessivas evoluções rápidas para atender demandas do mercado, surgem problemas como:

- Regressões em funcionalidades antigas (por exemplo, cálculo incorreto de rotas).
- Testes automatizados falhando intermitentemente no CI.
- Cobertura abaixo de 50% em áreas críticas do sistema.
- Módulo de pagamento refatorado sem atualização dos testes.
- Requisitos evolutivos não atualizados no backlog de QA.
- Testes manuais desatualizados e mal documentados.
- Falta de rastreabilidade entre requisitos, código e testes.

**Descrição da Atividade**:

Em grupo:

1. **Identifique os principais problemas de teste que contribuíram para a queda de qualidade.**

2. **Proponha melhorias técnicas e de processo, tais como:**
   - Estratégia de testes baseada em risco.
   - Adoção de TDD ou BDD.
   - Inclusão de análise de impacto automatizada.
   - Reformulação da matriz de rastreabilidade.
   - Monitoramento da cobertura e alarmes de regressão.

3. **Esboce um pipeline de CI/CD otimizado com etapas de validação antes do deploy.**

---

#### Parte 2 – Discussão e Apresentações

Cada grupo apresentará suas propostas (10–20 minutos), e em seguida seguida teremos:

- Rodada de perguntas de outros grupos.
- Mediação crítica do professor: destacando boas práticas e pontos de atenção.

##### Perguntas norteadoras para discussão:

- Como os testes devem acompanhar a evolução de requisitos?
- Como balancear velocidade de entrega com cobertura de testes?
- Até que ponto vale a pena automatizar testes em sistemas que mudam frequentemente?
- Quais métricas (além da cobertura) podem indicar a confiabilidade dos testes?
