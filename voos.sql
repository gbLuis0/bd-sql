CREATE DATABASE VOOS;
USE VOOS;

CREATE TABLE Aviao(
	id_aviao INT,
    marca VARCHAR(45),
    nome VARCHAR(45),
    CONSTRAINT fk_marca FOREIGN KEY(marca)
		REFERENCES Marca (marca)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Marca(
	marca VARCHAR(45),
    lugares INT NOT NULL,
    autonomia INT NOT NULL,
    CONSTRAINT pk_marca PRIMARY KEY(marca)
);

CREATE TABLE Piloto(
	nome_piloto VARCHAR(45),
    endereco VARCHAR(45) NOT NULL,
    local VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    CONSTRAINT pk_nome_piloto PRIMARY KEY(nome_piloto)
);

CREATE TABLE Voo(
	num_voo INT,
    nome_piloto VARCHAR(45),
    id_aviao INT NOT NULL,
    datav DATE NOT NULL,
    hora TIME NOT NULL,
    origem VARCHAR(45) NOT NULL,
    destino VARCHAR(45) NOT NULL,
    CONSTRAINT pk_num_voo PRIMARY KEY(num_voo),
    
    CONSTRAINT fk_Nome_piloto FOREIGN KEY(nome_piloto)
		REFERENCES Piloto(nome_piloto)
		ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_Id_aviao FOREIGN KEY(id_aviao)
		REFERENCES Aviao(id_aviao)
		ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Marca
(marca, lugares, autonomia)
VALUES 
('Boeing 747', 180, 10000),
('Boeing 737-300', 120, 8000),
('Boeing 737-500', 118, 8000),
('Airbus 300', 150, 85000),
('Airbus 200', 110, 7500);

INSERT INTO Aviao
(id_aviao, nome, marca)
VALUES
(12, 'PPT-XP', 'Boeing 747'),
(15, 'PPT-CD', 'Boeing 747'),
(20, 'PPT-AS', 'Boeing 737-300'),
(5, 'PPT-TD', 'Boeing 737-500'),
(3, 'PPT-FR', 'Boeing 737-300'),
(40, 'PPT-XJ', 'Airbus 300'),
(32, 'PPT-AM', 'Airbus200');

INSERT INTO Piloto
(nome_piloto, endereco, local, idade)
VALUES
('João', 'E-1', 'Local-1', 34),
('Pedro', 'E-2', 'Local-2', 36),
('Inacio', 'E-3', 'Local-3', 42),
('Jose','E-4', 'Local-4', 28),
('Carlos', 'E-5', 'Local-5', 31),
('Adão', 'E-6', 'Local-6', 37),
('Karl', 'E-7', 'Local-7', 48),
('Daniel', 'E-8', 'Local-8', 45);

INSERT INTO Voo
(num_voo, id_aviao, datav, hora, origem, destino, nome_piloto)
VALUES
(100, 15, ‘2002-12-15’, '08:00:00', 'SDU', 'CGH', 'Pedro'),
(100, 15, '15/12/2002', '08:00:00', 'SDU', 'CGH', 'Pedro'),
(101, 12, '16/12/2002', '09:00:00', 'SDU', 'CGH', 'Pedro'),
(102, 5, '16/12/2002', '10:05:00', 'SDU', 'BSB', 'Inacio'),
(103, 12, '16/12/2002', '11:00:00', 'CGH', 'SDU', 'Pedro'),
(104, 5, '16/12/2002', '17:42:00', 'BSB', 'SDU', 'Daniel'),
(105, 12, '16/12/2002', '13:00:00', 'SDU', 'CGH', 'Inacio'),
(106, 15, '15/12/2002', '10:00:00', 'CGH', 'SDU', 'Inacio'),
(108, 20, '16/12/2002', '09:12:00', 'SDU', 'POA', 'Pedro'),
(321, 40, '18/12/2002', '09:52:00', 'SDU', 'FOR', 'Inacio'),
(322, 32, '19/12/2002', '09:57:00', 'SDU', 'REC', 'Inacio'),
(324, 20, '17/12/2002', '11:03:00', 'POA', 'SDU', 'Pedro'),
(456, 15, '15/12/2002', '14:00:00', 'SDU', 'CGH', 'Daniel'),
(457, 15, '15/12/2002', '19:00:00', 'CGH', 'SDU', 'Daniel'),
(4011, 3, '15/12/2002', '13:02:00', 'SDU', 'GYN', 'Karl'),
(3010, 3, '15/12/2002', '17:51:00', 'GYN', 'SDU', 'Karl'),
(402, 20, '20/12/2002', '09:12:00', 'SDU', 'POA', 'Inacio'),
(311, 5, '2002-12-17', '11:03:00', 'POA', 'SDU', 'Inacio');



SELECT id_aviao from Aviao, Marca
WHERE Marca.autonomia > 7500;