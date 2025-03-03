
-- INSERÇÃO DE DADOS NAS TABELAS

USE StreamingDB;

-- USUÁRIOS
INSERT INTO Usuarios VALUES ('Nadson Sousa95', 'nadsonbcs95@gmail.com', '24/03/2020');
INSERT INTO Usuarios VALUES ('Anne_Sande', 'anasande33@gmail.com', '04/09/2021');
INSERT INTO Usuarios VALUES ('Luis_André', 'lluisandre@gmail.com', '11/12/2019');
INSERT INTO Usuarios VALUES ('_Marlo Santos', 'marlosants@gmail.com', '01/05/2020');
INSERT INTO Usuarios VALUES ('Joao victor', 'joaovictor@gmail.com', '23/12/2024');

SELECT * FROM Usuarios;

-- ARTISTAS
INSERT INTO Artistas VALUES ('Djavan', 'MPB');
INSERT INTO Artistas VALUES ('Bruna Karla', 'Gospel');
INSERT INTO Artistas VALUES ('Caetano Veloso', 'MPB');
INSERT INTO Artistas VALUES ('Annita', 'Pop');
INSERT INTO Artistas VALUES ('Orochi', 'Rap');
INSERT INTO Artistas VALUES ('Thales Roberto','Gospel');
INSERT INTO Artistas VALUES ('Felipe Ret','Rap/Trap');
INSERT INTO Artistas VALUES ('Pablo','Arrocha');
INSERT INTO Artistas VALUES ('Jorge Vercillo','MPB');
INSERT INTO Artistas VALUES ('Péricles','Pagode/Samba');
INSERT INTO Artistas VALUES ('Natiruts','Reagge');
INSERT INTO Artistas VALUES ('Fernandinho','Gospel');
INSERT INTO Artistas VALUES ('ANAVITÓRIA','MPB');

SELECT * FROM Artistas;

-- ALBUNS
INSERT INTO Albuns VALUES ('As melhores do Djavan', 1, 2024);
INSERT INTO Albuns VALUES ('Balão', 5, 2022);
INSERT INTO Albuns VALUES ('Aceito o Teu Chamado', 2, 2017);
INSERT INTO Albuns VALUES ('Falando de Amor', 2, 2014);
INSERT INTO Albuns VALUES ('Funk Generation', 4, 2024);
INSERT INTO Albuns VALUES ('Caetanear', 3, 2007);
INSERT INTO Albuns VALUES ('Esquinas', 13, 2024);
INSERT INTO Albuns VALUES ('Único', 12, 2023);
INSERT INTO Albuns VALUES ('JV30 Tour Deluxe', 9, 2025);
INSERT INTO Albuns VALUES ('NUME', 7, 2024);

SELECT * FROM Albuns;

-- MÚSICAS
INSERT INTO Musicas VALUES ('Advogado Fiel', 3, '00:02:10');
INSERT INTO Musicas VALUES ('Mitsubich', 2, '00:01:54');
INSERT INTO Musicas VALUES ('Sina', 1, '00:04:18');
INSERT INTO Musicas VALUES ('Oceano', 1, '00:04:56');
INSERT INTO Musicas VALUES ('Envolver', 5, '00:03:15');
INSERT INTO Musicas VALUES ('Sozinho', 6, '00:02:49')
INSERT INTO Musicas VALUES ('NVMX', 10, '00:00:45');
INSERT INTO Musicas VALUES ('Melhor lugar (Ao Vivo)', 9, '00:04:00');
INSERT INTO Musicas VALUES ('Único (Live)', 8, '00:03:58');
INSERT INTO Musicas VALUES ('Ponta solta', 7, '00:03:15');

SELECT * FROM Musicas;

--REPRODUÇÕES
INSERT INTO Reproducoes VALUES (4, 1, '14/05/2024');
INSERT INTO Reproducoes VALUES (3, 1, '15/06/2024');
INSERT INTO Reproducoes VALUES (1, 2, '08/11/2023');
INSERT INTO Reproducoes VALUES (2, 3, '10/02/2025');
INSERT INTO Reproducoes VALUES (5, 4, '01/02/2022');
INSERT INTO Reproducoes VALUES (6, 5, '08/01/2025');
INSERT INTO Reproducoes VALUES (1, 2, '14/05/2024');
INSERT INTO Reproducoes VALUES (3, 5, '30/06/2021');
INSERT INTO Reproducoes VALUES (2, 1, '30/11/2022');
INSERT INTO Reproducoes VALUES (6, 2, '03/11/2024');
INSERT INTO Reproducoes VALUES (5, 3, '03/03/2023');
INSERT INTO Reproducoes VALUES (4, 1, '03/07/2024');
INSERT INTO Reproducoes VALUES (4, 2, '03/07/2024');
INSERT INTO Reproducoes VALUES (3, 1, '01/01/2025');
INSERT INTO Reproducoes VALUES (5, 5, '02/02/2024');
INSERT INTO Reproducoes VALUES (4, 5, '20/02/2023');
INSERT INTO Reproducoes VALUES (10, 4, '22/12/2023');

SELECT * FROM Reproducoes;

INSERT INTO Playlists VALUES ('Minhas favoritas do MPB', 1, '01/05/2024');
INSERT INTO Playlists VALUES ('To my first love', 2, '14/05/2024');
INSERT INTO Playlists VALUES ('TRAP favoritos', 4, '12/11/2023');
INSERT INTO Playlists VALUES ('Bom dia, Espírito Santo', 2, '12/11/2023');
INSERT INTO Playlists VALUES ('Favoritas', 3, '12/01/2023');

SELECT * FROM Playlists

INSERT INTO Playlist_Musicas VALUES (1, 4);
INSERT INTO Playlist_Musicas VALUES (1, 3);
INSERT INTO Playlist_Musicas VALUES (1, 6);
INSERT INTO Playlist_Musicas VALUES (1, 8);
INSERT INTO Playlist_Musicas VALUES (2, 4);
INSERT INTO Playlist_Musicas VALUES (2, 10);
INSERT INTO Playlist_Musicas VALUES (2, 6);
INSERT INTO Playlist_Musicas VALUES (3, 2);
INSERT INTO Playlist_Musicas VALUES (3, 7);
INSERT INTO Playlist_Musicas VALUES (4, 1);
INSERT INTO Playlist_Musicas VALUES (4, 9);

SELECT * FROM Playlist_Musicas