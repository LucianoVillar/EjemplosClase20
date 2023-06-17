SELECT * FROM usuario;
SELECT @@autocommit;
#Para trabajar con transacciones, debemos desactivar esta variable, por eso la igualamos a 0
set @@autocommit = 0;
SELECT @@autocommit;

#transaccion para modificar el valor direccion de la tabla usuario
START transaction;
UPDATE usuario
SET 
	direccion = 'Calle secundaria 123'
where 
	id_usuario = 6;
SELECT * FROM usuario;
#Para volver al paso anterior, ejecutamos la siguiente sentencia
rollback;
SELECT * FROM usuario;

#TRANSACCION PARA INSERTAR NUEVO VALOR, EJECUTANDO LA SENTENCIA COMMIT PARA CONFIRMAR
START TRANSACTION;
INSERT INTO usuario (id_usuario, nombre, documento, birthdate, id_pais, direccion, mail, telefono) VALUES (4,'Cristina',28689544,'1969-08-15',1,'Zapican 435','crislescanocaceres@hotmail.com',098983468);
select * FROM usuario;
#Para que quede confirmado debemos ejecutar el siguiente comando
commit;

#Para definir un savepoint, utilizar la sentencia
savepoint ejemplo;

#PARA ELIMINAR UN SAVEPOINT UTILIZAMOS LA SIGUIENTE SENTENCIA
release savepoint ejemplo;


