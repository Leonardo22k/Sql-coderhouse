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