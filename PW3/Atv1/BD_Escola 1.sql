create database Bd_Escola;
use Bd_Escola;

create table Alunos( 
	CodAluno int Identity,
	Nome varchar(50) Not Null,
	Endereco varchar (70) Not Null,
	telefone varchar (14) Not Null,
	DataNasc date Not Null,
	NomPai varchar (50) Not Null,
	NomMae varchar (50) Not Null,
	Responsavel varchar (50) Not Null,

	primary key (CodAluno)
);

create table Professores(
	codprofessor int identity,
	nome varchar (50) Not Null,
	endereco varchar (70) Not Null

	primary key (codprofessor)
);

create table Cursos(
	codcurso int identity,
	codprofessor int ,
	nomecurso varchar (50) Not Null,

	primary key (codcurso),
	foreign key (codprofessor) references Professores
)


create table Notas(
	codAluno int,
	codcurso int,
	nota int Not Null,
	ano int Not Null,
	bimestre varchar(2),
	observacao varchar(40),

	foreign key(codAluno) references Alunos,
	foreign key(codCurso) references Cursos

);


--Insert
--6 professores, 15 alunos, 4 cursos, 15 notas

INSERT into Alunos (Nome,Endereco,telefone,DataNasc,NomPai,NomMae,Responsavel) 
VALUES
  ('Peter Parker', 'Queens, Nova York', '(11) 9876-5432', '1962-08-02', 'Richard Parker', 'Mary Parker', 'May Parker'),
  ('Tony Stark', 'Manhattan, Nova York', '(12) 3333-2222', '1970-05-29', 'Howard Stark', 'Maria Stark', 'Jarvis'),
  ('Natasha Romanoff', 'Volgogrado, Rússia', '(13) 5555-4444', '1984-02-22', 'Ivan Romanoff', 'Melina Vostokoff', 'Nick Fury'),
  ('Bruce Banner', 'Dayton, Ohio', '(14) 7777-6666', '1969-12-18', 'Brian Banner', 'Rebecca Banner', 'Betty Ross'),
  ('Thor Odinson', 'Asgard', '(15) 9999-0000', '0965-01-01', 'Odin', 'Frigga', 'Heimdall'),
  ('Steve Rogers', 'Brooklyn, Nova York', '(16) 1111-2222', '1918-07-04', 'Joseph Rogers', 'Sarah Rogers', 'Peggy Carter'),
  ('Wanda Maximoff', 'Sokovia', '(17) 3333-4444', '1989-02-16', 'Olek Maximoff', 'Iryna Maximoff', 'Pietro Maximoff'),
  ('Stephen Strange', 'Manhattan, Nova York', '(18) 5555-6666', '1967-11-05', 'Eugene Strange', 'Beverly Strange', 'Wong'),
  ('Scott Lang', 'San Francisco, California', '(19) 7777-8888', '1985-01-17', 'Hank Pym', 'Janet Van Dyne', 'Maggie Lang'),
  ('Sam Wilson', 'Delacroix, Louisiana', '(20) 9999-0000', '1987-03-23', 'Paul Wilson', 'Sarah Wilson', 'James Rhodes'),
  ('Carol Danvers', 'Boston, Massachusetts', '(21) 1111-3333', '1968-06-01', 'Joseph Danvers', 'Marie Danvers', 'Yon-Rogg'),
  ('Clint Barton', 'Waverly, Iowa', '(22) 2222-4444', '1980-05-07', 'Harold Barton', 'Edith Barton', 'Laura Barton'),
  ('T Challa', 'Wakanda', '(23) 3333-5555', '1983-07-02', 'T Chaka', 'Ramonda', 'Nakia'),
  ('Peter Quill', 'Terra', '(24) 4444-6666', '1980-08-27', 'Ego', 'Meredith Quill', 'Yondu Udonta'),
  ('Groot', 'Planeta X', '(25) 5555-7777', '2014-11-22', 'Rocket Raccoon','Flora Colossus', 'Rocket Raccoon');


Insert into Professores (nome, endereco) 
VALUES
('Ana Silva', 'Rua das Flores, 123'),
('João Souza', 'Rua da Paz, 456'),
('Maria Oliveira', 'Rua do Sol, 789'),
('Pedro Santos', 'Rua da Lua, 1011'),
('Carlos Andrade', 'Rua das Estrelas, 1213'),
('Fernanda Costa', 'Rua da Alegria, 1415')




Insert into Cursos (codprofessor,nomecurso) 
VALUES
(1, 'Desenvolvimento de Sistemas'),
(5, 'Logística'),
(2, 'Inglês'),
(4, 'Administração');


Insert into Notas (codAluno,codcurso,nota,ano,bimestre,observacao)
Values
(4, 1, 8.5, 2023, '1º', 'Bom desempenho'),
(12, 2, 9.0, 2023, '1º', 'Excelente desempenho'),
(2, 3, 7.0, 2023, '1º', 'Desempenho regular'),
(15, 4, 6.5, 2023, '1º', 'Desempenho abaixo da média'),
(1, 1, 5.0, 2023, '2º', 'Desempenho insatisfatório'),
(5, 2, 8.5, 2023, '1º', 'Bom desempenho'),
(11, 3, 9.0, 2023, '1º', 'Excelente desempenho'),
(7, 1, 7.0, 2023, '1º', 'Desempenho regular'),
(3, 4, 6.5, 2023, '1º', 'Desempenho abaixo da média'),
(9, 2, 5.0, 2023, '2º', 'Desempenho insatisfatório'),
(2, 3, 8.5, 2023, '1º', 'Bom desempenho'),
(6, 1, 9.0, 2023, '1º', 'Excelente desempenho'),
(10, 2, 7.0, 2023, '1º', 'Desempenho regular'),
(13, 4, 6.5, 2023, '1º', 'Desempenho abaixo da média'),
(14, 3, 5.0, 2023, '2º', 'Desempenho insatisfatório');