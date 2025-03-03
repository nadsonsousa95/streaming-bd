
-- CONSULTAS

use StreamingDB;

-- Lista todos as m�sicas do artista Djavan em ordem alfab�tica:

select M.titulo
from Musicas M
inner join Albuns A on A.id = M.album_id
inner join Artistas Ar on A.artista_id = Ar.id
where Ar.nome = 'Djavan'
order by M.titulo asc;

-- Exibe quantas vezes cada m�sica foi reproduzida, ordenando do mais para a menos popular:

select M.titulo, 'Reprodu��es' = count(R.musica_id)
from Musicas M
inner join Reproducoes R on M.id = R.musica_id
group by M.titulo
order by count(R.musica_id) desc;

-- Lista os �lbuns lan�ados nos �ltimos 5 anos, em ordem alfab�tica:

select titulo, ano_lancamento
from Albuns
where (year(getdate()) - ano_lancamento) <= 5
order by titulo asc;

-- Exibe os artistas mais reproduzidos no Streaming, ordenando do mais para o menos popular:

select 'Artista'= Ar.nome, 'Reprodu��es' = count(R.musica_id)
from Artistas Ar
inner join Albuns A on Ar.id = A.artista_id
inner join Musicas M on A.id = M.album_id
inner join Reproducoes R on M.id = R.musica_id
group by Ar.nome
order by count(R.musica_id) desc;

-- Calcula quanto tempo total cada m�sica j� foi ouvida na plataforma:

select 'M�sica' = M.titulo, 
'Tempo total de reprodu��o' = cast(dateadd(second, 
							  sum(datediff(second, '00:00:00', M.duracao)), '00:00:00') as time)
from Musicas M
inner join Reproducoes R on R.musica_id = M.id
group by M.titulo
order by 'Tempo total de reprodu��o' desc;

-- Exibe quantas m�sicas cada playlist possui:

select P.nome as Playlist, 'Total de M�sicas' = count(PM.musica_id)
from Playlists P
inner join Playlist_Musicas PM on P.id = PM.playlist_id
group by P.nome
order by 'Total de M�sicas' desc;

-- Ranking dos 3 usu�rios que mais escutam m�sicas na plataforma:

select top 3 U.nome as Usu�rio, 'Reprodu��es' = count(R.usuario_id)
from Usuarios U
inner join Reproducoes R on U.id = R.usuario_id
group by U.nome 
order by 'Reprodu��es' desc;




