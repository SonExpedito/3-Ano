create database Bd_Comercio;
use Bd_Comercio;

use master
drop database Bd_Comercio

/*Cliente*/

create table TBL_Estado_Civil(
	cod_est_civ int Primary Key identity,
	desc_est_civ varchar(30)
)

create table TBL_Clientes(
	cod_cliente  int Primary Key identity,
	nome_cliente varchar(50) Not Null,
	cod_estadocivil int Not Null,
	salario float Not Null,

	foreign key (cod_estadocivil) references TBL_Estado_Civil

);

create table TBL_Conjuge (
	cod_conjuge int Primary Key identity,
	nome_conjuge varchar(50),
	cod_cliente int,

	foreign key (cod_cliente) references TBL_Clientes

);


create table TBL_Tipo_Fone (
	cod_fone int Primary Key identity,
	desc_fone varchar(30)
);

create table TBL_Telefone (
	cod_cliente int,
	cod_fone int,
	numero_fone varchar(20),

	foreign key (cod_cliente) references TBL_Clientes,
	foreign key (cod_fone) references TBL_Tipo_Fone
)


/*Funcionário*/
create table TBL_Func(
	cod_func int Primary Key identity,
	nome_func varchar(50) Not Null
)

create table TBL_Premio(
	cod_func int,
	valor_premio float,

	foreign key (cod_func) references TBL_Func
)

create table TBL_Dependente (
	cod_dep int Primary Key identity,
	nome_dep Varchar(50),
	data_nasc date,
	cod_func int,

	foreign key (cod_func) references TBL_Func
)


/*Pedidos*/

create table TBL_Pedido(
	cod_pedido int Primary Key identity,
	cod_cliente int,
	cod_func int,
	data_pedido date,

	foreign key (cod_cliente) references TBL_Clientes,
	foreign key (cod_func) references TBL_Func
)

create table TBL_Produto (
	cod_produto int Primary Key identity,
	nome_produto varchar(50),
	tipo_produto varchar(30)

)

create table TBL_Item_Pedido(
	cod_pedido int,
	cod_produto int,
	qtd_produto int,

	foreign key (cod_pedido) references TBL_Pedido,
	foreign key (cod_produto) references TBL_Produto
)


/*INSERTS*/
/*Cliente*/
INSERT INTO TBL_Estado_Civil (desc_est_civ) VALUES 
('Solteiro'),
('Casado'),
('Divorciado'),
('Viúvo'),
('Separado'),
('União Estável');

INSERT INTO TBL_Clientes (nome_cliente, cod_estadocivil, salario) VALUES 
('Robert Downey Jr', 1, 10000.00),
('Scarlett Johansson', 2, 12000.00),
('Chris Evans', 3, 11000.00),
('Jennifer Lawrence', 4, 13000.00),
('Ryan Reynolds', 5, 14000.00),
('Rener', 2, 10500.00),
('Daniel', 4, 15000.00),
('Natalie Portman', 5, 11500.00);

INSERT INTO TBL_Conjuge (nome_conjuge, cod_cliente) VALUES 
('Susan Downey', 1),
('Colin Jost', 2),
('Alice Evans', 3),
('Cooke Maroney', 4),
('Blake Lively', 5),
('Leo Robinton', 6),
('Rita Wilson', 7),
('Benjamin Millepied', 8);

INSERT INTO TBL_Tipo_Fone (desc_fone) VALUES 
('Celular'),
('Residencial'),
('Comercial'),
('Fax'),
('Pessoal'),
('Trabalho'),
('Emergência'),
('WhatsApp');

INSERT INTO TBL_Telefone (cod_cliente, cod_fone, numero_fone) VALUES 
(1, 1, '+55 (11) 98765-4321'),
(2, 2, '+55 (11) 12345-6789'),
(3, 3, '+55 (11) 23456-7890'),
(4, 4, '+55 (11) 34567-8901'),
(5, 5, '+55 (11) 45678-9012'),
(6, 6, '+55 (11) 56789-0123'),
(7, 7, '+55 (11) 67890-1234'),
(8, 8, '+55 (11) 78901-2345');

/*Funcionário*/

INSERT INTO TBL_Func (nome_func) VALUES 
('Francisco'),
('Roseane'),
('Pedro Costa'),
('Ana Martins'),
('Ricardo Lima'),
('Fernanda Souza'),
('Lucas Almeida'),
('Carla Santos');

INSERT INTO TBL_Premio (cod_func, valor_premio) VALUES 
(1, 1000.00),
(2, 1200.00),
(3, 800.00),
(4, 950.00),
(5, 1100.00),
(6, 900.00),
(7, 1050.00),
(8, 1150.00);

INSERT INTO TBL_Dependente (nome_dep, data_nasc, cod_func) VALUES 
('Lucas Pereira', '2005-06-15', 1),
('Sofia Oliveira', '2008-03-22', 2),
('Gabriel Costa', '2010-09-30', 3),
('Laura Martins', '2012-11-12', 4),
('Rafael Lima', '2009-04-05', 5),
('Mariana Souza', '2011-07-25', 6),
('Pedro Almeida', '2006-02-18', 7),
('Isabela Santos', '2013-05-20', 8);

/*Pedidos*/
INSERT INTO TBL_Pedido (cod_cliente, cod_func, data_pedido) VALUES 
(1, 1, '2024-01-15'),
(2, 2, '2024-02-20'),
(3, 3, '2024-03-25'),
(4, 4, '2024-04-30'),
(5, 5, '2024-05-10'),
(6, 6, '2024-06-15'),
(7, 7, '2024-07-20'),
(8, 8, '2024-08-25');

INSERT INTO TBL_Produto (nome_produto, tipo_produto) VALUES 
('Doritos', 'Snacks'),
('Coca-Cola', 'Bebidas'),
('iPhone', 'Eletrônicos'),
('PlayStation 5', 'Eletrônicos'),
('Nutella', 'Alimentos'),
('Fosforo', 'Acendedor'),
('AirPods', 'Eletrônicos'),
('Oreo', 'Snacks');

INSERT INTO TBL_Item_Pedido (cod_pedido, cod_produto, qtd_produto) VALUES 
(1, 1, 2),
(1, 2, 1),
(2, 3, 5),
(2, 4, 3),
(3, 5, 4),
(4, 6, 2),
(5, 7, 1),
(6, 8, 6);

/*Parte 1*/
select TBL_Clientes.nome_cliente, TBL_Telefone.numero_fone 
from TBL_Clientes 
inner join  TBL_Telefone on TBL_Clientes.cod_cliente = TBL_Telefone.cod_cliente

select TBL_Clientes.nome_cliente, TBL_Conjuge.nome_conjuge 
from TBL_Clientes 
inner join TBL_Conjuge on TBL_Clientes.cod_cliente = TBL_Conjuge.cod_cliente 
where cod_estadocivil = 2;

select TBL_Clientes.nome_cliente, TBL_Telefone.numero_fone, TBL_Tipo_Fone.desc_fone
from TBL_Clientes 
inner join TBL_Telefone on TBL_Clientes.cod_cliente = TBL_Telefone.cod_cliente
Inner join TBL_Tipo_Fone on TBL_Telefone.cod_fone = TBL_Tipo_Fone.cod_fone

Select TBL_Clientes.nome_cliente, TBL_Func.nome_func, TBL_Pedido.*
from TBL_Clientes 
inner join TBL_Pedido on TBL_Clientes.cod_cliente = TBL_Pedido.cod_cliente
inner join TBL_Func on TBL_Pedido.cod_func = TBL_Func.cod_func

SELECT TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido, TBL_Clientes.nome_cliente
FROM TBL_Pedido
INNER JOIN TBL_Clientes ON TBL_Pedido.cod_cliente = TBL_Clientes.cod_cliente
INNER JOIN TBL_Func ON TBL_Pedido.cod_func = TBL_Func.cod_func
WHERE TBL_Func.nome_func = 'Francisco';


SELECT TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido, TBL_Func.nome_func
FROM TBL_Pedido
INNER JOIN TBL_Func ON TBL_Pedido.cod_func = TBL_Func.cod_func
INNER JOIN TBL_Clientes ON TBL_Pedido.cod_cliente = TBL_Clientes.cod_cliente
WHERE TBL_Clientes.nome_cliente = 'Rener';


/*Parte 2*/
select TBL_Func.nome_func, TBL_Dependente.nome_dep, TBL_Dependente.data_nasc
from TBL_Dependente 
inner join TBL_Func on TBL_Dependente.cod_func = TBL_Func.cod_func;

select TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido , TBL_Produto.nome_produto 
from TBL_Pedido 
inner join TBL_Item_Pedido on TBL_Item_Pedido.cod_pedido =  TBL_Pedido.cod_pedido
inner join TBL_Produto on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto

select TBL_Pedido.cod_pedido , TBL_Pedido.data_pedido , TBL_Func.nome_func
from TBL_Func 
inner join TBL_Pedido on TBL_Func.cod_func = TBL_Pedido.cod_func
inner join TBL_Item_Pedido on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_Produto on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
where nome_produto like 'Fosforo'

select TBL_Pedido.cod_pedido , TBL_Pedido.data_pedido , TBL_Produto.nome_produto
from TBL_Clientes 
inner join TBL_Pedido on TBL_Clientes.cod_cliente = TBL_Pedido.cod_cliente
inner join TBL_Item_Pedido on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_Produto on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
where nome_cliente like 'Daniel'


select TBL_Produto.nome_produto 
from TBL_Produto 
inner join TBL_Pedido on TBL_Produto.cod_produto = TBL_Pedido.cod_pedido
inner join TBL_Func on TBL_Pedido.cod_func = TBL_Func.cod_func
where nome_func like 'Roseane'

select TBL_Clientes.nome_cliente , TBL_Produto.nome_produto from
TBL_Clientes 
inner join TBL_Pedido on TBL_Clientes.cod_cliente = TBL_Pedido.cod_cliente
inner join TBL_Item_Pedido on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_Produto on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto

select TBL_Func.nome_func , TBL_Produto.nome_produto from
TBL_Func 
inner join TBL_Pedido on TBL_Func.cod_func = TBL_Pedido.cod_func
inner join TBL_Item_Pedido on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_Produto on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto

/*Parte 3*/
select TBL_Func.nome_func,  sum(TBL_Premio.valor_premio) as total_acumulado
from TBL_Func 
inner join TBL_Premio on TBL_Func.cod_func = TBL_Premio.cod_func
group by TBL_Func.nome_func

select TBL_Func.nome_func,  count(TBL_Dependente.cod_dep) as total_dependentes
from TBL_Func 
inner join TBL_Dependente on TBL_Func.cod_func = TBL_Dependente.cod_func
group by TBL_Func.nome_func

select TBL_Estado_Civil.desc_est_civ, count(TBL_Clientes.cod_cliente) as total_clientes
from TBL_Clientes
inner join TBL_Estado_Civil on TBL_Clientes.cod_estadocivil = TBL_Estado_Civil.cod_est_civ
where TBL_Estado_Civil.desc_est_civ in ('Solteiro', 'Casado', 'Separado')
group by TBL_Estado_Civil.desc_est_civ;


select * from TBL_Clientes 
inner join TBL_Telefone on TBL_Clientes.cod_cliente = TBL_Telefone.cod_cliente
where TBL_Telefone.cod_cliente is null

select * from TBL_Clientes
inner join TBL_Estado_Civil on TBL_Clientes.cod_estadocivil = TBL_Estado_Civil.cod_est_civ
where TBL_Clientes.cod_estadocivil = 1

select * from TBL_Clientes
inner join TBL_Estado_Civil on TBL_Clientes.cod_estadocivil = TBL_Estado_Civil.cod_est_civ
where TBL_Clientes.cod_estadocivil = 2

select * from TBL_Func
inner join TBL_Premio on TBL_Func.cod_func = TBL_Premio.cod_func
where TBL_Premio.cod_func is null

select * from TBL_Func
inner join TBL_Dependente on TBL_Func.cod_func = TBL_Dependente.cod_func
where TBL_Dependente.cod_func is null

select * from TBL_Produto
inner join TBL_Item_Pedido on TBL_Produto.cod_produto = TBL_Item_Pedido.cod_produto
where TBL_Item_Pedido.cod_produto is null