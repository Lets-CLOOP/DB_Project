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
-- Table structure for table `storage_spec`
--

DROP TABLE IF EXISTS `storage_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_spec` (
  `part_id` int NOT NULL,
  `capacity` int NOT NULL,
  `type` varchar(10) NOT NULL,
  `cache` smallint DEFAULT NULL,
  `form_factor` varchar(10) NOT NULL,
  `interface` varchar(10) NOT NULL,
  `bay_size` varchar(10) NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `storage_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_spec`
--

LOCK TABLES `storage_spec` WRITE;
/*!40000 ALTER TABLE `storage_spec` DISABLE KEYS */;
INSERT INTO `storage_spec` VALUES (10,1000,'SSD',NULL,'M.2','NVMe',''),(11,1000,'SSD',NULL,'M.2','NVMe',''),(12,2000,'HDD',256,'3.5\"','SATA',''),(71,1000,'SSD',NULL,'M.2','NVMe','M.2'),(72,2000,'SSD',NULL,'M.2','NVMe','M.2'),(73,1000,'SSD',NULL,'Portable','USB','N/A'),(100,4000,'SSD',512,'2.5\"','SATA','2.5\"'),(114,2000,'SSD',NULL,'M.2','NVMe','M.2'),(122,1000,'SSD',512,'M.2','NVMe','M.2'),(127,1000,'SSD',NULL,'M.2','NVMe','M.2'),(209,2000,'SSD',NULL,'M.2','NVMe','M.2'),(210,2000,'SSD',NULL,'M.2','NVMe','M.2'),(211,2000,'SSD',NULL,'M.2','NVMe','M.2'),(212,1000,'SSD',NULL,'M.2','NVMe','M.2'),(213,2000,'SSD',NULL,'M.2','NVMe','M.2'),(214,4000,'SSD',NULL,'M.2','NVMe','M.2'),(215,1000,'SSD',NULL,'M.2','NVMe','M.2'),(216,1500,'SSD',NULL,'PCIe','PCIe','PCIe'),(217,2000,'SSD',NULL,'M.2','NVMe','M.2'),(218,1000,'SSD',NULL,'M.2','NVMe','M.2'),(219,1000,'SSD',NULL,'M.2','NVMe','M.2'),(220,1000,'SSD',NULL,'M.2','NVMe','M.2'),(221,2000,'SSD',NULL,'M.2','NVMe','M.2'),(222,4000,'SSD',NULL,'M.2','NVMe','M.2'),(223,2000,'SSD',NULL,'M.2','NVMe','M.2'),(224,1000,'SSD',NULL,'M.2','NVMe','M.2'),(225,2000,'SSD',NULL,'M.2','NVMe','M.2'),(226,1000,'SSD',NULL,'M.2','NVMe','M.2'),(227,1000,'SSD',NULL,'M.2','NVMe','M.2'),(228,2000,'SSD',NULL,'M.2','NVMe','M.2');
/*!40000 ALTER TABLE `storage_spec` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 14:39:25
