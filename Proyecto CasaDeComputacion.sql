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

DELIMITER $$

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

DELIMITER $$

CREATE OR REPLACE VIEW producto_mas_vendido
AS
SELECT p.id_producto,nombre_producto, COUNT(*) AS cantidad 
FROM ventas AS v
JOIN productos p ON p.id_producto = v.id_producto
GROUP BY p.id_producto
ORDER BY count(*) DESC;


CREATE OR REPLACE VIEW dinero_total_de_ventas
AS 
SELECT count(subtotal) AS ventas_totales,sum(subtotal) AS dinero_total FROM ventas;


CREATE OR REPLACE VIEW mayor_cantidad_de_producto_en_stock
AS
SELECT p.id_producto,nombre_producto,id_proveedor,cantidad_producto 
FROM almacen a 
JOIN productos p ON p.id_producto = a.id_producto 
ORDER BY cantidad_producto DESC; 


CREATE OR REPLACE VIEW empleado_con_mas_ventas_realizadas
AS 
SELECT v.id_empleado,nombre_empleado,apellido_empleado,count(*) AS cantidad_ventas
 FROM ventas v 
 JOIN empleados e ON e.id_empleado = v.id_empleado 
 GROUP BY v.id_empleado
ORDER BY count(*) DESC;


CREATE OR REPLACE VIEW cliente_con_mas_compras
AS
SELECT c.id_cliente AS ID,nombre_cliente ,apellido_cliente,count(*) AS cantidad_de_compras
FROM facturas f 
JOIN clientes c ON c.id_cliente = f.id_cliente 
GROUP BY f.id_cliente
ORDER BY count(*) DESC;  

CREATE OR REPLACE VIEW Total_productos_en_almacen
AS
SELECT sum(cantidad_producto) AS cantidad_de_productos FROM almacen;
