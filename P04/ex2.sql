CREATE SCHEMA  Reservas_Voos;
GO

CREATE TABLE Reservas_Voos.Airport(
	code						int					PRIMARY KEY,
	city						varchar,
	states						varchar,
	name						varchar				UNIQUE
);

CREATE TABLE Reservas_Voos.Airport_Type(
	name						varchar				PRIMARY KEY,
	max_seats					int,
	company						varchar
);

CREATE TABLE Reservas_Voos.Airplane(
	id						varchar					PRIMARY KEY,
	total_seats				int,
	typeName				varchar
);

CREATE TABLE Reservas_Voos.Flight(
	number					int						PRIMARY KEY,
	airline					varchar,
	weekdays				int
);

CREATE TABLE Reservas_Voos.Flight_Leg(
	n_leg					int						PRIMARY KEY,
	scheArrTime				date,
	scheDateTime			date,
	flightNumber			int,
	airportCode				int

);

CREATE TABLE Reservas_Voos.Leg_Instance(
	data					date					PRIMARY KEY,
	n_avail_seats			int,
	Dep_time				date,
	Arr_time				date,
	airplaneID				int,
	legNo					int,
	airportCode				int
);

CREATE TABLE Reservas_Voos.Seats(
	nSat					int						PRIMARY KEY,
	customorName			varchar,
	Cphone					int,
	data					date 
);

CREATE TABLE Reservas_Voos.Fare(
	code					int						PRIMARY KEY,
	amount					int,
	restrictions			varchar,
	flightNum				int
);

CREATE TABLE Reservas_Voos.Can_Land(
	code					int,
	name					varchar
);

ALTER TABLE Reservas_Voos.Can_Land
	ADD CONSTRAINT keyCode FOREIGN KEY(code) REFERENCES Reservas_Voos.Airport(code),
	CONSTRAINT keyName FOREIGN KEY(name) REFERENCES Reservas_Voos.Airport_Type(name);

ALTER TABLE Reservas_Voos.Airplane
	ADD CONSTRAINT keyTypeName FOREIGN KEY(typeName) REFERENCES Reservas_Voos.Airport_Type(name);

ALTER TABLE Reservas_Voos.Leg_Instance
	ADD CONSTRAINT keyPlaneId FOREIGN KEY(airplaneID) REFERENCES Reservas_Voos.Airplane(id),
	CONSTRAINT keyAirportCode FOREIGN KEY(airportCode) REFERENCES Reservas_Voos.Airport(code),
	CONSTRAINT keyLegNo FOREIGN KEY(legNo) REFERENCES Reservas_Voos.Flight_Leg(n_leg);

ALTER TABLE Reservas_Voos.Flight_Leg
	ADD CONSTRAINT keyFlightNumber FOREIGN KEY(flightNumber) REFERENCES Reservas_Voos.Flight(number),
	CONSTRAINT keyAirportCode FOREIGN KEY(airportCode) REFERENCES Reservas_Voos.Airport(code);

ALTER TABLE Reservas_Voos.Fare
	ADD CONSTRAINT keyFlightNum FOREIGN KEY(flightNum) REFERENCES Reservas_Voos.Flight(number);

ALTER TABLE Reservas_Voos.Seats
	ADD CONSTRAINT keyDate FOREIGN KEY(data) REFERENCES Reservas_Voos.Leg_Instance(data);