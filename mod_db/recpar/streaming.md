### Sistema de Gerenciamento de Streamings de Video

  Construa um modelo conceitual e relacional para um sistema de streaming de video (similar a Netflix). O sistema deve fornecer as funcionalidades descritas abaixo.
  
- **LEMBRE-SE**: Os modelos conceitual e relacional descrevem **APENAS** como os dados serão estruturados e organizados dentro de um banco de dados, de forma a permitir a implementação das funcionalidades do sistema. Assim, esses modelos **NÃO** descrevem as funcionalidades do sistema.
  - **Ex**: Com uma tabela de visualização de filmes, podemos descobrir quais são os filmes mais populares pela quantidade de vezes que usuários diferentes assistiram a um determinado filme.
    - **Funcionalidade**: 
      - Pesquisar e ordenar filmes por popularidade.
    - **Como (dados necessários)**: 
      - Criar uma entidade *Visualizacoes (ID do filme, ID do usuario, data e hora que o usuário começou a assistir)*.
      - Criar um relacionamento ternário entre as entidades *Filmes*, *Usuarios* e *Visualizacoes*.
      - Definir a cardinalidade máxima ("onde está a chave estrangeira é onde estará a cardinalidade máxima N").

#### Funcionalidades

1. **Gestão de Conteúdo de Vídeos**:
   - Upload de novos vídeos com atribuição de título, sinopse, categorias, e duração.
   - Edição e remoção de vídeos existentes.
  
2. **Navegação e Busca de Vídeos**:
   - Visualização de vídeos por categoria, popularidade ou avaliação dos usuários.
   - Busca por vídeos usando palavras-chave.

3. **Interação com Conteúdo**:
   - Avaliação de vídeos com estrelas.
   - Assistir vídeos com diferentes qualidades a depender do plano de assinatura do usuário (gratuito, HD, 4K premium, etc).

4. **Histórico de Visualização**:
   - Registro de vídeos assistidos, permitindo continuar a reprodução de onde parou.
   - Exibição de histórico de vídeos assistidos para referência futura.

- **LEMBRE-SE**: Entidades, atributos e relacionamentos NÃO PODEM ter caracteres especiais (acentos, hífen, e outros) ou espaços.
  - O único caractere especial permitido é o underline ( _ ).

#### Entidades (sugestão)

- **Usuário**: ID do usuário, nome, e-mail, senha, data de nascimento, data de registro, tipo de assinatura (gratuita, HD, 4K premium, etc).
- **Vídeo**: ID do vídeo, título, descrição, duração, data de upload, categoria. 
- **Categoria**: ID da categoria, nome da categoria, descrição.
- **Avaliação**: ID da avaliação, ID do vídeo, ID do usuário, pontuação (de 1 a 5 estrelas), data da avaliação.
- **Visualização**: ID da visualização, ID do usuário, ID do vídeo, data e hora da visualização, duração assistida.

- **LEMBRE-SE**: Essas sao SOMENTE sugestões, que podem ou não estar de acordo com a 3FN. Ajuste