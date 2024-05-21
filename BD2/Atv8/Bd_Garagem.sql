CREATE DATABASE BDGaragem
USE BDGaragem


Create table Patio(
	Patio_Num Int,
	Ender Varchar(60),
	Capacidade Int,
	PRIMARY KEY (Patio_Num)
);

Create table Modelo(
	CodMod Int,
	Desc_Mod Varchar(50),
	PRIMARY KEY (CodMod),
);

Create table Cliente(
	CPF Varchar(14),
	Nome Varchar(20),
	Nasc Date,
	PRIMARY KEY (CPF),
);

Create table Veiculo(
	CPF Varchar(14),
	CodMod Int,
	Placa Varchar(8),
	Cor Varchar(20),
	Ano Date,
	PRIMARY KEY (Placa),
	FOREIGN KEY (CodMod) REFERENCES Modelo,
	FOREIGN KEY (CPF) REFERENCES Cliente
);

Create table Estaciona(
	Cod Int,
	Patio_Num Int,
	Placa Varchar(8),
	DtEntrada Date,
	DtSaida Date,
	HsEntrada Time,
	HsSaida Time,
	PRIMARY KEY (Cod),
	FOREIGN KEY (Patio_Num) REFERENCES Patio,
	FOREIGN KEY (Placa) REFERENCES Veiculo
);


INSERT INTO Patio (Patio_Num, Ender, Capacidade) VALUES
(1, 'Endereço 1', 50),
(2, 'Endereço 2', 30),
(3, 'Endereço 3', 40),
(4, 'Endereço 4', 25),
(5, 'Endereço 5', 35)



INSERT INTO Modelo (CodMod, Desc_Mod) VALUES
(1, 'Sedan'),
(2, 'SUV'),
(3, 'Hatchback'),
(4, 'Caminhão'),
(5, 'Van'),
(6, 'Esportivo'),
(7, 'Compacto'),
(8, 'Utilitário'),
(9, 'Micro-ônibus'),
(10, 'Coupé'),
(11, 'Conversível'),
(12, 'Semi-reboque'),
(13, 'Trator'),
(14, 'Motocicleta')

INSERT INTO Cliente (CPF, Nome, Nasc) VALUES
('123.456.789-00', 'João', '1990-05-15'),
('987.654.321-00', 'Maria', '1985-10-20'),
('111.222.333-44', 'Pedro', '2000-03-25'),
('555.666.777-88', 'Ana', '1995-08-12'),
('999.888.777-66', 'Carlos', '1978-11-30')

INSERT INTO Veiculo (CPF, CodMod, Placa, Cor, Ano) VALUES
('123.456.789-00', 1, 'ABC-1234', 'Azul', '2018-01-01'),
('987.654.321-00', 2, 'JJJ-2020', 'Preto', '2020-06-15'),
('111.222.333-44', 3, 'DEF-9999', 'Vermelho', '2015-12-10'),
('555.666.777-88', 4, 'GHI-1111', 'Verde', '2019-03-20'),
('999.888.777-66', 5, 'JEG-1010', 'Prata', '2017-11-05')

INSERT INTO Estaciona (Cod, Patio_Num, Placa, DtEntrada, HsEntrada, DtSaida) VALUES
(1, 1, 'ABC-1234', '2024-05-18', '08:00:00', '2024-05-18'),
(2, 2, 'JJJ-2020', '2024-05-18', '09:30:00', '2024-05-18'),
(3, 3, 'DEF-9999', '2024-05-18', '10:45:00', '2024-05-18'),
(4, 4, 'GHI-1111', '2024-05-18', '11:15:00', '2024-05-18'),
(5, 5, 'JEG-1010', '2024-05-18', '12:00:00', '2024-05-18')



-- INNER JOIN EX1
SELECT Patio.Ender, Estaciona.DtEntrada, Estaciona.DtSaida
FROM Estaciona
INNER JOIN Patio ON Estaciona.Patio_Num = Patio.Patio_Num
WHERE Estaciona.Placa = 'JEG-1010';

-- INNER JOIN EX2
SELECT Cliente.CPF, Cliente.Nome
FROM Veiculo
INNER JOIN Cliente ON Veiculo.CPF = Cliente.CPF
WHERE Veiculo.Placa = 'JJJ-2020';

-- INNER JOIN EX3
SELECT Veiculo.Placa, Veiculo.Cor
FROM Veiculo
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 1;

-- INNER JOIN EX4
SELECT Veiculo.Ano, Veiculo.Placa
FROM Veiculo
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 1;

-- INNER JOIN EX5
SELECT Veiculo.Placa, Veiculo.Ano, Modelo.Desc_Mod
FROM Veiculo
INNER JOIN Modelo ON Veiculo.CodMod = Modelo.CodMod
WHERE Veiculo.Ano >= '2000';

-- INNER JOIN EX6
SELECT Patio.Ender, Estaciona.DtEntrada, Estaciona.DtSaida
FROM Estaciona
INNER JOIN Patio ON Estaciona.Patio_Num = Patio.Patio_Num
WHERE Estaciona.Placa = 'JEG-1010';

-- INNER JOIN EX7
SELECT COUNT(*)
FROM Estaciona
INNER JOIN Veiculo ON Estaciona.Placa = Veiculo.Placa
WHERE Veiculo.Cor = 'Verde';

-- INNER JOIN EX8
SELECT Cliente.*
FROM Cliente
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.CPF
WHERE Veiculo.CodMod = 1;

-- INNER JOIN EX9
SELECT Estaciona.Placa, Estaciona.HsEntrada, Estaciona.HsSaida
FROM Estaciona
INNER JOIN Veiculo ON Estaciona.Placa = Veiculo.Placa
WHERE Veiculo.Cor = 'Verde';

-- INNER JOIN EX10
SELECT *
FROM Estaciona
WHERE Placa = 'JJJ-2020';

-- INNER JOIN EX11
SELECT Cliente.Nome
FROM Cliente
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.CPF
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 2;

-- INNER JOIN EX12
SELECT Cliente.CPF
FROM Cliente
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.CPF
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 3;

-- INNER JOIN EX13
SELECT Modelo.Desc_Mod
FROM Modelo
INNER JOIN Veiculo ON Modelo.CodMod = Veiculo.CodMod
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 2;

-- INNER JOIN EX14
SELECT Veiculo.Placa, Cliente.Nome, Modelo.Desc_Mod
FROM Veiculo
INNER JOIN Cliente ON Veiculo.CPF = Cliente.CPF
INNER JOIN Modelo ON Veiculo.CodMod = Modelo.CodMod;
