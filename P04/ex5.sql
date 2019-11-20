CREATE SCHEMA Conferencia;
GO

CREATE TABLE Conferencia.Pessoa(
	nome			varchar				PRIMARY KEY,
	email			varchar
);

CREATE TABLE Conferencia.Autores(
	nome			varchar				PRIMARY KEY
);

CREATE TABLE Conferencia.Participantes(
	nome			varchar				PRIMARY KEY,
	morada			varchar,
	data_inscricao	date
);

CREATE TABLE Conferencia.Estudantes(
	nome			varchar				PRIMARY KEY,
	link			varchar
);

CREATE TABLE Conferencia.NaoEstudantes(
	nome			varchar				PRIMARY KEY,
	ref				int
);

CREATE TABLE Conferencia.Artigos(
	n_registo		int					PRIMARY KEY,
	titulo			varchar
);

CREATE TABLE Conferencia.Instituicao(
	nome			varchar				PRIMARY KEY,
	titulo			varchar
);

CREATE TABLE Conferencia.PessoaInstituicao(
	nome_Pessoa			varchar			NOT NULL,
	nome_Instituicao	varchar			NOT NULL
);

CREATE TABLE Conferencia.AutoresArtigos(
	nome			varchar				NOT NULL,
	n_registo		int					NOT NULL
);

ALTER TABLE Conferencia.PessoaInstituicao
	ADD CONSTRAINT Key_nomePes FOREIGN KEY (nome_Pessoa) REFERENCES Conferencia.Pessoa(nome),
	CONSTRAINT Key_nomeIns FOREIGN KEY (nome_Instituicao) REFERENCES Conferencia.Instituicao(nome);

ALTER TABLE Conferencia.AutoresArtigos
	ADD CONSTRAINT Key_nomeArt FOREIGN KEY (nome) REFERENCES Conferencia.Autores(nome),
	CONSTRAINT Key_registo FOREIGN KEY (n_registo) REFERENCES Conferencia.Artigos(n_registo);

ALTER TABLE Conferencia.Autores
	ADD CONSTRAINT Key_autores FOREIGN KEY (nome) REFERENCES Conferencia.Pessoa(nome);

ALTER TABLE Conferencia.Participantes
	ADD CONSTRAINT Key_participantes FOREIGN KEY (nome) REFERENCES Conferencia.Autores(nome);

ALTER TABLE Conferencia.Estudantes
	ADD CONSTRAINT Key_estudantes FOREIGN KEY (nome) REFERENCES Conferencia.Participantes(nome);

ALTER TABLE Conferencia.NaoEstudantes
	ADD CONSTRAINT Key_naoestudantes FOREIGN KEY (nome) REFERENCES Conferencia.Participantes(nome);