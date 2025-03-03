
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS E AS TABELAS

CREATE DATABASE StreamingDB;

USE StreamingDB;

CREATE TABLE Usuarios (
	id INT PRIMARY KEY IDENTITY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	data_cadastro DATE NOT NULL
);

CREATE TABLE Artistas (
	id INT PRIMARY KEY IDENTITY,
	nome VARCHAR(100) NOT NULL,
	genero VARCHAR(50) NOT NULL
);

CREATE TABLE Albuns (
	id INT PRIMARY KEY IDENTITY,
	titulo VARCHAR(50) NOT NULL,
	artista_id INT FOREIGN KEY REFERENCES Artistas (id),
	ano_lancamento INT NOT NULL
);

CREATE TABLE Musicas (
	id INT PRIMARY KEY IDENTITY,
	titulo VARCHAR(50) NOT NULL,
	album_id INT FOREIGN KEY REFERENCES Albuns (id),
	duracao TIME NOT NULL,
);

CREATE TABLE Reproducoes (
	id INT PRIMARY KEY IDENTITY,
	musica_id INT FOREIGN KEY REFERENCES Musicas (id),
	usuario_id INT FOREIGN KEY REFERENCES Usuarios (id),
	data_reproducao DATETIME NOT NULL
);

-- SISTEMA DE PLAYLISTS, ONDE OS USUÁRIOS PODEM SALVAR SUAS MÚSICAS FAVORITAS

CREATE TABLE Playlists (
	id INT PRIMARY KEY IDENTITY,
	nome VARCHAR(50) NOT NULL,
	usuario_id INT FOREIGN KEY REFERENCES Usuarios (id),
	data_criacao DATE NOT NULL
);

CREATE TABLE Playlist_Musicas (
	id INT PRIMARY KEY IDENTITY,
	playlist_id INT FOREIGN KEY REFERENCES Playlists (id),
	musica_id INT FOREIGN KEY REFERENCES Musicas (id)
);

-- TABELA QUE ARMAZENA AS PRIMEIRAS REPRODUÇÕES DE UM USUÁRIO

CREATE TABLE Historico_Primeira_Reproducao (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT FOREIGN KEY REFERENCES Usuarios(id) NOT NULL,
    musica_id INT FOREIGN KEY REFERENCES Musicas(id) NOT NULL,
    data_primeira_reproducao DATETIME NOT NULL DEFAULT GETDATE()
);

--------------------------------------------------------TRIGGER---------------------------------------------------------------------|
-- REGISTA A PRIMEIRA VEZ QUE UM USUÁRIO TOCA UMA MÚSICA

GO
CREATE TRIGGER trg_Registro_Primeira_Reproducao
ON Reproducoes
AFTER INSERT
AS
BEGIN
    -- Adicionando ao histórico apenas se for a primeira vez que o usuário ouve a música
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

