CREATE DATABASE BDRETORNO;
USE BDRETORNO;

CREATE TABLE funcionarios (
id INT PRIMARY KEY IDENTITY, 
nome VARCHAR(60), 
email VARCHAR(60), 
salario FLOAT, 
data_nascimento DATE, 
cidade VARCHAR(60), 
estado VARCHAR(2));

INSERT INTO funcionarios VALUES 
('João', 'joao1970@gmail.com', 8000.00,'1970-05-20','São Paulo','SP'),
('Camila', 'camila@gmail.com', 3000.00,'1985-07-23','São Paulo','SP'),
('Marcio', 'marcio@gmail.com', 900.00,'1982-03-15','Campinas','SP'),
('Fernanda', 'fernanda@gmail.com', 3500.00,'1987-08-18','Rio de Janeiro','RJ'),
('José', 'jose@gmail.com', 2200.00,'1990-09-18','Guaxupé','MG'),
('Fabiano', 'fabiano@gmail.com', 6800.00,'1981-01-30','Poços de Caldas','MG'),
('Marcos', 'marcos@gmail.com', 3200.00,'1989-02-08','Vitória','ES'); 

SELECT * FROM funcionarios;

/*Modificações*/
/*Paraná*/
Insert INTO funcionarios VALUES 
('Carlos','Carlosoficial@gmail.com',2200.00,'1992-04-22','Curitiba','PR'),
('Gabriel','GabrielProgramador@gmail.com',1750.00,'1993-07-04','Londrina','PR');

/*Amazonas*/
Insert INTO funcionarios VALUES 
('Henrique','proHenrique@gmail.com',3400.00,'1995-07-17','Manaus','AM'),
('Pedro','OliveiraPedro@gmail.com',3750.00,'1996-03-12','Parintins','AM');

/*Nordeste*/
Insert INTO funcionarios VALUES 
('Erika','LittleErika@gmail.com',2840.00,'1998-12-30','Salvador','BA'),
('Matheus','MTHeus@gmail.com',3120.00,'2001-02-02','Recife','PE'),
('Guilherme','Doguilher@gmail.com',2500.00,'2002-04-25','Natal','RN'),
('Diogo','D1og0Oficial@gmail.com',4250.00,'1997-11-29','Fortaleza','CE'),
('Nickolas','NCKnickolas@gmail.com',2100.00,'1995-03-12','João Pessoa','PB');

/*Rio grande do sul*/
Insert INTO funcionarios VALUES 
('Alex','yAlexzin@gmail.com',7500.00,'2003-09-20','Porto Alegre','RS');


/*Questões*/
Select avg(salario) from funcionarios where estado in ('RS','SC','PR');

Select avg(salario) from funcionarios where estado in ('AL','BA','CE','MA','PB','PE','PI','RN','SE');

Select max(salario) from funcionarios;

select count(id) from funcionarios where estado in ('ES','MG','RJ','SP');

Select min(salario) from funcionarios;

select * from funcionarios where data_nascimento < '2000-01-01';

select avg(salario) from funcionarios  where data_nascimento < '2000-01-01';

select * from funcionarios where data_nascimento >= '2000-01-01';

select avg(salario) from funcionarios  where data_nascimento >= '2000-01-01';
