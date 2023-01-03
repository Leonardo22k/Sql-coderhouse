
                           -- CREACIÓN DE USUARIOS CON PRIVILEGIOS -- 

        -- Este usuario solo podra ver las tablas y seleccionarlas -- 
        
CREATE USER 'usuariodeprueba1@coder' IDENTIFIED WITH mysql_native_password BY '12345';
	GRANT SELECT ON *.* TO 'usuariodeprueba1@coder';

        -- Este usuario podra ver las tablas, insertar datos y modificar -- 
        
CREATE USER 'usuariodeprueba2@coder' IDENTIFIED WITH mysql_native_password BY '12345';
	GRANT SELECT, INSERT, UPDATE ON *.* TO 'usuariodeprueba2@coder';
	


 

