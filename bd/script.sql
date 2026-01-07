CREATE DATABASE estoque;
USE estoque;

-- -----------------------------------------------------
-- Table produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoque`.`produto`(
  idproduto INT PRIMARY KEY AUTO_INCREMENT,
  codigo VARCHAR(20),
  descricao VARCHAR(200),
  categoria VARCHAR(45));

-- -----------------------------------------------------
-- Table parceiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoque`.`parceiro` (
  idclientes INT PRIMARY KEY AUTO_INCREMENT,
  razaosocial VARCHAR(45),
  tipo VARCHAR(45));

-- -----------------------------------------------------
-- Table notafiscal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoque`.`notafiscal` (
  idnotafiscal INT PRIMARY KEY AUTO_INCREMENT,
  idclientes INT,
  dataemissao DATE,
  nf VARCHAR(45),
  icms DECIMAL,
  vcmt DATE,
  dplbol TINYINT,
  pagto TINYINT,
  npedido VARCHAR(45),
  CONSTRAINT fk_idclientes_notafiscal FOREIGN KEY (idclientes) REFERENCES `estoque`.`parceiro` (idclientes));

-- -----------------------------------------------------
-- Table estoque
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoque`.`estoque_produto` (
  idestoque INT AUTO_INCREMENT,
  idproduto INT,
  qtd INT,
  PRIMARY KEY (idestoque, idproduto),
  CONSTRAINT fk_idproduto_estoque FOREIGN KEY (idproduto) REFERENCES `estoque`.`produto` (idproduto));

-- -----------------------------------------------------
-- Table movimentacao_estoque
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoque`.`movimentacao_estoque` (
  idmovimentacao INT,
  idclientes INT,
  idproduto INT,
  quantidade INT,
  `data` DATE,
  PRIMARY KEY (idmovimentacao, idclientes, idproduto),
  CONSTRAINT fk_idclientes_mov FOREIGN KEY (idclientes) REFERENCES `estoque`.`parceiro` (idclientes),
  CONSTRAINT fk_idproduto_mov FOREIGN KEY (idproduto) REFERENCES `estoque`.`produto` (idproduto));

-- -----------------------------------------------------
-- Table item_notafiscal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoque`.`item_notafiscal` (
  iditem INT,
  idproduto INT,
  idnotafiscal INT,
  valor DECIMAL,
  qtd INT,
  PRIMARY KEY (iditem, idproduto, idnotafiscal),
  CONSTRAINT fk_idproduto_item_notafiscal FOREIGN KEY (idproduto) REFERENCES `estoque`.`produto` (idproduto),
  CONSTRAINT fk_idnotafiscal_item_notafiscal FOREIGN KEY (idnotafiscal) REFERENCES `estoque`.`notafiscal` (idnotafiscal));