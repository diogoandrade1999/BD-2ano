CREATE SCHEMA  Universidade;
GO

CREATE TABLE  Universidade.Pessoa(
	n_mec			int					PRIMARY KEY,
	nome			varchar,
	data_nasc		date
);

CREATE TABLE  Universidade.Estudante(
	n_mec			int					PRIMARY KEY,
	grau			varchar
);

CREATE TABLE  Universidade.Professor(
	n_mec			int					PRIMARY KEY,
	morada			varchar,
	data_inscricao	date,
	nome_Dep		varchar
);

CREATE TABLE  Universidade.Projeto(
	id				int					PRIMARY KEY,
	ent_finan		varchar,
	data_término	date,
	data_início		date
);

CREATE TABLE  Universidade.Departamento(
	nome			varchar				PRIMARY KEY,
	localizacao		varchar
);

CREATE TABLE  Universidade.Supervisiona(
	n_mec_prof		int					NOT NULL,
	n_mec_est		int					NOT NULL
);

CREATE TABLE  Universidade.EstudanteParticipa(
	n_mec			int					NOT NULL,
	id				int					NOT NULL
);

CREATE TABLE  Universidade.ProfessorParticipa(
	n_mec			int					NOT NULL,
	id				int					NOT NULL
);

ALTER TABLE Universidade.Estudante
	ADD CONSTRAINT Key_estudante FOREIGN KEY (n_mec) REFERENCES Universidade.Pessoa(n_mec);

ALTER TABLE Universidade.Professor
	ADD CONSTRAINT Key_professor FOREIGN KEY (n_mec) REFERENCES Universidade.Pessoa(n_mec),
	CONSTRAINT Key_departProf FOREIGN KEY (nome_Dep) REFERENCES Universidade.Departamento(nome);

ALTER TABLE Universidade.Supervisiona
	ADD CONSTRAINT Key_nmecProf FOREIGN KEY (n_mec_prof) REFERENCES Universidade.Professor(n_mec),
	CONSTRAINT Key_nmecEst FOREIGN KEY (n_mec_est) REFERENCES Universidade.Estudante(n_mec);

ALTER TABLE Universidade.EstudanteParticipa
	ADD CONSTRAINT Key_nmecEstPart FOREIGN KEY (n_mec) REFERENCES Universidade.Estudante(n_mec),
	CONSTRAINT Key_idProjetoEst FOREIGN KEY (id) REFERENCES Universidade.Projeto(id);

ALTER TABLE Universidade.ProfessorParticipa
	ADD CONSTRAINT Key_nmecProftPart FOREIGN KEY (n_mec) REFERENCES Universidade.Professor(n_mec),
	CONSTRAINT Key_idProjetoProf FOREIGN KEY (id) REFERENCES Universidade.Projeto(id);