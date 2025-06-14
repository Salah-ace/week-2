-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_reviews
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `app_package_name` varchar(100) NOT NULL,
  `current_version` varchar(50) DEFAULT NULL,
  `last_updated` date DEFAULT NULL,
  PRIMARY KEY (`bank_id`),
  UNIQUE KEY `app_package_name` (`app_package_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Commercial Bank of Ethiopia','com.cbe.cbe',NULL,NULL),(2,'Bank of Abyssinia','com.boa.mobilebanking',NULL,NULL),(3,'Dashen Bank','com.dashen.mobilebanking',NULL,NULL);
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `bank_id` int DEFAULT NULL,
  `review_text` text,
  `rating` tinyint DEFAULT NULL,
  `sentiment_score` decimal(3,2) DEFAULT NULL,
  `sentiment` enum('POSITIVE','NEUTRAL','NEGATIVE') DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `source` varchar(50) DEFAULT 'GOOGLE_PLAY',
  PRIMARY KEY (`review_id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`bank_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,'Great app but sometimes crashes',4,0.37,'POSITIVE','App Stability','2023-10-01 00:00:00','GOOGLE_PLAY'),(2,2,'Very slow transactions',2,0.00,'NEUTRAL','Other','2023-09-28 00:00:00','GOOGLE_PLAY'),(3,3,'Excellent user experience',5,0.57,'POSITIVE','Other','2023-09-25 00:00:00','GOOGLE_PLAY'),(4,1,'Can\'t login to my account',1,0.00,'NEUTRAL','Login Issues','2023-09-20 00:00:00','GOOGLE_PLAY'),(5,2,'Needs more features',3,0.00,'NEUTRAL','Other','2023-09-15 00:00:00','GOOGLE_PLAY');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11  2:48:28
