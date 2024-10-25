CREATE DATABASE BD_Perfumaria;
USE BD_Perfumaria;

CREATE TABLE Regiao (
    Cod_Reg INT PRIMARY KEY,
    Nome_Regiao VARCHAR(50),
    Local VARCHAR(60)
);

CREATE TABLE Ponto_Estrategico (
    Cod_Reg INT,
    Nome_Ponto VARCHAR(50),
    FOREIGN KEY (Cod_Reg) REFERENCES Regiao (Cod_Reg)
);

CREATE TABLE Vendedor (
    ID_Ven INT PRIMARY KEY,
    Nome VARCHAR(255),
    CPF VARCHAR(14),
    Sexo VARCHAR(10),
    Data_Nascimento DATE,
    Cod_Reg INT,
    FOREIGN KEY (Cod_Reg) REFERENCES Regiao (Cod_Reg)
);

CREATE TABLE Veiculo (
    ID_Veiculo INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Placa VARCHAR(20),
    Cor VARCHAR(15)
);

CREATE TABLE Escala_Veiculo (
    Data DATE,
    ID_Ven INT,
    ID_Car INT,
    FOREIGN KEY (ID_Ven) REFERENCES Vendedor (ID_Ven),
    FOREIGN KEY (ID_Car) REFERENCES Veiculo (ID_Veiculo)
);

CREATE TABLE Consumidor (
    Id_Consumidor INT PRIMARY KEY,
    Nome VARCHAR(50),
    CPF VARCHAR(14),
    Data_Nascimento DATE
);

CREATE TABLE Nota_Fiscal (
    Cod_Nota INT PRIMARY KEY,
    Cod_Ven INT,
    Cod_Consu INT,
    Data_Nota DATE,
    FOREIGN KEY (Cod_Ven) REFERENCES Vendedor (ID_Ven),
    FOREIGN KEY (Cod_Consu) REFERENCES Consumidor (Id_Consumidor)
);

CREATE TABLE Produto (
    Cod_Produto INT PRIMARY KEY,
    Nome VARCHAR(50),
    Marca VARCHAR(30),
    Estoque INT,
    Descricao VARCHAR(30),
    Preco DECIMAL(10, 2)
);

CREATE TABLE Item_Consumo (
    Cod_Produto INT,
    Quantidade INT,
    Cod_Nota INT,
    FOREIGN KEY (Cod_Produto) REFERENCES Produto (Cod_Produto),
    FOREIGN KEY (Cod_Nota) REFERENCES Nota_Fiscal (Cod_Nota)
);

INSERT INTO Regiao (Cod_Reg, Nome_Regiao, Local) VALUES 
(1, 'Centro-Oeste', 'Brasília - DF'),
(2, 'Sudeste', 'São Paulo - SP'),
(3, 'Sul', 'Curitiba - PR'),
(4, 'Nordeste', 'Recife - PE'),
(5, 'Norte', 'Manaus - AM');

select * from Regiao;

INSERT INTO Ponto_Estrategico (Cod_Reg, Nome_Ponto) VALUES 
(1, 'Shopping Conjunto Nacional'),
(2, 'Avenida Paulista'),
(3, 'Rua XV de Novembro'),
(4, 'Praça do Marco Zero'),
(5, 'Teatro Amazonas');

select * from Ponto_Estrategico;

INSERT INTO Vendedor (ID_Ven, Nome, CPF, Sexo, Data_Nascimento, Cod_Reg) VALUES 
(1, 'Tite', '123.456.789-00', 'Masculino', '1961-05-12', 1),
(2, 'Felipão', '987.654.321-00', 'Masculino', '1948-11-25', 2),
(3, 'Abel Ferreira', '159.753.486-00', 'Masculino', '1978-12-22', 3),
(4, 'Rogério Ceni', '258.456.789-00', 'Masculino', '1973-01-22', 4),
(5, 'Renato Gaúcho', '789.123.456-00', 'Masculino', '1962-09-30', 5);

select * from Vendedor;

INSERT INTO Veiculo (ID_Veiculo, Marca, Modelo, Placa, Cor) VALUES 
(1, 'Toyota', 'Corolla', 'ABC-1234', 'Branco'),
(2, 'Ford', 'Fusion', 'DEF-5678', 'Preto'),
(3, 'Chevrolet', 'Onix', 'GHI-9101', 'Prata'),
(4, 'Volkswagen', 'Jetta', 'JKL-2345', 'Azul'),
(5, 'Honda', 'Civic', 'MNO-6789', 'Vermelho');

select * from Veiculo;

INSERT INTO Escala_Veiculo (Data, ID_Ven, ID_Car) VALUES 
('2024-10-01', 1, 1),
('2024-10-02', 2, 2),
('2024-10-03', 3, 3),
('2024-10-04', 4, 4),
('2024-10-05', 5, 5);

select * from Escala_Veiculo;

INSERT INTO Consumidor (Id_Consumidor, Nome, CPF, Data_Nascimento) VALUES 
(1, 'Gabigol', '321.654.987-00', '1996-08-30'),
(2, 'Memphis Depay', '654.321.987-00', '1994-02-13'),
(3, 'Arrascaeta', '987.654.123-00', '1994-06-01'),
(4, 'Raphael Veiga', '456.789.123-00', '1995-06-19'),
(5, 'Hulk', '789.456.123-00', '1986-07-25');

select * from Consumidor;

INSERT INTO Nota_Fiscal (Cod_Nota, Cod_Ven, Cod_Consu, Data_Nota) VALUES 
(1, 1, 1, '2024-10-10'),
(2, 2, 2, '2024-10-11'),
(3, 3, 3, '2024-10-12'),
(4, 4, 4, '2024-10-13'),
(5, 5, 5, '2024-10-14');

select * from Nota_Fiscal;

INSERT INTO Produto (Cod_Produto, Nome, Marca, Estoque, Descricao, Preco) VALUES 
(1, 'Chanel No. 5', 'Chanel', 100, 'Aroma Floral e Aldeídico', 150.00),
(2, 'Acqua di Gio', 'Giorgio Armani', 150, 'Aroma Aquático e Frutado', 180.00),
(3, 'La Vie Est Belle', 'Lancôme', 200, 'Aroma Doce e Floral', 160.50),
(4, 'Dior Sauvage', 'Dior', 80, 'Aroma Amadeirado e Picante', 200.00),
(5, 'Flowerbomb', 'Viktor & Rolf', 60, 'Aroma Floral Oriental', 210.00);

select * from Produto;

INSERT INTO Item_Consumo (Cod_Produto, Quantidade, Cod_Nota) VALUES 
(1, 2, 1),
(2, 1, 2),
(3, 3, 3),
(4, 1, 4),
(4, 2, 5);

select * from Item_Consumo;

-- Exercícios --

-- A – Listar todos os pontos estratégicos de cada região.
SELECT 
    R.Nome_Regiao, P.Nome_Ponto 
FROM 
    Regiao R JOIN Ponto_Estrategico P ON R.Cod_Reg = P.Cod_Reg;

-- B – Listar os nomes das regiões cadastradas.
SELECT 
   Nome_Regiao FROM Regiao;

-- C – Listar todos os vendedores e quais veículos que eles utilizaram no último mês.
SELECT 
    V.Nome AS Vendedor, Ve.Marca, Ve.Modelo, E.Data 
FROM Vendedor V
JOIN Escala_Veiculo E ON V.ID_Ven = E.ID_Ven
JOIN Veiculo Ve ON E.ID_Car = Ve.ID_Veiculo
WHERE 
    E.Data >= '2024-09-25' 
    AND E.Data <= '2024-10-25';

-- D – Listar todos os vendedores responsáveis por cada região.
SELECT 
    R.Nome_Regiao, V.Nome AS Vendedor 
FROM Regiao R
JOIN Vendedor V ON R.Cod_Reg = V.Cod_Reg;

-- E – Todos os produtos vendidos por um determinado <vendedor>.
SELECT 
    P.Nome AS Produto, P.Marca,IC.Quantidade,NF.Data_Nota
FROM Produto P
JOIN Item_Consumo IC ON P.Cod_Produto = IC.Cod_Produto
JOIN Nota_Fiscal NF ON IC.Cod_Nota = NF.Cod_Nota
JOIN Vendedor V ON NF.Cod_Ven = V.ID_Ven
WHERE V.Nome = 'Abel Ferreira'; 

-- F – Todos os vendedores que venderam um determinado <produto>.
SELECT 
    V.Nome AS Vendedor, P.Nome AS Produto, NF.Data_Nota
FROM Vendedor V 
JOIN Nota_Fiscal NF ON V.ID_Ven = NF.Cod_Ven
JOIN Item_Consumo IC ON NF.Cod_Nota = IC.Cod_Nota
JOIN Produto P ON IC.Cod_Produto = P.Cod_Produto
WHERE P.Nome = 'Acqua di Gio'; 

-- G – Todos os produtos que ainda não foram vendidos.
SELECT 
    P.Nome AS Produto, P.Marca 
FROM Produto P
LEFT JOIN Item_Consumo IC ON P.Cod_Produto = IC.Cod_Produto
WHERE  IC.Cod_Produto IS NULL;

-- H – Listar o histórico de utilização de um determinado <veículo>.
SELECT Ve.Marca, Ve.Modelo, E.Data, 
    V.Nome AS Vendedor 
FROM Veiculo Ve
JOIN Escala_Veiculo E ON Ve.ID_Veiculo = E.ID_Car
JOIN Vendedor V ON E.ID_Ven = V.ID_Ven
WHERE Ve.Modelo = 'Civic';

-- I – A quantidade de itens de cada nota fiscal.
SELECT 
    NF.Cod_Nota, 
    COUNT(IC.Cod_Produto) AS Quantidade_Itens 
FROM  Nota_Fiscal NF
JOIN Item_Consumo IC ON NF.Cod_Nota = IC.Cod_Nota
GROUP BY NF.Cod_Nota;
