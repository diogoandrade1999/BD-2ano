CREATE SCHEMA moduloDeEncomendas;
GO

CREATE TABLE moduloDeEncomendas.Produto(
	codigo				int			PRIMARY KEY,
	nome				varchar		UNIQUE,
	iva					int
);

CREATE TABLE moduloDeEncomendas.nItems(
	quantidade			int			NOT NULL,
	codigo				int			NOT NULL,
	numero				int
);

CREATE TABLE moduloDeEncomendas.Encomenda(
	numero				int			PRIMARY KEY,
	data				date,
	nInfFiscal			int
);

CREATE TABLE moduloDeEncomendas.Fornecedor(
	nFiscal				int			PRIMARY KEY,
	endereço			int,
	nome				varchar,
	nFax				int			UNIQUE,
	codigoPag			int,
	typeID				int
);

CREATE TABLE moduloDeEncomendas.Tipo(
	ID					int			PRIMARY KEY,
	designacao			varchar		UNIQUE	
);

ALTER TABLE moduloDeEncomendas.nItems
	ADD CONSTRAINT keyCodigo FOREIGN KEY(codigo) REFERENCES moduloDeEncomendas.Produto(codigo),
	CONSTRAINT keyNumero FOREIGN KEY(numero) REFERENCES moduloDeEncomendas.Encomenda(numero);

ALTER TABLE moduloDeEncomendas.Encomenda
	ADD CONSTRAINT keyInfFiscal FOREIGN KEY(nInfFiscal) REFERENCES moduloDeEncomendas.Fornecedor(nFiscal);

ALTER TABLE moduloDeEncomendas.Fornecedor
	ADD CONSTRAINT keyID FOREIGN KEY(typeID) REFERENCES moduloDeEncomendas.Tipo(ID);

