create database BD_Garagem;
use Bd_Garagem;

create table Cliente(
	cpf varchar(14) Primary Key,
	nome varchar(50) Not Null,
	nasc date Not Null
);

create table Modelo(
	codmodelo int Primary Key identity,
	desc_mod varchar (40) Not Null
);

create table Veiculo(
	codMod int,
	cpf varchar(14),
	placa varchar(7) Primary Key,
	cor varchar(15) Not Null,
	ano date Not Null,

	foreign key (codMod) references Modelo(codmodelo),
	foreign key (cpf) references Cliente(cpf)
);


create table Patio(
	patio_num int Primary Key,
	ender varchar(40) Not Null,
	capacidade int Not Null,
);

create table Estacionamento(
	cod int Primary Key identity,
	patio_num int,
	placa varchar(7),
	dtEntrada date Not Null,
	dtSaida date Not Null,
	hsEntrada time Not Null,
	hsSaida time Not Null,


	foreign key (patio_num) references Patio(patio_num),
	foreign key (placa) references Veiculo(placa)
);



INSERT INTO Cliente (cpf, nome, nasc) VALUES 
('123.456.789-00', 'João Silva', '1990-05-10'),
('987.654.321-00', 'Maria Souza', '1985-12-15'),
('111.222.333-44', 'Carlos Oliveira', '1988-08-20');


INSERT INTO Modelo ( desc_mod) VALUES 
('Sedan'),
('SUV'),
('Hatchback');


INSERT INTO Veiculo (codMod, cpf, placa, cor, ano) VALUES 
('1', '123.456.789-00', 'ABC1234', 'Preto', '2020-01-01'),
('2', '987.654.321-00', 'XYZ9876', 'Branco', '2019-05-01'),
('3', '111.222.333-44', 'DEF5678', 'Azul', '2022-03-10');


INSERT INTO Patio (patio_num, ender, capacidade) VALUES 
(1, 'Rua das Flores, 123', 20),
(2, 'Avenida Principal, 456', 30),
(3, 'Rua do Comércio, 789', 25);


INSERT INTO Estacionamento (patio_num, placa, dtEntrada, dtSaida, hsEntrada, hsSaida) VALUES 
(1, 'ABC1234', '2024-05-15', '2024-05-16', '08:00:00', '18:00:00'),
(2, 'XYZ9876', '2024-05-14', '2024-05-17', '09:30:00', '19:30:00'),
(3, 'DEF5678', '2024-05-16', '2024-05-18', '10:00:00', '20:00:00');



Select Veiculo.placa, Cliente.nome 
From Cliente INNER JOIN Veiculo ON
Cliente.cpf = Veiculo.cpf;

Select Cliente.cpf, Cliente.nome 
from Cliente INNER JOIN Veiculo 
ON Cliente.cpf = Veiculo.cpf WHERE
Veiculo.placa like 'JJJ-2020';

Select Veiculo.placa, Veiculo.cor 
from Veiculo INNER JOIN Estacionamento 
on Veiculo.placa = Estacionamento.placa
WHERE Estacionamento.cod = 1;

Select Veiculo.placa, Veiculo.ano 
from Veiculo INNER JOIN Estacionamento 
on Veiculo.placa = Estacionamento.placa
WHERE Estacionamento.cod = 1;


Select Veiculo.placa, Veiculo.ano , Modelo.desc_mod
from Modelo INNER JOIN Veiculo 
on Modelo.codmodelo = Veiculo.codMod
WHERE Veiculo.ano >= '2000/01/01';


Select Patio.ender, Estacionamento.dtEntrada, Estacionamento.dtSaida 
from Patio INNER JOIN Estacionamento 
ON Patio.patio_num = Estacionamento.patio_num 
INNER JOIN Veiculo ON Estacionamento.placa = Veiculo.placa WHERE
Veiculo.placa like 'JJJ-2020';


Select count(dtEntrada) from Estacionamento 
INNER JOIN Veiculo ON Estacionamento.placa = Veiculo.placa WHERE
Veiculo.cor = 'verde';


Select * from Cliente INNER JOIN Veiculo ON
Cliente.cpf = Veiculo.cpf WHERE Veiculo.codMod = 1;


Select  Estacionamento.placa, Estacionamento.hsEntrada, Estacionamento.hsSaida 
from Estacionamento INNER JOIN Veiculo 
ON Estacionamento.placa = Veiculo.placa WHERE
Veiculo.cor like 'Verde';

Select * from Estacionamento INNER JOIN Veiculo
ON Estacionamento.placa = Veiculo.placa WHERE
Veiculo.placa like 'JJJ-2020';

Select Cliente.nome from Cliente INNER JOIN Veiculo ON
Cliente.cpf = Veiculo.cpf INNER JOIN Estacionamento ON
Veiculo.placa = Estacionamento.placa 
WHERE Estacionamento.cod = 2;

Select Cliente.cpf from Cliente INNER JOIN Veiculo ON
Cliente.cpf = Veiculo.cpf INNER JOIN Estacionamento ON
Veiculo.placa = Estacionamento.placa 
WHERE Estacionamento.cod = 3;


Select Modelo.desc_mod from Modelo INNER JOIN Veiculo ON
Modelo.codmodelo = Veiculo.codMod INNER JOIN Estacionamento 
ON Veiculo.placa = Estacionamento.placa WHERE Estacionamento.cod = 2;


Select Veiculo.placa, Cliente.nome, Modelo.desc_mod from Cliente INNER JOIN
Veiculo ON Cliente.cpf = Veiculo.cpf 
INNER JOIN Modelo ON Modelo.codmodelo = Veiculo.codMod ;

