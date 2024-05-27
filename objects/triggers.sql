USE utn_proyecto ;

-- TRIGGERS 

-- Trigger para verificar que el estudiante que quiera ingresar mediante un Procedimiento, no esté ya inscripto en el curso que le indico

DELIMITER //

CREATE TRIGGER validar_inscripcion
BEFORE INSERT ON INSCRIPCION
FOR EACH ROW
BEGIN
    DECLARE inscrito_anteriormente INT;
    SELECT COUNT(*) INTO inscrito_anteriormente
    FROM INSCRIPCION
    WHERE ID_ESTUDIANTE = NEW.ID_ESTUDIANTE AND ID_CURSO = NEW.ID_CURSO;
    IF inscrito_anteriormente > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El estudiante ya está inscrito en este curso';
    END IF;
END //

DELIMITER ;


-- Trigger para verificar que al usar el Procedimiento que actualiza la información de los estudiantes, no cargue con un espacio vacio la informacion categorizada como NOT NULL (en caso de error de tipeo)

DELIMITER //

CREATE TRIGGER verificar_campos_not_null_update
BEFORE UPDATE ON ESTUDIANTE
FOR EACH ROW
BEGIN
    IF (NEW.NOMBRE_EST = '' OR NEW.NOMBRE_EST = ' ') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo NOMBRE_EST no puede estar vacío';
    END IF;
    
    IF (NEW.APELLIDO_EST = '' OR NEW.APELLIDO_EST = ' ') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo APELLIDO_EST no puede estar vacío';
    END IF;
    
       IF (NEW.DIRECCION = '' OR NEW.DIRECCION = ' ') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo DIRECCION no puede estar vacío';
    END IF;
    
       IF (NEW.CORREO_EST = '' OR NEW.CORREO_EST = ' ') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo CORREO_EST no puede estar vacío';
    END IF;
    
       IF (NEW.TEL_EST = '' OR NEW.TEL_EST = ' ') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo TEL_EST no puede estar vacío';
    END IF;
END //

DELIMITER ;