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
-- Table structure for table `case_spec`
--

DROP TABLE IF EXISTS `case_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_spec` (
  `part_id` int NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `supported_form_factors` varchar(50) NOT NULL,
  `side_panel` varchar(50) DEFAULT NULL,
  `hdd_bays` int NOT NULL,
  `ssd_bays` int NOT NULL,
  `volume` int DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `max_gpu_length` smallint NOT NULL,
  `max_cpu_cooler_height` smallint NOT NULL,
  `psu_form_factor` varchar(20) NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `case_spec_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_spec`
--

LOCK TABLES `case_spec` WRITE;
/*!40000 ALTER TABLE `case_spec` DISABLE KEYS */;
INSERT INTO `case_spec` VALUES (22,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',0,0,46,'Black',381,165,'ATX'),(23,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',0,0,45,'Black',360,170,'ATX'),(24,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',0,0,42,'Black',410,159,'ATX'),(77,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,3,49,'Black/White',420,155,'ATX'),(78,'Mid Tower','ATX,Micro-ATX,Mini-ITX,E-ATX','Tempered Glass',4,4,47,'Black',491,185,'ATX'),(106,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,3,47,'Black',384,170,'ATX'),(107,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,45,'White',360,160,'ATX'),(108,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Mesh',2,2,42,'Black',380,165,'ATX'),(117,'Mid Tower','ATX,Micro-ATX,Mini-ITX,E-ATX','Tempered Glass',2,3,50,'Black/White',400,180,'ATX'),(123,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,3,47,'Black',355,160,'ATX'),(269,'Mid Tower','ATX,Micro-ATX,Mini-ITX,E-ATX','Tempered Glass',2,3,47,'Black',420,155,'ATX'),(270,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,45,'Black',315,160,'ATX'),(271,'Mid Tower','ATX,Micro-ATX,Mini-ITX,E-ATX','Tempered Glass',2,3,44,'Black/White',400,180,'ATX'),(272,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,45,'Black',360,170,'ATX'),(273,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,42,'Black',410,159,'ATX'),(274,'Open Frame','ATX,Mini-ITX','None',1,1,50,'Black',300,160,'ATX'),(275,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,45,'White',360,170,'ATX'),(276,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,3,47,'Black',369,185,'ATX'),(277,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,45,'White',410,160,'ATX'),(278,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,48,'Black',370,185,'ATX'),(279,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,3,43,'Black',380,165,'ATX'),(280,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,45,'Black',360,170,'ATX'),(281,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,46,'Black',340,165,'ATX'),(282,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,3,47,'Black',384,170,'ATX'),(283,'Mid Tower','ATX,Micro-ATX,Mini-ITX,E-ATX','Tempered Glass',3,5,54,'Black',413,185,'ATX'),(284,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',1,2,39,'Black',360,160,'ATX'),(285,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,3,45,'White',360,160,'ATX'),(286,'Full Tower','ATX,Micro-ATX,Mini-ITX,E-ATX','Acrylic',3,4,60,'Black',360,185,'ATX'),(287,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Tempered Glass',2,2,46,'Black',360,170,'ATX'),(288,'Mid Tower','ATX,Micro-ATX,Mini-ITX','Sound Dampening',2,3,48,'Black',315,168,'ATX');
/*!40000 ALTER TABLE `case_spec` ENABLE KEYS */;
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
