CREATE DATABASE  IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `testdb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `m_category`
--

DROP TABLE IF EXISTS `m_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_category` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_category`
--

LOCK TABLES `m_category` WRITE;
/*!40000 ALTER TABLE `m_category` DISABLE KEYS */;
INSERT INTO `m_category` VALUES (1,'Japanese',4,0,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(2,'English',4,0,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(3,'Others',4,0,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1);
/*!40000 ALTER TABLE `m_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_ess`
--

DROP TABLE IF EXISTS `m_ess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_ess` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL,
  `unchange` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_ess`
--

LOCK TABLES `m_ess` WRITE;
/*!40000 ALTER TABLE `m_ess` DISABLE KEYS */;
INSERT INTO `m_ess` VALUES (1,'Are you OK?',2,1,10,1,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(2,'Are there any problems?',2,1,9,1,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(3,'大丈夫ですか？',1,1,8,1,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(4,'Are you OK?',2,1,7,1,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(5,'Are there any problems?',2,1,6,1,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(6,'大丈夫ですか？',1,1,5,0,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(7,'Are you OK?',2,1,4,1,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(8,'Are there any problems?',2,1,3,0,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(9,'大丈夫ですか？',1,1,2,1,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1),(10,'Daijyoubu desuka?',3,1,1,0,'2022-06-10 00:00:00','2022-06-10 00:00:00',1,1);
/*!40000 ALTER TABLE `m_ess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13  7:50:08
