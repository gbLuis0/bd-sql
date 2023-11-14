CREATE DATABASE Banco;
USE Banco;

CREATE TABLE Agencia(
	num_agencia INT,
    nome VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    CONSTRAINT pk_Num_agencia PRIMARY KEY(num_agencia)
);

CREATE TABLE Conta(
    num_conta INT NOT NULL,
	num_agencia INT NOT NULL,
    cpf_cliente INT NOT NULL,
    saldo FLOAT NOT NULL,
    CONSTRAINT pk_Num_conta PRIMARY KEY(num_conta),
    
    CONSTRAINT fk_Num_agencia FOREIGN KEY(num_agencia)
		REFERENCES Agencia (num_agencia)
		ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_Cpf_cliente FOREIGN KEY(cpf_cliente)
		REFERENCES Cliente(cpf_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE
    );
    
    
CREATE TABLE Cliente(
cpf_cliente INT,
nome VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL,
CONSTRAINT pk_cpf_cliente PRIMARY KEY(cpf_cliente)
);
 
INSERT INTO Agencia (num_agencia, nome, cidade)
VALUES

(1, "Cidade Luz", "Paris"),
(2, "Cidade Verde", "Teresina"),
(3, "Cidade Maravilhosa", "Rio de Janeiro"),
(4, "Ilha do Amor", "São Luís"),
(5, "Terra do Sol", "Natal");

INSERT INTO Cliente (cpf_cliente, nome, cidade) 
VALUES
(123, "Jean Marie", "Paris"),
(234, "Chico da Silva", "Teresina"),
(345, "Maria de Deus", "Teresina"),
(567, "João Santana", "São Luís"),
(789, "Pedro dos Anjos", "Natal"),
(321, "Angelina Jolie", "Paris"),
(367, "Zé da Roça", "Rio de Janeiro"),
(333, "Julião Santos", "São Luís"),
(235, "Raimundo Damião", "São Luís");

INSERT INTO Conta (num_conta, cpf_cliente, num_agencia, saldo)
VALUES
(1, 123, 1, 1000),
(2, 234, 2, 2500),
(3, 345, 2, 1500),
(4, 567, 4, 2500),
(5, 789, 5, 3000),
(6, 321, 1, 2500),
(7, 367, 3, 1000),
(8, 333, 4, 500),
(9, 235, 4, 1350),
(10, 123, 5, 1450),
(11, 567, 2, 1000);

/*Nome das agências*/
SELECT nome
FROM Agencia;

/*Nome dos clientes da agência iha do amor*/
SELECT nome
FROM Cliente
WHERE cidade="São Luís";

/*Mostrar número da conta e cpf das contas com saldo > 2000*/
SELECT num_conta, cpf_cliente
FROM Conta
WHERE saldo > 2000;

/*Mostrar saldo das contas da agência Cidade Luz*/
SELECT saldo
FROM Conta
WHERE num_agencia = 1;

/*Mostrar cpf dos clientes da cidade Teresina*/
SELECT cpf_cliente
FROM Cliente
Where cidade = "Teresina";
