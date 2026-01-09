CREATE DATABASE `estoqueclee`;
USE `estoqueclee` ;

-- -----------------------------------------------------
-- Table `mydb`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoqueclee`.`produto` (
  `idproduto` INT PRIMARY KEY AUTO_INCREMENT,
  `codigo` VARCHAR(20),
  `descricao` VARCHAR(100),
  `categoria` VARCHAR(45));

-- -----------------------------------------------------
-- Table `mydb`.`parceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoqueclee`.`parceiro` (
  `idclientes` INT PRIMARY KEY AUTO_INCREMENT,
  `razaosocial` VARCHAR(45),
  `tipo` VARCHAR(45));

-- -----------------------------------------------------
-- Table `mydb`.`notafiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoqueclee`.`notafiscal` (
  `idnotafiscal` INT PRIMARY KEY AUTO_INCREMENT,
  `idclientes` INT,
  `dataemissao` DATE,
  `nf` VARCHAR(45),
  `icms` DECIMAL,
  `vcmt` DATE,
  `dplbol` TINYINT,
  `pagto` TINYINT,
  `npedido` VARCHAR(45),
  CONSTRAINT `fk_notafiscal_parceiro1`
    FOREIGN KEY (`idclientes`)
    REFERENCES `estoqueclee`.`parceiro` (`idclientes`));

-- -----------------------------------------------------
-- Table `mydb`.`estoqueproduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoqueclee`.`estoqueproduto` (
  `idestoque` INT AUTO_INCREMENT,
  `idproduto` INT,
  `qtd` INT,
  `data` DATE,
  PRIMARY KEY (`idestoque`, `idproduto`),
  CONSTRAINT `fk_estoque_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `estoqueclee`.`produto` (`idproduto`));

-- -----------------------------------------------------
-- Table `mydb`.`itemnf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoqueclee`.`itemnf` (
  `iditem` INT AUTO_INCREMENT,
  `idproduto` INT,
  `idnotafiscal` INT,
  `valor` DECIMAL,
  `qtd` INT,
  PRIMARY KEY (`iditem`, `idproduto`, `idnotafiscal`),
  CONSTRAINT `fk_produto_has_notafiscal_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `estoqueclee`.`produto` (`idproduto`),
  CONSTRAINT `fk_produto_has_notafiscal_notafiscal1`
    FOREIGN KEY (`idnotafiscal`)
    REFERENCES `estoqueclee`.`notafiscal` (`idnotafiscal`));

-- -----------------------------------------------------
-- Table `mydb`.`caproduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoqueclee`.`caproduto` (
  `idca` INT AUTO_INCREMENT,
  `idproduto` INT,
  `numeroca` VARCHAR(20),
  `data` DATE,
  PRIMARY KEY (`idca`, `idproduto`),
  CONSTRAINT `fk_ca_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `estoqueclee`.`produto` (`idproduto`));

-- -----------------------------------------------------
-- Table `mydb`.`movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoqueclee`.`movimentacao` (
  `idmovimentacaoestoque` INT,
  `idproduto` INT,
  `idclientes` INT,
  `quantidade` INT,
  `data` DATE,
  `codigo` CHAR(1),
  PRIMARY KEY (`idmovimentacaoestoque`, `idproduto`, `idclientes`),
  CONSTRAINT `fk_produto_has_parceiro_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `estoqueclee`.`produto` (`idproduto`),
  CONSTRAINT `fk_produto_has_parceiro_parceiro1`
    FOREIGN KEY (`idclientes`)
    REFERENCES `estoqueclee`.`parceiro` (`idclientes`));
