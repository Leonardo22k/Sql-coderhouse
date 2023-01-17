
                             
                             -- TCL (Lenguaje de control de transacciones) -- 

START TRANSACTION; 

DELETE  FROM clientes WHERE id_cliente = 1;
DELETE  FROM clientes WHERE id_cliente = 2;
DELETE  FROM clientes WHERE id_cliente = 3;
DELETE  FROM clientes WHERE id_cliente = 4;
DELETE  FROM clientes WHERE id_cliente = 5;

ROLLBACK; -- Sentencia para realizar el rollback de los registros eliminados
COMMIT; -- Sentencia para aceptar los cambios realizados

SELECT * FROM clientes; -- Para ver la tabla que se esta usando


START TRANSACTION;

INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba1','1253');
INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba2','1234');
INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba3','1245');
INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba4','3251');

SAVEPOINT parte1;

INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba5','4321');
INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba6','5421');
INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba7','2563');
INSERT INTO productos(nombre_producto,precio_producto)VALUES('productoprueba8','1526');

RELEASE SAVEPOINT parte1; -- Como el desafio indica agregar la sentencia de eliminacion del savepoint 

SELECT * FROM productos; --  Para ver la tabla que se esta usando

 