/* CREACIÓN DE DATOS */

DROP DATABASE IF EXISTS utn_proyecto;
CREATE DATABASE utn_proyecto ;

USE utn_proyecto ;

/* CREACIÓN DE TABLAS */

CREATE TABLE ESTUDIANTE(
ID_ESTUDIANTE INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE_EST VARCHAR(100) NOT NULL,
APELLIDO_EST VARCHAR(100) NOT NULL,
FECHA_NAC DATE NOT NULL,
GENERO VARCHAR(1),
DIRECCION VARCHAR(100),
CORREO_EST VARCHAR(100) UNIQUE NOT NULL,
TEL_EST VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE CURSO(
ID_CURSO INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE_CUR VARCHAR(100) NOT NULL,
DESCRIPCION VARCHAR(300),
NIVEL VARCHAR(1) NOT NULL,
DURACION INT NOT NULL
);

CREATE TABLE INSCRIPCION(
ID_INSCRIPCION INT PRIMARY KEY AUTO_INCREMENT,
ID_ESTUDIANTE INT NOT NULL,
ID_CURSO INT NOT NULL,
FECHA_INS DATE NOT NULL,
ESTADO VARCHAR(1) NOT NULL
);

CREATE TABLE NOTA(
ID_NOTA INT PRIMARY KEY AUTO_INCREMENT,
ID_ESTUDIANTE INT NOT NULL,
ID_CURSO INT NOT NULL,
NOTA INT NOT NULL,
FECHA_EV DATE NOT NULL
);

CREATE TABLE PROFESOR(
ID_PROF INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE_PROF VARCHAR(100) NOT NULL,
ESPECIALIDAD VARCHAR(100) NOT NULL,
CORREO_PROF VARCHAR(100) UNIQUE NOT NULL,
TEL_PROF VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE ASIGN_PROF(
ID_ASIGNACION INT PRIMARY KEY AUTO_INCREMENT,
ID_CURSO INT NOT NULL,
ID_PROF INT NOT NULL,
HORARIO INT NOT NULL,
AULA_ASIGN INT NOT NULL
);


/* CREACION DE LAS FOREIGN KEY */

-- ESTUDIANTES

ALTER TABLE INSCRIPCION
ADD CONSTRAINT FK_INSCR_EST 
FOREIGN KEY (ID_ESTUDIANTE) REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE INSCRIPCION
ADD CONSTRAINT FK_INSCR_CUR 
FOREIGN KEY (ID_CURSO) REFERENCES CURSO (ID_CURSO);

-- NOTAS

ALTER TABLE NOTA
ADD CONSTRAINT FK_NOT_EST 
FOREIGN KEY (ID_ESTUDIANTE) REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE NOTA
ADD CONSTRAINT FK_NOT_CUR 
FOREIGN KEY (ID_CURSO) REFERENCES CURSO (ID_CURSO);

-- ASIGNACIÓN DE PROFES

ALTER TABLE ASIGN_PROF
ADD CONSTRAINT FK_ASIGN_CUR
FOREIGN KEY (ID_CURSO) REFERENCES CURSO (ID_CURSO);

ALTER TABLE ASIGN_PROF
ADD CONSTRAINT FK_ASIGN_PROF 
FOREIGN KEY (ID_PROF) REFERENCES PROFESOR (ID_PROF);

-----------------

/* VIEWS */

-- Inscripciones aprobadas

CREATE VIEW vw_inscrp_aprob AS SELECT * FROM utn_proyecto.inscripcion WHERE ESTADO = "C";

SELECT * FROM vw_inscrp_aprob;

-- Cantidad de estudiantes por curso

CREATE VIEW vw_est_cur AS
SELECT 
    C.NOMBRE_CUR AS Materia,
    COUNT(I.ID_ESTUDIANTE) AS Cant_Est
FROM inscripcion I
JOIN curso C ON I.ID_CURSO = C.ID_CURSO
GROUP BY C.NOMBRE_CUR;


SELECT * FROM vw_est_cur;

-- Lista de Aprobados

CREATE OR REPLACE VIEW vw_est_aprob AS SELECT ID_ESTUDIANTE,ID_CURSO,NOTA FROM utn_proyecto.nota WHERE NOTA > 6;

SELECT * FROM vw_est_aprob;

-- Cantidad de Inscriptos por fecha (inicio de cuatrimestre)

CREATE VIEW vw_ins_fecha AS
SELECT 
    FECHA_INS,
    COUNT(ID_INSCRIPCION) AS Cantidad_Inscripciones
FROM inscripcion
GROUP BY FECHA_INS
ORDER BY FECHA_INS DESC;

SELECT * FROM vw_ins_fecha;

-- Top 5 de los estudiantes con mejor promedio

CREATE VIEW vw_top_est AS
SELECT 
    E.ID_ESTUDIANTE,
    CONCAT(E.NOMBRE_EST, ' ', E.APELLIDO_EST) AS Nombre_Apellido,
    AVG(N.NOTA) AS Promedio
FROM estudiante E
JOIN NOTA N ON E.ID_ESTUDIANTE = N.ID_ESTUDIANTE
GROUP BY E.ID_ESTUDIANTE
ORDER BY Promedio DESC
LIMIT 5;

SELECT * FROM vw_top_est;

/* FUNCIONES */

-- Funcion para calcular el promedio de notas de un estudiante ingresado 

DELIMITER //

CREATE FUNCTION calcular_promedio_nota(
    estudiante_id INT
)
RETURNS DECIMAL(5,2)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(5,2);
    SELECT AVG(NOTA) INTO promedio
    FROM NOTA
    WHERE ID_ESTUDIANTE = estudiante_id;
    RETURN promedio;
END //

DELIMITER ;

SELECT calcular_promedio_nota(1);

-- Funcion para mostrar materias aprobadas sobre materias rendidas de un estudiante ingresado

DELIMITER //

CREATE FUNCTION calcular_proporcion_aprobados(
    estudiante_id INT
)
RETURNS VARCHAR(10)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_cursos INT;
    DECLARE cursos_aprobados INT;
    DECLARE proporcion VARCHAR(10);
    SELECT COUNT(*) INTO total_cursos
    FROM INSCRIPCION
    WHERE ID_ESTUDIANTE = estudiante_id;
    SELECT COUNT(*) INTO cursos_aprobados
    FROM NOTA
    WHERE ID_ESTUDIANTE = estudiante_id AND NOTA >= 7;
    SET proporcion = CONCAT(cursos_aprobados, '/', total_cursos);
    
    RETURN proporcion;
END //

DELIMITER ;

SELECT calcular_proporcion_aprobados(70);

/* PROCEDURES */

-- Procedimiento para inscribir un estudiante a un curso (asistido por trigger para evitar repeticiones)

DELIMITER //
CREATE PROCEDURE registrar_inscripcion(
    IN estudiante_id INT,
    IN curso_id INT
)
BEGIN
    INSERT INTO INSCRIPCION (ID_ESTUDIANTE, ID_CURSO, FECHA_INS, ESTADO)
    VALUES (estudiante_id, curso_id, CURDATE(), 'P');
END //

DELIMITER ;

CALL registrar_inscripcion(1,2);

-- Procedimiento para actualizar la información personal de un estudiante en la tabla "estudiante"

DELIMITER //
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

DELIMITER ;


CALL actualizar_informacion_estudiante(1,"Matias","Fredes","1200Yerbal","matfredes@gmail.com","1145662315");

/* TRIGGERS */

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
