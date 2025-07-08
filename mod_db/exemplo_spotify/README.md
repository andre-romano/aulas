## Sistema de Streaming de Música (Spotify-like)

**Descrição**: Um sistema de *streaming* de músicas, semelhante ao Spotify. 

O sistema permite que usuários acessem, escutem e gerenciem um vasto catálogo de faixas musicais por meio de conexão à internet. Cada usuário pode criar playlists personalizadas, seguir artistas, avaliar músicas

**Funcionalidades:**

- Cadastro de usuários (email, senha, nome, tipo de conta).
- Tipo de contas (gratuito ou premium).
- Consulta por músicas (id, nome, gênero, artistas, album).
- Consulta por artistas (id, nome, data_nascimento).
- Consulta por álbuns (id, nome).
- Consulta por gêneros (id, nome).
- Criação de playlists pelos usuários (id, musicas).
- Registro de avaliações das musicas (id, nota, musica).
- Histórico de reprodução (musica_ou_playlist, data_hora).
- Relatórios estatísticos: músicas mais ouvidas, playlists populares, usuários ativos, etc.

**Condições e Restrições:**

- Apenas usuários podem criar playlists, avaliar e escutar músicas.
- Cada música deve estar associada a pelo menos um gênero musical, um artista, e um album..
- Álbuns e playlists não podem conter musicas duplicadas.
- O sistema deve registrar o histórico de reprodução para futuras análises e relatórios.
- Nao podem existir usuários diferentes com mesmo email.

### Modelo conceitual (completo)

![alt](img/modelo_conceitual.png)

Abra o arquivo do BrModelo [./modelo_conceitual.brM3](./modelo_conceitual.brM3) para maiores detalhes.

### Modelo lógico (completo)

![alt](img/modelo_logico.png)

Abra o arquivo do BrModelo [./modelo_logico.brM3](./modelo_logico.brM3) para maiores detalhes.
 