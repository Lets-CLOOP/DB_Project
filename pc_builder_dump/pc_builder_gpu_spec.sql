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
-- Table structure for table `gpu_spec`
--

DROP TABLE IF EXISTS `gpu_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gpu_spec` (
  `part_id` int NOT NULL,
  `chipset` varchar(50) DEFAULT NULL,
  `memory` smallint DEFAULT NULL,
  `core_clock` smallint DEFAULT NULL,
  `boost_clock` smallint DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `length` smallint NOT NULL,
  `tdp` smallint NOT NULL,
  `power_connectors` varchar(20) NOT NULL,
  `interface` varchar(10) NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `gpu_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpu_spec`
--

LOCK TABLES `gpu_spec` WRITE;
/*!40000 ALTER TABLE `gpu_spec` DISABLE KEYS */;
INSERT INTO `gpu_spec` VALUES (13,'GA106',12,1320,1777,'Black',242,170,'1×8-pin','PCIe'),(14,'GA104',8,1500,1725,'Black',242,220,'1×8-pin','PCIe'),(15,'Navi 22',12,1925,2581,'Black',267,230,'2×8-pin','PCIe'),(74,'AD104',12,2310,2610,'Silver',336,285,'1×8-pin,1×6-pin','PCIe'),(75,'TU116',6,1530,1785,'Black',229,125,'1×8-pin','PCIe'),(76,'Navi 31',20,1500,2450,'Black',320,300,'2×8-pin','PCIe'),(102,'AD106',8,2310,2535,'Black',242,165,'1×8-pin','PCIe'),(103,'Navi 23',16,2000,2350,'Black',267,225,'2×8-pin','PCIe'),(115,'GA104',8,1410,1665,'Black',280,200,'2×8-pin','PCIe'),(128,'AD106',8,1837,2475,'Black',232,115,'1×8-pin','PCIe'),(229,'GA104',8,1410,1665,'Black',302,200,'1×8-pin','PCIe'),(230,'GA106',12,1320,1777,'Black',240,170,'1×8-pin','PCIe'),(231,'GA104',8,1500,1725,'Black',242,220,'1×8-pin','PCIe'),(232,'GA102',10,1440,1710,'Black',285,320,'2×8-pin','PCIe'),(233,'GA102',10,1440,1710,'Black',270,320,'2×8-pin','PCIe'),(234,'GA102',10,1440,1710,'Black',275,320,'2×8-pin','PCIe'),(235,'GA102',24,1400,1695,'Black',313,350,'2×8-pin','PCIe'),(236,'Navi 22',12,1925,2581,'Black',267,230,'2×8-pin','PCIe'),(237,'Navi 21',16,2015,2250,'Black',267,300,'2×8-pin','PCIe'),(238,'Navi 21',16,1825,2250,'Black',267,300,'2×8-pin','PCIe'),(239,'Navi 21',16,2155,2340,'Black',282,335,'2×8-pin','PCIe'),(240,'Navi 23',8,2045,2589,'Black',190,160,'1×8-pin','PCIe'),(241,'Navi 32',8,1960,2350,'Black',175,165,'1×8-pin','PCIe'),(242,'AD104',12,1920,2475,'Black',240,200,'1×8-pin','PCIe'),(243,'AD104',12,2310,2610,'Silver',280,285,'2×8-pin','PCIe'),(244,'AD102',24,2235,2520,'Black',336,450,'3×8-pin','PCIe'),(245,'RDNA3',20,1800,2450,'Black',307,350,'2×8-pin','PCIe'),(246,'TU116',4,1530,1785,'Black',168,100,'1×6-pin','PCIe'),(247,'Navi 23',8,2045,2589,'Black',190,160,'1×8-pin','PCIe'),(248,'RDNA3',16,2000,2350,'Black',175,165,'1×8-pin','PCIe');
/*!40000 ALTER TABLE `gpu_spec` ENABLE KEYS */;
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
