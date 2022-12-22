DELIMITER $$
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

DELIMITER $$