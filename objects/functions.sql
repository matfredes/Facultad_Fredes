USE utn_proyecto ;
-- FUNCIONES 

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

-- Uso de Functions

SELECT calcular_promedio_nota(1);
SELECT calcular_proporcion_aprobados(70);
