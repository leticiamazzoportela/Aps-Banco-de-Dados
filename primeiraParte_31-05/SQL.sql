DROP DATABASE IF EXISTS deliverynow;
CREATE DATABASE deliverynow;
USE deliverynow;

CREATE TABLE IF NOT EXISTS Cliente(
  idCliente INT NOT NULL,
  Nome VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Rua VARCHAR(45) NULL,
  Numero INT(11) NULL,
  Email varchar(45) null,
  PRIMARY KEY (idCliente));

CREATE TABLE IF NOT EXISTS Fornecedor(
  CNPJ INT NOT NULL,
  Nome VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Rua VARCHAR(45) NULL,
  Numero INT(11) NULL,
  Email varchar(45) null,
  PRIMARY KEY (CNPJ));
  
CREATE TABLE IF NOT EXISTS Telefone_Fornecedor(
  NroTelefone INT NOT NULL,
  Fornecedor_CNPJ INT NOT NULL,
  PRIMARY KEY (NroTelefone, Fornecedor_CNPJ),
    FOREIGN KEY (Fornecedor_CNPJ)
    REFERENCES Fornecedor(CNPJ)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Entregador(
  idEntregador INT NOT NULL,
  Nome VARCHAR(45) NULL,
  HorarioEntrega integer,
  PRIMARY KEY (idEntregador));

CREATE TABLE IF NOT EXISTS Pedido(
  idPedido INT NOT NULL,
  ValorTotal REAL NULL,
  Cliente_idCliente INT NOT NULL,
  Fornecedor_CNPJ INT NULL,
  DataPedido date,
  FormaPagamento varchar(45),
  Entregador_idEntregador int,
	PRIMARY KEY (idPedido),
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente(idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (Fornecedor_CNPJ)
    REFERENCES Fornecedor(CNPJ)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,    
    FOREIGN KEY (Entregador_idEntregador)
    REFERENCES Entregador(idEntregador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Veiculo(
  Placa INT NOT NULL,
  Marca VARCHAR(45) NULL,
  Modelo VARCHAR(45) NULL,
  AnoFabricacao INT(11) NULL,
  PRIMARY KEY (Placa));

CREATE TABLE IF NOT EXISTS Usa(
  Entregador_idEntregador INT NOT NULL,
  Veiculo_Placa INT NOT NULL,
  Data DATE NULL,
  PRIMARY KEY (Entregador_idEntregador, Veiculo_Placa),
    FOREIGN KEY (Entregador_idEntregador)
    REFERENCES Entregador(idEntregador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (Veiculo_Placa)
    REFERENCES Veiculo(Placa)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Telefone_Cliente(
  NroTelefone INT NOT NULL,
  Cliente_idCliente INT NOT NULL,
  PRIMARY KEY (NroTelefone, Cliente_idCliente),
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente(idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Produto(
  NomeProduto VARCHAR(45) NOT NULL,
  idProduto integer,
  Fornecedor_CNPJ INT NOT NULL,
  PRIMARY KEY (idProduto),
    FOREIGN KEY (Fornecedor_CNPJ)
    REFERENCES Fornecedor(CNPJ)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Pedido_Produto(
  Produto_idProduto integer NOT NULL,
  Pedido_idPedido INT NOT NULL,
  PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Pedido_idPedido)
    REFERENCES Pedido(idPedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION, 
	FOREIGN KEY (Produto_idProduto)
    REFERENCES Produto(idProduto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Telefone_Entregador(
  NroTelefone INT NOT NULL,
  Entregador_idEntregador INT NOT NULL,
  PRIMARY KEY (NroTelefone, Entregador_idEntregador),
    FOREIGN KEY (Entregador_idEntregador)
    REFERENCES Entregador(idEntregador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
-- Inserts-- 


-- Inserindo Clientes na tabela Cliente -- 

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (01, 'Hermione Granger', 'Potato', 'Magic', 58, 'hg@hg.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (02, 'Ronny Weasley', 'Toca', 'Leviosa', 41, 'rw@rw.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (03, 'Harry Potter', 'Potato', 'Patrono', 25, 'hp@hp2.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (04, 'Minerva Macgnagol', 'Chapeu', 'Seletora', 77, 'mm@mm.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (05, 'Draco Malfoy', 'Comensais', 'Ruim', 29, 'dm@dm.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (06, 'Severo Snape', 'Comensais', 'Boa', 63, 'ss@ss.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (07, 'Alvo Dumbledore', 'Chapeu', 'Fenix', 52, 'ad@ad.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (08, 'Cedrico Digori', 'Crepusculo', 'Morre Cedo', 80, 'cd@cd.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (09, 'Sirius Black', 'Dementador', 'Lobo', 23, 'sb@sv.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (10, 'Bellatrix Lestrange', 'Comensais', 'Ruim', 88, 'bl@bl.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (11, 'Hagrid Gigante', 'Canino', 'Bixinhos', 20, 'hg@hg.com');

insert into Cliente (idCliente, Nome, Bairro, Rua, Numero, Email)
values (12, 'Dobby Elfo', 'Canino', 'Bixinhos', 20, 'de@de.com');


-- Inserindo em Fornecedor -- 

insert into Fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email)
values (1234, 'Hamburgueria Magica', 'Grifinória', 'Leao', 365, 'lhm@mm.com');

insert into Fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email)
values (1357, 'Hamburgueria Quadribol', 'Canino', 'Hipogrifo', 326, 'ss@mm.com');

insert into Fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email)
values (1977, 'Confeitaria de todos os sabores', 'Toca', 'Reparo', 658, 'lh@mm.com');

insert into Fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email)
values (9965, 'Churrascaria da Bruxa', 'Corvinal', 'Aguia', 952, 'lm@mm.com');

insert into Fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email)
values (6452, 'Sushi de Abóbora', 'Grifinória', 'Dourada', 425, 'pm@mm.com');

insert into Fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email)
values (6631, 'Tacos do Elfo', 'Potato', 'Patrono', 412, 'llj@mm.com');

insert into Fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email)
values (1237, 'Pizzaria do Profeta', 'Potato', 'Diario', 202, 'lb@mm.com');


-- Inserindo em telefone fornecedor--

insert into Telefone_Fornecedor(NroTelefone, Fornecedor_CNPJ)
values (5522366, 1234),(5522652, 1357), (5582366, 1977), (8522366, 9965), (5522006, 6452), (5525441, 6631), (5527416, 1237);



-- Inserindo em Entregador -- 

insert into Entregador(idEntregador, Nome, HorarioEntrega)
values (693, 'Edwiges', 19);

insert into Entregador(idEntregador, Nome, HorarioEntrega)
values (852, 'Bicusso', 20);

insert into Entregador(idEntregador, Nome, HorarioEntrega)
values (982, 'Nimbus', 21);

insert into Entregador(idEntregador, Nome, HorarioEntrega)
values (742, 'Lupin', 15);

insert into Entregador(idEntregador, Nome, HorarioEntrega)
values (602, 'Luna', 18);

insert into Entregador(idEntregador, Nome, HorarioEntrega)
values (153, 'James', 19);

insert into Entregador(idEntregador, Nome, HorarioEntrega)
values (360, 'krum', 21);


-- Inserindo na tabela Veículo --


insert into Veiculo (Placa, Marca, Modelo, AnoFabricacao)
values(35896, 'Vassoura', 'Moto', 2015);

insert into Veiculo (Placa, Marca, Modelo, AnoFabricacao)
values(38952, 'Quadribol', 'Moto', 2016);

insert into Veiculo (Placa, Marca, Modelo, AnoFabricacao)
values(25369, 'Vassoura', 'Moto', 2017);

insert into Veiculo (Placa, Marca, Modelo, AnoFabricacao)
values(12053, 'Expresso', 'Carro', 2016);

insert into Veiculo (Placa, Marca, Modelo, AnoFabricacao)
values(52094, 'Vassoura', 'Moto', 2015);

insert into Veiculo (Placa, Marca, Modelo, AnoFabricacao)
values(10493, 'Quadribol', 'Moto', 2016);

insert into Veiculo (Placa, Marca, Modelo, AnoFabricacao)
values(30164, 'Expresso', 'Carro', 2017);


-- Inserindo em Produto -- 

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('XBurguer', 1, 1234), ('Xfrango', 15, 1234), ('XCalabresa', 16, 1234);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('XBacon', 2, 1234);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('XBurguer', 3, 1357), ('XQueijo', 17, 1357);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('XSalada', 4, 1357);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Bolo de Aniversario', 5, 1977);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Bolo Magico', 6, 1977);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Picanha ao Alho', 7, 9965);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Lombo Recheado', 8, 9965);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Temaki', 9, 6452);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Sashimi', 10, 6452);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Nachos', 11, 6631);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Tacos', 12, 6631);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Pizza Mexicana', 13, 1237);

insert into Produto (NomeProduto, idProduto, Fornecedor_CNPJ)
values ('Pizza Canadense', 14, 1237);


-- Inserindo em Telefone_Cliente --

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999999999, 01);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999999998, 02);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999999974, 01);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999999919, 03);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999995599, 04);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999999944, 02);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999999555, 05);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999991205, 06);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999523699, 07);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(942999999, 08);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(963298999, 09);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999995874, 10);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999991485, 07);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(912349999, 11);

insert into Telefone_Cliente(NroTelefone, Cliente_idCliente)
values(999523699, 12);


-- Inserindo em telefone_Entregador -- 

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(888888888, 693);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(888852388, 693);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(888888142, 852);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(826352088, 982);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(888883665, 742);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(885203665, 742);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(850883665, 602);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(888112065, 153);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(888203665, 360);

insert into Telefone_Entregador(NroTelefone, Entregador_idEntregador)
values(887523680, 360);

-- Inserindo em Entrega --




-- Inserindo em Pedido --


insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(1, 10.00, 01, 1234, '2017-03-12', 'cartão', 693), (2, 40.00, 01, 1977, '2017-03-14', 'cartão', 693);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(3, 20.00, 02, 1357, '2017-03-17', 'dinheiro', 852), (4, 40.00, 02, 1977, '2017-03-11', 'cartão', 852), (5, 40.00, 02, 9965, '2017-03-17', 'dinheiro', 852);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(6, 30.00, 03, 1234, '2017-03-14', 'cartão', 982), (7, 40.00, 03, 1977, '2017-03-13', 'dinheiro', 982), (8, 50.00, 03, 9965, '2017-03-17', 'dinheiro', 982);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(9, 30.00, 04, 1977, '2017-03-16', 'dinheiro', 742), (10, 25.00, 04, 1237, '2017-03-10', 'dinheiro', 742);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(11, 30.00, 05, 6631, '2017-03-14', 'cartão', 602), (12, 40.00, 05, 9965, '2017-03-18', 'dinheiro', 602), (13, 50.00, 05, 9965, '2017-03-15', 'dinheiro', 602), (14, 130.00, 05, 6452, '2017-03-17', 'dinheiro', 602);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(15, 35.00, 06, 1237, '2017-03-17', 'cartão', 153);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(16, 30.50, 07, 1234, '2017-03-20', 'dinheiro', 360), (17, 42.00, 07, 6631, '2017-03-17', 'dinheiro', 360);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(18, 49.00, 08, 1357, '2017-03-21', 'cartão', 852), (19, 40.00, 08, 1237, '2017-03-11', 'cartão', 852);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(20, 50.00, 09, 1977, '2017-03-23', 'dinheiro', 153), (21, 45.00, 09, 9965, '2017-03-15', 'cartão', 153);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(22, 50.00, 10, 6631, '2017-03-30', 'dinheiro', 693), (23, 25.00, 10, 1237, '2017-03-07', 'cartão', 693), (24, 25.00, 10, 6452, '2017-03-31', 'dinheiro', 602);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(25, 50.00, 11, 1977, '2017-03-05', 'dinheiro', 742), (26, 100.00, 11, 9965, '2017-03-20', 'cartão', 742), (27, 50.00, 11, 1357, '2017-03-11', 'dinheiro', 852), (28, 90.00, 11, 6631, '2017-03-17', 'cartão', 153);

insert into Pedido (idPedido, ValorTotal, Cliente_idCliente, Fornecedor_CNPJ, DataPedido, FormaPagamento, Entregador_idEntregador)
values(29, 44.00, 12, 1234, '2017-03-25', 'cartão', 360);


-- Inserindo em Usa -- 


insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(982, 35896, '2017-03-13'), (982, 12053, '2017-03-16');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(852, 25369, '2017-03-14'), (852, 35896, '2017-03-15');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(982, 52094, '2017-03-13'), (693, 38952, '2017-03-14');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(742, 10493, '2017-03-12'), (742, 35896, '2017-03-13');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(602, 30164, '2017-03-16'), (602, 12053, '2017-03-16');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(153, 10493, '2017-03-17'), (153, 52094, '2017-03-18');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(360, 12053, '2017-03-12'), (360, 25369, '2017-03-12');


-- Inserindo em Pedido_Produto -- 


insert into Pedido_Produto(Produto_idProduto, Pedido_idPedido)
values(1, 1),(2, 6),(1, 16), (2, 29);

insert into Pedido_Produto(Produto_idProduto, Pedido_idPedido)
values(1, 3), (4, 18),(4, 27);

insert into Pedido_Produto(Produto_idProduto, Pedido_idPedido)
values(5, 2), (6, 4), (6, 7), (6, 9), (5, 20), (5, 25);

insert into Pedido_Produto(Produto_idProduto, Pedido_idPedido)
values(7, 5), (8, 8), (7, 12), (8, 13), (8, 21), (8, 26);

insert into Pedido_Produto(Produto_idProduto, Pedido_idPedido)
values(9, 14), (10, 24);

insert into Pedido_Produto(Produto_idProduto, Pedido_idPedido)
values(11, 11), (12, 17), (11, 22), (11, 28);

insert into Pedido_Produto(Produto_idProduto, Pedido_idPedido)
values(13, 10), (13, 15), (13, 19), (14, 23);



