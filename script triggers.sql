DELIMITER $$

CREATE TRIGGER `nuevos_clientes_tr`
	AFTER INSERT ON `clientes` FOR EACH ROW 
	BEGIN
	INSERT INTO `casacomputacion`.`clientes_nuevos_tr` (id_cliente,nombre_cliente,apellido_cliente,telefono_cliente,direccion_cliente,email_cliente,usuario,fecha_hora,db,version)
	VALUES (NEW.id_cliente,NEW.nombre_cliente,NEW.apellido_cliente,NEW.telefono_cliente,NEW.direccion_cliente,NEW.email_cliente,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
	END$$
    
CREATE TRIGGER `cliente_actualizado` 
	AFTER UPDATE ON `clientes` FOR EACH ROW 
    BEGIN
    INSERT INTO `casacomputacion`.`actualizacion_de_clientes_tr` (id_cliente,nombre_cliente,apellido_cliente,telefono_cliente,direccion_cliente,email_cliente,usuario,fecha_hora,db,version)
	VALUES (OLD.id_cliente,OLD.nombre_cliente,OLD.apellido_cliente,OLD.telefono_cliente,OLD.direccion_cliente,OLD.email_cliente,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
    END$$
    
CREATE TRIGGER `productos_nuevos_tr`
     AFTER INSERT ON `productos` FOR EACH ROW BEGIN
     INSERT INTO `casacomputacion`.`productos_nuevos_tr` (id_producto,nombre_producto,precio_producto,usuario,fecha_hora,db,version)
     VALUES (NEW.id_producto,NEW.nombre_producto,NEW.precio_producto,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
     END$$
    
CREATE TRIGGER `productos_actualizados` 
     AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
     INSERT INTO `casacomputacion`.`actualizacion_de_productos_tr` (id_producto,nombre_producto,precio_producto,usuario,fecha_hora,db,version)
	 VALUES (OLD.id_producto,OLD.nombre_producto,OLD.precio_producto,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
     END
    

DELIMITER $$