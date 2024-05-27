USE utn_proyecto;

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
CREATE ROLE desarrollador_servicio, desarrollador_asistente, directivos_facultad;

-- ACCESOS DE ROLES
GRANT ALL PRIVILEGES ON utn_proyecto.* TO desarrollador_servicio;
GRANT SELECT ON utn_proyecto.* TO directivos_facultad;
GRANT INSERT, UPDATE, DELETE ON utn_proyecto.* TO desarrollador_asistente;

-- CREACION USUARIOS Y CONTRASEÑAS
CREATE USER 'reader_1'@'%' IDENTIFIED BY 'user1';
CREATE USER 'reader_2'@'%' IDENTIFIED BY 'user2';
CREATE USER 'reader_3'@'%' IDENTIFIED BY 'user3';
CREATE USER 'dev'@'%' IDENTIFIED BY 'user4';
CREATE USER 'dev_jr'@'%' IDENTIFIED BY 'user5';

-- ASIGNACION DE ROLES
GRANT desarrollador_servicio TO 'dev'@'%';
GRANT directivos_facultad TO 'reader_1'@'%', 'reader_2'@'%', 'reader_3'@'%';
GRANT directivos_facultad, desarrollador_asistente TO 'dev_jr'@'%';


SET DEFAULT ROLE desarrollador_servicio TO 'dev'@'%'; 
SET DEFAULT ROLE directivos_facultad TO 'reader_1'@'%', 'reader_2'@'%', 'reader_3'@'%';
SET DEFAULT ROLE directivos_facultad, desarrollador_asistente TO 'dev_jr'@'%';