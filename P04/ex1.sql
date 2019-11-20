CREATE SCHEMA Rent_Car;
GO
CREATE TABLE Rent_Car.Cliente(
	nif				int				PRIMARY KEY,
	nome			varchar,
	endereco		varchar,
	num_carta		int				UNIQUE
);

CREATE TABLE Rent_Car.Aluguer(
	numero			int				PRIMARY KEY,
	duracao			int,
	data			date,
	nif_cliente		int,
	n_Balcao		int,
	mat_Veiculo		char(6),
);

CREATE TABLE Rent_Car.Balcao(
	numero			int				PRIMARY KEY,
	nome			varchar			UNIQUE,
	endereco		varchar			UNIQUE
);

CREATE TABLE Rent_Car.Veiculo(
	matricula		char(6)			PRIMARY KEY,
	ano				int,
	marca			varchar,
	cod_Veiculo		int
);

CREATE TABLE Rent_Car.Tipo_Veiculo(
	codigo			int				PRIMARY KEY,
	designacao		varchar			UNIQUE,
	arcondicionado	bit
);

CREATE TABLE Rent_Car.Ligeiro(
	codigo			int				PRIMARY KEY,
	n_lugares		int,
	n_portas		int,
	combustivel		varchar
);

CREATE TABLE Rent_Car.Pesado(
	codigo			int				PRIMARY KEY,
	n_passageiros	int,
	peso			int
);

CREATE TABLE Rent_Car.Similaridade(
	codigo			int				PRIMARY KEY,
	cod_Similar		int
);

ALTER TABLE Rent_Car.Aluguer
	ADD CONSTRAINT Key_nif FOREIGN KEY (nif_cliente) REFERENCES Rent_Car.Cliente(nif),
	CONSTRAINT Key_nBalcao FOREIGN KEY (n_Balcao) REFERENCES Rent_Car.Balcao(numero),
	CONSTRAINT Key_mat FOREIGN KEY (mat_Veiculo) REFERENCES Rent_Car.Veiculo(matricula);

ALTER TABLE Rent_Car.Veiculo
	ADD CONSTRAINT Key_cod FOREIGN KEY (cod_Veiculo) REFERENCES Rent_Car.Tipo_Veiculo(codigo);

ALTER TABLE Rent_Car.Ligeiro
	ADD CONSTRAINT Key_codl FOREIGN KEY (codigo) REFERENCES Rent_Car.Tipo_Veiculo(codigo);

ALTER TABLE Rent_Car.Pesado
	ADD CONSTRAINT Key_codp FOREIGN KEY (codigo) REFERENCES Rent_Car.Tipo_Veiculo(codigo);

ALTER TABLE Rent_Car.Similaridade
	ADD CONSTRAINT Key_cods1 FOREIGN KEY (codigo) REFERENCES Rent_Car.Tipo_Veiculo(codigo),
	 CONSTRAINT Key_cods2 FOREIGN KEY (cod_Similar) REFERENCES Rent_Car.Tipo_Veiculo(codigo);