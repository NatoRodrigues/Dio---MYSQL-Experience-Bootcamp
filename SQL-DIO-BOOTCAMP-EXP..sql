drop database e_commerce;
create database e_commerce;
use e_commerce;

create table ecommerce(
idecommerce INT primary key not null,
razaoSocial VARCHAR(45) not null,
CNPJ VARCHAR(20) not null
);

insert into ecommerce(idecommerce, razaoSocial, CNPJ)
values(10, 'Lojas americanas', '54.783.040/0001-86'),
	  (4, 'Carrefour', '88.210.980/0001-06'),
	  (80, 'Big bompreço', '10.752.852/0001-99'),
      (7, 'Magazine luiza', '99.099.385/0001-53'),
	  (41, 'Centauro', '91.272.167/0001-67'),
	  (12, 'Riachuelo', '24.607.893/0001-04');
      
create table cliente(
idCliente INT primary key not null,
nome varchar(45) not null,
email varchar(45) not null,
telefone varchar(45),
cpf varchar(18),
cnpj varchar(20));



INSERT INTO cliente(idCliente, nome, email, telefone, cpf, cnpj) 

VALUES(12, 'Mariana Dias', 'mari_ana243@gmail.com', '(81) 99853-4235', '35614523400', '0'),
(65, 'Jorge Silva', 'jorge_sda@outlook.com', '(11) 97955-2301', '23515499463', '0'),
(152, 'Serpa Transportadoras LTDA', 'serpa_transportadora@hotmail.com', '(21) 3245-8867','0', '13.123.452/0001-09'),
(364, 'Americanas S.A', 'americanasexpress@americanas.com.br', '(78) 3355-4267', '0', '25.346.566/0001-02'),
(789, 'Claudinei Oliveira', 'claudinei.oliveira544@gmail.com','(34) 99276-5470', '78.238.996-89', '0');

create table fornecedor(
idFornecedor int primary key not null,
razaoSocial varchar(45) not null,
cnpj varchar(45)
);

insert into fornecedor(idFornecedor, razaoSocial, cnpj)
	values(100, 'china-Importações', '80.289.975/0001-10'),
			(400, 'nike', '33.397.681/0001-22'),
			(500, 'ambev', '80.387.542/0001-06'),
			(200, 'shein', '72.542.488/0001-90'),
			(800, 'adidas','92.145.593/0001-00' );

create table pedido(
idPedido int primary key not null auto_increment,
statuspedido tinyint not null,
codRastreio varchar(45) not null
);

insert into pedido(idPedido, statuspedido, codRastreio)
	values(1254, '1', '216169837551542284'),
			(4125,'4','79497295328769565117'),
			(5741,'5','684312355429994468'),
			(6666,'2','6311171271927366936'),
			(8412,'3','47565693236728691');


create table formaPag(
idFormapag int primary key not null,
tipo varchar(45) not null,
dataPag date not null);

insert into formaPag(idFormapag, tipo, dataPag)

values(15484, 'cartao de credito', '2021-05-08'),
(12348,	'boleto bancario',	'2022-06-06'),
(77841,	'cartao de debito',	'2020-04-10'),
(15678,	'espécie',	'2021-08-10'),
(66124,	'cartao de credito - parcelado 2x', '2022-05-08');

create table endereco(
idEndereco int primary key not null,
rua varchar(45) not null,
cep varchar(45) not null,
bairro varchar(45) not null,
cidade varchar(45) not null,
estado varchar(45) not null,
complemento varchar(45));

insert into endereco(idEndereco, rua, cep, bairro, cidade, estado, complemento)

values(123456, 'Travessa Nossa Senhora da Medianeira','ibura','96211-220', 'Cidade Nova', 'RS', 'apt 201'),
(758945,'Rua das Pindaíbas',77827-310, 'Loteamento Araguaína Sul', 'Araguaína', 'TO', 'apt 101'),
(545987,'Rua Taxista Valdemar', 63044-240, 'Frei Damião', 'Juazeiro do Norte', 'CE', 'apt 181'),
(645512,'Quadra SHCGN 706 Bloco P', 70740-716, 'Asa Norte', 'Brasília', 'DF', 'apt 151'),
(124578,'Travessa Osório Duque Estrada', 69035-234, 'Compensa', 'Manaus', 'AM', 'apt 451');

create table estoque(
idEstoque INt primary key not null,
local varchar(45) not null,
quantidade varchar(45) not null);

SELECT idEstoque as 'numero do prod.', quantidade as 'Ordenado por quantidade'
from estoque
group by quantidade
having quantidade > 5;


insert into estoque(idEstoque, local, quantidade)
values(1234897, 'Recife', '51'),
(1284217, 'Recife', '71'),
(1271897, 'Recife', '72'),
(1234871, 'Recife', '512'),
(1237157, 'Recife', '49');


create table produto(
idProduto INT primary key not null,
nome varchar(45) not null,
categoria varchar(15) not null,
valor decimal,
descricao varchar(50));

INSERT INTO produto(idProduto, nome, categoria, valor, descricao) VALUES
(1, 'Calça Jeans', 'número 48', '119.90', 'Calça jeans skinny'),
(23, 'Bermuda', 'número 39', '79.90', 'Bermuda passeio masculina'),
(31, 'Chápeu de palha', 'tam: P', '23.99', 'Chapéu de palha'),
(9, 'Cueca', 'Box', '6.90', 'Feita com algodão e poliester'),
(12, 'calça jeans', 'GG', '149.90', 'Casa jeans tamanho G');


create table vendedor_terceiro(
idVendedor INT primary key not null,
razaoSocial varchar(60) not null,
cnpj varchar(40));

insert into vendedor_terceiro(idVendedor, razaoSocial, cnpj)
values(9849841, 'joao-coach', '67.611.498/0001-08'),
(8412488, 'joao-imports', '17.424.674/0001-16'),
(4846351, 'mercadinho-tira', '55.684.281/0001-30'),
(8948781, 'casa-do-sapato', '79.916.621/0001-70'),
(2315623, 'vende-joias', '89.146.681/0001-04');


create table pedido_produto(
pedido_idPedido int not null auto_increment,
produto_idProduto INT not null, 
cliente_idCliente INT not null,
foreign key (pedido_idPedido) references pedido(idPedido)
on update cascade
on delete cascade,
foreign key (produto_idProduto) references produto(idProduto)
on update cascade
on delete cascade,
foreign key (cliente_idCliente) references cliente(idCliente)
on update cascade
on delete cascade);

SELECT pedido_idPedido as 'quantidade', cliente_idCliente from pedido_produto;

select * from produto
order by nome;



insert into pedido_produto(pedido_idPedido, produto_idProduto, cliente_idCliente)
values(1254, 1,12),
(4125, 23,65),
(5741, 31,152),
(6666, 9 ,364),
(8412, 12,789);

create table disponibilizando(
fornecedor_idFornecedor int not null,
produto_idProduto INT not null,
foreign key (fornecedor_idFornecedor) references fornecedor(idFornecedor),
foreign key (produto_idProduto) references produto(idProduto));



