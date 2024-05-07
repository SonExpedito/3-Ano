create database ExercicioBeetweenOrder;
use ExercicioBeetweenOrder;

create table Funcionario(
	Id int Primary Key Identity,
	Nome varchar (50) ,
	Email varchar (60),
	Salario decimal (10,2) ,
	Data_Nasc date ,
	Cidade varchar (60),
	Estado varchar (2)
);


/* INSERT INTO Funcionario (Nome, Email, Salario, Data_Nasc, Cidade, Estado) 
VALUES 
('HP', 'harry@gmail.com', 3000.00, '1990-05-15', 'Rio de Janeiro', 'RJ'),
('Gk', 'goku@outlook.com', 3500.00, '1985-08-20', 'São Paulo', 'SP'),
('HS', 'homer@gmail.com', 2800.00, '1992-02-10', 'Brasília', 'DF'),
('Dv', 'vader@outlook.com', 3200.00, '1987-11-25', 'Curitiba', 'PR'),
('NU', 'naruto@gmail.com', 3100.00, '1983-04-30', 'Salvador', 'BA'),
('BL', 'buzz@outlook.com', 3300.00, '1995-09-05', 'Fortaleza', 'CE'),
('BW', 'batman@gmail.com', 3400.00, '1980-12-12', 'Porto Alegre', 'RS'),
('SH', 'sonic@outlook.com', 2900.00, '1998-07-18', 'Manaus', 'AM'); */

INSERT INTO Funcionario (Nome, Email, Salario, Data_Nasc, Cidade, Estado) 
VALUES 
('Harry Potter', 'harry@gmail.com', 3000.00, '1990-05-15', 'Rio de Janeiro', 'RJ'),
('Goku', 'goku@outlook.com', 3500.00, '1985-08-20', 'São Paulo', 'SP'),
('Homer Simpson', 'homer@gmail.com', 2800.00, '1992-02-10', 'Brasília', 'DF'),
('Darth Vader', 'vader@outlook.com', 3200.00, '1987-11-25', 'Curitiba', 'PR'),
('Naruto Uzumaki', 'naruto@gmail.com', 3100.00, '1983-04-30', 'Salvador', 'BA'),
('Buzz Lightyear', 'buzz@outlook.com', 3300.00, '1995-09-05', 'Fortaleza', 'CE'),
('Batman', 'batman@gmail.com', 3400.00, '1980-12-12', 'Porto Alegre', 'RS'),
('Sonic the Hedgehog', 'sonic@outlook.com', 2900.00, '1998-07-18', 'Manaus', 'AM');

Select * from Funcionario where Nome like 'a%' or Nome like 'e%' or Nome like 'i%' or Nome like 'o%' or Nome like 'u%';

Select Nome,Salario from Funcionario order by Salario desc;

Select Nome,Email from Funcionario order by Nome;

Select Max(Salario) from Funcionario;

Select avg(Salario) from Funcionario;

Select Nome,Salario,Email from Funcionario where Id >=3 And Id<=7;
