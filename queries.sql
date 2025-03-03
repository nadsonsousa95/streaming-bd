
-- CONSULTAS

use StreamingDB;

-- Lista todos as músicas do artista Djavan em ordem alfabética:

select M.titulo
from Musicas M
inner join Albuns A on A.id = M.album_id
inner join Artistas Ar on A.artista_id = Ar.id
where Ar.nome = 'Djavan'
order by M.titulo asc;

-- Exibe quantas vezes cada música foi reproduzida, ordenando do mais para a menos popular:

select M.titulo, 'Reproduções' = count(R.musica_id)
from Musicas M
inner join Reproducoes R on M.id = R.musica_id
group by M.titulo
order by count(R.musica_id) desc;

-- Lista os álbuns lançados nos últimos 5 anos, em ordem alfabética:

select titulo, ano_lancamento
from Albuns
where (year(getdate()) - ano_lancamento) <= 5
order by titulo asc;

-- Exibe os artistas mais reproduzidos no Streaming, ordenando do mais para o menos popular:

select 'Artista'= Ar.nome, 'Reproduções' = count(R.musica_id)
from Artistas Ar
inner join Albuns A on Ar.id = A.artista_id
inner join Musicas M on A.id = M.album_id
inner join Reproducoes R on M.id = R.musica_id
group by Ar.nome
order by count(R.musica_id) desc;

-- Calcula quanto tempo total cada música já foi ouvida na plataforma:

select 'Música' = M.titulo, 
'Tempo total de reprodução' = cast(dateadd(second, 
				sum(datediff(second, '00:00:00', M.duracao)), '00:00:00') as time)
from Musicas M
inner join Reproducoes R on R.musica_id = M.id
group by M.titulo
order by 'Tempo total de reprodução' desc;

-- Exibe quantas músicas cada playlist possui:

select P.nome as Playlist, 'Total de Músicas' = count(PM.musica_id)
from Playlists P
inner join Playlist_Musicas PM on P.id = PM.playlist_id
group by P.nome
order by 'Total de Músicas' desc;

-- Ranking dos 3 usuários que mais escutam músicas na plataforma:

select top 3 U.nome as Usuário, 'Reproduções' = count(R.usuario_id)
from Usuarios U
inner join Reproducoes R on U.id = R.usuario_id
group by U.nome 
order by 'Reproduções' desc;




