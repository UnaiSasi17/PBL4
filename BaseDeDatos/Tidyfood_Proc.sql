USE tidyfood;
DROP procedure IF EXISTS `ObtenerProductos`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerProductos` ()
BEGIN
 	  select ProductoID,NombreProducto,Cantidad,F_Caducidad, ProveedorID,F_Donacion from  producto;
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerIntolerancias`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerIntolerancias` (prodID varchar(30))
BEGIN
 	  select i.nombre from intolerancias i
 	      join  producto_intolerancia pi on i.NumeroIntolerancia = pi.NumeroIntolerancia
 	        where pi.ProductoID like  prodID;
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerGrupo`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerGrupo` (prodID varchar(30))
BEGIN
	  select  g.NombreTipo from grupo_alimentos g 
		  join pertenece p on g.TipoID = p.TipoID
			where p.ProductoID like ProdID;		  
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerExistencias`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerExistencias` ()
BEGIN
	  select a.ProductoID, a.NombreProducto,a.Cantidad,a.F_Caducidad from producto a 
		left join productoacaja p on a.ProductoID = p.ProductoID 
			where CajaID is null or (a.Cantidad>0); 	  
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerProductoIDEnCajas`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerProductoIDEnCajas` ()
BEGIN
	  select ProductoID from productoacaja;  
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerExistencias`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerExistencias` ()
BEGIN
	  select a.ProductoID, a.NombreProducto,a.Cantidad,a.F_Caducidad from producto a 
		left join productoacaja p on a.ProductoID = p.ProductoID 
			where CajaID is null or (a.Cantidad>0); 	  
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerIDDelProveedor`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerIDDelProveedor` (NombreProveedor varchar(40))
BEGIN
	  select ProveedorID from proveedores where Nombre like NombreProveedor;
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerNumeroDeIntolerancia`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerNumeroDeIntolerancia` (NombreIntoleracia varchar(40))
BEGIN
	  select NumeroIntolerancia from intolerancias where Nombre like Nombreintolerancia;
END$$
DELIMITER ;


DROP procedure IF EXISTS `InsertarProductoIntolerancia`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `InsertarProductoIntolerancia` (Proc_ProductoID varchar(30), Proc_NumeroIntolerancia INTEGER)
BEGIN
	  INSERT INTO producto_intolerancia (ProductoID, NumeroIntolerancia) values (Proc_ProductoID, Proc_NumeroIntolerancia);
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerTodoDeProducto`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerTodoDeProducto`()
BEGIN
	  select * from producto;
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerProductoyTipo`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerProductoyTipo` ()
BEGIN
	  select p.ProductoID, ga.NombreTipo from pertenece p
		join grupo_alimentos ga on ga.TipoID = p.TipoID;
END$$
DELIMITER ;


DROP procedure IF EXISTS `ObtenerTodoDeProducto_intolerancia`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ObtenerTodoDeProducto_intolerancia` ()
BEGIN
	  select * from producto_intolerancia;
END$$
DELIMITER ;


DROP procedure IF EXISTS `ActualizarProducto`;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE `ActualizarProducto` (Proc_Cantidad, Integer, Proc_ProductoID varchar(30), Proc_NumeroIntolerancia INTEGER)
BEGIN
	  update producto
	    set Cantidad= Cantidad+ Proc_Cantidad
		  where ProductoID like Proc_ProductoID;
END$$
DELIMITER ;



USE tidyfood;
DROP PROCEDURE IF EXISTS Meter_Cajas;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE Meter_Cajas(Proc_CajaID INTEGER, Proc_Caducidad DATE, Proc_CantidadC INTEGER, Proc_CantidadCP INTEGER)
BEGIN
    DECLARE MAXKAJA INTEGER;
	
    SELECT max(CajaID) into MAXKAJA from Caja;
 	  INSERT INTO caja(CajaID) values (MAXKAJA+1, Proc_Caducidad, Proc_CantidadC, Proc_CantidadCP );
	  
	  
	   F_Caducidad     DATE,
    CantidadC       INTEGER,
    CantidadCP       INTEGER
);
END$$
DELIMITER ;



USE tidyfood;
DROP PROCEDURE IF EXISTS BorrarCaja;
DELIMITER $$
USE `tidyfood`$$
CREATE PROCEDURE BorrarCaja()
BEGIN
	  delete from caja where CantidadC like 0;
END$$
DELIMITER ;



















