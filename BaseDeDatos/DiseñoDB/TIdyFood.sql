show databases;












/*CREATE DATABASE Tidyfood;
DROP DATABASE IF EXISTS tidyfood;
USE Tidyfood;

CREATE TABLE Proveedores (
    ProveedorID     INTEGER,
    Nombre          VARCHAR (40) NOT NULL,
    Direccion       VARCHAR (50)
);

CREATE TABLE Producto (
    ProductoID      INTEGER,
    Cantidad        INTEGER,
    F_Caducidad     DATE,
    ProveedorID     INTEGER,
    F_Donacion      DATE
);

CREATE TABLE Grupo_Alimentos(
    TipoID          INTEGER,
    NombreTipo      VARCHAR(40) NOT NULL
);

CREATE TABLE Caja(
    CajaID          INTEGER,
    F_Caducidad     DATE,
    CantidadC       INTEGER,
    CantidadCP       INTEGER
);

CREATE TABLE Intolerancias(
    NumeroIntolerancia  INTEGER,
    Nombre          VARCHAR(40)
);

CREATE TABLE Beneficiarios(
    BenefID         INTEGER,
    Localidad       VARCHAR(45),
    Calle           VARCHAR(40),
    Numero          VARCHAR(10)
);

CREATE TABLE Lotes(
  LoteID            INTEGER,
  Nombre            VARCHAR(20),
  F_Entrega         DATE,
  BenefID           INTEGER
);

#CREATE TABLE Donacion(
#    ProveedorID     INTEGER,
#    ProductoID      INTEGER,
#    F_Donacion      DATE
#);

CREATE TABLE ProductoACaja(
    CantidadP       INTEGER,
    ProductoID      INTEGER,
    CajaID          INTEGER
);

CREATE TABLE Entregas(
    BenefID         INTEGER,
    LoteID          INTEGER,
    F_Entrega       DATE
);

CREATE TABLE Contiene(
    LoteID          INTEGER,
    ProductoID      INTEGER,
    Cantidad        INTEGER
);

CREATE TABLE Producto_Intolerancia(
    ProductoID      INTEGER,
    NumeroIntolerancia  INTEGER
);

CREATE TABLE Relacion(
    NumeroIntolerancia  INTEGER,
    BenefID         INTEGER
);

CREATE TABLE Pertenece(
    ProductoID      INTEGER,
    F_Caducidad     DATE,
    TipoID          INTEGER
);

ALTER TABLE Proveedores
    ADD CONSTRAINT primary key (ProveedorID);

ALTER TABLE Producto
    ADD CONSTRAINT foreign key (ProveedorID) references Proveedores(ProveedorID),
    ADD CONSTRAINT primary key (ProductoID, F_Caducidad);


ALTER TABLE Grupo_Alimentos
    ADD CONSTRAINT primary key (TipoID);

ALTER TABLE Pertenece
    ADD CONSTRAINT foreign key (ProductoID,F_Caducidad) references Producto(ProductoID,F_Caducidad),
    #ADD CONSTRAINT foreign key (F_Caducidad) references Producto(F_Caducidad),
    ADD CONSTRAINT foreign key (TipoID)     references Grupo_Alimentos(TipoID),
    ADD CONSTRAINT primary key (ProductoID,F_Caducidad, TipoID);

#ALTER TABLE Donacion
#    ADD CONSTRAINT primary key (ProveedorID,ProductoID),
#    ADD CONSTRAINT foreign key (ProveedorID) references Proveedores(ProveedorID),
#    ADD CONSTRAINT foreign key (ProductoID) references Producto (ProductoID);

ALTER TABLE Caja
    #ADD CONSTRAINT foreign key (CantidadP) references ProductoACaja(CantidadP),
    ADD CONSTRAINT primary key (CajaID);

ALTER TABLE ProductoACaja
    ADD CONSTRAINT foreign key (ProductoID) references Producto(ProductoID),
    ADD CONSTRAINT foreign key (CajaID) references Caja(CajaID),
    ADD CONSTRAINT primary key (ProductoID, CajaID);

ALTER TABLE Intolerancias
    ADD CONSTRAINT primary key (NumeroIntolerancia);

ALTER TABLE Producto_Intolerancia
    ADD CONSTRAINT foreign key (NumeroIntolerancia) references Intolerancias(NumeroIntolerancia),
    ADD CONSTRAINT foreign key (ProductoID) references Producto(ProductoID),
    ADD CONSTRAINT primary key (NumeroIntolerancia, ProductoID);

ALTER TABLE Beneficiarios
    ADD CONSTRAINT primary key (BenefID);

ALTER TABLE relacion
    ADD CONSTRAINT foreign key (BenefID) references Beneficiarios(BenefID),
    ADD CONSTRAINT foreign key (NumeroIntolerancia) references Intolerancias(NumeroIntolerancia),
    ADD CONSTRAINT primary key (BenefID, NumeroIntolerancia);

ALTER TABLE Lotes
    ADD CONSTRAINT primary key (LoteID),
    ADD CONSTRAINT foreign key (BenefID) references Beneficiarios(BenefID);###############################

#ALTER TABLE Entregas
#    ADD CONSTRAINT foreign key (BenefID) references Beneficiarios(BenefID),
#    ADD CONSTRAINT foreign key (LoteID) references Lotes(LoteID),
#    ADD CONSTRAINT primary key (LoteID, BenefID, F_Entrega);

#ALTER TABLE Lotes
#    ADD CONSTRAINT foreign key (F_Entrega) references entregas(F_Entrega);



ALTER TABLE Contiene
    ADD CONSTRAINT foreign key (LoteID)     references Lotes(LoteID),
    ADD CONSTRAINT foreign key (ProductoID) references Producto(ProductoID),
    ADD CONSTRAINT primary key (LoteID,ProductoID);


INSERT INTO Proveedores values (16, 'Andoni', 'Aizkorri Kalea 3 3 A, Legazpi');
INSERT INTO Producto values (1, 3, '2022-05-30',16, '2022-05-24');
#INSERT INTO Grupo_Alimentos values (1, 'Verduras');
INSERT INTO Intolerancias values (1, 'Alergia');
INSERT INTO Beneficiarios values (20,'Legazpi', 'Aizkorri Kalea', '3, 3, A');
INSERT INTO Caja values (1, '2022-05-30', 3, 5);
INSERT INTO Lotes values (1, 'Bolsa de Lechuga', '2022-05-26', 20);
INSERT INTO Entregas values (20, 1, '2022-05-26');
INSERT INTO Producto_Intolerancia values (1, 1);
INSERT INTO Contiene values (1, 1, 3);
INSERT INTO ProductoACaja values (2, 1, 1);
INSERT INTO relacion values (1, 20);
INSERT INTO pertenece values (1, '2022-05-30',1);



CREATE TABLE Erabiltzailea(
    Usuario     VARCHAR(30),
    Contra      VARCHAR(20) NOT NULL
)ENGINE = MYISAM;

ALTER TABLE Erabiltzailea
    ADD CONSTRAINT primary key (Usuario);














