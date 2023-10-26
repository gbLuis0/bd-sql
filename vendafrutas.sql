create database VendaFrutas;
use VendaFrutas;

CREATE TABLE DestinoDeExportacao(
codDestinoExportacao INT NOT NULL,
nomeDestinoExportacao VARCHAR(45) NOT NULL,
CONSTRAINT pk_DestinoExportacao PRIMARY KEY(codDestinoExportacao)
);

CREATE TABLE Vendas(

codrelatorio INT,
dataA Date NOT NULL,
codDestinoExportacao INT NOT NULL,
CONSTRAINT pk_codrelatorio PRIMARY KEY(codrelatorio),
CONSTRAINT fk_Vendas_DestinoExp FOREIGN KEY (codDestinoExportacao)
REFERENCES DestinoDeExportacao (codDestinoExportacao)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE DetalhesDeVendas(
codrelatorio INT NOT NULL,
codproduto INT NOT NULL,
quantidade VARCHAR(45) NOT NULL,
CONSTRAINT fk_Detalhes_cr FOREIGN KEY (codrelatorio)
REFERENCES Vendas (codrelatorio)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_Detalhes_cp FOREIGN KEY (codproduto)
REFERENCES Produto (codproduto)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Produto(
codproduto INT,
nomeproduto VARCHAR(45) NOT NULL,
precounitario DOUBLE NOT NULL,
CONSTRAINT pk_produto_cp PRIMARY KEY(codproduto)
);

INSERT INTO produto
VALUES
(1, "Maçã", 2),
(2, "Banana", 2.5),
(3, "Laranja", 1.5),
(4, "Morango",5),
(5, "Kiwi", 3);

INSERT INTO destinodeexportacao
VALUES
(101, "Argentina"),
(102, "Uruguai"),
(103, "Chile");

INSERT INTO vendas
VALUES
(51, "2023-09-15", 101),
(52, "2023-09-15", 102),
(53, "2023-09-16", 103),
(54, "2023-09-16", 101),
(55, "2023-09-16", 102),
(56, "2023-09-17", 101);

INSERT INTO detalhesdevendas
VALUES
(51, 1, 50),
(51, 3, 72),
(52, 4, 100),
(52, 1, 24),
(52, 5, 72),
(53, 2, 100),
(54, 1, 240),
(54, 4, 100),
(55, 1, 200),
(56, 3, 45),
(56, 2, 24),
(56, 5, 200);

desc Vendas;
show tables