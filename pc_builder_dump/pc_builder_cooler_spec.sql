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
-- Table structure for table `cooler_spec`
--

DROP TABLE IF EXISTS `cooler_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooler_spec` (
  `part_id` int NOT NULL,
  `fan_rpm` smallint DEFAULT NULL,
  `noise_level` decimal(4,1) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `radiator_size` smallint DEFAULT NULL,
  `height` int NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `cooler_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooler_spec`
--

LOCK TABLES `cooler_spec` WRITE;
/*!40000 ALTER TABLE `cooler_spec` DISABLE KEYS */;
INSERT INTO `cooler_spec` VALUES (52,1500,19.2,'Brown',158,160),(53,2000,36.0,'Black',159,160),(54,1500,24.3,'Black',136,140),(57,2400,36.0,'Black',276,280),(58,1800,21.0,'Black',280,280),(89,2000,29.0,'Black',360,83),(90,1800,21.6,'Black',NULL,163),(91,1500,22.4,'Black',NULL,158),(94,2400,36.0,'Black',360,80),(95,1800,28.5,'Black',360,78),(111,2000,24.5,'Black',240,52),(118,1850,28.0,'Black',NULL,160),(125,1850,23.8,'Black',NULL,145),(149,1500,19.2,'Brown',NULL,165),(150,2000,22.6,'Brown',NULL,158),(151,2500,23.6,'Brown',NULL,37),(152,1500,24.3,'Black',NULL,163),(153,1700,26.8,'Black',NULL,155),(154,1200,14.5,'Black',NULL,155),(155,1800,24.9,'Black',NULL,135),(156,2000,36.0,'Black',NULL,159),(157,2000,30.0,'Black',240,52),(158,2000,29.8,'Black',240,52),(159,2400,36.0,'Black',240,52),(160,2400,37.0,'Black',360,52),(161,2000,21.0,'Black',240,52),(162,2000,21.6,'Black',280,52),(163,2300,34.0,'Black',280,52),(164,2200,26.7,'Black',NULL,162),(165,1400,19.0,'Black',NULL,160),(166,2000,29.9,'Black',240,54),(167,2000,22.7,'Black',360,54);
/*!40000 ALTER TABLE `cooler_spec` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 12:19:55
