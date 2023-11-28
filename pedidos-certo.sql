CREATE DATABASE IF NOT EXISTS `pedidos`;
USE `pedidos` ;

CREATE TABLE IF NOT EXISTS `pedidos`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(50) NULL,
  `cidade` VARCHAR(50) NULL,
  `estado` VARCHAR(5) NULL,
  `cep` VARCHAR(10) NULL,
  `pais` VARCHAR(45) NULL,
  `telefone` VARCHAR(15) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`id_cliente`));

CREATE TABLE IF NOT EXISTS `pedidos`.`pedido` (
  `num_pedido` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`num_pedido`),
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `pedidos`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `pedidos`.`fornecedor` (
  `id_fornecedor` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(50) NULL,
  `cidade` VARCHAR(50) NULL,
  `estado` VARCHAR(5) NULL,
  `cep` VARCHAR(10) NULL,
  `pais` VARCHAR(10) NULL,
  PRIMARY KEY (`id_fornecedor`));

CREATE TABLE IF NOT EXISTS `pedidos`.`produto` (
  `id_produto` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `descricao` VARCHAR(255) NULL,
  PRIMARY KEY (`id_produto`),
  CONSTRAINT `fk_produto_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `pedidos`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `pedidos`.`ItemDoPedido` (
  `num_pedido` INT NOT NULL,
  `num_item` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco` DOUBLE NOT NULL,
  PRIMARY KEY (`num_pedido`, `num_item`),
  CONSTRAINT `fk_ItensDoPedido_pedido1`
    FOREIGN KEY (`num_pedido`)
    REFERENCES `pedidos`.`pedido` (`num_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemDoPedido_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `pedidos`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO cliente
(id_cliente, nome, endereco, cidade, estado, cep, pais, telefone, email)
VALUES
(101, 'RiHappy', 'Rua A, 25', 'São Paulo', 'SP', '1100', 'BRA', '11-32313321', 'rihappy@rihappy.com.br'),
(102, 'Brinquedolândia', 'Av. Colares Moreira, 200', 'São Luís', 'MA', '6500', 'BRA', '98-32116554',null),
(103, 'Fun4All', 'Av. Frei Serafim, 888', 'Teresina', 'PI', '8600', 'BRA', '86-12334556', 'jjones@fun4all.com'),
(104, 'Fun4All', 'Av. das Américas, 84', 'Rio de Janeiro', 'RJ', '2100', 'BRA', '21-98876544', 'dstephens@fun4all.com'),
(105, 'The Toy Store', 'Av. Visconde de de Mauá, 85', 'Ponta Grossa', 'PR', '84010', 'BRA', '42-99876545',null);


INSERT INTO fornecedor
(id_fornecedor, nome, endereco, cidade, estado, cep, pais)
VALUES
(201,'Lego','Av. Abiurana','Manaus','AM','9200', 'BRA'),
(202,'Fisher Price','BR 101','Recife','PE','8400', 'BRA'),
(203,'Estrela','R. Roupen Tilkian, 375','Itapira','SP','1150', 'BRA'),
(204,'GROW',' Rua Oneda, 538','São Bernardo do Campo','SP','1111', 'BRA'),
(205,'Fun and Games','Galaxy Road, 42','Londres', NULL,'N16 6PS', 'Inglaterra'),
(206,'Jouets et ours','Rua Amusement, 1','Paris', NULL,'45678', 'França');


INSERT INTO produto
(id_produto, id_fornecedor, nome, preco, descricao)
VALUES
(301, 201, 'Boneco Lego Ninja', 5.99, 'Boneco Lego Ninja Azul'),
(302, 201, 'Lego Super Mario', 8.99, 'Lego Super Mario as Aventuras de Luigi'),
(303, 201, 'Lego Creator Carro', 11.99, 'Lego Creator Expert Porsche'),
(304, 203, 'Pogobol', 3.49, 'Preto e Laranja'),
(305, 203, 'Autorama', 3.49, 'Autorama Ayrton Senna'),
(306, 203, 'Banco Imobiliário', 3.49, 'Edição Retrô'),
(307, 203, 'Ferrorama', 4.99, 'XP 300'),
(308, 205, 'Super Game', 9.49, 'Console de Jogo'),
(309, 205, 'Bola de Futebol', 9.49, 'Clássica Oficial');


INSERT INTO pedido
(num_pedido, data, id_cliente)
VALUES
(20005, '2020-05-01', 101),
(20006, '2020-01-12', 103),
(20007, '2020-01-30', 104),
(20008, '2020-02-03', 105),
(20009, '2020-02-08', 101);


INSERT INTO ItemDoPedido
(num_pedido, num_item, id_produto, quantidade, preco)
VALUES(20005, 1, 301, 100, 5.49),
(20005, 2, 303, 100, 10.99),
(20006, 1, 301, 20, 5.99),
(20006, 2, 302, 10, 8.99),
(20006, 3, 303, 10, 11.99),
(20007, 1, 303, 50, 11.49),
(20007, 2, 304, 100, 2.99),
(20007, 3, 305, 100, 2.99),
(20007, 4, 306, 100, 2.99),
(20007, 5, 307, 50, 4.49),
(20008, 1, 307, 5, 4.99),
(20008, 2, 303, 5, 11.99),
(20008, 3, 304, 10, 3.49),
(20008, 4, 305, 10, 3.49),
(20008, 5, 306, 10, 3.49),
(20009, 1, 304, 250, 2.49),
(20009, 2, 305, 250, 2.49),
(20009, 3, 306, 250, 2.49);

/* Tarefa 01*/
/* 1 */
select distinct id_produto
from produto;

/* 2 */
select nome
from cliente
order by nome desc;

/* 3 */
select id_cliente, num_pedido
from pedido
order by id_cliente, data desc;

/* 4 */
select quantidade, preco
from ItemDoPedido
order by quantidade desc, preco  desc;

/* 5 */
select id_produto, nome
from produto 
where preco = 9.49;

/* 6 */
select id_produto, nome
from produto 
where preco >= 9;

/* 7 */
select distinct num_pedido
from ItemDoPedido
where quantidade >= 100;

/* 8 */
select nome, preco
from produto
where preco >= 3 and preco <= 6
order by preco desc;

/* 9 */
select nome
from fornecedor
where estado = 'SP';

/* 10 */
select num_pedido, id_produto, quantidade
from ItemDoPedido
where (id_produto = 301 or id_produto = 302 or id_produto = 303) and quantidade >= 100 
order by id_produto desc,  quantidade desc;


/*Tarefa 4*/
/* 1 */
select sum(quantidade)
from ItemDoPedido;

/* 2 */
select count(id_produto)
from ItemDoPedido
where id_produto = 301



