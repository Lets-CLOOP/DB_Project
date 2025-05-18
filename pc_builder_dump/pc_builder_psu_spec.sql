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
-- Table structure for table `psu_spec`
--

DROP TABLE IF EXISTS `psu_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psu_spec` (
  `part_id` int NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `efficiency` varchar(20) NOT NULL,
  `wattage` smallint NOT NULL,
  `modularity` varchar(20) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `form_factor` varchar(20) NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `psu_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psu_spec`
--

LOCK TABLES `psu_spec` WRITE;
/*!40000 ALTER TABLE `psu_spec` DISABLE KEYS */;
INSERT INTO `psu_spec` VALUES (16,'ATX','80+ Gold',650,'Full','Black','ATX'),(17,'ATX','80+ Gold',750,'Full','Black','ATX'),(18,'ATX','80+ Gold',650,'Full','Black','ATX'),(79,'ATX','80+ Gold',750,'Full','Black','ATX'),(80,'ATX','80+ Platinum',850,'Full','Black','ATX'),(104,'ATX','80+ Platinum',850,'Full','Black','ATX'),(105,'ATX','80+ Bronze',650,'Semi','Black','ATX'),(116,'ATX','80+ Gold',1000,'Full','Black','ATX'),(249,'ATX','80+ Titanium',1000,'Full','Black','ATX'),(250,'ATX','80+ Gold',650,'Full','Black','ATX'),(251,'ATX','80+ Gold',850,'Full','Black','ATX'),(252,'SFX','80+ Gold',600,'Full','Black','SFX'),(253,'SFX','80+ Platinum',750,'Full','Black','SFX'),(254,'ATX','80+ Platinum',850,'Full','Black','ATX'),(255,'ATX','80+ Gold',850,'Full','Black','ATX'),(256,'ATX','80+ Titanium',1200,'Full','Black','ATX'),(257,'ATX','80+ Gold',850,'Full','Black','ATX'),(258,'ATX','80+ Gold',750,'Full','Black','ATX'),(259,'ATX','80+ Platinum',850,'Full','Black','ATX'),(260,'ATX','80+ Gold',850,'Full','Black','ATX'),(261,'ATX','80+ Gold',650,'Full','Black','ATX'),(262,'ATX','80+ Platinum',760,'Full','Black','ATX'),(263,'ATX','80+ Gold',850,'Full','Black','ATX'),(264,'ATX','80+ Platinum',1200,'Full','Black','ATX'),(265,'ATX','80+ Gold',750,'Full','Black','ATX'),(266,'ATX','80+ Gold',650,'Full','Black','ATX'),(267,'ATX','80+ Gold',750,'Full','Black','ATX');
/*!40000 ALTER TABLE `psu_spec` ENABLE KEYS */;
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
