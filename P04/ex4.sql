CREATE SCHEMA PrescricaoMedicamentos;
GO

CREATE TABLE PrescricaoMedicamentos.Medico(
	sns					int			PRIMARY KEY,
	nome				varchar		UNIQUE,
	especialidade		varchar
);

CREATE TABLE PrescricaoMedicamentos.Prescricao(
	nPrescricao			int			PRIMARY  KEY,
	data				date,
	numUtente			int,
	telefoneFarmacia	int,
	sns					int
);

CREATE TABLE PrescricaoMedicamentos.Utente(
	nUtente				int			PRIMARY KEY,
	nome				varchar		UNIQUE,
	dataNascimento		date,
	endereço			varchar
);

CREATE TABLE PrescricaoMedicamentos.Farmacia(
	telefone			int			PRIMARY KEY,
	nome				varchar		UNIQUE,
	endereço			varchar
);

CREATE TABLE PrescricaoMedicamentos.Vender(
	telefoneFarmacia	int,
	nomeFarmaco			varchar
);

CREATE TABLE PrescricaoMedicamentos.Farmaco(
	nome				varchar		PRIMARY KEY,
	formula				varchar,
	regNacionalFarm		int
);

CREATE TABLE PrescricaoMedicamentos.Produz(
	numPrescricao		int,
	nomeFarmaco			varchar
);

CREATE TABLE PrescricaoMedicamentos.Farmaceutica(
	nRegistoNacional	int			PRIMARY KEY,
	nome				varchar		UNIQUE,
	endereço			varchar,
	telefone			int			UNIQUE
);

ALTER TABLE PrescricaoMedicamentos.Prescricao
	ADD CONSTRAINT keyNUmUtente FOREIGN KEY(numUtente) REFERENCES PrescricaoMedicamentos.Utente(nUtente),
	CONSTRAINT keyTelefoneFarmacia FOREIGN KEY(telefoneFarmacia) REFERENCES PrescricaoMedicamentos.Farmacia(telefone),
	CONSTRAINT keySNS FOREIGN KEY(sns) REFERENCES PrescricaoMedicamentos.Medico(sns);

ALTER TABLE PrescricaoMedicamentos.Vender
	ADD CONSTRAINT keyTelefone FOREIGN KEY(telefoneFarmacia) REFERENCES PrescricaoMedicamentos.Farmacia(telefone),
	CONSTRAINT keyNomeFarmaco FOREIGN KEY(nomeFarmaco) REFERENCES PrescricaoMedicamentos.Farmaco(nome);

ALTER TABLE PrescricaoMedicamentos.Farmaco
	ADD CONSTRAINT keyRegistoNacional FOREIGN KEY(regNacionalFarm) REFERENCES PrescricaoMedicamentos.Farmaceutica(nRegistoNacional);

ALTER TABLE PrescricaoMedicamentos.Produz
	ADD CONSTRAINT keyNumPrescricao FOREIGN KEY(numPrescricao) REFERENCES PrescricaoMedicamentos.Prescricao(nPrescricao),
	CONSTRAINT keyFarmaco FOREIGN KEY(nomeFarmaco) REFERENCES PrescricaoMedicamentos.Farmaco(nome);