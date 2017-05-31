DROP DATABASE IF EXISTS bd;
CREATE DATABASE bd;
USE bd;

CREATE TABLE IF NOT EXISTS Cliente(
  idCliente INT NOT NULL,
  Nome VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Rua VARCHAR(45) NULL,
  Numero INT(11) NULL,
  PRIMARY KEY (idCliente));

CREATE TABLE IF NOT EXISTS Fornecedor(
  CNPJ INT NOT NULL,
  Nome VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Rua VARCHAR(45) NULL,
  Numero INT(11) NULL,
  PRIMARY KEY (CNPJ));

CREATE TABLE IF NOT EXISTS Entregador(
  idEntregador INT NOT NULL,
  Nome VARCHAR(45) NULL,
  Telefone INT(11) NULL,
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
    