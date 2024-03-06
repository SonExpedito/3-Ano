create database Clinica;
use Clinica;

CREATE TABLE Ambulatorios (
  nroa INT PRIMARY KEY,
  andar NUMERIC(3) NOT NULL,
  capacidade SMALLINT
);

CREATE TABLE Medicos (
  codm INT,
  nome VARCHAR(40) NOT NULL,
  nasc DATE NOT NULL,
  especialidade CHAR(20),
  CPF NUMERIC(11) UNIQUE,
  cidade VARCHAR(30),
  nroa INT,
  PRIMARY KEY (codm),
  FOREIGN KEY (nroa) REFERENCES Ambulatorios
);

CREATE TABLE Pacientes (
  codp INT,
  nome VARCHAR(40) NOT NULL,
  nasc DATE NOT NULL,
  cidade CHAR(30),
  CPF NUMERIC(11) UNIQUE,
  doenca VARCHAR(40) NOT NULL,

  PRIMARY KEY (codp)
);

CREATE TABLE Funcionarios (
  codf INT,
  nome VARCHAR(40) NOT NULL,
  nasc DATE,
  CPF NUMERIC(11) UNIQUE,
  cidade VARCHAR(30),
  salario NUMERIC(10),
  cargo VARCHAR(20)

  PRIMARY KEY (codf)
);

CREATE TABLE Consultas (
  codm INT,
  codp INT,
  data DATE,
  hora TIME,
  FOREIGN KEY (codm) REFERENCES Medicos,
  FOREIGN KEY (codp) REFERENCES Pacientes
);

INSERT INTO Ambulatorios (nroa, andar, capacidade) VALUES
(1, 1, 30),
(2, 1, 50),
(3, 2, 40),
(4, 2, 25),
(5, 2, 55);

INSERT INTO Medicos (codm, nome, nasc, especialidade, CPF, cidade, nroa) VALUES
(1, 'João', '1984/02/01', 'ortopedia', 10000100000, 'Florianópolis', 1),
(2, 'Maria', '1982/01/20', 'traumatologia', 10000110000, 'Blumenau', 2),
(3, 'Pedro', '1973/03/02', 'pediatria', 11000100000, 'São José', 2),
(4, 'Carlos', '1996/09/20', 'ortopedia', 11000110000, 'Joinville', NULL),
(5, 'Marcia', '1991/05/22', 'neurologia', 11000111000, 'Biguaçu', 3);

INSERT INTO Pacientes (codp, nome, nasc, cidade, CPF, doenca) VALUES
(1, 'Ana', '2004/02/12', 'Florianópolis', 20000200000, 'gripe'),
(2, 'Paulo', '2000/05/30', 'Palhoça', 20000220000, 'fratura'),
(3, 'Lucia', '1994/01/22', 'Biguaçu', 22000200000, 'tendinite'),
(4, 'Carlos', '1996/08/18', 'Joinville', 11000110000, 'sarampo');

INSERT INTO Funcionarios (codf, nome, nasc, cidade, salario, CPF) VALUES
(1, 'Rita', '1992/01/01', 'São José', 1200, 20000100000),
(2, 'Maria', '1969/01/01', 'Palhoça', 1220, 30000110000),
(3, 'Caio', '1979/01/01', 'Florianópolis', 1100, 41000100000),
(4, 'Carlos', '1980/01/01', 'Florianópolis', 1200, 51000110000),
(5, 'Paula', '1991/01/01', 'Florianópolis', 2500, 61000111000);

INSERT INTO Consultas (codm, codp, data, hora) VALUES
(1, 1, '2006/06/12', '14:00'),
(1, 4, '2006/06/13', '10:00'),
(2, 1, '2006/06/13', '09:00'),
(2, 2, '2006/06/13', '11:00'),
(2, 3, '2006/06/14', '14:00'),
(2, 4, '2006/06/14', '17:00'),
(3, 1, '2006/06/19', '18:00'),
(3, 3, '2006/06/12', '10:00'),
(3, 4, '2006/06/19', '13:00'),
(4, 4, '2006/06/20', '13:00'),
(4, 4, '2006/06/22', '19:30');

UPDATE Pacientes SET cidade = 'Ilhota' WHERE codp=2;
UPDATE Consultas SET data=2006-07-04, hora = '12:00' WHERE codm=1 AND codp=4;
UPDATE Pacientes SET doenca= 'gastrite' WHERE codp=1;
UPDATE Consultas SET hora= '14:30' WHERE codm=3 AND codp=4;
DELETE FROM Funcionarios WHERE codf=4;
DELETE FROM Consultas WHERE hora >= '19:00';
DELETE FROM Pacientes WHERE doenca='gastrite' OR nasc >= 2014/01/01;
DELETE FROM Medicos WHERE cidade = 'Biguacu' OR cidade = 'Palhoca';