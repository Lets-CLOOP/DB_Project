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
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (91,'ADATA'),(102,'Alphacool'),(2,'AMD'),(168,'Antec'),(84,'Arctic'),(35,'ASRock'),(3,'ASUS'),(16,'be quiet!'),(112,'Biostar'),(78,'BitFenix'),(14,'Cooler Master'),(5,'Corsair'),(38,'Crucial'),(17,'DeepCool'),(101,'EKWB'),(11,'EVGA'),(39,'Fractal Design'),(167,'FSP'),(6,'G.Skill'),(34,'Gigabyte'),(182,'In Win'),(77,'Inno3D'),(1,'Intel'),(36,'Kingston'),(143,'Kioxia'),(139,'Lexar'),(72,'Lian Li'),(142,'Micron'),(183,'Montech'),(4,'MSI'),(120,'Mushkin'),(15,'Noctua'),(10,'NVIDIA'),(13,'NZXT'),(157,'Palit'),(71,'Patriot'),(79,'Phanteks'),(119,'PNY'),(159,'PowerColor'),(137,'Sabrent'),(7,'Samsung'),(141,'SanDisk'),(158,'Sapphire'),(100,'Scythe'),(9,'Seagate'),(12,'Seasonic'),(92,'SilverStone'),(144,'SK Hynix'),(76,'SuperMicro'),(37,'TeamGroup'),(93,'Thermalright'),(70,'Thermaltake'),(140,'Toshiba'),(138,'Transcend'),(8,'Western Digital'),(160,'XFX'),(169,'XPG'),(94,'ZOTAC');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
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
