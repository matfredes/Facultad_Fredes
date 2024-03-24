-- CREACIÓN DE DATOS

DROP DATABASE IF EXISTS utn_proyecto;
CREATE DATABASE utn_proyecto ;

USE utn_proyecto ;

-- CREACIÓN DE TABLAS

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

-- CREACION DE LAS FOREIGN KEY

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

SELECT 
	*
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema = "utn_proyecto";