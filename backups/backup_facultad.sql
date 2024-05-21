-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: utn_proyecto
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asign_prof`
--

DROP TABLE IF EXISTS `asign_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asign_prof` (
  `ID_ASIGNACION` int NOT NULL AUTO_INCREMENT,
  `ID_CURSO` int NOT NULL,
  `ID_PROF` int NOT NULL,
  `HORARIO` int NOT NULL,
  `AULA_ASIGN` int NOT NULL,
  PRIMARY KEY (`ID_ASIGNACION`),
  KEY `FK_ASIGN_CUR` (`ID_CURSO`),
  KEY `FK_ASIGN_PROF` (`ID_PROF`),
  CONSTRAINT `FK_ASIGN_CUR` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`),
  CONSTRAINT `FK_ASIGN_PROF` FOREIGN KEY (`ID_PROF`) REFERENCES `profesor` (`ID_PROF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asign_prof`
--

LOCK TABLES `asign_prof` WRITE;
/*!40000 ALTER TABLE `asign_prof` DISABLE KEYS */;
/*!40000 ALTER TABLE `asign_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `ID_CURSO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_CUR` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(300) DEFAULT NULL,
  `NIVEL` varchar(1) NOT NULL,
  `DURACION` int NOT NULL,
  PRIMARY KEY (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `ID_ESTUDIANTE` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_EST` varchar(100) NOT NULL,
  `APELLIDO_EST` varchar(100) NOT NULL,
  `FECHA_NAC` date NOT NULL,
  `GENERO` varchar(1) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `CORREO_EST` varchar(100) NOT NULL,
  `TEL_EST` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_ESTUDIANTE`),
  UNIQUE KEY `CORREO_EST` (`CORREO_EST`),
  UNIQUE KEY `TEL_EST` (`TEL_EST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verificar_campos_not_null_update` BEFORE UPDATE ON `estudiante` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion` (
  `ID_INSCRIPCION` int NOT NULL AUTO_INCREMENT,
  `ID_ESTUDIANTE` int NOT NULL,
  `ID_CURSO` int NOT NULL,
  `FECHA_INS` date NOT NULL,
  `ESTADO` varchar(1) NOT NULL,
  PRIMARY KEY (`ID_INSCRIPCION`),
  KEY `FK_INSCR_EST` (`ID_ESTUDIANTE`),
  KEY `FK_INSCR_CUR` (`ID_CURSO`),
  CONSTRAINT `FK_INSCR_CUR` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`),
  CONSTRAINT `FK_INSCR_EST` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `estudiante` (`ID_ESTUDIANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_inscripcion` BEFORE INSERT ON `inscripcion` FOR EACH ROW BEGIN
    DECLARE inscrito_anteriormente INT;
    SELECT COUNT(*) INTO inscrito_anteriormente
    FROM INSCRIPCION
    WHERE ID_ESTUDIANTE = NEW.ID_ESTUDIANTE AND ID_CURSO = NEW.ID_CURSO;
    IF inscrito_anteriormente > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El estudiante ya está inscrito en este curso';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota` (
  `ID_NOTA` int NOT NULL AUTO_INCREMENT,
  `ID_ESTUDIANTE` int NOT NULL,
  `ID_CURSO` int NOT NULL,
  `NOTA` int NOT NULL,
  `FECHA_EV` date NOT NULL,
  PRIMARY KEY (`ID_NOTA`),
  KEY `FK_NOT_EST` (`ID_ESTUDIANTE`),
  KEY `FK_NOT_CUR` (`ID_CURSO`),
  CONSTRAINT `FK_NOT_CUR` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`),
  CONSTRAINT `FK_NOT_EST` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `estudiante` (`ID_ESTUDIANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `ID_PROF` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_PROF` varchar(100) NOT NULL,
  `ESPECIALIDAD` varchar(100) NOT NULL,
  `CORREO_PROF` varchar(100) NOT NULL,
  `TEL_PROF` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_PROF`),
  UNIQUE KEY `CORREO_PROF` (`CORREO_PROF`),
  UNIQUE KEY `TEL_PROF` (`TEL_PROF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_est_aprob`
--

DROP TABLE IF EXISTS `vw_est_aprob`;
/*!50001 DROP VIEW IF EXISTS `vw_est_aprob`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_est_aprob` AS SELECT 
 1 AS `ID_ESTUDIANTE`,
 1 AS `ID_CURSO`,
 1 AS `NOTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_est_cur`
--

DROP TABLE IF EXISTS `vw_est_cur`;
/*!50001 DROP VIEW IF EXISTS `vw_est_cur`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_est_cur` AS SELECT 
 1 AS `Materia`,
 1 AS `Cant_Est`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ins_fecha`
--

DROP TABLE IF EXISTS `vw_ins_fecha`;
/*!50001 DROP VIEW IF EXISTS `vw_ins_fecha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ins_fecha` AS SELECT 
 1 AS `FECHA_INS`,
 1 AS `Cantidad_Inscripciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_inscrp_aprob`
--

DROP TABLE IF EXISTS `vw_inscrp_aprob`;
/*!50001 DROP VIEW IF EXISTS `vw_inscrp_aprob`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inscrp_aprob` AS SELECT 
 1 AS `ID_INSCRIPCION`,
 1 AS `ID_ESTUDIANTE`,
 1 AS `ID_CURSO`,
 1 AS `FECHA_INS`,
 1 AS `ESTADO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top_est`
--

DROP TABLE IF EXISTS `vw_top_est`;
/*!50001 DROP VIEW IF EXISTS `vw_top_est`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top_est` AS SELECT 
 1 AS `ID_ESTUDIANTE`,
 1 AS `Nombre_Apellido`,
 1 AS `Promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'utn_proyecto'
--

--
-- Dumping routines for database 'utn_proyecto'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_promedio_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_promedio_nota`(
    estudiante_id INT
) RETURNS decimal(5,2)
    READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(5,2);
    SELECT AVG(NOTA) INTO promedio
    FROM NOTA
    WHERE ID_ESTUDIANTE = estudiante_id;
    RETURN promedio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_proporcion_aprobados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_proporcion_aprobados`(
    estudiante_id INT
) RETURNS varchar(10) CHARSET utf8mb4
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_informacion_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_informacion_estudiante`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_inscripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_inscripcion`(
    IN estudiante_id INT,
    IN curso_id INT
)
BEGIN
    INSERT INTO INSCRIPCION (ID_ESTUDIANTE, ID_CURSO, FECHA_INS, ESTADO)
    VALUES (estudiante_id, curso_id, CURDATE(), 'P');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_est_aprob`
--

/*!50001 DROP VIEW IF EXISTS `vw_est_aprob`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_est_aprob` AS select `nota`.`ID_ESTUDIANTE` AS `ID_ESTUDIANTE`,`nota`.`ID_CURSO` AS `ID_CURSO`,`nota`.`NOTA` AS `NOTA` from `nota` where (`nota`.`NOTA` > 6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_est_cur`
--

/*!50001 DROP VIEW IF EXISTS `vw_est_cur`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_est_cur` AS select `c`.`NOMBRE_CUR` AS `Materia`,count(`i`.`ID_ESTUDIANTE`) AS `Cant_Est` from (`inscripcion` `i` join `curso` `c` on((`i`.`ID_CURSO` = `c`.`ID_CURSO`))) group by `c`.`NOMBRE_CUR` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ins_fecha`
--

/*!50001 DROP VIEW IF EXISTS `vw_ins_fecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ins_fecha` AS select `inscripcion`.`FECHA_INS` AS `FECHA_INS`,count(`inscripcion`.`ID_INSCRIPCION`) AS `Cantidad_Inscripciones` from `inscripcion` group by `inscripcion`.`FECHA_INS` order by `inscripcion`.`FECHA_INS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_inscrp_aprob`
--

/*!50001 DROP VIEW IF EXISTS `vw_inscrp_aprob`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inscrp_aprob` AS select `inscripcion`.`ID_INSCRIPCION` AS `ID_INSCRIPCION`,`inscripcion`.`ID_ESTUDIANTE` AS `ID_ESTUDIANTE`,`inscripcion`.`ID_CURSO` AS `ID_CURSO`,`inscripcion`.`FECHA_INS` AS `FECHA_INS`,`inscripcion`.`ESTADO` AS `ESTADO` from `inscripcion` where (`inscripcion`.`ESTADO` = 'C') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top_est`
--

/*!50001 DROP VIEW IF EXISTS `vw_top_est`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top_est` AS select `e`.`ID_ESTUDIANTE` AS `ID_ESTUDIANTE`,concat(`e`.`NOMBRE_EST`,' ',`e`.`APELLIDO_EST`) AS `Nombre_Apellido`,avg(`n`.`NOTA`) AS `Promedio` from (`estudiante` `e` join `nota` `n` on((`e`.`ID_ESTUDIANTE` = `n`.`ID_ESTUDIANTE`))) group by `e`.`ID_ESTUDIANTE` order by `Promedio` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 18:44:02
