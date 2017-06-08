DROP DATABASE IF EXISTS bd;
CREATE DATABASE bd;
USE bd;

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
  PRIMARY KEY (idEntregador));

CREATE TABLE IF NOT EXISTS Entrega(
  idEntrega INT NOT NULL,
  FormaPagamento VARCHAR(45) NULL,
  ValorTotal REAL NULL,
  Data DATE NULL,
  Entregador_idEntregador INT NOT NULL,
  PRIMARY KEY (idEntrega),
  FOREIGN KEY (Entregador_idEntregador)
  REFERENCES Entregador(idEntregador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Pedido(
  idPedido INT NOT NULL,
  ValorParcial REAL NULL,
  Cliente_idCliente INT NOT NULL,
  Fornecedor_CNPJ INT NULL,
  Entrega_idEntrega INT NOT NULL,
  PRIMARY KEY (idPedido),
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente(idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (Fornecedor_CNPJ)
    REFERENCES Fornecedor(CNPJ)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (Entrega_idEntrega)
    REFERENCES Entrega(idEntrega)
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
  DescricaoProduto VARCHAR(100) NULL,
  Fornecedor_CNPJ INT NOT NULL,
  PRIMARY KEY (NomeProduto, Fornecedor_CNPJ),
    FOREIGN KEY (Fornecedor_CNPJ)
    REFERENCES Fornecedor(CNPJ)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Pedido_Produto(
  Produto_NomeProduto VARCHAR(45) NOT NULL,
  Produto_Fornecedor_CNPJ INT NOT NULL,
  Pedido_idPedido INT NOT NULL,
  PRIMARY KEY (Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido),
    FOREIGN KEY (Produto_NomeProduto , Produto_Fornecedor_CNPJ)
    REFERENCES Produto(NomeProduto, Fornecedor_CNPJ)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (Pedido_idPedido)
    REFERENCES Pedido(idPedido)
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

CREATE TABLE IF NOT EXISTS Entrega_Cliente(
  Cliente_idCliente INT NOT NULL,
  Entregador_idEntregador INT NOT NULL,
  HorarioEntrega INT(11) NOT NULL,
  PRIMARY KEY (Cliente_idCliente, Entregador_idEntregador, HorarioEntrega),
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente(idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
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

insert into Entregador(idEntregador, Nome)
values (693, 'Edwiges');

insert into Entregador(idEntregador, Nome)
values (852, 'Bicusso');

insert into Entregador(idEntregador, Nome)
values (982, 'Nimbus');

insert into Entregador(idEntregador, Nome)
values (742, 'Lupin');

insert into Entregador(idEntregador, Nome)
values (602, 'Luna');

insert into Entregador(idEntregador, Nome)
values (153, 'James');

insert into Entregador(idEntregador, Nome)
values (360, 'krum');


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

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('XBurguer', 'pão, hamburguer, queijo, alface', 1234);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('XBacon', 'pão, hamburguer, queijo, alface, bacon', 1234);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('XBurguer', 'pão, hamburguer, queijo, alface, tomate', 1357);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('XSalada', 'pão, hamburguer, queijo, alface, tomate, milho', 1357);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Bolo de Aniversario', 'Bolo de chocolate com recheio de morango', 1977);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Bolo Magico', 'Bolo de chocolate com cobertura de caramelo', 1977);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Picanha ao Alho', 'Picanha temperada com manteiga de alho', 9965);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Lombo Recheado', 'Lombo suíno recheado com bacon', 9965);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Temaki', 'temaki recheado com arroz e salmão', 6452);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Sashimi', 'salmao acompanhado de cebola, repolho e pepino', 6452);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Nachos', 'Nachos acompanhados de guacamole e Chilly', 6631);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Tacos', 'Taco recheado com alface tomate e Chilly', 6631);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Pizza Mexicana', 'recheio de milho, presunto, mussarela, pimentão, pimentas', 1237);

insert into Produto (NomeProduto, DescricaoProduto, Fornecedor_CNPJ)
values ('Pizza Canadense', 'recheio de Lombo, cebola e catupiry', 1237);


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


insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(1, 'cartao', 50.00, '2017-03-12', 360);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(2, 'cartao', 100.00, '2017-03-12', 742);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(3, 'cartao', 150.00, '2017-03-12', 360);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(4, 'dinheiro', 55.00, '2017-03-13', 693);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(5, 'dinheiro', 250.00, '2017-03-13', 982);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(6, 'cartao', 35.00, '2017-03-14', 693);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(7, 'dinheiro', 72.50, '2017-03-14', 852);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(8, 'cartao', 89.00, '2017-03-15', 852);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(9, 'dinheiro', 98.00, '2017-03-16', 602);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(10, 'cartao', 100.00, '2017-03-16', 602);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(11, 'dinheiro', 290.00, '2017-03-17', 153);

insert into Entrega(idEntrega, FormaPagamento, ValorTotal, Data, Entregador_idEntregador)
values(12, 'cartao', 44.00, '2017-03-18', 153);


-- Inserindo em Pedido --


insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(1, 10.00, 01, 1234, 1), (2, 40.00, 01, 1977, 1);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(3, 20.00, 02, 1357, 2), (4, 40.00, 02, 1977, 2), (5, 40.00, 02, 9965, 2);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(6, 30.00, 03, 1234, 3), (7, 40.00, 03, 1977, 3), (8, 50.00, 03, 9965, 3);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(9, 30.00, 04, 1977, 4), (10, 25.00, 04, 1237, 4);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(11, 30.00, 05, 6631, 5), (12, 40.00, 05, 9965, 5), (13, 50.00, 05, 9965, 5), (14, 130.00, 05, 6452, 5);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(15, 35.00, 06, 1237, 6);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(16, 30.50, 07, 1234, 7), (17, 42.00, 07, 6631, 7);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(18, 49.00, 08, 1357, 8), (19, 40.00, 08, 1237, 8);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(20, 50.00, 09, 1977, 9), (21, 45.00, 09, 9965, 9);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(22, 50.00, 10, 6631, 10), (23, 25.00, 10, 1237, 10), (24, 25.00, 10, 6452, 10);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(25, 50.00, 11, 1977, 11), (26, 100.00, 11, 9965, 11), (27, 50.00, 11, 1357, 11), (28, 90.00, 11, 6631, 11);

insert into Pedido (idPedido, ValorParcial, Cliente_idCliente, Fornecedor_CNPJ, Entrega_idEntrega)
values(29, 44.00, 12, 1234, 12);


-- Inserindo em Usa -- 


insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(693, 35896, '2017-03-13'), (693, 38952, '2017-03-14');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(852, 25369, '2017-03-14'), (852, 12053, '2017-03-15');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(982, 52094, '2017-03-13');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(742, 10493, '2017-03-12');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(602, 30164, '2017-03-16'), (602, 12053, '2017-03-16');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(153, 10493, '2017-03-17'), (153, 52094, '2017-03-18');

insert into Usa (Entregador_idEntregador, Veiculo_Placa, Data)
values(360, 12053, '2017-03-12'), (360, 25369, '2017-03-12');


-- Inserindo em Pedido_Produto -- 


insert into Pedido_Produto(Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido)
values('XBurguer', 1234, 1),('XBacon', 1234, 6),('XBurguer', 1234, 16), ('XBacon', 1234, 29);

insert into Pedido_Produto(Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido)
values('XBurguer', 1357, 3), ('XSalada', 1357, 18),('XSalada', 1357, 27);

insert into Pedido_Produto(Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido)
values('Bolo de Aniversario', 1977, 2), ('Bolo Magico', 1977, 4), ('Bolo Magico', 1977, 7), ('Bolo Magico', 1977, 9), ('Bolo de Aniversario', 1977, 20), ('Bolo de Aniversario', 1977, 25);

insert into Pedido_Produto(Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido)
values('Picanha ao Alho', 9965, 5), ('Lombo Recheado', 9965, 8), ('Picanha ao Alho', 9965, 12), ('Lombo Recheado', 9965, 13), ('Lombo Recheado', 9965, 21), ('Lombo Recheado', 9965, 26);

insert into Pedido_Produto(Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido)
values('Temaki', 6452, 14), ('Sashimi', 6452, 24);

insert into Pedido_Produto(Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido)
values('Nachos', 6631, 11), ('Tacos', 6631, 17), ('Tacos', 6631, 22), ('Tacos', 6631, 28);

insert into Pedido_Produto(Produto_NomeProduto, Produto_Fornecedor_CNPJ, Pedido_idPedido)
values('Pizza Mexicana', 1237, 10), ('Pizza Mexicana', 1237, 15), ('Pizza Mexicana', 1237, 19), ('Pizza Mexicana', 1237, 23);


-- Inserindo em  Entrega_Cliente --


insert into Entrega_Cliente (Cliente_idCliente, Entregador_idEntregador, HorarioEntrega) 
values(01, 360, 19), (02, 742, 16), (03, 360, 15), (04, 693, 11), (05, 982, 15), (06, 693, 20), (07, 852, 21), (08, 852, 16), (09, 602, 21), (10, 602, 15), (11, 153, 21), (12, 153, 16);

    