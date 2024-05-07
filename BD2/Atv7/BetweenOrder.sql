create database AE;
use AE;

create table Funcionario(
	Id int Primary Key Identity,
	Nome varchar (50) ,
	Email varchar (60),
	Salario decimal (10,2) ,
	Data_Nasc date ,
	Cidade varchar (60),
	Estado varchar (2)
);



INSERT INTO Funcionario (Nome, Email, Salario, Data_Nasc, Cidade, Estado) 
VALUES 
('João', 'joao1970@gmail.com', 8000.00, '1970-05-20', 'São Paulo', 'SP'),
('Camila', 'camila@gmail.com', 3000.00, '1985-07-23', 'São Paulo', 'SP'),
('Marcio', 'marcio@gmail.com', 900.00, '1982-03-15', 'Campinas', 'SP'),
('Fernanda', 'fernanda@gmail.com', 3500.00, '1987-08-18', 'Rio de Janeiro', 'RJ'),
('José', 'jose@gmail.com', 2200.00, '1990-09-18', 'Guaxupé', 'MG'),
('Fabiano', 'fabiano@gmail.com', 6800.00, '1981-01-30', 'Poços de Caldas', 'MG'),
('Marcos', 'marcos@gmail.com', 3200.00, '1989-02-08', 'Vitória', 'ES');

Select * from Funcionario

Select * from Funcionario where Nome like 'a%' or Nome like 'e%' or Nome like 'i%' or Nome like 'o%' or Nome like 'u%';

Select Nome,Salario from Funcionario order by Salario desc;

Select Nome,Email from Funcionario order by Nome;

Select Max(Salario) from Funcionario;

Select avg(Salario) from Funcionario;

Select Nome,Salario,Email from Funcionario where Id >=3 And Id<=7;
