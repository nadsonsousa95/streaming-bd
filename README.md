# 🎵 StreamingDB - Banco de Dados para Plataforma de Streaming de Música

## 📌 Sobre o Projeto

O **StreamingDB** é um sistema fictício de banco de dados relacional projetado para gerenciar uma plataforma de streaming de música. Ele contém informações sobre usuários, artistas, álbuns, músicas, playlists e reproduções, permitindo o armazenamento e a análise de dados relacionados à experiência do usuário na plataforma.

## 📂 Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

- **Usuarios**: Armazena informações dos usuários cadastrados.
- **Artistas**: Contém dados sobre os artistas disponíveis na plataforma.
- **Albuns**: Guarda informações sobre os álbuns e seus respectivos artistas.
- **Musicas**: Registra as músicas e seus detalhes, como título e duração.
- **Reproducoes**: Armazena o histórico de músicas ouvidas pelos usuários.
- **Playlists**: Permite que os usuários criem e gerenciem suas playlists.
- **Playlist_Musicas**: Relaciona as músicas adicionadas às playlists.
- **Historico_Primeira_Reproducao**: Registra a primeira vez que um usuário ouviu uma música.

## 🚀 Funcionalidades Implementadas

- Cadastro de usuários, artistas, álbuns, músicas e playlists.
- Registro das reproduções realizadas pelos usuários.
- Gatilho (**Trigger**) para salvar a primeira vez que um usuário ouve uma música.
- Consultas SQL para análise de dados, como:
  - Músicas mais populares
  - Artistas mais reproduzidos
  - Tempo total de reprodução de cada música
  - Ranking de usuários mais ativos

## 🛠️ Tecnologias Utilizadas

- **Banco de Dados**: SQL Server
- **Linguagem SQL**: Para criação e manipulação do banco de dados
- **Triggers e Stored Procedures**: Para automação de processos no banco de dados

## 📜 Scripts Principais

### 🎯 Criação do Banco de Dados e das Tabelas

O script **streamingdb.sql** contém toda a estrutura do banco, incluindo a criação das tabelas e seus relacionamentos.

### 🔥 Trigger: Registro da Primeira Reprodução

Um **TRIGGER** foi implementado para armazenar automaticamente a primeira vez que um usuário ouve uma música.

```sql
GO
CREATE TRIGGER trg_Registro_Primeira_Reproducao
ON Reproducoes
AFTER INSERT
AS
BEGIN
    INSERT INTO Historico_Primeira_Reproducao (usuario_id, musica_id, data_primeira_reproducao)
    SELECT i.usuario_id, i.musica_id, GETDATE()
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1
        FROM Historico_Primeira_Reproducao h
        WHERE h.usuario_id = i.usuario_id
        AND h.musica_id = i.musica_id
    );
END;
```

### 📊 Consultas SQL Implementadas

O projeto também inclui diversas consultas para análise de dados, como:

- Listagem das músicas de um artista específico
- Contagem de reproduções de cada música
- Tempo total de reprodução por música
- Álbuns lançados nos últimos 5 anos
- Ranking de usuários mais ativos

## 📎 Como Usar

1. Importe e execute o script **streamingdb.sql** no SQL Server.
2. execute o **inserts.sql** para inserir dados no banco
3. Utilize os scripts de consultas para analisar os dados da plataforma.


---

💡 **Contribuições são bem-vindas!** Se quiser adicionar novas funcionalidades, sinta-se à vontade para abrir um PR. 🎶

