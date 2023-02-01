USE CompuHouse;

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
       ('Mariela','Luna','1161143122','Granaderos 5412','MLuna@hotmail.com'),
       ('Pablo','Valor','1152635241','Agustin de Vedia 563','pabloV@gmail.com'),
       ('Marina','Lugones','1158963252','Ambrosetti 200','MarL@gmali.com'),
       ('Angel','Tavolaro','4456384','Anatole France 1652','Tavolaro@gmail.com'),
       ('Lautaro','Grance','42528454','Pedro Leon Gallo 2514','Lauti@hotmail.com'),
       ('Sylvana','Silva','1151269854','Adolfo Berro 546','Silsilva@gmail.com');
       
INSERT INTO proveedores 
(nombre_proveedor,direccion_proveedor,telefono_proveedor)
VALUES ('Mundo Computacion','Av Rivadavia 9800','4625-6584'),
	   ('Diamond System','Av Mayo 500','4628-3561'),
       ('TodoComputacion','jujuy 158','6523-4512'),
       ('SellerCompu','Gral. Alvadrado 443','4862-6584');
       
       
INSERT INTO empleados 
(nombre_empleado,apellido_empleado)
VALUES ('Leonardo','Cantaro'),
       ('Juan','Gomez'),
	   ('German','Rodriguez'),
       ('Gaston','Lopez'),
       ('Gonzalo','Fernandez');


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
       ('Pendrive Multilaser Twist PD588 16GB 2.0 negro y plateado','1399'),
	   ('Cooler Cpu Watercooler Thermaltake Th120 Aio Argb Pcreg','26969'),
       ('Fan Cooler 120 X120 Cm - Rgb Con Conector A Controlador','1945'),
	   ('Disco duro interno Seagate Barracuda ST1000DM010 1TB','10899'),
	   ('Disco sólido interno Kingston SA400S37/240G 240GB negro','7286'),
	   ('Mouse Pad gamer Razer Chroma Goliathus de goma y tela extended 294mm x 920mm x 3mm black','23215');
       
       
INSERT INTO almacen 
(id_producto,id_proveedor,cantidad_producto,descripcion)
VALUES ('1',1,25,'en stock'),
       ('2',1,35,'en stock'),
       ('3',1,22,'en stock'),
       ('4',1,21,'en stock'),
	   ('5',1,28,'en stock'),
       ('6',2,32,'en stock'),
       ('7',2,35,'en stock'),
       ('8',2,39,'en stock'),
       ('9',2,21,'en stock'),
       ('10',2,33,'en stock'),
       ('11',2,38,'en stock'),
       ('12',2,42,'en stock'),
       ('13',2,15,'en stock'),
       ('14',2,56,'en stock'),
       ('15',3,43,'en stock'),
       ('16',3,22,'en stock'),
       ('17',3,64,'en stock'),
       ('18',3,30,'en stock'),
       ('19',3,48,'en stock'),
       ('20',3,39,'en stock'),
       ('21',4,28,'en stock'),
       ('22',4,56,'en stock'),
       ('23',4,44,'en stock'),
       ('24',4,67,'en stock'),
       ('25',4,55,'en stock'),
	   ('26',1,60,'en stock'),
       ('27',1,80,'en stock'),
       ('28',2,50,'en stock'),
       ('29',2,35,'en stock'),
       ('30',3,65,'en stock');
       
       
INSERT INTO ventas
(id_factura,id_producto,id_empleado,cantidad_producto,subtotal)
VALUES ('1','2','3','1',95000),
       ('2','13','4','1',6658),
       ('3','2','5','1','95000'),
       ('4','13','2','1','6658'),
       ('5','2','3','1','95000'),
       ('6','25','5','1','1399'),
       ('7','15','4','1','8949'),
       ('8','2','1','1','95000'),
       ('9','25','1','1','1399'),
       ('10','2','5','1','95000'),
       ('11','16','2','1','7290'),
       ('12','2','3','1','95000'),
       ('13','16','4','1','7290'),
       ('14','25','1','1','1399'),
       ('15','25','3','1','1399'),
       ('16','28','3','1','10899'),
       ('17','29','5','1','7286'),
       ('18','30','1','1','23215'),
       ('19','30','2','1','23215'),
       ('20','27','3','1','1945'),
       ('21','2','6','1','95000'),
       ('22','2','1','1','95000'),
       ('23','2','6','1','95000'),
       ('24','25','2','1','1399'),
       ('25','25','3','1','1399'),
       ('26','25','6','1','1399'),
       ('27','13','4','1','6658'),
       ('28','13','5','1','6658'),
       ('29','13','2','1','6658'),
       ('30','16','3','1','7290'),
       ('31','16','4','1','7290'),
       ('32','16','6','1','7290'),
       ('33','30','1','1','23215'),
       ('34','30','2','1','23215'),
       ('35','15','1','1','8949'),
       ('36','15','3','1','8949'),
       ('37','28','4','1','10899');
    
       
       
INSERT INTO facturas 
(id_producto,id_cliente,total_factura,fecha_factura)
VALUES ('2','3',95000,'2022-11-28'),
       ('12','15',6658,'2022-12-01'),
       ('2','4','95000','2022-12-01'),
       ('13','5','6658','2022-12-02'),
       ('2','8','95000','2022-12-02'),
       ('25','14','2798','2022-12-03'),
       ('15','11','8949','2022-12-03'),
       ('2','1','95000','2022-12-03'),
       ('25','5','2798','2022-12-03'),
       ('2','9','95000','2022-12-04'),
       ('16','12','7290','2022-12-04'),
       ('2','15','95000','2022-12-04'),
       ('16','9','7290','2022-12-05'),
       ('25','4','4197','2022-12-06'),
       ('25','3','4197','2022-12-06'),
       ('28','5','10899','2022-12-07'),
       ('29','7','7286','2022-12-09'),
       ('30','10','23215','2022-12-09'),
       ('30','2','23215','2022-12-09'),
       ('27','9','1945','2022-12-10'),
       ('2','20','95000','2022-12-10'),
       ('2','18','95000','2022-12-10'),
       ('2','17','95000','2022-12-10'),
       ('25','15','2798','2022-12-12'),
       ('25','13','2798','2022-12-13'),
       ('25','10','2798','2022-12-13'),
       ('13','8','6658','2022-12-13'),
       ('13','6','6658','2022-12-14'),
       ('13','4','6658','2022-12-14'),
       ('16','2','7290','2022-12-14'),
       ('16','1','7290','2022-12-15'),
       ('16','16','7290','2022-12-16'),
       ('30','14','23215','2022-12-16'),
       ('30','12','23215','2022-12-17'),
       ('15','11','8949','2022-12-17'),
       ('15','9','8949','2022-12-18'),
       ('28','6','10899','2022-12-18');
     
      
INSERT INTO pedido 
(id_producto,id_proveedor,cantidad_pedido,precio_por_unidad,subtotal)
VALUES('9','2','15','11250','168750'),
      ('23','4','20','62523','1250460'),
      ('25','4','50','26362','1318100'),
	  ('29','2','20','21235','424700'),
      ('28','2','15','5682','85230'),
	  ('5','1','20','90365','1807300'),
	  ('8','2','15','9635','144525'),
	  ('15','4','20','5802','116040'),
      ('20','3','10','16500','165000');
 
 INSERT INTO repartidor
 (nombre_repartidor,telefono_repartidor)
 VALUES('Adreani','0800-122-1112'),
	   ('Correo Argentino','4625-0988'),
       ('rapiboy','+5493413580076');
 

INSERT INTO envio 
(id_repartidor,id_cliente,id_producto,cantidad_de_productos,nombre_cliente,apellido_cliente,direccion_cliente,localidad_cliente,codigo_postal,telefono_cliente)
VALUES('1','2','2','2','Fabricio','Galizia','av,jujuy 580','Lujan','6700','4235-4586'),     
      ('1','5','5','1','Juan','Abadia','Castelli 1524','Merlo','1718','Castelli 1524'),    
      ('2','8','20','3','Adrian','Marcheti','Necochea 3526','Paso Del Rey','1603','4256-5847'),    
      ('3','1','25','2','German','Freigedo','Siempre viva 742','Merlo','1747','4521-3528'),    
      ('2','2','1','1','Fabricio','Galizia','av,jujuy 580','Lujan','6700','4235-4586'),    
      ('2','12','15','2','Carlos','Cuglari','Alvear 1235','La Tablada','1751','5623-6545'),    
      ('1','8','23','3','Adrian','Marcheti','Necochea 3526','Paso Del Reys','1603','4256-5847'),    
      ('2','7','5','4','Cristian','Velazco','Sulipacha 1485','Lomas Del Mirador','1751','1152682365'),    
      ('3','2','8','2','Fabricio','Galizia','av,jujuy 580','Lujan','6700','4235-4586'),    
      ('2','10','9','4','Emliano','Peralta','Tacuari 4652','San Justo','1754','5268-6234');   
      

    