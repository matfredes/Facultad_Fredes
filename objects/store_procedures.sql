USE utn_proyecto;
-- PROCEDURES 

-- Procedimiento para inscribir un estudiante a un curso (asistido por trigger para evitar repeticiones)

delimiter //
CREATE PROCEDURE registrar_inscripcion(
    IN estudiante_id INT
   ,IN curso_id INT)
BEGIN
    INSERT INTO INSCRIPCION (ID_ESTUDIANTE, ID_CURSO, FECHA_INS, ESTADO)
    VALUES (estudiante_id, curso_id, CURDATE(), 'P');
END //

delimiter ;


-- Procedimiento para actualizar la información personal de un estudiante en la tabla "estudiante"

delimiter //
CREATE PROCEDURE actualizar_informacion_estudiante(
    IN estudiante_id INT,
    IN nuevo_nombre VARCHAR(100),
    IN nuevo_apellido VARCHAR(100),
    IN nueva_direccion VARCHAR(100),
    IN nuevo_correo VARCHAR(100),
    IN nuevo_telefono VARCHAR(20)
)
BEGIN
    UPDATE ESTUDIANTE
    SET NOMBRE_EST = nuevo_nombre,
        APELLIDO_EST = nuevo_apellido,
        DIRECCION = nueva_direccion,
        CORREO_EST = nuevo_correo,
        TEL_EST = nuevo_telefono
    WHERE ID_ESTUDIANTE = estudiante_id;
END //

delimiter ;

-- Uso de Stored Procedures

CALL registrar_inscripcion(1,2);
CALL actualizar_informacion_estudiante(1,"Matias","Fredes","1200Yerbal","matfredes@gmail.com","1145662315");
