## Solucao - Sistema de Streaming de Música (Spotify-like)

A descricao dos requisitos do sistema podem ser encontrados no arquivo [README.md](./README.md).

### Modelo conceitual (completo)

![alt](img/modelo_conceitual.png)

Abra o arquivo do BrModelo [./modelo_conceitual.brM3](./modelo_conceitual.brM3) para maiores detalhes.

### Modelo lógico (completo)

![alt](img/modelo_logico.png)

Abra o arquivo do BrModelo [./modelo_logico.brM3](./modelo_logico.brM3) para maiores detalhes.
 
#### Exemplos de tabelas

**Artista**:
| id  | nome            |
| --- | --------------- |
| 1   | Gun's and Roses |
| 2   | Michael Jackson |

**Album**:
| id  | nome                  |
| --- | --------------------- |
| 1   | Nothing Lasts Forever |
| 2   | Chinese Democracy     |
| 3   | Thriller              |

**Genero**:
| id  | nome |
| --- | ---- |
| 1   | Rock |
| 2   | Pop  |

**Musica**:
| id  | nome     | duracao  |
| --- | -------- | -------- |
| 1   | Beat It  | 00:04:18 |
| 2   | Better   | 00:04:59 |
| 3   | Attitude | 00:02:19 |

**Playlist**:
| id  | nome          |
| --- | ------------- |
| 1   | Rock anos 80  |
| 2   | Pop topíssimo |

**Tipo_conta**:
| id  | nome     |
| --- | -------- |
| 1   | Gratuita |
| 2   | Premium  |

**Usuario**:
| email            | nome             | senha | id_tipo_conta |
| ---------------- | ---------------- | ----- | ------------- |
| joao.c@gmail.com | Joao Costa       | 1234  | 1             |
| eumbu@uol.com.br | Eliane Umbuzeiro | 5678  | 2             |
| carnob@yahoo.com | Carlos Nobrega   | senha | 2             |

**Avalia_Musica**:
| id  | email_usuario    | id_musica | nota |
| --- | ---------------- | --------- | ---- |
| 1   | eumbu@uol.com.br | 3         | 7    |
| 2   | eumbu@uol.com.br | 2         | 10   |
| 2   | joao.c@gmail.co  | 3         | 2    |

**Playlist_Musica**:
| id_playlist | id_musica |
| ----------- | --------- |
| 1           | 3         |
| 2           | 1         |

**Escuta_Playlist**:
| email_usuario    | id_playlist | data_hora           | duracao_escutada | id_musica_escutada |
| ---------------- | ----------- | ------------------- | ---------------- | ------------------ |
| joao.c@gmail.com | 2           | 2025-07-10 08:51:20 | 00:03:01         | 1                  |
| eumbu@uol.com.br | 1           | 2024-01-15 18:32:12 | 00:02:01         | 3                  |

**Escuta_Musica**:
| email_usuario    | id_musica | data_hora           | duracao_escutada |
| ---------------- | --------- | ------------------- | ---------------- |
| carnob@yahoo.com | 2         | 2025-04-20 16:10:11 | 00:03:33         |

**Musica_Artista**:
| id_musica | id_artista |
| --------- | ---------- |
| 1         | 2          |
| 2         | 1          |
| 3         | 1          |

**Musica_Album**:
| id_musica | id_album |
| --------- | -------- |
| 1         | 3        |
| 2         | 2        |
| 3         | 1        |

**Musica_Genero**:
| id_musica | id_genero |
| --------- | --------- |
| 1         | 2         |
| 2         | 1         |
| 3         | 1         |