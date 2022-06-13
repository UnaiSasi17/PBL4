DROP DATABASE IF EXISTS Tidyfood;
CREATE DATABASE Tidyfood;
Use Tidyfood;

CREATE TABLE Proveedores (
    ProveedorID     INTEGER,
    Nombre          VARCHAR (40) NOT NULL,
    Direccion       VARCHAR (50)
);

CREATE TABLE Producto (
    ProductoID      VARCHAR(30),
    NombreProducto  VARCHAR(20),
    Cantidad        INTEGER,
    F_Caducidad     DATE,
    ProveedorID     INTEGER,
    F_Donacion      DATE
);

CREATE TABLE Grupo_Alimentos(
    TipoID          int,
    NombreTipo      VARCHAR(40) NOT NULL
);

CREATE TABLE Caja(
    CajaID          INTEGER,
    F_Caducidad     DATE,
    CantidadC       INTEGER,
    CantidadCP       INTEGER
);

CREATE TABLE Intolerancias(
    NumeroIntolerancia  int,
    Nombre          VARCHAR(40)
);

CREATE TABLE Beneficiarios(
    BenefID         INTEGER,
    nombreBene      varchar(20)
);

CREATE TABLE Lotes(
  LoteID            INTEGER,
  Nombre            VARCHAR(20),
  F_Entrega         DATE,
  BenefID           INTEGER,
  Cantidad          INTEGER
);

CREATE TABLE ProductoACaja(
    CantidadP       INTEGER,
    ProductoID      VARCHAR(30),
    CajaID          INTEGER
);

CREATE TABLE Contiene(
    LoteID          INTEGER,
    ProductoID      VARCHAR(30),
    Cantidad        INTEGER
);

CREATE TABLE Producto_Intolerancia(
    ProductoID          VARCHAR(30),
    NumeroIntolerancia  int
);

CREATE TABLE Relacion(
    NumeroIntolerancia  int,
    BenefID         INTEGER
);

CREATE TABLE Pertenece(
    ProductoID      VARCHAR(30),
    TipoID       int
);

CREATE TABLE Erabiltzailea(
    Usuario     VARCHAR(30),
    Contra      VARCHAR(20) NOT NULL
)ENGINE = MYISAM;

ALTER TABLE Erabiltzailea
    ADD CONSTRAINT primary key (Usuario);

ALTER TABLE Proveedores
    ADD CONSTRAINT primary key (ProveedorID);

ALTER TABLE Producto
    ADD COLUMN caducado boolean,
    ADD CONSTRAINT foreign key (ProveedorID) references Proveedores(ProveedorID),
    ADD CONSTRAINT primary key (ProductoID, F_Caducidad);

ALTER TABLE Grupo_Alimentos
    ADD CONSTRAINT primary key (TipoID);

ALTER TABLE Pertenece
    ADD CONSTRAINT foreign key (ProductoID) references Producto(ProductoID),
    ADD CONSTRAINT foreign key (TipoID)     references Grupo_Alimentos(TipoID),
    ADD CONSTRAINT primary key (ProductoID, TipoID);

ALTER TABLE Caja
    ADD CONSTRAINT primary key (CajaID);

ALTER TABLE ProductoACaja
    ADD CONSTRAINT foreign key (ProductoID) references Producto(ProductoID),
    ADD CONSTRAINT foreign key (CajaID) references Caja(CajaID),
    ADD CONSTRAINT primary key (ProductoID, CajaID);

ALTER TABLE Intolerancias
    ADD CONSTRAINT primary key (NumeroIntolerancia);

ALTER TABLE Producto_Intolerancia
    ADD CONSTRAINT foreign key (NumeroIntolerancia) references Intolerancias(NumeroIntolerancia) ,
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
    ADD CONSTRAINT foreign key (BenefID) references Beneficiarios(BenefID);

ALTER TABLE Contiene
    ADD CONSTRAINT foreign key (LoteID)     references Lotes(LoteID),
    ADD CONSTRAINT foreign key (ProductoID) references Producto(ProductoID),
    ADD CONSTRAINT primary key (LoteID,ProductoID);
