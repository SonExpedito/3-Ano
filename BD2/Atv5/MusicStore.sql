create database MusicStore;
use MusicStore;

create table CDs(
	ID Int Identity Primary Key ,
	Nome_Cd Varchar(50) Not Null,
	Data_Compra date Not Null,
	ValorPago float Not Null,
	LocalCompra varchar(50) Not Null,
	Album Bit Not Null
);

create table Musicas(
	Codigo_Cd Int,
	Numero_Musica int Not Null,
	Nome_Musica varchar(50) Not Null,
	Artista varchar(50) Not Null,
	Tempo time Not Null,

	foreign key (Codigo_CD) references Cds(ID)

);

Insert into CDs(Nome_Cd,Data_Compra,ValorPago,LocalCompra, Album) Values 
('Todo Mundo Odeia o IG', '2024-03-21', 125.50,'Americanas',1),
('Justin in Time', '2021-03-19', 89.99, 'Universal Music',0),
('After and The Star', '2016-11-25', 72.25,'Mercado Livre',0),
('24K Magic', '2016-11-18',110.00,'Amazon',1),
('Montero','2021-11-17',75.25,'Submarino',1);


Insert into Musicas (Codigo_Cd,Numero_Musica,Nome_Musica,Artista,Tempo) Values
-- Músicas do álbum "Todo Mundo Odeia o IG"
(1, 1, 'Olá, Moça', 'Veigh ft Mc Ig', '00:02:44'),
(1, 2, 'Deus por favor', 'Mc Kevin, Mc IG, PH', '00:04:39'),
(1, 3, 'Goodnight Menina 3', 'MC Ig feat Dj Glenner', '00:03:29'),

-- Músicas selecionadas do Justin Bieber
(2, 1, 'Sorry', 'Justin Bieber', '00:03:20'),
(2, 2, 'Peaches', 'Justin Bieber,Daniel Ceaser & Giveon', '00:03:18'),
(2, 3, 'What do you Mean?', 'Justin Bieber', '00:03:27'),

-- Músicas selecionadas do The Weeknd
(3, 1, 'Die for You', 'The Weeknd', '00:04:20'),
(3, 2, 'Save Your Tears', 'The Weeknd', '00:03:35'),
(3, 3, 'Blinding Lights', 'The Weeknd', '00:03:20'),

-- Músicas do álbum "24K Magic"
(4, 1, '24K Magic', 'Bruno Mars', '00:03:46'),
(4, 2, 'That''s What I Like', 'Bruno Mars', '00:03:26'),
(4, 3, 'Versace on the Floor', 'Bruno Mars', '00:04:21'),

-- Músicas do álbum "Montero"
(5, 1, 'Montero (Call Me by Your Name)', 'Lil Nas X', '00:02:18'),
(5, 2, 'Industry Baby', 'Lil Nas X feat Jack Harlow', '00:03:32'),
(5, 3, 'That''s What I Want', 'Lil Nas X', '00:02:24');

Select * from CDs;
Select Nome_Cd, Data_Compra from CDs order by Nome_Cd;
Select Nome_Cd, Data_Compra from CDs order by Data_Compra desc;
Select Nome_Cd, Data_Compra, ValorPago from CDs order by ValorPago desc;
Select Sum(ValorPago) from CDs;


Select * from Musicas where Codigo_Cd = 1;
Select Nome_Musica, Artista from Musicas;
Select Numero_Musica, Nome_Musica, Tempo from Musicas where Codigo_Cd = 5;
Select Count(Codigo_Cd) from Musicas;
Select * from Musicas where Artista like 'José Pedro';

Select * from Cds where LocalCompra like 'Submarino';

Select * from Musicas order by Nome_Musica;

Select * from CDs where Album = 1;

Select avg(ValorPago) from CDs;
