
                                    -- **STORED PROCEDURE** --
                                    
 -- Como menciona el ejercicio a realizar, en el primer campo se ingresa el nombre de la columna de clientes y en el segundo en el orden que se desea asc o desc
 
 DELIMITER $$
 
CREATE PROCEDURE  `clientes_por_orden`(IN seleccionar_fila_de_1_a_6 char(1),IN seleccionar_orden_ASC_o_DESC char(4))
BEGIN
    IF seleccionar_fila_de_1_a_6 <> '' THEN
        IF seleccionar_orden_ASC_o_DESC = 'asc'        THEN   SET @column_name = CONCAT('ORDER BY',' ',seleccionar_fila_de_1_a_6,' ','ASC');                  
        ELSEIF seleccionar_orden_ASC_o_DESC = 'desc'    THEN    SET @column_name = CONCAT('ORDER BY',' ',seleccionar_fila_de_1_a_6,' ','DESC');
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

DELIMITER $$