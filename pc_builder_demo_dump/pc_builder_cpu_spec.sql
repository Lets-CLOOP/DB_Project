-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: pc_builder
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `cpu_spec`
--

DROP TABLE IF EXISTS `cpu_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpu_spec` (
  `part_id` int NOT NULL,
  `socket` varchar(20) NOT NULL,
  `cores` tinyint NOT NULL,
  `core_clock` decimal(5,2) DEFAULT NULL,
  `boost_clock` decimal(5,2) DEFAULT NULL,
  `architecture` varchar(50) NOT NULL DEFAULT 'x64',
  `tdp` smallint NOT NULL,
  `integrated_graphics` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `cpu_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_spec`
--

LOCK TABLES `cpu_spec` WRITE;
/*!40000 ALTER TABLE `cpu_spec` DISABLE KEYS */;
INSERT INTO `cpu_spec` VALUES (1,'LGA1200',6,2.90,4.30,'x64',65,'Intel UHD Graphics 630'),(2,'AM4',6,3.60,4.20,'x64',65,NULL),(3,'LGA1700',12,3.60,5.00,'x64',125,'Intel UHD Graphics 770'),(55,'LGA1700',16,3.20,5.20,'x64',125,'Intel UHD Graphics 770'),(56,'AM4',8,3.80,4.70,'x64',105,NULL),(59,'LGA1700',14,2.60,5.10,'x64',125,'Intel UHD Graphics 770'),(60,'AM4',12,3.70,4.80,'x64',105,NULL),(61,'LGA1700',12,2.10,4.90,'x64',65,NULL),(92,'LGA1700',14,3.50,5.40,'x64',125,'Intel UHD Graphics 770'),(93,'AM5',6,4.70,5.30,'x64',105,NULL),(109,'LGA1700',24,3.20,6.00,'x64',125,'Intel UHD Graphics 770'),(110,'AM5',16,4.20,5.70,'x64',120,NULL),(119,'LGA1700',16,3.40,5.40,'x64',125,'Intel UHD Graphics 770'),(124,'AM5',8,4.50,5.40,'x64',105,NULL),(129,'LGA1200',4,3.60,4.30,'x64',65,'Intel UHD Graphics 630'),(130,'LGA1700',4,3.30,4.30,'x64',58,NULL),(131,'LGA1200',6,2.90,4.30,'x64',65,NULL),(132,'LGA1700',6,2.50,4.40,'x64',65,'Intel UHD Graphics 730'),(133,'LGA1700',14,2.60,5.10,'x64',125,NULL),(134,'LGA1200',8,3.60,5.00,'x64',125,'Intel UHD Graphics 750'),(135,'LGA1700',16,3.40,5.40,'x64',125,NULL),(136,'LGA1700',24,3.00,5.80,'x64',125,'Intel UHD Graphics 770'),(137,'AM4',4,3.60,3.90,'x64',65,NULL),(138,'AM4',4,3.80,4.00,'x64',65,NULL),(139,'AM4',6,3.70,4.60,'x64',65,NULL),(140,'AM5',6,3.80,5.10,'x64',65,NULL),(141,'AM4',8,3.60,4.40,'x64',65,NULL),(142,'AM5',16,4.50,5.70,'x64',170,NULL);
/*!40000 ALTER TABLE `cpu_spec` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 14:39:26
