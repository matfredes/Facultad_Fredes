USE utn_proyecto ;

-- DROPEO ROLES Y USUARIOS
DROP ROLE IF EXISTS desarrollador_servicio;
DROP ROLE IF EXISTS desarrollador_asistente;
DROP ROLE IF EXISTS directivos_facultad;

DROP USER IF EXISTS 'reader_1'@'%';
DROP USER IF EXISTS 'reader_2'@'%';
DROP USER IF EXISTS 'reader_3'@'%';
DROP USER IF EXISTS 'dev'@'%';
DROP USER IF EXISTS 'dev_jr'@'%';


-- CREACIÓN NOMBRES ROLES
CREATE ROLE 'desarrollador_servicio', 'desarrollador_asistente', 'directivos_facultad';

-- ACCESOS DE ROLES
GRANT ALL ON utn_proyecto.* TO 'desarrollador_feria';
GRANT SELECT ON utn_proyecto.* TO 'gerencia_feria';
GRANT INSERT, UPDATE, DELETE ON utn_proyecto.* TO 'desarrolladorjr_feria';

-- CREACION USUARIOS Y CONTRASEÑAS
CREATE USER 'reader1'@'%' IDENTIFIED BY 'user1';
CREATE USER 'reader2'@'%' IDENTIFIED BY 'user2';
CREATE USER 'reader3'@'%' IDENTIFIED BY 'user3';
CREATE USER 'dev'@'%' IDENTIFIED BY 'user4';
CREATE USER 'dev_jr'@'%' IDENTIFIED BY 'user5';

-- ASIGNACION DE ROLES
GRANT 'desarrollador_servicio' TO 'dev'@'%';
GRANT 'desarrollador_asistente' TO 'reader1'@'%', 'reader2'@'%', 'reader3'@'%';
GRANT 'directivos_facultad', 'desarrollador_asistente' TO 'dev_jr'@'%';