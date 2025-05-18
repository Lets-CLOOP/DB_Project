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
-- Table structure for table `memory_spec`
--

DROP TABLE IF EXISTS `memory_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memory_spec` (
  `part_id` int NOT NULL,
  `speed` smallint NOT NULL,
  `modules` tinyint NOT NULL,
  `capacity` smallint NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `memory_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory_spec`
--

LOCK TABLES `memory_spec` WRITE;
/*!40000 ALTER TABLE `memory_spec` DISABLE KEYS */;
INSERT INTO `memory_spec` VALUES (7,3200,2,16,'Black','DDR4'),(8,3600,2,32,'Black/Silver','DDR4'),(9,5200,2,32,'Black/RGB','DDR5'),(68,4400,2,16,'Black','DDR4'),(69,5600,2,32,'Black','DDR5'),(70,3600,2,64,'Black','DDR4'),(98,3200,2,32,'Black','DDR4'),(99,5200,2,16,'Black','DDR5'),(113,3200,2,16,'Black','DDR4'),(121,6000,2,32,'Black/RGB','DDR5'),(189,2400,1,8,'Black','DDR4'),(190,3200,2,16,'Black','DDR4'),(191,3600,2,16,'Black/RGB','DDR4'),(192,5200,2,32,'Black/RGB','DDR5'),(193,2400,1,8,'Black','DDR4'),(194,3200,2,16,'Black','DDR4'),(195,3600,2,32,'Black/Silver','DDR4'),(196,6000,2,16,'Black/RGB','DDR5'),(197,2666,1,8,'Black','DDR4'),(198,3200,2,16,'Black','DDR4'),(199,3000,2,16,'White','DDR4'),(200,3600,2,32,'Black/Red','DDR4'),(201,4400,2,16,'Black','DDR4'),(202,3200,2,32,'Black/RGB','DDR4'),(203,3200,2,16,'Black','DDR4'),(204,3600,2,32,'Black/RGB','DDR4'),(205,3000,1,8,'Black','DDR4'),(206,3200,2,16,'Black','DDR4'),(207,5200,2,16,'Black','DDR5'),(208,3600,2,16,'Black','DDR4');
/*!40000 ALTER TABLE `memory_spec` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 12:19:54
