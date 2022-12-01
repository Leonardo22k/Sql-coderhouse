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


INSERT INTO clientes
(nombre_cliente,apellido_cliente,telefono_cliente,direccion_cliente,email_cliente)
VALUES ('German' ,'Freigedo','4521-3528','Siempre viva 742','chueko@gmail.com'),
	   ('Fabricio','Galizia','4235-4586','av,jujuy 580','fabry@gmail.com'),
	   ('Daiana','Patao','1165288563','Tokio 2233','Day22@hotmail.com'),
       ('Pablo','Segundo','1152364587','Espora 2685','pablo2@gmail.com'),
       ('Juan','Abadia','4523-6584','Castelli 1524','JAbadia@gmail.com'),
       ('Noelia','Alderete','6526-4524','Chacabuco 2584','NoeAld@hotmail.com'),
       ('Cristian','Velazco','1152682365','Sulipacha 1485','Cvelazco@gmail.com'),
       ('Adrian','Marcheti','4256-5847','Necochea 3526','AdrianM@hotmail.com'),
       ('Pedro','Ramos','1168963215','Saavedra 1485','PedroCH@gmail.com'),
       ('Emliano','Peralta','5268-6234','Tacuari 4652','EPeralta@gmail.com'),
       ('Lorenzo','Lamas','1122569632','Magallanes 2368','LorenzoLamas@hotmail.com'),
       ('Carlos','Cugliari','5623-6545','Alvear 1235','Cugliari22@gmail.com'),
       ('Lautaro','Grance','4422-6352','Rondeau 5423','LGrance@gmail.com'),
       ('Mayra','battaglia','1152623652','Camacua 2658','MayBat@gmail.com'),
       ('Mariela','Luna','1161143122','Granaderos 5412','MLuna@hotmail.com');
       
       
CREATE TABLE IF NOT EXISTS productos (

id_producto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR (120) NOT NULL, 
precio_producto FLOAT NOT NULL 
);


 INSERT INTO productos
(nombre_producto,precio_producto)
VALUES ('Placa de video AMD PowerColor Fighter Radeon 6600 Series RX 6600 AXRX 6600 8GBD6-3DH 8GB','95000'),
	   ('Placa de video AMD Gigabyte Gaming Radeon RX 5700 Series RX 5700 XT GV-R57XTGAMING OC-8GD (REV 1.0) OC Edition 8GB','170000'),
	   ('Placa De Video Powercolor Rx 6600 Fighter 8g Ddr6 Oem','130990'),
	   ('Placa De Video Nvidia Evga Xc Gaming Geforce Rtx 20 Series Rtx 2060 Black Edition 12gb','175054'),
	   ('Placa De Video Nvidia Zotac Twin Fan Geforce Rtx 20 Series Geforce Rtx 2060 Twin Fan 12gb','93999'),
	   ('Memoria RAM Fury Beast DDR4 RGB gamer color negro 16GB 1 Kingston KF432C16BBA/16','22470'),
	   ('Memoria RAM Fury Beast DDR4 gamer color negro 8GB 1 Kingston KF432C16BB/8','11999'),
	   ('Memoria Ram Udimm Xpg Ddr5 Lancer 16gb 5200 Rbg','34999'),
	   ('Memoria Ram Pc Adata Premier Ddr5 8gb 4800 Mhz U-dimm','12439'),
	   ('Monitor Asus Rog Strix 27 4k Hdr 400 Gaming Xg27uqr G-sync','656700'),
	   ('Monitor gamer Gigabyte G24F LCD 23.8" negro 100V/240V','117.463'),
	   ('Monitor gamer Samsung F24T35 led 24" azul y gris oscuro 100V/240V','53999'),
	   ('Teclado Gaming Cynosa Lite Essential Razer Rz03-02741600','6.659'),
	   ('Teclado gamer Redragon Kumara K552 QWERTY Outemu Blue español latinoamérica color negro con luz roja','12190'),
	   ('Mouse de juego Razer DeathAdder Essential negro','8949'),
	   ('Mouse de juego Redragon Cobra Chroma M711 negro','7290'),
	   ('Mother Asus H310m-e R2.0 1151 Intel 8va 9na Placa Madre','11700'),
	   ('Motherboard Amd Gigabyte Ga-b450m Ds3h V2 Am4 B450','20990'),
	   ('Motherboard B660m Aorus Pro Ddr4 Gigabyte Intel S1700','57999'),
	   ('Motherboard Asus Prime A320m-k Am4 Ddr4 Usb 3.0 Hdmi A320','14999'),
	   ('Gabinete Gamer Atx Xigmatek Duke X3 Fan Led Vidrio Templado','17998'),
       ('Gabinete Sentey J20 -led Azul Vidrio Templado','20654'),
       ('Auriculares Razer Kaira X For Xbox Pc Multiplataforma 3.5 F','24999'),
       ('Razer Barracuda Auricular Gamer Wireless 2.4ghz Y Bluetooth','64636'),
       ('Pendrive Multilaser Twist PD588 16GB 2.0 negro y plateado','1399');



CREATE TABLE IF NOT EXISTS proveedores (
id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY, 
nombre_proveedor  VARCHAR (30) NOT NULL,
direccion_proveedor  VARCHAR (80),
telefono_proveedor  VARCHAR (30)
);


INSERT INTO proveedores 
(nombre_proveedor,direccion_proveedor,telefono_proveedor)
VALUES ('Mundo Computacion','Av Rivadavia 9800','4625-6584'),
	   ('Diamond System','Av Mayo 500','4628-3561'),
       ('TodoComputacion','jujuy 158','6523-4512'),
       ('SellerCompu','Gral. Alvadrado 443','4862-6584');


CREATE TABLE IF NOT EXISTS facturas (
id_factura INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL,
id_cliente INT NOT NULL,
total_factura FLOAT NOT NULL, 
fecha_factura  DATE NOT NULL

);


INSERT INTO facturas 
(id_producto,id_cliente,total_factura,fecha_factura)
VALUES ('2','3',95002,'2022-11-28'),
       ('12','15',6657,'2022-12-01');
       
       
CREATE TABLE IF NOT EXISTS almacen (
id_producto INT NOT NULL AUTO_INCREMENT,
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


INSERT INTO almacen 
(id_proveedor,cantidad_producto,descripcion)
VALUES (1,20,'en stock'),
       (1,20,'en stock'),
       (1,20,'en stock'),
       (1,20,'en stock'),
	   (1,20,'en stock'),
       (2,30,'en stock'),
       (2,30,'en stock'),
       (2,30,'en stock'),
       (2,30,'en stock'),
       (2,30,'en stock'),
       (2,40,'en stock'),
       (2,35,'en stock'),
       (2,12,'en stock'),
       (2,56,'en stock'),
       (3,40,'en stock'),
       (3,25,'en stock'),
       (3,60,'en stock'),
       (3,30,'en stock'),
       (3,40,'en stock'),
       (3,30,'en stock'),
       (4,20,'en stock'),
       (4,50,'en stock'),
       (4,40,'en stock'),
       (4,60,'en stock'),
       (4,55,'en stock');


CREATE TABLE IF NOT EXISTS empleados(
id_empleado INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre_empleado VARCHAR (30) NOT NULL,
apellido_empleado VARCHAR (30) NOT NULL
);


INSERT INTO empleados 
(nombre_empleado,apellido_empleado)
VALUES ('Leonardo','Cantaro'),
       ('Juan','Gomez'),
	   ('German','Rodriguez'),
       ('Gaston','Lopez'),
       ('Gonzalo','Fernandez');
       
       
CREATE TABLE IF NOT EXISTS ventas (
id_venta INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
id_factura INT NOT NULL,
id_producto INT NOT NULL,
id_empleado INT NOT NULL,
cantidad_producto INT NOT NULL,
subtotal FLOAT NOT NULL

);


INSERT INTO ventas
(id_factura,id_producto,id_empleado,cantidad_producto,subtotal)
VALUES ('1','2','3','1',95001),
       ('2','13','4','1',6658);
       
       
CREATE TABLE IF NOT EXISTS pedido (
id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL, 
id_proveedor INT NOT NULL,
cantidad_pedido INT NOT NULL

);

INSERT INTO pedido 
(id_producto,id_proveedor,cantidad_pedido)
VALUES('9','2','15'),
      ('23','4','20'),
      ('25','4','50');
      
