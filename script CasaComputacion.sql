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
fecha_factura  DATE NOT NULL,
FOREIGN KEY (id_factura)
     REFERENCES facturas(id_factura)
     ON DELETE CASCADE 
     ON UPDATE CASCADE, 
FOREIGN KEY (id_producto)
     REFERENCES productos(id_producto)
	 ON DELETE CASCADE 
     ON UPDATE CASCADE,
FOREIGN KEY (id_cliente)
	 REFERENCES clientes(id_cliente)     
     ON DELETE CASCADE 
     ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS almacen (
id_producto INT NOT NULL,
id_proveedor INT NOT NULL, 
cantidad_producto INT NOT NULL,
drecripcion VARCHAR (200),
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
subtotal FLOAT NOT NULL,
FOREIGN KEY (id_factura)
     REFERENCES facturas(id_factura)
     ON DELETE CASCADE 
     ON UPDATE CASCADE, 
FOREIGN KEY (id_producto)
     REFERENCES productos(id_producto)
	 ON DELETE CASCADE 
     ON UPDATE CASCADE,
FOREIGN KEY (id_empleado)
     REFERENCES empleados(id_empleado)
	 ON DELETE CASCADE 
     ON UPDATE CASCADE    
);

CREATE TABLE IF NOT EXISTS pedido (
id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL, 
id_proveedor INT NOT NULL,
cantidad_pedido INT NOT NULL, 
FOREIGN KEY (id_producto)
     REFERENCES productos(id_producto)
	 ON DELETE CASCADE 
     ON UPDATE CASCADE,
FOREIGN KEY (id_proveedor)
      REFERENCES proveedores(id_proveedor)
	  ON DELETE CASCADE 
      ON UPDATE CASCADE

);


