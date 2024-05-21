USE utn_proyecto ;


/* VIEWS */

-- Inscripciones aprobadas

CREATE VIEW vw_inscrp_aprob AS  
    SELECT * FROM utn_proyecto.INSCRIPCION WHERE ESTADO = "C"
;


-- Cantidad de estudiantes por curso

CREATE VIEW vw_est_cur AS
SELECT 
    C.NOMBRE_CUR AS Materia,
    COUNT(I.ID_ESTUDIANTE) AS Cant_Est
FROM INSCRIPCION I
JOIN CURSO C ON I.ID_CURSO = C.ID_CURSO
GROUP BY C.NOMBRE_CUR;
USE utn_proyecto ;
-- Lista de Aprobados

CREATE OR REPLACE VIEW vw_est_aprob AS SELECT ID_ESTUDIANTE,ID_CURSO,NOTA FROM utn_proyecto.NOTA WHERE NOTA > 6;


-- Cantidad de Inscriptos por fecha (inicio de cuatrimestre)

CREATE VIEW vw_ins_fecha AS
SELECT 
    FECHA_INS,
    COUNT(ID_INSCRIPCION) AS Cantidad_Inscripciones
FROM INSCRIPCION
GROUP BY FECHA_INS
ORDER BY FECHA_INS DESC;


-- Top 5 de los estudiantes con mejor promedio

CREATE VIEW vw_top_est AS
SELECT 
    E.ID_ESTUDIANTE,
    CONCAT(E.NOMBRE_EST, ' ', E.APELLIDO_EST) AS Nombre_Apellido,
    AVG(N.NOTA) AS Promedio
FROM ESTUDIANTE E
JOIN NOTA N ON E.ID_ESTUDIANTE = N.ID_ESTUDIANTE
GROUP BY E.ID_ESTUDIANTE
ORDER BY Promedio DESC
LIMIT 5;

-- Uso de Views

SELECT * FROM vw_inscrp_aprob;
SELECT * FROM vw_est_cur;
SELECT * FROM vw_est_aprob;
SELECT * FROM vw_ins_fecha;
SELECT * FROM vw_top_est;
