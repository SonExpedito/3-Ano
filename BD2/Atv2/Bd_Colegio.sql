create database Bd_Colegio;
use Bd_Colegio;


create table Disciplinas (
	CodDisciplina char (2),
	NomeDisciplina varchar (30),

	primary key (CodDisciplina)

);



create table Cursos(
	codcurso char (2),
	nome varchar(50) Not Null,
	coddisc1 char (2),
	coddisc2 char (2),
	coddisc3 char (2),


	primary key (codcurso),
	foreign key (coddisc1) references Disciplinas,
	foreign key (coddisc2) references Disciplinas,
	foreign key (coddisc3) references Disciplinas
);




create table Alunos(
	matricula varchar (5),
	nome varchar (50) Not Null,
	endereco varchar (50) Not Null,
	cidade varchar (30) Not Null,
	codcurso char (2),

	primary key (matricula),
	foreign key (codcurso) references Cursos

);


Insert into Disciplinas (CodDisciplina, NomeDisciplina) 
Values 
(11,'Banco de Dados'),
(12,'Lógica de Programação'),
(13,'Desenvolvimento de Software 1'),
(21,'Banco de Dados 2'),
(22,'Desenvolvimento de Software 2'),
(23,'Programação de Computadores 1'),
(31,'Banco de Dados 3'),
(32,'Programção de Computadores 2 '),
(33,'Desenvolvimento de Software 3');


Insert into Cursos (codcurso, nome, coddisc1, coddisc2, coddisc3) 
Values
(01, 'Auxíliar de Informática',11,12,13),
(02, 'Programador de Computadores',21,22,23),
(03, 'Técnico em informática',31,32,33);

Insert into Alunos (matricula, nome, endereco, cidade, codcurso)
Values
(10001,'Marcos Moraes','Rua Pe Roque, 2057','Mogi Mirim',01),
(10002,'Maria Conceição Lopes','Rua Araras,23','Mogi Guaçu',01),
(10003,'Ana Carina Lopes','Rua Peraltas,222','Santos',01),
(10004,'Carlos Aguiar','Rua Botafogo, 33','Santos',01),
(10005,'André Luiz dos Santos','Rua Lopes Conte, 3343','Sapucaí',01),
(10006,'Pedro Antonio Pimenta','Rua Altair Lopes, 33','Itapira',02),
(10007,'Rita de Cássia da Silva','Rua Eletromais, 33','Itapira',02),
(10008,'Caique dos Santos','Rua das Amoreiras, 55','Campinas',02),
(10009,'Carlos Tavares','Rua Peixe, 99','Santos',02),
(10010,'Antonio Carlos Caetano','Rua Josefina Alface, 987','Campinas',02),
(10011,'Ricardo Moreira','Rua do Pinhal, 332','Aparecida',03),
(10012,'Richardson S.P.Campeao','Rua do Tricolor, 433 ','São Paulo',03),
(10013,'Junior Camisa Seis','Rua do Morumbi, 433','São Paulo',03),
(10014,'Carina Melo','Rua Osvaldo Ramos, 88','Mogi Guaçu',03),
(10015,'Pedro Mello','Rua Itororó, 3999','Mogi Mirim',03);