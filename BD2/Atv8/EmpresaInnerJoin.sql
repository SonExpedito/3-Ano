create database empresadb;
use empresadb;

create table Departamentos(
	Codigo_Depto int Primary key,
	NomeDepto varchar(50) Not Null,
);


create table Funcionarios(
	Codigo_func int Primary key identity,
	Nome_func varchar(50) Not Null,
	Sobrenome varchar(35) Not Null,
	Datanasci date Not Null,
	CPF varchar(14) Unique ,
	RG varchar (18) Unique ,
	Endereco varchar(40) Not Null,
	CEP varchar(10) Not Null,
	Cidade varchar(30) Not Null,
	Telefone varchar (14) Not Null,
	Codigo_Depto int,
	Funcao varchar (30) Not Null,
	Salario float Not Null,

	foreign key (Codigo_Depto) references Departamentos(Codigo_Depto)
);

-- Inserir departamentos
INSERT INTO Departamentos (Codigo_Depto, NomeDepto) VALUES
(1, 'Tecnologia'),
(2, 'Marketing'),
(3, 'Recursos Humanos');

-- Inserir funcionários
INSERT INTO Funcionarios (Nome_func, Sobrenome, Datanasci, CPF, RG, Endereco, CEP, Cidade, Telefone, Codigo_Depto, Funcao, Salario) VALUES
('Tony', 'Stark', '1970-05-29', '123.456.789-00', '12.345.678-9', '10880 Malibu Point', '90265', 'Malibu', '(310) 555-0123', 1, 'CEO', 1000000),
('Peter', 'Parker', '1995-08-10', '987.654.321-00', '34.567.891-0', '20 Ingram Street', '10011', 'New York', '(212) 555-1234', 1, 'Desenvolvedor', 80000),
('Bruce', 'Wayne', '1972-02-19', '111.222.333-00', '56.789.012-1', '1007 Mountain Drive', '12345', 'Gotham City', '(212) 555-6789', 1, 'Engenheiro', 90000),
('Diana', 'Prince', '1985-06-22', '444.555.666-00', '78.901.234-2', 'Themyscira', '54321', 'Themyscira', '(310) 555-9876', 2, 'Gerente de Marketing', 85000),
('Clark', 'Kent', '1976-04-18', '777.888.999-00', '90.123.456-3', '1938 Sullivan Place', '20001', 'Metropolis', '(202) 555-4321', 2, 'Analista de Marketing', 75000),
('Barry', 'Allen', '1989-03-19', '222.333.444-00', '01.234.567-4', '123 Central City', '10001', 'Central City', '(212) 555-8765', 2, 'Especialista em Publicidade', 70000),
('Harry', 'Potter', '1980-07-31', '555.666.777-01', '23.456.789-5', '4 Privet Drive', '54321', 'Little Whinging', '(212) 555-2345', 3, 'Gerente de RH', 88000),
('Hermione', 'Granger', '1979-09-19', '888.999.000-00', '45.678.901-6', '12 Grimmauld Place', '12345', 'London', '(212) 555-3456', 3, 'Analista de RH', 76000),
('Ron', 'Weasley', '1980-03-01', '999.000.111-00', '67.890.123-7', 'The Burrow', '54321', 'Ottery St Catchpole', '(212) 555-5678', 3, 'Assistente de RH', 65000),
('Satoru', 'Gojo', '1976-11-20', '111.222.333-11', '89.012.345-8', '123 Tokyo', '54321', 'Tokyo', '(212) 555-6789', 3, 'Diretor de RH', 120000);

Select Nome_Func, Sobrenome from Funcionarios order by Sobrenome;
Select * from Funcionarios order by Cidade;
Select * from Funcionarios where Salario>1000 order by Nome_func;
Select Datanasci, Nome_func from Funcionarios order by Datanasci desc;


Select Sobrenome, Nome_func, Cidade, Endereco, Telefone from Funcionarios;

Select sum(salario) from Funcionarios;
Select Nome_func, Salario, Funcao from Funcionarios order by Funcao;
Select * from Funcionarios where Funcao like '%Supervisor%'
select count(Codigo_func) from Funcionarios;
Select avg(Salario) from Funcionarios;
Select Nome_func from Funcionarios where Cidade like 'Recife' and Funcao like 'Telefonista';

--Inner Join --

Select Funcionarios.Nome_Func, Departamentos.NomeDepto, Funcionarios.Funcao 
from Departamentos INNER JOIN Funcionarios 
ON Departamentos.Codigo_Depto = Funcionarios.Codigo_Depto;

Select Departamentos.NomeDepto , Funcionarios.Nome_func
from Departamentos  INNER JOIN Funcionarios
ON Departamentos.Codigo_Depto = Funcionarios.Codigo_Depto 
WHERE Funcionarios.Funcao like '%Supervisor%';


Select Departamentos.NomeDepto , Funcionarios.Nome_func 
from Departamentos  INNER JOIN Funcionarios
ON Departamentos.Codigo_Depto = Funcionarios.Codigo_Depto 
ORDER BY Departamentos.NomeDepto, Funcionarios.Sobrenome; 