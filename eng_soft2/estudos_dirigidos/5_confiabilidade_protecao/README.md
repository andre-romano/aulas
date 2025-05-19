
## Estudo Dirigido / Estudo de Caso: Confiabilidade, Proteção, Gestão e Especificação de Confiança e Segurança em Sistemas Computacionais Críticos

**Sumário:**
- [Estudo Dirigido / Estudo de Caso: Confiabilidade, Proteção, Gestão e Especificação de Confiança e Segurança em Sistemas Computacionais Críticos](#estudo-dirigido--estudo-de-caso-confiabilidade-proteção-gestão-e-especificação-de-confiança-e-segurança-em-sistemas-computacionais-críticos)
  - [Objetivos](#objetivos)
  - [Conteúdo Recomendado](#conteúdo-recomendado)
  - [Estrutura da Atividade](#estrutura-da-atividade)
    - [Parte 1 – Estudo de Caso: Vazamento de Dados Críticos em Plataforma de Governo Digital (e-Cidadão)](#parte-1--estudo-de-caso-vazamento-de-dados-críticos-em-plataforma-de-governo-digital-e-cidadão)
    - [Parte 2 – Discussão e Apresentações](#parte-2--discussão-e-apresentações)
  - [Avaliação da Atividade](#avaliação-da-atividade)


### Objetivos

- Compreender os conceitos de confiabilidade, proteção, confiança e segurança na Engenharia de Software.
- Analisar a relação entre especificações de segurança e a implementação de medidas protetivas eficazes.
- Explorar técnicas de mitigação de falhas, controle de acesso e confiança entre partes em sistemas distribuídos.
- Avaliar criticamente a gestão de riscos em sistemas que operam em ambientes adversos ou de alta disponibilidade.
- Desenvolver propostas de melhorias práticas baseadas em normas e boas práticas internacionais.

---

### Conteúdo Recomendado

- Conceitos de confiabilidade, disponibilidade e segurança (tríade CIA).
- Modelos de controle de acesso (RBAC, ABAC, DAC, MAC).
- Segurança em software (OWASP, threat modeling, hardening).
- Técnicas e modelos de mitigação de falhas.
- Monitoramento contínuo e princípios de confiança mínima (*least privilege*, *zero trust architecture*).
- Exemplos de falhas publicados por empresas como Google, AWS, GitHub e Microsoft.

---

### Estrutura da Atividade

#### Parte 1 – Estudo de Caso: Vazamento de Dados Críticos em Plataforma de Governo Digital (e-Cidadão)

**Contexto:**

O sistema e-Cidadão gerencia dados de milhões de cidadãos em uma plataforma integrada de serviços públicos digitais. Uma falha ocorreu após uma atualização de segurança apressada, o que resultou em:

- Violação de tokens de autenticação.
- Exposição de logs internos via API pública.
- Servidores de autenticação sem isolamento adequado.
- Mecanismos de verificação de integridade desativados em produção.
- Códigos maliciosos injetados por um ataque à cadeia de dependências de bibliotecas (supply chain attack).
- Falta de validação de contratos de confiança entre microsserviços.

**Descrição da Atividade:**

Em grupo:

1. **Identifique os ativos críticos** do sistema e os principais pontos de vulnerabilidade.

2. **Analise as falhas sob quatro perspectivas:**
   - **Confiabilidade**: falhas previsíveis do sistema sob carga.
   - **Proteção**: lacunas de hardening e segregação de ambientes.
   - **Confiança**: ausência de critérios explícitos de verificação entre partes.
   - **Segurança**: ameaças, brechas e vetores de ataque explorados.

3. **Elabore uma matriz de risco** (probabilidade × impacto) com pelo menos 5 riscos principais.

4. **Proponha uma política de confiança e segurança**, considerando:
   - Segmentação de responsabilidades.
   - Especificações formais de confiança.
   - Mecanismos de proteção reativa e proativa.
   - Modelos de controle de acesso adaptativos.
   - Monitoramento contínuo com alertas inteligentes.

---

#### Parte 2 – Discussão e Apresentações

Cada grupo apresentará suas conclusões (20-30 minutos) com slides, quadro ou mapa conceitual. Em seguida, realizaremos um debate em sala.

**Pontos sugeridos para o debate:**

- Como podemos garantir a confiança em componentes de terceiros?
- Quais os limites práticos da confiabilidade em sistemas altamente conectados?
- Como alinhar segurança e usabilidade em sistemas de larga escala?
- O que deve ser especificado como requisitos não funcionais de segurança em projetos reais?

---

### Avaliação da Atividade

- Participação individual e colaboração (20%)
- Qualidade e profundidade da análise (30%)
- Coerência e aplicabilidade das propostas (30%)
- Clareza e objetividade na apresentação (20%)
