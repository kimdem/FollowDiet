-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ourdiet
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `diet_info`
--

DROP TABLE IF EXISTS `diet_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_info` (
  `Info_id` int NOT NULL AUTO_INCREMENT,
  `User_id` int NOT NULL,
  `Today_weight` float DEFAULT '0',
  `Total_calrory` float DEFAULT '0',
  `Total_tan` float DEFAULT '0',
  `Total_ji` float DEFAULT '0',
  `Info_date` date NOT NULL,
  `Total_dan` float DEFAULT '0',
  PRIMARY KEY (`Info_id`),
  KEY `fk_dietinfo_user` (`User_id`),
  CONSTRAINT `fk_dietinfo_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_info`
--

LOCK TABLES `diet_info` WRITE;
/*!40000 ALTER TABLE `diet_info` DISABLE KEYS */;
INSERT INTO `diet_info` VALUES (8,4,73.2,712.2,246.4,232.7,'2025-06-01',110.7),(9,4,80,0,0,0,'2025-02-01',0),(10,4,80,0,0,0,'2025-05-02',0),(11,4,80,0,0,0,'2025-05-30',0),(12,4,78.4,0,0,0,'2025-05-31',0),(13,4,77,0,0,0,'2025-05-29',0),(14,4,71,0,0,0,'2025-05-28',0),(15,4,75,0,0,0,'2025-06-03',0),(16,4,74,1265,195,70,'2025-06-04',77),(17,4,75,495,90,25,'2025-06-09',40),(18,4,70,300,40,10,'2025-06-11',30),(19,4,0,230,80,100,'2025-06-12',50);
/*!40000 ALTER TABLE `diet_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12  1:23:47
