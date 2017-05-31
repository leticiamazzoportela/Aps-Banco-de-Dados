-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Bairro` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NULL,
  `Numero` INT(11) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
COMMENT = 'me';


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `CNPJ` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Bairro` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NULL,
  `Numero` INT(11) NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entregador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entregador` (
  `idEntregador` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Telefone` INT(11) NULL,
  PRIMARY KEY (`idEntregador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrega` (
  `idEntrega` INT NOT NULL,
  `FormaPagamento` VARCHAR(45) NULL,
  `ValorTotal` REAL NULL,
  `Data` DATE NULL,
  `Entregador_idEntregador` INT NOT NULL,
  PRIMARY KEY (`idEntrega`),
  INDEX `fk_Entrega_Entregador1_idx` (`Entregador_idEntregador` ASC),
  CONSTRAINT `fk_Entrega_Entregador1`
    FOREIGN KEY (`Entregador_idEntregador`)
    REFERENCES `mydb`.`Entregador` (`idEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `ValorParcial` REAL NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Fornecedor_CNPJ` INT NULL,
  `Entrega_idEntrega` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Pedido_Fornecedor1_idx` (`Fornecedor_CNPJ` ASC),
  INDEX `fk_Pedido_Entrega1_idx` (`Entrega_idEntrega` ASC),
  CONSTRAINT `fk_Pedido_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Fornecedor1`
    FOREIGN KEY (`Fornecedor_CNPJ`)
    REFERENCES `mydb`.`Fornecedor` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Entrega1`
    FOREIGN KEY (`Entrega_idEntrega`)
    REFERENCES `mydb`.`Entrega` (`idEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo` (
  `Placa` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `AnoFabricacao` INT(11) NULL,
  PRIMARY KEY (`Placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usa` (
  `Entregador_idEntregador` INT NOT NULL,
  `Veiculo_Placa` INT NOT NULL,
  `Data` DATE NULL,
  PRIMARY KEY (`Entregador_idEntregador`, `Veiculo_Placa`),
  INDEX `fk_Entregador_has_Veiculo_Veiculo1_idx` (`Veiculo_Placa` ASC),
  INDEX `fk_Entregador_has_Veiculo_Entregador1_idx` (`Entregador_idEntregador` ASC),
  CONSTRAINT `fk_Entregador_has_Veiculo_Entregador1`
    FOREIGN KEY (`Entregador_idEntregador`)
    REFERENCES `mydb`.`Entregador` (`idEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entregador_has_Veiculo_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `mydb`.`Veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_Cliente` (
  `NroTelefone` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`NroTelefone`, `Cliente_idCliente`),
  INDEX `fk_Telefone_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Telefone_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `NomeProduto` VARCHAR(45) NOT NULL,
  `DescricaoProduto` VARCHAR(100) NULL,
  `Fornecedor_CNPJ` INT NOT NULL,
  PRIMARY KEY (`NomeProduto`, `Fornecedor_CNPJ`),
  INDEX `fk_Produto_Fornecedor1_idx` (`Fornecedor_CNPJ` ASC),
  CONSTRAINT `fk_Produto_Fornecedor1`
    FOREIGN KEY (`Fornecedor_CNPJ`)
    REFERENCES `mydb`.`Fornecedor` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido_Produto` (
  `Produto_NomeProduto` VARCHAR(45) NOT NULL,
  `Produto_Fornecedor_CNPJ` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`Produto_NomeProduto`, `Produto_Fornecedor_CNPJ`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC),
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_NomeProduto` ASC, `Produto_Fornecedor_CNPJ` ASC),
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_NomeProduto` , `Produto_Fornecedor_CNPJ`)
    REFERENCES `mydb`.`Produto` (`NomeProduto` , `Fornecedor_CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_Entregador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_Entregador` (
  `NroTelefone` INT NOT NULL,
  `Entregador_idEntregador` INT NOT NULL,
  PRIMARY KEY (`NroTelefone`, `Entregador_idEntregador`),
  INDEX `fk_Telefone_Entregador_Entregador1_idx` (`Entregador_idEntregador` ASC),
  CONSTRAINT `fk_Telefone_Entregador_Entregador1`
    FOREIGN KEY (`Entregador_idEntregador`)
    REFERENCES `mydb`.`Entregador` (`idEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrega_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrega_Cliente` (
  `Cliente_idCliente` INT NOT NULL,
  `Entregador_idEntregador` INT NOT NULL,
  `HorarioEntrega` INT(11) NOT NULL,
  PRIMARY KEY (`Cliente_idCliente`, `Entregador_idEntregador`, `HorarioEntrega`),
  INDEX `fk_Cliente_has_Entregador_Entregador1_idx` (`Entregador_idEntregador` ASC),
  INDEX `fk_Cliente_has_Entregador_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Cliente_has_Entregador_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Entregador_Entregador1`
    FOREIGN KEY (`Entregador_idEntregador`)
    REFERENCES `mydb`.`Entregador` (`idEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
