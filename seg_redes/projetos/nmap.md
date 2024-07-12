
### Projeto: Auditoria de Segurança de Rede com Nmap e Normas ISO 27001/27002

#### Objetivo do Projeto:
Realizar uma auditoria de segurança de rede utilizando a ferramenta Nmap e alinhando os resultados obtidos com os requisitos das normas ISO 27001 (Sistema de Gestão de Segurança da Informação) e ISO 27002 (Código de Prática para Controles de Segurança da Informação).

#### Etapas do Projeto:

1. **Introdução e Contextualização:**
   - Explicar o contexto da segurança de redes, importância da auditoria de segurança e relevância das normas ISO 27001/27002.

2. **Planejamento:**
   - Definir o escopo da auditoria.
   - Estabelecer objetivos e critérios de auditoria baseados nas normas ISO 27001/27002.
   - Selecionar os sistemas e redes a serem auditados.
     - **Sugestão**: instalar, configurar e auditar os seguintes serviços e sistemas.
       - Servidor SSH (porta 22) usando [OpenSSH for Windows](https://learn.microsoft.com/pt-br/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui#install-openssh-for-windows)   
       - Servidor FTP (portas 20/21) usando [Filezilla Server](https://filezilla-project.org/download.php?type=server)       
       - Servidor SAMBA (portas 137-139 e 445) do Windows, para isso ative o compartilhamento de uma pasta no Windows seguindo [esse tutorial](https://tecnoblog.net/responde/como-compartilhar-uma-pasta-na-rede-e-encontra-la-no-windows-10/)
       - Servidor Web com Banco de dados SQL (portas 80/443 e 3306) usando [XAMPP](https://sourceforge.net/projects/xampp/files/latest/download)
     - **OBS**: Demais serviços e sistemas em execução do Windows, mesmo aqueles que vocês nao tenham instalado e configurado, também devem ser investigados. Para isso faça uma varredura das portas 0-1024 da máquina alvo.

3. **Execução da Auditoria:**
   - Configurar o ambiente de testes e preparar a execução do Nmap.
     - Para isso, instale e configure os serviços e sistemas em uma das máquinas que vocês pretendem auditar.
     - A outra máquina deve possuir o NMAP instalado, conforme instruções contidas [neste video tutorial](https://www.youtube.com/watch?v=4p8Eq2Ldxy4).
   - Realizar varreduras de rede utilizando o Nmap para identificar ativos de rede, portas abertas, serviços em execução e o sistema operacional em execuçao na máquina alvo.
   - Documentar os resultados das varreduras, incluindo vulnerabilidades identificadas.
     - Utilize bases de dados como o [Exploit-DB](https://www.exploit-db.com/) ou outros similares para ajudar em sua documentação.

4. **Análise de Resultados:**
   - Comparar os resultados obtidos com os controles de segurança da ISO 27001/27002.
   - Identificar pontos fortes e áreas de melhoria em relação às práticas recomendadas pelas normas.

5. **Relatório de Auditoria:**
   - Preparar um relatório detalhado da auditoria, em formato PDF, incluindo:
     - Resumo da metodologia utilizada.
     - Descrição dos ativos de rede auditados.
     - Análise das vulnerabilidades identificadas.
     - Recomendações para mitigação de vulnerabilidades e melhoria da segurança conforme as normas ISO 27001/27002.

6. **Apresentação dos Resultados:**
   - Apresentar os resultados da auditoria em formato de seminário ou apresentação para os colegas e professores.
     - A duração do seminário será definida em momento oportuno, em sala de aula.
   - Discutir as lições aprendidas, desafios enfrentados e possíveis melhorias no processo de auditoria.

#### Recursos Necessários:
- Dois ou mais computadores conectados em uma rede LAN. 
  - Um realizará a varredura usando o Nmap.
  - A outra máquina será o alvo da varredura.
- Documentação das normas ISO 27001/27002 para referência durante a auditoria.
- Ferramentas de documentação e elaboração de relatórios (Word, LaTeX, ou outro equivalente).
