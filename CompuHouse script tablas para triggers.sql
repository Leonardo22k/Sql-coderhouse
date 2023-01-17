USE CompuHouse;

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