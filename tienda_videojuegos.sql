-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tienda_videojuegos
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos Ruiz','carlos@example.com','2023-01-15'),(2,'Luisa Gómez','luisa@example.com','2023-02-20'),(3,'Pedro Salazar','pedro@example.com','2023-03-10');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcion_venta`
--

DROP TABLE IF EXISTS `descripcion_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descripcion_venta` (
  `idDescripcion_venta` int NOT NULL,
  `idVenta` int DEFAULT NULL,
  `idVideojuego` int DEFAULT NULL,
  PRIMARY KEY (`idDescripcion_venta`),
  KEY `idVenta` (`idVenta`),
  KEY `idVideojuego` (`idVideojuego`),
  CONSTRAINT `descripcion_venta_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`),
  CONSTRAINT `descripcion_venta_ibfk_2` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`id_videojuego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcion_venta`
--

LOCK TABLES `descripcion_venta` WRITE;
/*!40000 ALTER TABLE `descripcion_venta` DISABLE KEYS */;
INSERT INTO `descripcion_venta` VALUES (1,1,1),(2,1,2),(3,2,3),(4,3,2),(5,3,4);
/*!40000 ALTER TABLE `descripcion_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL,
  `totalVenta` float DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fechaVenta` date DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,550000,2,'2023-04-01',1),(2,300000,1,'2023-04-10',2),(3,400000,2,'2023-04-15',3);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videojuego`
--

DROP TABLE IF EXISTS `videojuego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuego` (
  `id_videojuego` int NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `plataforma` enum('PC','Xbox','PlayStation','Switch') DEFAULT NULL,
  PRIMARY KEY (`id_videojuego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuego`
--

LOCK TABLES `videojuego` WRITE;
/*!40000 ALTER TABLE `videojuego` DISABLE KEYS */;
INSERT INTO `videojuego` VALUES (1,'FIFA 24',200000,'PlayStation'),(2,'Call of Duty',250000,'Xbox'),(3,'Zelda: Breath of the Wild',300000,'Switch'),(4,'Minecraft',100000,'PC');
/*!40000 ALTER TABLE `videojuego` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 18:27:25
