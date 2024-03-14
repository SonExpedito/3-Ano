create database Clinica;
use Clinica;

CREATE TABLE Ambulatorios (
  nroa INT PRIMARY KEY,
  andar INT NOT NULL,
  capacidade Int
);

CREATE TABLE Medicos (
  codm INT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL,
  nasc DATE NOT NULL,
  especialidade VARCHAR(20),
  CPF VARCHAR(14) UNIQUE,
  cidade VARCHAR(30),
  nroa INT,
  FOREIGN KEY (nroa) REFERENCES Ambulatorios(nroa)
);

CREATE TABLE Pacientes (
  codp INT PRIMARY KEY ,
  nome VARCHAR(40) NOT NULL,
  nasc DATE NOT NULL,
  cidade VARCHAR(30),
  CPF VARCHAR(14) UNIQUE,
  doenca VARCHAR(40) NOT NULL,

);

CREATE TABLE Funcionarios (
  codf INT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL,
  nasc DATE,
  CPF VARCHAR(14) UNIQUE,
  cidade VARCHAR(30),
  salario FLOAT,
  cargo VARCHAR(20),
  nroa INT,
  FOREIGN KEY (nroa) REFERENCES Ambulatorios(nroa)
);

CREATE TABLE Consultas (
  codm INT,
  codp INT,
  data DATE,
  hora TIME,
  FOREIGN KEY (codm) REFERENCES Medicos(codm),
  FOREIGN KEY (codp) REFERENCES Pacientes(codp)
);

INSERT INTO Ambulatorios (nroa, andar, capacidade) VALUES
(1, 1, 30),
(2, 1, 50),
(3, 2, 40),
(4, 2, 25),
(5, 2, 55);

INSERT INTO Medicos (codm, nome, nasc, especialidade, CPF, cidade, nroa) VALUES
(1, 'João', '1980-01-01', 'ortopedia', '10000100000', 'Florianópolis', 1),
(2, 'Maria', '1981-02-02', 'traumatologia', '10000110000', 'Blumenau', 2),
(3, 'Pedro', '1982-03-03', 'pediatria', '11000100000', 'São José', 5),
(4, 'Carlos', '2000-04-04', 'ortopedia', '11000110000', 'Joinville', 4),
(5, 'Marcia', '1999-05-03', 'neurologia', '11000111000', 'Biguaçu', 3);

INSERT INTO Pacientes (codp, nome, nasc, cidade, CPF, doenca) VALUES
(1, 'Ana', '1980-02-02', 'Florianópolis', '20000200000', 'gripe'),
(2, 'Paulo', '2000-01-24', 'Palhoça', '20000220000', 'fratura'),
(3, 'Lucia', '2001-12-30', 'Biguaçu', '22000200000', 'tendinite'),
(4, 'Carlos', '2005-07-28', 'Joinville', '11000110000', 'sarampo');

INSERT INTO Funcionarios (codf, nome, nasc, cidade, salario, CPF, cargo, nroa) VALUES
(1, 'Rita', '2000-12-31', 'São José', 1200, '20000100000','Recepcionista', 5),
(2, 'Maria', '1999-12-29', 'Palhoça', 1220, '30000110000', 'Diretor', 2),
(3, 'Caio', '1980-10-10', 'Florianópolis', 1100, '41000100000','Enfermeiro',4),
(4, 'Carlos', '2005-08-09', 'Florianópolis', 1200, '51000110000','Recepcionista',3),
(5, 'Paula', '2006-09-08', 'Florianópolis', 2500, '61000111000','Enfermeiro',5);

INSERT INTO Consultas (codm, codp, data, hora) VALUES
(1, 1, '2006-06-12', '14:00'),
(1, 4, '2006-06-13', '10:00'),
(2, 1, '2006-06-13', '09:00'),
(2, 2, '2006-06-13', '11:00'),
(2, 3, '2006-06-14', '14:00'),
(2, 4, '2006-06-14', '17:00'),
(3, 1, '2006-06-19', '18:00'),
(3, 3, '2006-06-12', '10:00'),
(3, 4, '2006-06-19', '13:00'),
(4, 4, '2006-06-20', '13:00'),
(4, 4, '2006-06-22', '19:30');

Select * from Ambulatorios;
Select * from Medicos;
Select * from Pacientes;
Select * from Funcionarios;
Select * from Consultas;

UPDATE Pacientes SET cidade = 'Ilhota' WHERE codp=2;
UPDATE Consultas SET data='2006-07-04', hora = '12:00' WHERE codm=1 AND codp=4;
UPDATE Pacientes SET doenca= 'gastrite' WHERE codp=1;
UPDATE Consultas SET hora= '14:30' WHERE codm=3 AND codp=4;
DELETE FROM Funcionarios WHERE codf=4;
DELETE FROM Consultas WHERE hora >= '19:00';
DELETE FROM Consultas WHERE codp=1;
DELETE FROM Pacientes WHERE doenca='gastrite' OR nasc >= '2014-01-01';
DELETE FROM Medicos WHERE cidade = 'Biguaçu' OR cidade = 'Palhoca';