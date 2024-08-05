CREATE DATABASE Aeropuerto;
use Aeropuerto;





CREATE TABLE Personel(
CedulaPersonel INT PRIMARY KEY,
NombrePersonel VARCHAR(20),
ApellidoPersonel1 VARCHAR(20),
ApellidoPersonel2 VARCHAR(20),
Telefono VARCHAR(20),
Correo VARCHAR (150),
Rol VARCHAR(20),
Sexo CHAR,
VueloAsignado INT
);




CREATE TABLE Aeropuertos(
NumAeropuerto TINYINT PRIMARY KEY IDENTITY(1,1),
Provincia VARCHAR(30),
);




CREATE TABLE Vuelo(
NumeroVuelo INT IDENTITY PRIMARY KEY,
Capitán INT, /*Inserted via code*/
Copiloto INT, /*Inserted via code*/
Asistente1 INT, /*Inserted via code*/
Asistente2 INT, /*Inserted via code*/
Partida TINYINT, /*From where the flight starts*/
Destino VARCHAR(30), /*To which province the flight is going*/

FOREIGN KEY (Partida) REFERENCES Aeropuertos (NumAeropuerto),
FOREIGN KEY (Capitán) REFERENCES Personel (CedulaPersonel),
FOREIGN KEY (Copiloto) REFERENCES Personel (CedulaPersonel),
FOREIGN KEY (Asistente1) REFERENCES Personel (CedulaPersonel),
FOREIGN KEY (Asistente2) REFERENCES Personel (CedulaPersonel)
);


/*The table to manage the seats*/
CREATE TABLE Asientos (
    NumeroVuelo INT,
    NumeroAsiento INT,
    FOREIGN KEY (NumeroVuelo) REFERENCES Vuelo(NumeroVuelo)
);
ALTER TABLE Asientos
ADD CONSTRAINT AsientoAvion UNIQUE (NumeroVuelo, NumeroAsiento);



/*The very basics to recognize the clients*/
CREATE TABLE Clientes(
CedulaCliente INT PRIMARY KEY NOT NULL,
NombreCliente VARCHAR(20) NOT NULL,
ApellidoCliente1 VARCHAR(20) NOT NULL,
ApellidoCliente2 VARCHAR(20) NOT NULL,
Telefono VARCHAR(20) NOT NULL,
Correo VARCHAR (150),
Sexo CHAR NOT NULL
);



/*NumTicket is the ID, NumVuelo and NumAsiento are self-explanatory*/
/*Fecha vuelo is used to tell when is the fly. And Hora vuelo does the same but for hours*/
CREATE TABLE Tickets (
    NumTicket INT IDENTITY(1,1),
	CedulaPersona INT,
	NumeroVuelo INT,
	NumeroAsiento TINYINT,
	FechaVuelo DATETIME,
    HoraVuelo TIME,
	PesoLlevado SMALLINT,
	FOREIGN KEY (NumeroVuelo) REFERENCES Vuelo (NumeroVuelo),
	FOREIGN KEY (CedulaPersona) REFERENCES Clientes (CedulaCliente)
);
