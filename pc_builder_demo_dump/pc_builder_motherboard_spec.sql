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
-- Table structure for table `motherboard_spec`
--

DROP TABLE IF EXISTS `motherboard_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motherboard_spec` (
  `part_id` int NOT NULL,
  `socket` varchar(20) NOT NULL,
  `form_factor` varchar(20) NOT NULL,
  `ram_type` varchar(10) NOT NULL,
  `memory_max` smallint DEFAULT NULL,
  `ram_slots` tinyint NOT NULL,
  `m2_slots` tinyint NOT NULL,
  `sata_ports` tinyint NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `motherboard_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motherboard_spec`
--

LOCK TABLES `motherboard_spec` WRITE;
/*!40000 ALTER TABLE `motherboard_spec` DISABLE KEYS */;
INSERT INTO `motherboard_spec` VALUES (4,'AM4','ATX','DDR4',128,4,2,6,'Black'),(5,'LGA1700','ATX','DDR5',128,4,2,6,'Black'),(6,'AM4','ATX','DDR4',128,4,2,8,'Gray'),(65,'LGA1700','ATX','DDR5',192,4,4,6,'Black'),(66,'AM5','E-ATX','DDR5',128,4,4,8,'Black'),(67,'AM4','ATX','DDR4',128,4,2,6,'Black'),(96,'LGA1700','E-ATX','DDR5',192,4,4,8,'Black'),(97,'AM5','ATX','DDR5',128,4,3,6,'Silver'),(112,'LGA1700','ATX','DDR5',192,4,5,6,'Black'),(120,'AM5','ATX','DDR5',192,4,4,6,'Black'),(126,'LGA1700','Micro-ATX','DDR4',128,4,2,4,'Gray'),(169,'LGA1700','ATX','DDR5',192,4,4,8,'Black'),(170,'LGA1700','ATX','DDR5',192,4,5,6,'Silver/Black'),(171,'LGA1700','Micro-ATX','DDR4',128,4,2,4,'Black'),(172,'LGA1700','ATX','DDR5',192,4,5,6,'Black'),(173,'LGA1700','ATX','DDR5',128,4,2,6,'Black'),(174,'LGA1700','ATX','DDR5',192,4,4,8,'Steel Grey'),(175,'LGA1700','ATX','DDR4',128,4,2,4,'Black'),(176,'LGA1700','ATX','DDR5',128,4,4,6,'Black'),(177,'LGA1700','E-ATX','DDR5',256,8,8,10,'Black'),(178,'LGA1700','ATX','DDR5',192,4,4,8,'Black'),(179,'AM5','ATX','DDR5',192,4,5,8,'Black'),(180,'AM5','ATX','DDR5',192,4,5,6,'Silver/Black'),(181,'AM5','E-ATX','DDR5',128,4,4,8,'Black'),(182,'AM5','E-ATX','DDR5',256,4,8,10,'Black'),(183,'AM5','ATX','DDR5',192,4,4,6,'Black'),(184,'AM5','ATX','DDR5',128,4,2,6,'Steel Grey'),(185,'AM4','ATX','DDR4',128,4,3,6,'Black'),(186,'AM4','ATX','DDR4',128,4,2,8,'Black'),(187,'AM4','ATX','DDR4',128,4,4,6,'Black');
/*!40000 ALTER TABLE `motherboard_spec` ENABLE KEYS */;
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
