INSERT INTO Proveedores values (8635, 'Dia Judimendi', 'Judimendi Hiribidea, 8, Gasteiz');
INSERT INTO Proveedores values (1234, 'Eroski Musakola', 'Barrio Musakola, Arrasate');
INSERT INTO Proveedores values (2345, 'Eroski Av. Gasteiz', 'Av. Gasteiz, 9 y 11, Vitoria-Gasteiz');
INSERT INTO Proveedores values (3456, 'Eroski Cerrajera', 'Cerrajera, 5, Arrasate');
INSERT INTO Proveedores values (4567, 'Eroski Zaramaga', 'Zaramaga Kalea, 1, Vitoria-Gasteiz');
INSERT INTO Proveedores values (4321, 'Mercadona Olarizu', 'Olarizu Hiribidea, 1, Vitoria-Gasteiz');
INSERT INTO Proveedores values (5432, 'Mercadona Elgoibar', 'Lerun Kalea, 1, Elgoibar');
INSERT INTO Proveedores values (5678, 'Carrefour G. Alava', 'General lava, 10, Vitoria-Gasteiz');


INSERT INTO Intolerancias values (1, 'Carne de cerdo');
INSERT INTO Intolerancias values (2, 'Gluten');
INSERT INTO Intolerancias values (3, 'Frutos secos');
INSERT INTO Intolerancias values (4, 'Crustaceo');
INSERT INTO Intolerancias values (5, 'Huevos');
INSERT INTO Intolerancias values (6, 'Soja');
INSERT INTO Intolerancias values (7, 'Lacteo');
INSERT INTO Intolerancias values (8, 'Apio');
INSERT INTO Intolerancias values (9, 'Molusco');
INSERT INTO Intolerancias values (10, 'Carnico');
INSERT INTO Intolerancias values (11, 'X');


INSERT INTO Grupo_Alimentos values (1, 'Fruta');
INSERT INTO Grupo_Alimentos values (2, 'Hortaliza');
INSERT INTO Grupo_Alimentos values (3, 'Legumbre');
INSERT INTO Grupo_Alimentos values (4, 'Pescado');
INSERT INTO Grupo_Alimentos values (5, 'Carne');
INSERT INTO Grupo_Alimentos values (6, 'Conserva');
INSERT INTO Grupo_Alimentos values (7, 'Cereal');
INSERT INTO Grupo_Alimentos values (8, 'Lacteo');
INSERT INTO Grupo_Alimentos values (9, 'Vegetal');
INSERT INTO Grupo_Alimentos values (10, 'Reposteria');
INSERT INTO Grupo_Alimentos values (11, 'Producto basico');


INSERT INTO Producto values ('lechugaDIA2021-6-7', 'Lechuga', 3, '2022-08-30',8635, '2022-05-24',0);
INSERT INTO producto_intolerancia values ('lechugaDIA2021-6-7',11);
INSERT INTO pertenece values ('lechugaDIA2021-6-7',9);
INSERT INTO Producto values ('pimientosDIA2021-9-16', 'Pimientos', 4, '2022-05-30',8635, '2022-05-24',1);
INSERT INTO producto_intolerancia values ('pimientosDIA2021-9-16',11);
INSERT INTO pertenece values ('pimientosDIA2021-9-16',9);
INSERT INTO Producto values ('pimientoEROS2021-03-23','Pimientos',7,'2023-03-23',1234,'2022-05-24',0);
INSERT INTO producto_intolerancia values ('pimientoEROS2021-03-23',11);
INSERT INTO pertenece values ('pimientoEROS2021-03-23',9);
INSERT INTO Producto values ('lentejasMER2021-2-21', 'Lentejas', 7, '2024-06-28',4321, '2022-06-12',0);
INSERT INTO producto_intolerancia values ('lentejasMER2021-2-21',11);
INSERT INTO pertenece values ('lentejasMER2021-2-21',3);
INSERT INTO Producto values ('quesoCARR2020-5-6', 'Queso', 8, '2022-07-30',5678, '2022-05-12',0);
INSERT INTO producto_intolerancia values ('quesoCARR2020-5-6',7);
INSERT INTO pertenece values ('quesoCARR2020-5-6',8);
INSERT INTO Producto values ('AtunCARR2020-5-6','Atun',9,'2023-08-31',1234,'2022-02-17',0);
INSERT INTO producto_intolerancia values ('AtunCARR2020-5-6',10);
INSERT INTO pertenece values ('AtunCARR2020-5-6',4);
INSERT INTO Producto values ('cerealesMER2022-12-27','Cereales',5,'2024-08-31',5432,'2022-06-10',0);
INSERT INTO producto_intolerancia values ('cerealesMER2022-12-27',6);
INSERT INTO producto_intolerancia values ('cerealesMER2022-12-27',2);
INSERT INTO pertenece (ProductoID, TipoID) values ('cerealesMER2022-12-27',7);


INSERT INTO Beneficiarios values (1,'Xabier Lamarain');
INSERT INTO  relacion values (1,1);
INSERT INTO  relacion values (4,1);
INSERT INTO Beneficiarios values (2,'Unai Sasiain');
INSERT INTO  relacion values (10,2);
INSERT INTO  relacion values (2,2);
INSERT INTO Beneficiarios values (3,'Gorka Etxebarria');
INSERT INTO  relacion values (7,3);
INSERT INTO  relacion values (9,3);
INSERT INTO  relacion values (3,3);


INSERT INTO Caja values (1, '2022-05-30', 7, 50);
INSERT INTO productoacaja values (3,'cerealesMER2022-12-27',1);
INSERT INTO Caja values (2, '2022-05-30', 7, 50);
INSERT INTO productoacaja values (3,'lentejasMER2021-2-21',2);
INSERT INTO Caja values (3, '2022-05-30', 7, 50);
INSERT INTO productoacaja values (3,'quesoCARR2020-5-6',3);


INSERT INTO Lotes values (1, 'Lote1', '2022-05-26', 1,1);
INSERT INTO contiene values (1,'cerealesMER2022-12-27',2);
INSERT INTO contiene values (1,'lentejasMER2021-2-21',3);
INSERT INTO Lotes values (2, 'Lote2', '2022-06-24', 2,2);
INSERT INTO contiene values (2,'pimientosDIA2021-9-16',2);
INSERT INTO contiene values (1,'lechugaDIA2021-6-7',1);


INSERT INTO erabiltzailea values ('admin','admin');
INSERT INTO erabiltzailea values ('unai','unai');
INSERT INTO erabiltzailea values ('gorka','gorka');
INSERT INTO erabiltzailea values ('sergio','sergio');
INSERT INTO erabiltzailea values ('ando','ando');

