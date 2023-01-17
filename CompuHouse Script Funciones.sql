
                                    -- **FUNCIONES** -- 
                                    
-- Al poner el id de empleado realiza la suma del total de dinero de las ventas que realizo ese empleado 

DELIMITER $$

CREATE FUNCTION `total_dinero_recaudado_por_empleado`(colocar_id_empleado INT) 
RETURNS varchar(60) 
READS SQL DATA
BEGIN
	DECLARE dinero VARCHAR (60); 
	SET dinero = (SELECT sum(subtotal) FROM ventas where id_empleado = colocar_id_empleado);
	RETURN dinero;
END$$

-- Al poner un id de factura, busca la fecha que se realizo   

CREATE FUNCTION `fecha_factura_por_id`(colocar_id_factura INT) RETURNS varchar(50) 
READS SQL DATA
BEGIN
	DECLARE fecha VARCHAR(50);
	SET fecha = (SELECT fecha_factura FROM facturas WHERE id_factura = colocar_id_factura);
	RETURN fecha;

END$$  

DELIMITER $$
