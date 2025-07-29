-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tienda_software
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `cargo` enum('desarrollador','diseñador','tester','gerente') DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'lucía ramírez','lucia.ramirez@empresa.com','desarrollador'),(2,'carlos pérez','carlos.perez@empresa.com','diseñador'),(3,'andrea suárez','andrea.suarez@empresa.com','tester'),(4,'juan torres','juan.torres@empresa.com','gerente'),(5,'lucía ramírez','lucia.ramirez@empresa.com','desarrollador'),(6,'carlos pérez','carlos.perez@empresa.com','diseñador'),(7,'andrea suárez','andrea.suarez@empresa.com','tester'),(8,'juan torres','juan.torres@empresa.com','gerente'),(9,'lucía ramírez','lucia.ramirez@empresa.com','desarrollador'),(10,'carlos pérez','carlos.perez@empresa.com','diseñador'),(11,'andrea suárez','andrea.suarez@empresa.com','tester'),(12,'juan torres','juan.torres@empresa.com','gerente');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_proyecto`
--

DROP TABLE IF EXISTS `empleado_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_proyecto` (
  `idEmpleadoProyecto` int NOT NULL AUTO_INCREMENT,
  `idProyecto` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  PRIMARY KEY (`idEmpleadoProyecto`),
  KEY `idProyecto` (`idProyecto`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `empleado_proyecto_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`),
  CONSTRAINT `empleado_proyecto_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_proyecto`
--

LOCK TABLES `empleado_proyecto` WRITE;
/*!40000 ALTER TABLE `empleado_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `idProyecto` int NOT NULL AUTO_INCREMENT,
  `nombreProyecto` varchar(100) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `estado` enum('en progreso','completado','pendiente') DEFAULT NULL,
  PRIMARY KEY (`idProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'sistema de ventas','2025-07-01','en progreso'),(2,'app de reservas','2025-06-15','pendiente'),(3,'portal de clientes','2025-05-10','completado');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `idTarea` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL,
  `estado` enum('pendiente','en proceso','completada') DEFAULT NULL,
  `idProyecto` int DEFAULT NULL,
  PRIMARY KEY (`idTarea`),
  KEY `idProyecto` (`idProyecto`),
  CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'diseñar interfaz de login','2025-07-30','en proceso',1),(2,'implementar base de datos','2025-08-05','pendiente',1),(3,'pruebas funcionales','2025-08-10','pendiente',2),(4,'documentación del sistema','2025-06-20','completada',3),(5,'diseñar interfaz de login','2025-07-30','en proceso',1),(6,'implementar base de datos','2025-08-05','pendiente',1),(7,'pruebas funcionales','2025-08-10','pendiente',2),(8,'documentación del sistema','2025-06-20','completada',3);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 18:21:45
