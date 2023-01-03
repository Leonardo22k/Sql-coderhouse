CREATE DATABASE IF NOT EXISTS casacomputacion;

USE casacomputacion; 

CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre_cliente  VARCHAR (30) NOT NULL,
apellido_cliente VARCHAR (30) NOT NULL,
telefono_cliente VARCHAR (30),
direccion_cliente VARCHAR (80),
email_cliente VARCHAR (80) 
); 

CREATE TABLE IF NOT EXISTS productos (

id_producto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR (120) NOT NULL, 
precio_producto FLOAT NOT NULL 
);

CREATE TABLE IF NOT EXISTS proveedores (
id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY, 
nombre_proveedor  VARCHAR (30) NOT NULL,
direccion_proveedor  VARCHAR (80),
telefono_proveedor  VARCHAR (30)
);

CREATE TABLE IF NOT EXISTS facturas (
id_factura INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL,
id_cliente INT NOT NULL,
total_factura FLOAT NOT NULL, 
fecha_factura  DATE NOT NULL

);

CREATE TABLE IF NOT EXISTS almacen (
id_producto INT NOT NULL,
id_proveedor INT NOT NULL, 
cantidad_producto INT NOT NULL,
descripcion VARCHAR (200),
FOREIGN KEY (id_producto)
      REFERENCES productos(id_producto)
      ON DELETE CASCADE 
      ON UPDATE CASCADE,
FOREIGN KEY (id_proveedor)
      REFERENCES proveedores(id_proveedor)
	  ON DELETE CASCADE 
      ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS empleados(
id_empleado INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre_empleado VARCHAR (30) NOT NULL,
apellido_empleado VARCHAR (30) NOT NULL
);

CREATE TABLE IF NOT EXISTS ventas (
id_venta INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
id_factura INT NOT NULL,
id_producto INT NOT NULL,
id_empleado INT NOT NULL,
cantidad_producto INT NOT NULL,
subtotal FLOAT NOT NULL

);

CREATE TABLE IF NOT EXISTS pedido (
id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL, 
id_proveedor INT NOT NULL,
cantidad_pedido INT NOT NULL

);




                                            -- **************TABLAS PARA TRIGGERS************** --
CREATE TABLE clientes_nuevos_tr (
id_cliente INT, 
nombre_cliente VARCHAR (30),
apellido_cliente VARCHAR (30),
telefono_cliente VARCHAR (30),
direccion_cliente VARCHAR (80),
email_cliente VARCHAR (80),
usuario VARCHAR (200),
fecha_hora TIMESTAMP,
db VARCHAR(200),
version VARCHAR (100)

);

CREATE TABLE productos_nuevos_tr (
id_producto INT, 
nombre_producto VARCHAR (120),
precio_producto float,
usuario VARCHAR (200),
fecha_hora TIMESTAMP,
db VARCHAR(200),
version VARCHAR (100)

);                       
                       
CREATE TABLE actualizacion_de_clientes_tr (
id_cliente INT, 
nombre_cliente VARCHAR (30),
apellido_cliente VARCHAR (30),
telefono_cliente VARCHAR (30),
direccion_cliente VARCHAR (80),
email_cliente VARCHAR (80),
usuario VARCHAR (200),
fecha_hora TIMESTAMP,
db VARCHAR(200),
version VARCHAR (100)

);

CREATE TABLE actualizacion_de_productos_tr (
id_producto INT, 
nombre_producto VARCHAR (120),
precio_producto float,
usuario VARCHAR (200),
fecha_hora TIMESTAMP,
db VARCHAR(200),
version VARCHAR (100)

);

DELIMITER $$
                                    -- **FUNCIONES** -- 
-- Al poner el id de empleado realiza la suma del total de dinero de las ventas que realizo ese empleado 

CREATE FUNCTION `total_dinero_recaudado_por_empleado`(recaudado INT) 
RETURNS varchar(60) 
READS SQL DATA
BEGIN
	DECLARE dinero VARCHAR (60); 
	SET dinero = (SELECT sum(subtotal) FROM ventas where id_empleado = recaudado);
	RETURN dinero;
END$$

-- Al poner un id de factura, busca la fecha que se realizo   

CREATE FUNCTION `fecha_factura_por_id`(fecha_compra INT) RETURNS varchar(50) 
READS SQL DATA
BEGIN
	DECLARE fecha VARCHAR(50);
	SET fecha = (SELECT fecha_factura FROM facturas WHERE id_factura = fecha_compra);
	RETURN fecha;

END$$  

                                     -- **STORED PROCEDURE** --
 -- Como menciona el ejercicio a realizar, en el primer campo se ingresa el nombre de la columna de clientes y en el segundo en el orden que se desea asc o desc
 
CREATE PROCEDURE  `clientes_por_orden`(IN campo char(30),IN orden char(4))
BEGIN
    IF campo <> '' THEN
        IF orden = 'asc'        THEN   SET @column_name = CONCAT('ORDER BY',' ',campo,' ','ASC');                  
        ELSEIF orden = 'desc'    THEN    SET @column_name = CONCAT('ORDER BY',' ',campo,' ','DESC');
        ELSE SET @column_name = '';
        END IF;  
    ELSE 
        SET @column_name = '';
    END IF;
    
    IF  @column_name <> '' THEN
        SET @consulta = CONCAT('SELECT * FROM clientes',' ',  @column_name);
    END IF;  
    
    PREPARE para_ordenar FROM @consulta;
    EXECUTE para_ordenar;
    DEALLOCATE PREPARE para_ordenar;

END$$

 -- Este stored procedure inserta un nuevo nombre de producto y precio en la tabla productos
 
CREATE PROCEDURE `insertar_nuevo_producto`(IN producto_nuevo VARCHAR(150), IN precio_nuevo float)
BEGIN
insert into productos (nombre_producto,precio_producto) values (producto_nuevo,precio_nuevo);
END$$


                                                      -- TRIGGERS -- 
                                                      
	-- Trigger relacionado con la tabla clientes_nuevos_tr en la cual cada ves que se inserta un cliente nuevo en la tabla clientes se muestran los datos 
	-- en la tabla realacionada con la fecha, usuario,version y db
    
CREATE TRIGGER `nuevos_clientes_tr`
	AFTER INSERT ON `clientes` FOR EACH ROW 
	BEGIN
	INSERT INTO `casacomputacion`.`clientes_nuevos_tr` (id_cliente,nombre_cliente,apellido_cliente,telefono_cliente,direccion_cliente,email_cliente,usuario,fecha_hora,db,version)
	VALUES (NEW.id_cliente,NEW.nombre_cliente,NEW.apellido_cliente,NEW.telefono_cliente,NEW.direccion_cliente,NEW.email_cliente,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
	END$$
    
    -- De mismo modo que la tabla anterior cada ves que se actualizan los datos de un usuarios se veran los datos actualizados en la tabla actualizacion_de_clientes_tr
    
CREATE TRIGGER `cliente_actualizado` 
	AFTER UPDATE ON `clientes` FOR EACH ROW 
    BEGIN
    INSERT INTO `casacomputacion`.`actualizacion_de_clientes_tr` (id_cliente,nombre_cliente,apellido_cliente,telefono_cliente,direccion_cliente,email_cliente,usuario,fecha_hora,db,version)
	VALUES (OLD.id_cliente,OLD.nombre_cliente,OLD.apellido_cliente,OLD.telefono_cliente,OLD.direccion_cliente,OLD.email_cliente,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
    END$$
    
    -- Trigger relacionado con la tabla productos_nuevos_tr en la cual cada ves que se inserta un producto nuevo en la tabla productos se muestran los datos 
	-- en la tabla realacionada con la fecha, usuario,version y db
    
CREATE TRIGGER `productos_nuevos_tr` 
	AFTER INSERT ON `productos` FOR EACH ROW BEGIN
	INSERT INTO `casacomputacion`.`productos_nuevos_tr` (id_producto,nombre_producto,precio_producto,usuario,fecha_hora,db,version)
	VALUES (NEW.id_producto,NEW.nombre_producto,NEW.precio_producto,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
	END$$
    
        -- De mismo modo que la tabla anterior cada ves que se actualizan los datos de un producto se veran los datos actualizados en la tabla actualizacion_de_productos_tr
    
CREATE TRIGGER `productos_actualizados` 
	AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
	INSERT INTO `casacomputacion`.`actualizacion_de_productos_tr` (id_producto,nombre_producto,precio_producto,usuario,fecha_hora,db,version)
	VALUES (OLD.id_producto,OLD.nombre_producto,OLD.precio_producto,USER(),CURRENT_TIMESTAMP(),DATABASE(),VERSION());
	END$$
    
DELIMITER $$


                                                      -- VISTAS --

-- Vista creada para ver el producto mas vendido en la tabla ventas
CREATE OR REPLACE VIEW producto_mas_vendido
AS
SELECT p.id_producto,nombre_producto, COUNT(*) AS cantidad 
FROM ventas AS v
JOIN productos p ON p.id_producto = v.id_producto
GROUP BY p.id_producto
ORDER BY count(*) DESC;

-- Vista creada para ver el total de dinero de la tabla ventas
CREATE OR REPLACE VIEW dinero_total_de_ventas
AS 
SELECT count(subtotal) AS ventas_totales,sum(subtotal) AS dinero_total FROM ventas;

-- Vista creada para ver y calcular el total de cada producto entre la tabla almacen y productos
CREATE OR REPLACE VIEW mayor_cantidad_de_producto_en_stock
AS
SELECT p.id_producto,nombre_producto,id_proveedor,cantidad_producto 
FROM almacen a 
JOIN productos p ON p.id_producto = a.id_producto 
ORDER BY cantidad_producto DESC; 

-- Vista creada para ver el empleado que mas ventas realizo, lo cual trae la tabla ventas y empleados
CREATE OR REPLACE VIEW empleado_con_mas_ventas_realizadas
AS 
SELECT v.id_empleado,nombre_empleado,apellido_empleado,count(*) AS cantidad_ventas
 FROM ventas v 
 JOIN empleados e ON e.id_empleado = v.id_empleado 
 GROUP BY v.id_empleado
ORDER BY count(*) DESC;

-- Vista creada para ver el cliente que mas compras realizo, la cual se utilizan las tablas facturas y clientes
CREATE OR REPLACE VIEW cliente_con_mas_compras
AS
SELECT c.id_cliente AS ID,nombre_cliente ,apellido_cliente,count(*) AS cantidad_de_compras
FROM facturas f 
JOIN clientes c ON c.id_cliente = f.id_cliente 
GROUP BY f.id_cliente
ORDER BY count(*) DESC;  

-- Vista creada para ver el total de productos en la tabla almacen
CREATE OR REPLACE VIEW Total_productos_en_almacen
AS
SELECT sum(cantidad_producto) AS cantidad_de_productos FROM almacen;

                           -- CREACIÓN DE USUARIOS CON PRIVILEGIOS -- 

-- Este usuario solo podra ver las tablas y seleccionarlas -- 
CREATE USER 'usuariodeprueba1@coder' IDENTIFIED WITH mysql_native_password BY '12345';
	GRANT SELECT ON *.* TO 'usuariodeprueba1@coder';

-- Este usuario podra ver las tablas, insertar datos y modificar -- 
CREATE USER 'usuariodeprueba2@coder' IDENTIFIED WITH mysql_native_password BY '12345';
	GRANT SELECT, INSERT, UPDATE ON *.* TO 'usuariodeprueba2@coder';
