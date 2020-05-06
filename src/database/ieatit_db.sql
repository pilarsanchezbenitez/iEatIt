CREATE DATABASE ieatit;
USE ieatit;

CREATE TABLE Usuario(
    IdUsuario 			INT NOT NULL,
    Nombre				VARCHAR(50) NOT NULL,
	Paterno				VARCHAR(50) NOT NULL,
	Materno				VARCHAR(50),
	Genero				CHAR(1) NOT NULL CHECK( genero IN ('H','M')),
    PRIMARY KEY (IdUsuario)
);

CREATE TABLE Cliente(
	IdCliente 			INT NOT NULL,
	IdUsuario			INT NOT NULL UNIQUE,
    INDEX fk_usuario_cliente (IdUsuario),
    FOREIGN KEY (IdUsuario)
        REFERENCES Usuario(IdUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	PRIMARY KEY (IdCliente)
); 

CREATE TABLE Repartidor(
	IdRepartidor		INT NOT NULL,
	IdUsuario			INT NOT NULL UNIQUE,
    INDEX fk_usuario_repartidor (IdUsuario),
    FOREIGN KEY (IdUsuario)
        REFERENCES Usuario(IdUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	PRIMARY KEY (IdRepartidor)
);

CREATE TABLE Administrador(
	IdAdministrador		INT NOT NULL,
	IdUsuario			INT NOT NULL UNIQUE,
    INDEX fk_usuario_administrador (IdUsuario),
    FOREIGN KEY (IdUsuario)
        REFERENCES Usuario(IdUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (IdAdministrador)
);

CREATE TABLE Alimento (
    IdAlimento 			 INT NOT NULL,
    Nombre               varchar(45) NOT NULL,
    Precio               int DEFAULT 0,
    Descripcion          varchar(255),
    PRIMARY KEY (IdAlimento)
);

CREATE TABLE Categoria (
    IdCategoria          INT NOT NULL,
    Nombre               varchar(45) NOT NULL,
    Descripcion          varchar(255),
    PRIMARY KEY (IdCategoria)
);

CREATE TABLE Orden (
    IdOrden 			 INT NOT NULL,
    NombreCliente        varchar(45),
    DireccionCliente     varchar(45),
    Estado               varchar(45),
    HoraCreacion         time,
    HoraEntrega          time,
    PRIMARY KEY (IdOrden)
);

/**
* Sección de tablas de atributos multivaluados.
**/


CREATE TABLE Correo(
	Correo				VARCHAR(100) NOT NULL CHECK(Correo LIKE '%_@%_.%_'),
	IdUsuario 			INT		NOT NULL,
    INDEX fk_usuario_correo (IdUsuario),
    FOREIGN KEY (IdUsuario)
        REFERENCES Usuario(IdUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (Correo, IdUsuario)
);

CREATE TABLE Telefono(
	Telefono			CHAR(10) 	NOT NULL,
	IdUsuario 			INT		NOT NULL,
    INDEX fk_usuario_telefono (IdUsuario),
    FOREIGN KEY (IdUsuario)
        REFERENCES Usuario(IdUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (Telefono, IdUsuario)
);


CREATE TABLE Direccion(
	Direccion			VARCHAR(100) 	NOT NULL,
	IdUsuario 			INT		NOT NULL,
    INDEX fk_usuario_direccion (IdUsuario),
    FOREIGN KEY (IdUsuario)
        REFERENCES Usuario(IdUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (Direccion, IdUsuario)
);

/**
* Sección de tablas de atributos multivaluados.
**/

CREATE TABLE Administrar (
    IdAdministrador      INT,
    IdAlimento  	     INT,
    IdCategoria          INT,
    FOREIGN KEY (IdAdministrador) REFERENCES Administrador(IdAdministrador),
    FOREIGN KEY (IdAlimento) REFERENCES Alimento(IdAlimento),
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);

CREATE TABLE Ver (
    IdCliente            INT,
    IdAlimento           INT,
    IdCategoria          INT,
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
    FOREIGN KEY (IdAlimento) REFERENCES Alimento(IdAlimento),
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);

CREATE TABLE Pedir (
    IdCliente            INT,
    IdOrden              INT,
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
    FOREIGN KEY (IdOrden) REFERENCES Orden(IdOrden)
);

CREATE TABLE Seleccionar (
    IdRepartidor         INT,
    IdOrden              INT,
    FOREIGN KEY (IdRepartidor) REFERENCES Repartidor(IdRepartidor),
    FOREIGN KEY (IdOrden) REFERENCES Orden(IdOrden)
);

CREATE TABLE Formar (
    IdOrden              INT,
    IdAlimento           INT,
    FOREIGN KEY (IdOrden) REFERENCES Orden(IdOrden),
    FOREIGN KEY (IdAlimento) REFERENCES Alimento(IdAlimento)
);

CREATE TABLE Pertenecer (
    IdAlimento           INT,
    IdCategoria          INT,
    FOREIGN KEY (IdAlimento) REFERENCES Alimento(IdAlimento),
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);
