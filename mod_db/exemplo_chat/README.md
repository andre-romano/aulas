## Sistema de Chat On-line

**Descrição**: Um sistema de chat online semelhante ao WhatsApp, que permite que os usuários enviem mensagens entre si e também participem de grupos de conversa. O sistema armazena informações dos usuários, mensagens, membros dos grupos e histórico de conversas.

**Sumário**:
- [Sistema de Chat On-line](#sistema-de-chat-on-line)
  - [Modelo conceitual (completo)](#modelo-conceitual-completo)
  - [Modelo lógico (completo)](#modelo-lógico-completo)
    - [Exemplos de tabelas](#exemplos-de-tabelas)

**Funcionalidades:**

- Cadastro de usuários (telefone, nome, nome_arquivo_foto_perfil)
- Envio de mensagens de texto (id, data_hora_envio, origem, destinatario, mensagem)
- Criação de grupos de conversa (nome do grupo,usuarios)
- Adição e remoção de membros em grupos (usuario, eh_administrador)
- Histórico completo de mensagens entre usuários e dentro de grupos

**Condições e Restrições:**
- Um usuário só pode enviar mensagens em grupo se for membro daquele grupo.
- Cada grupo pode ter um ou mais administradores.
- Mensagens não podem ser apagadas ou editadas após o envio.
- Um usuário pode participar de vários grupos.
- Um grupo pode ter vários usuários.
- Cada mensagem deve estar associada a um remetente.
- O telefone do usuário deve ser único no sistema.

### Modelo conceitual (completo)

![alt](img/modelo_conceitual.png)

Abra o arquivo do BrModelo [./modelo_conceitual.brM3](./modelo_conceitual.brM3) para maiores detalhes.

### Modelo lógico (completo)

![alt](img/modelo_logico.png)

Abra o arquivo do BrModelo [./modelo_logico.brM3](./modelo_logico.brM3) para maiores detalhes.
 
#### Exemplos de tabelas

**Destinatario**:
| id_destinatario | nome              | nome_arq_foto_perfil |
| --------------- | ----------------- | -------------------- |
| 3               | Carlos Alberto    | carlos.jpg           |
| 4               | Padaria do Seu Zé | pze.png              |
| 5               | Josefina Silva    | jsilva.jpg           |
| 6               | Grupo de ADS      | ads_broca.png        |

**Usuario**:
| telefone        | id_destinatario |
| --------------- | --------------- |
| (71) 98765-4532 | 3               |
| (21) 3421-0000  | 4               |
| (75) 91234-5678 | 5               |

**Grupo**:
| id  | id_destinatario |
| --- | --------------- |
| 1   | 6               |


**Usuario_Destinatario**:
| id  | data_hora_envio     | mensagem                      | id_destinatario | telefone_remetente |
| --- | ------------------- | ----------------------------- | --------------- | ------------------ |
| 1   | 2025-07-10 07:55:26 | Ola Seu Zé, tudo bem?         | 4               | (75) 91234-5678    |
| 2   | 2024-02-28 16:41:02 | O que vai cair na prova hoje? | 6               | (71) 98765-4532    |

**Usuario_Grupo**:
| tel_usuario     | id_grupo | eh_administrador |
| --------------- | -------- | ---------------- |
| (71) 98765-4532 | 6        | true             |
| (75) 91234-5678 | 6        | false            |
