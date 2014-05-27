CREATE DATABASE  IF NOT EXISTS `jimel` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jimel`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: jimel
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Table structure for table `es_association`
--

DROP TABLE IF EXISTS `es_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_association` (
  `id_association` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '0:Club; 1:Federation; 2:Confederation',
  `id_parent_association` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_association`),
  KEY `IDX_id_parent_ass` (`type`),
  KEY `es_association_ibfk_1` (`id_parent_association`),
  CONSTRAINT `es_association_ibfk_1` FOREIGN KEY (`id_parent_association`) REFERENCES `es_association` (`id_association`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_association`
--

LOCK TABLES `es_association` WRITE;
/*!40000 ALTER TABLE `es_association` DISABLE KEYS */;
INSERT INTO `es_association` VALUES (5,'IMeL Campinas',1,8),(7,'IMeL Sorocaba',1,8),(8,'Concílio Nikkei',2,NULL),(9,'IMeL Apucarana',1,8),(10,'IMeL Diadema',1,8),(11,'IMeL Embura',1,8),(12,'IMeL Itapevi',1,8),(13,'IMeL Jaçanã',1,8),(14,'IMeL Jardim Planalto',1,8),(15,'IMeL Jordanópolis',1,8),(16,'IMeL Liberdade',1,8),(17,'IMeL Marília',1,8),(18,'IMeL Mogi das Cruzes',1,8),(19,'IMeL Novo Alvoecer',1,8),(20,'IMeL Pindamoiangaba',1,8),(21,'IMeL Pinheiros',1,8),(22,'IMeL Santana',1,8),(23,'IMeL São José dos Campos',1,8),(24,'IMeL São Remo',1,8),(25,'IMeL Saúde',1,8),(26,'IMeL Vila Mariana',1,8),(27,'IMeL Curitiba',1,8);
/*!40000 ALTER TABLE `es_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_athlete`
--

DROP TABLE IF EXISTS `es_athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_athlete` (
  `id_athlete` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_association` int(11) NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT 'INATIVO; ATIVO',
  PRIMARY KEY (`id_athlete`),
  KEY `id_user` (`id_user`),
  KEY `es_athlete_ibfk_2` (`id_association`),
  KEY `es_athlete_ibfk_4` (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_athlete`
--

LOCK TABLES `es_athlete` WRITE;
/*!40000 ALTER TABLE `es_athlete` DISABLE KEYS */;
INSERT INTO `es_athlete` VALUES (9,27,20,1,1),(12,28,20,1,1),(15,31,20,1,1),(16,32,20,1,1),(17,33,20,1,1),(18,34,20,1,1),(19,35,20,1,1),(20,36,20,1,1),(21,37,20,1,1),(22,38,20,1,1),(23,39,20,1,1),(24,40,20,1,1),(26,42,20,1,1),(29,44,21,1,1),(30,45,21,1,1),(31,46,20,1,1),(32,48,21,1,1),(33,49,21,1,1),(34,50,21,1,1),(35,51,21,1,1),(36,52,21,1,1),(37,53,21,1,1),(38,54,21,1,1),(39,55,21,1,1),(40,56,21,1,1),(41,57,21,1,1),(42,58,21,1,1),(43,59,21,1,1),(44,60,21,1,1),(45,61,21,1,1),(47,65,27,1,1),(48,66,27,1,1),(49,67,27,1,1),(50,69,27,1,1),(51,70,27,1,1),(52,71,27,1,1),(53,72,27,1,1),(54,73,27,1,1),(60,1,22,1,1),(61,76,22,1,1),(62,77,22,1,1),(63,78,22,1,1),(64,79,22,1,1),(65,80,22,1,1),(69,84,22,1,1),(70,85,22,1,1),(71,86,22,1,1),(72,87,22,1,1),(73,88,22,1,1),(74,89,22,1,1),(78,93,27,1,1),(79,94,27,1,1),(80,95,10,1,1),(81,96,10,1,1),(84,99,10,1,1),(85,100,10,1,1),(86,101,10,1,1),(88,103,10,1,1),(89,104,10,1,1),(90,105,10,1,1),(91,106,10,1,1),(92,107,10,1,1),(93,108,10,1,1),(94,109,10,1,1),(95,110,10,1,1),(96,111,10,1,1),(97,112,10,1,1),(98,113,10,1,1),(99,114,10,1,1),(100,115,10,1,1),(101,116,10,1,1),(103,118,10,1,1),(104,119,10,1,1),(105,120,10,1,1),(106,121,10,1,1),(107,122,10,1,1),(108,123,10,1,1),(109,124,10,1,1),(110,125,20,1,1),(111,126,20,1,1),(112,127,20,1,1),(117,128,24,1,1),(118,129,24,1,1),(125,134,10,1,1),(126,135,10,1,1),(127,136,10,1,1),(128,137,10,1,1),(129,138,10,1,1),(130,139,10,1,1),(132,140,20,1,1),(133,141,20,1,1),(135,143,20,1,1),(136,144,20,1,1),(137,145,20,1,1),(138,146,20,1,1),(139,147,20,1,1),(140,148,20,1,1),(141,149,20,1,1),(142,150,20,1,1),(143,151,20,1,1),(144,152,20,1,1),(145,153,20,1,1),(146,154,20,1,1),(147,155,20,1,1),(148,156,20,1,1),(150,158,20,1,1),(151,159,20,1,1),(152,160,20,1,1),(153,161,20,1,1),(154,162,20,1,1),(155,163,20,1,1),(156,164,20,1,1),(158,165,24,1,1),(161,166,22,1,1),(163,168,22,1,1),(164,169,22,1,1),(165,170,22,1,1),(169,171,22,1,1),(170,172,22,1,1),(172,174,22,1,1),(173,175,22,1,1),(174,176,22,1,1),(175,177,22,1,1),(189,179,11,1,1),(190,180,11,1,1),(191,181,11,1,1),(192,182,11,1,1),(193,183,11,1,1),(194,184,11,1,1),(195,185,11,1,1),(196,186,11,1,1),(197,187,20,1,1),(198,188,5,1,1),(199,189,5,1,1),(200,190,5,1,1),(201,191,5,1,1),(202,192,5,1,1),(203,193,5,1,1),(204,194,5,1,1),(205,195,5,1,1),(206,196,5,1,1),(207,197,5,1,1),(208,198,5,1,1),(209,199,22,1,1),(210,200,24,1,1),(214,201,20,1,1),(223,203,22,1,1),(224,204,22,1,1),(236,213,23,1,1),(237,214,23,1,1),(238,215,23,1,1),(239,216,23,1,1),(240,217,23,1,1),(241,218,23,1,1),(242,219,23,1,1),(243,220,23,1,1),(244,221,23,1,1),(245,222,23,1,1),(246,223,23,1,1),(247,224,23,1,1),(248,225,23,1,1),(249,226,23,1,1),(250,227,23,1,1),(251,228,23,1,1),(252,229,23,1,1),(253,230,23,1,1),(254,231,23,1,1),(255,232,23,1,1),(256,233,23,1,1),(257,234,23,1,1),(258,235,23,1,1),(259,236,23,1,1),(260,237,23,1,1),(261,238,25,1,1),(262,239,25,1,1),(263,240,25,1,1),(264,241,25,1,1),(265,242,25,1,1),(266,243,25,1,1),(267,244,25,1,1),(268,245,25,1,1),(269,246,25,1,1),(270,247,25,1,1),(271,248,25,1,1),(272,249,25,1,1),(273,250,25,1,1),(274,251,25,1,1),(275,252,25,1,1),(276,253,25,1,1),(277,254,25,1,1),(278,255,25,1,1),(279,256,25,1,1),(280,257,25,1,1),(281,258,25,1,1),(282,259,25,1,1),(283,260,25,1,1),(284,261,25,1,1),(285,262,25,1,1),(286,263,25,1,1),(287,264,25,1,1),(288,265,25,1,1),(289,266,25,1,1),(290,267,25,1,1),(291,268,25,1,1),(292,269,25,1,1),(293,270,25,1,1),(294,271,25,1,1),(295,272,25,1,1),(296,273,25,1,1),(297,274,25,1,1),(298,275,25,1,1),(299,276,25,1,1),(300,277,25,1,1),(301,278,25,1,1),(302,279,25,1,1),(303,280,25,1,1),(304,281,25,1,1),(305,282,25,1,1),(306,283,25,1,1),(307,284,25,1,1),(308,285,25,1,1),(309,286,25,1,1),(310,287,25,1,1),(311,288,25,1,1),(312,289,25,1,1),(313,290,23,1,1),(314,291,23,1,1),(315,292,23,1,1),(316,293,25,1,1),(317,294,25,1,1),(318,295,23,1,1),(319,296,25,1,1),(320,297,23,1,1),(321,298,25,1,1),(322,299,25,1,1),(323,300,25,1,1),(324,301,23,1,1),(325,302,25,1,1),(326,303,23,1,1),(327,304,25,1,1),(328,305,23,1,1),(329,306,25,1,1),(330,307,23,1,1),(331,308,25,1,1),(332,309,25,1,1),(333,310,23,1,1),(334,311,25,1,1),(335,312,23,1,1),(336,313,25,1,1),(337,314,23,1,1),(338,315,25,1,1),(339,316,23,1,1),(340,317,23,1,1),(341,318,23,1,1),(342,319,23,1,1),(343,320,23,1,1),(344,321,23,1,1),(345,322,23,1,1),(346,323,23,1,1),(347,324,11,1,1),(348,325,11,1,1),(349,326,11,1,1),(350,327,11,1,1),(352,329,11,1,1),(353,330,11,1,1),(354,331,11,1,1),(355,332,11,1,1),(356,333,11,1,1),(357,334,11,1,1),(358,335,11,1,1),(359,336,10,1,1),(360,337,10,1,1),(362,339,17,1,1),(363,340,17,1,1),(364,341,17,1,1),(365,342,21,1,1),(366,343,21,1,1),(367,344,21,1,1),(368,345,7,1,1),(369,346,7,1,1),(370,347,7,1,1),(371,348,7,1,1),(372,349,7,1,1),(373,350,7,1,1),(374,351,7,1,1),(375,352,7,1,1),(376,353,7,1,1),(377,354,7,1,1),(378,355,7,1,1),(379,356,7,1,1),(380,357,7,1,1),(381,358,7,1,1),(382,359,7,1,1),(383,360,7,1,1),(384,361,7,1,1),(386,363,7,1,1),(387,364,7,1,1),(388,365,7,1,1),(389,366,7,1,1),(390,367,7,1,1),(391,368,7,1,1),(392,369,7,1,1),(393,370,7,1,1),(394,371,7,1,1),(395,372,7,1,1),(396,373,10,1,1),(397,374,7,1,1),(398,375,10,1,1),(399,376,10,1,1),(400,377,10,1,1),(401,378,7,1,1),(402,379,10,1,1),(403,380,10,1,1),(404,381,10,1,1),(405,382,10,1,1),(406,383,10,1,1),(407,384,7,1,1),(408,385,10,1,1),(409,386,10,1,1),(411,388,7,1,1),(412,389,7,1,1),(413,390,10,1,1),(414,391,10,1,1),(416,393,10,1,1),(418,395,10,1,1),(419,396,7,1,1),(420,397,10,1,1),(421,398,10,1,1),(423,400,7,1,1),(424,401,7,1,1),(425,402,7,1,1),(426,403,10,1,1),(427,404,7,1,1),(428,405,7,1,1),(429,406,10,1,1),(430,407,7,1,1),(431,408,7,1,1),(432,409,7,1,1),(433,410,7,1,1),(434,411,7,1,1),(435,412,7,1,1),(436,413,7,1,1),(439,414,7,1,1),(440,415,7,1,1),(442,416,7,1,1),(443,417,7,1,1),(444,418,7,1,1),(445,419,7,1,1),(446,420,7,1,1),(447,421,7,1,1),(448,422,7,1,1),(449,423,7,1,1),(450,424,7,1,1),(451,425,7,1,1),(452,426,7,1,1),(453,427,7,1,1),(454,428,7,1,1),(455,429,7,1,1),(456,430,7,1,1),(457,431,7,1,1),(458,432,7,1,1),(459,433,7,1,1),(460,434,7,1,1),(461,435,7,1,1),(462,436,7,1,1),(463,437,7,1,1),(464,438,7,1,1),(465,439,7,1,1),(466,440,7,1,1),(467,442,7,1,1),(468,443,7,1,1),(469,444,16,1,1),(470,445,16,1,1),(471,446,16,1,1),(472,447,16,1,1),(473,448,16,1,1),(474,449,16,1,1),(475,450,16,1,1),(476,451,16,1,1),(477,452,22,1,1),(478,453,10,1,1),(479,454,10,1,1),(480,455,10,1,1),(481,456,10,1,1),(482,457,10,1,1),(483,458,10,1,1),(484,459,10,1,1),(487,462,25,1,1),(488,463,24,1,1),(489,464,24,1,1),(490,465,24,1,1),(491,467,25,1,1),(492,468,10,1,1),(493,469,17,1,1),(494,470,24,1,1),(495,471,24,1,1),(496,472,24,1,1),(497,473,24,1,1),(498,474,24,1,1),(499,475,24,1,1),(500,476,24,1,1),(501,477,17,1,1),(502,478,17,1,1),(503,479,24,1,1),(504,480,24,1,1),(505,481,17,1,1),(506,482,23,1,1),(507,483,23,1,1),(508,484,17,1,1),(509,485,21,1,1),(510,486,21,1,1),(511,487,21,1,1),(512,488,21,1,1),(513,489,21,1,1),(514,490,21,1,1),(515,491,12,1,1),(516,492,12,1,1),(517,493,12,1,1),(518,494,12,1,1),(519,495,12,1,1),(520,496,12,1,1),(521,497,12,1,1),(522,498,7,1,1),(523,499,12,1,1),(524,500,12,1,1),(525,501,12,1,1),(526,502,12,1,1),(527,503,23,1,1),(528,504,7,1,1),(529,505,21,1,1),(530,506,23,1,1),(531,507,27,1,1),(532,508,7,1,1),(533,509,7,1,1),(534,510,7,1,1),(535,511,7,1,1),(536,512,7,1,1),(537,513,25,1,1),(538,514,25,1,1),(539,515,7,1,1),(540,516,25,1,1),(541,517,17,1,1),(542,518,17,1,1),(543,519,20,1,1),(544,520,23,1,1),(545,521,23,1,1),(546,527,5,NULL,1);
/*!40000 ALTER TABLE `es_athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_category`
--

DROP TABLE IF EXISTS `es_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `id_sport_type` int(11) DEFAULT NULL,
  `id_event` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(15) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `min_age` int(2) DEFAULT NULL COMMENT 'Minimum age (included) for this category; Leave blank for no limit.',
  `max_age` int(2) DEFAULT NULL COMMENT 'Maximum age (included) for this category; Leave blank for no limit.',
  PRIMARY KEY (`id_category`),
  KEY `id_sport_type` (`id_sport_type`),
  KEY `id_event` (`id_event`),
  CONSTRAINT `es_category_ibfk_1` FOREIGN KEY (`id_sport_type`) REFERENCES `es_sport_type` (`id_sport_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_category`
--

LOCK TABLES `es_category` WRITE;
/*!40000 ALTER TABLE `es_category` DISABLE KEYS */;
INSERT INTO `es_category` VALUES (1,1,0,'Feminino',NULL,'1','F',NULL,NULL),(2,1,0,'Senior',NULL,'1','M',NULL,NULL),(3,1,0,'Junior',NULL,'1','M',13,17),(4,1,0,'Mirim',NULL,'1','X',7,12),(5,1,1,'Master',NULL,'1','M',30,45),(6,1,2,'Veteranos',NULL,'1','M',46,NULL);
/*!40000 ALTER TABLE `es_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_event`
--

DROP TABLE IF EXISTS `es_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  `outdate` datetime DEFAULT NULL,
  `expires` date NOT NULL,
  `id_venue` int(11) DEFAULT NULL COMMENT 'Venue ID',
  `id_sport_type` int(11) DEFAULT NULL COMMENT 'Sport Type ID',
  `id_association` int(11) NOT NULL,
  `www` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `id_venue` (`id_venue`),
  KEY `id_sport_type` (`id_sport_type`),
  KEY `id_association` (`id_association`),
  CONSTRAINT `es_event_ibfk_1` FOREIGN KEY (`id_venue`) REFERENCES `es_venue` (`id_venue`),
  CONSTRAINT `es_event_ibfk_2` FOREIGN KEY (`id_sport_type`) REFERENCES `es_sport_type` (`id_sport_type`),
  CONSTRAINT `es_event_ibfk_3` FOREIGN KEY (`id_association`) REFERENCES `es_association` (`id_association`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_event`
--

LOCK TABLES `es_event` WRITE;
/*!40000 ALTER TABLE `es_event` DISABLE KEYS */;
INSERT INTO `es_event` VALUES (1,'Copa Futsal 2012','2012-08-18 08:00:00','2012-08-18 19:00:00','2012-08-18',1,1,8,'http://www.imelesportes.com.br/futsal',1),(2,'Copa Futsal 2014','2014-08-16 08:00:00','2014-08-16 19:00:00','2014-06-30',1,1,8,'http://www.jimel.com.br',1);
/*!40000 ALTER TABLE `es_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_game`
--

DROP TABLE IF EXISTS `es_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_game` (
  `id_game` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_game_place` int(11) DEFAULT NULL,
  `id_user_keeper` int(11) DEFAULT NULL COMMENT 'game keeper user ID - Mesário/Apontador',
  `id_event` int(11) DEFAULT NULL,
  `id_team_a` int(11) DEFAULT NULL,
  `id_team_b` int(11) DEFAULT NULL,
  `score_a` int(11) DEFAULT NULL,
  `score_b` int(11) DEFAULT NULL,
  `id_winner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_game`),
  KEY `id_event` (`id_event`),
  KEY `id_team_a` (`id_team_a`),
  KEY `id_team_b` (`id_team_b`),
  KEY `id_user_keeper` (`id_user_keeper`),
  CONSTRAINT `es_game_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `es_event` (`id_event`),
  CONSTRAINT `es_game_ibfk_2` FOREIGN KEY (`id_team_a`) REFERENCES `es_team` (`id_team`),
  CONSTRAINT `es_game_ibfk_3` FOREIGN KEY (`id_team_b`) REFERENCES `es_team` (`id_team`),
  CONSTRAINT `es_game_ibfk_4` FOREIGN KEY (`id_user_keeper`) REFERENCES `es_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_game`
--

LOCK TABLES `es_game` WRITE;
/*!40000 ALTER TABLE `es_game` DISABLE KEYS */;
INSERT INTO `es_game` VALUES (2,'2012-08-18 09:00:00',5,NULL,NULL,18,44,NULL,NULL,NULL),(4,'2012-08-18 09:30:00',5,NULL,NULL,21,37,NULL,NULL,NULL),(5,'2012-08-18 10:00:00',5,NULL,NULL,44,22,NULL,NULL,NULL),(6,'2012-08-18 10:30:00',5,NULL,NULL,37,46,NULL,NULL,NULL),(7,'2012-08-18 11:00:00',5,NULL,NULL,22,52,NULL,NULL,NULL),(8,'2012-08-18 11:30:00',5,NULL,NULL,21,46,NULL,NULL,NULL),(9,'2012-08-18 13:15:00',5,NULL,NULL,52,18,NULL,NULL,NULL),(10,'2012-08-18 14:15:00',5,NULL,2,18,22,NULL,NULL,NULL),(11,'2012-08-18 15:15:00',5,NULL,NULL,52,44,NULL,NULL,NULL),(12,'2012-08-18 09:00:00',4,NULL,NULL,26,43,NULL,NULL,NULL),(13,'2012-08-18 09:30:00',4,NULL,NULL,35,57,NULL,NULL,NULL),(14,'2012-08-18 09:30:00',7,NULL,NULL,34,11,NULL,NULL,NULL),(15,'2012-08-18 10:00:00',4,NULL,NULL,39,27,NULL,NULL,NULL),(16,'2012-08-18 10:30:00',4,NULL,NULL,54,28,NULL,NULL,NULL),(17,'2012-08-18 10:30:00',6,NULL,NULL,39,32,NULL,NULL,NULL),(18,'2012-08-18 10:30:00',7,NULL,NULL,14,29,NULL,NULL,NULL),(19,'2012-08-18 11:00:00',4,NULL,NULL,43,19,NULL,NULL,NULL),(20,'2012-08-18 11:00:00',5,NULL,NULL,57,17,NULL,NULL,NULL),(21,'2012-08-18 11:30:00',4,NULL,NULL,11,36,NULL,NULL,NULL),(22,'2012-08-18 11:30:00',7,NULL,NULL,27,38,NULL,NULL,NULL),(23,'2012-08-18 13:00:00',4,NULL,NULL,28,12,NULL,NULL,NULL),(24,'2012-08-18 13:00:00',6,NULL,NULL,32,51,NULL,NULL,NULL),(25,'2012-08-18 13:30:00',4,NULL,NULL,29,30,NULL,NULL,NULL),(26,'2012-08-18 13:30:00',7,NULL,NULL,19,26,NULL,NULL,NULL),(27,'2012-08-18 14:00:00',4,NULL,NULL,17,35,NULL,NULL,NULL),(28,'2012-08-18 14:00:00',5,NULL,NULL,36,34,NULL,NULL,NULL),(29,'2012-08-18 14:30:00',4,NULL,NULL,38,25,NULL,NULL,NULL),(30,'2012-08-18 14:30:00',6,NULL,NULL,12,54,NULL,NULL,NULL),(31,'2012-08-18 14:30:00',7,NULL,NULL,51,39,NULL,NULL,NULL),(32,'2012-08-18 14:30:00',8,NULL,NULL,30,14,NULL,NULL,NULL),(33,'2012-08-18 09:00:00',6,NULL,NULL,56,24,NULL,NULL,NULL),(34,'2012-08-18 09:30:00',6,NULL,NULL,13,59,NULL,NULL,NULL),(35,'2012-08-18 10:00:00',6,NULL,NULL,16,48,NULL,NULL,NULL),(36,'2012-08-18 11:00:00',6,NULL,NULL,24,42,NULL,NULL,NULL),(37,'2012-08-18 11:30:00',6,NULL,NULL,59,16,NULL,NULL,NULL),(38,'2012-08-18 13:30:00',6,NULL,NULL,56,42,NULL,NULL,NULL),(39,'2012-08-18 14:00:00',6,NULL,NULL,48,13,NULL,NULL,NULL),(40,'2012-08-18 15:00:00',4,NULL,NULL,13,16,NULL,NULL,NULL),(41,'2012-08-18 15:00:00',6,NULL,NULL,48,59,NULL,NULL,NULL),(42,'2012-08-18 09:00:00',8,NULL,NULL,53,20,NULL,NULL,NULL),(43,'2012-08-18 09:30:00',8,NULL,NULL,50,58,NULL,NULL,NULL),(44,'2012-08-18 10:00:00',8,NULL,NULL,20,47,NULL,NULL,NULL),(45,'2012-08-18 10:30:00',8,NULL,NULL,58,9,NULL,NULL,NULL),(46,'2012-08-18 11:00:00',8,NULL,NULL,47,41,NULL,NULL,NULL),(47,'2012-08-18 11:30:00',8,NULL,NULL,9,33,NULL,NULL,NULL),(48,'2012-08-18 13:00:00',8,NULL,NULL,41,53,NULL,NULL,NULL),(49,'2014-08-16 08:30:00',4,NULL,2,37,18,NULL,NULL,NULL),(51,'2014-08-16 09:30:00',6,NULL,2,46,52,NULL,NULL,NULL);
/*!40000 ALTER TABLE `es_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_game_place`
--

DROP TABLE IF EXISTS `es_game_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_game_place` (
  `id_game_place` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_venue` int(11) NOT NULL,
  PRIMARY KEY (`id_game_place`),
  KEY `id_venue` (`id_venue`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_game_place`
--

LOCK TABLES `es_game_place` WRITE;
/*!40000 ALTER TABLE `es_game_place` DISABLE KEYS */;
INSERT INTO `es_game_place` VALUES (4,'A',1),(5,'B',1),(6,'C',1),(7,'D',1),(8,'E',1);
/*!40000 ALTER TABLE `es_game_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_group`
--

DROP TABLE IF EXISTS `es_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_group` (
  `id_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT '1' COMMENT '1 - ATIVO; 0 - INATIVO',
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_group`
--

LOCK TABLES `es_group` WRITE;
/*!40000 ALTER TABLE `es_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_score`
--

DROP TABLE IF EXISTS `es_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_score` (
  `id_score` int(11) NOT NULL AUTO_INCREMENT,
  `id_subscription` int(11) DEFAULT NULL,
  `id_game` int(11) DEFAULT NULL,
  `period` varchar(4) DEFAULT NULL COMMENT 'Template: #R or #T (R for regular period and T for tie period)',
  `id_score_type` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_score`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_score`
--

LOCK TABLES `es_score` WRITE;
/*!40000 ALTER TABLE `es_score` DISABLE KEYS */;
INSERT INTO `es_score` VALUES (1,46,2,NULL,1,1,'2014-04-27 03:24:48'),(2,130,2,NULL,1,1,'2014-04-27 03:24:49'),(3,45,49,NULL,1,1,'2014-05-22 02:26:26');
/*!40000 ALTER TABLE `es_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_score_type`
--

DROP TABLE IF EXISTS `es_score_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_score_type` (
  `id_score_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_score_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_score_type`
--

LOCK TABLES `es_score_type` WRITE;
/*!40000 ALTER TABLE `es_score_type` DISABLE KEYS */;
INSERT INTO `es_score_type` VALUES (1,'Gol'),(2,'Falta'),(3,'Cartão Vermelho'),(4,'Cartão Amarelo'),(5,'Substituição');
/*!40000 ALTER TABLE `es_score_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_sport_type`
--

DROP TABLE IF EXISTS `es_sport_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_sport_type` (
  `id_sport_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `maxes_athlete` tinyint(4) DEFAULT NULL,
  `mines_athlete` tinyint(4) DEFAULT NULL,
  `num_athlete_line` tinyint(4) DEFAULT NULL,
  `playmode` tinyint(1) DEFAULT NULL COMMENT '0:single; 1:team',
  `num_period` tinyint(2) DEFAULT NULL,
  `duration_period` int(3) DEFAULT NULL COMMENT 'Duration of each regular period in minutes; leave blank if no time limit applies.',
  `num_tie_period` tinyint(1) DEFAULT NULL,
  `num_duration_tie` int(3) DEFAULT NULL COMMENT 'Duration of each tie period in minutes; leave blank if no time limit applies.',
  `num_initial_penaltie` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_sport_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_sport_type`
--

LOCK TABLES `es_sport_type` WRITE;
/*!40000 ALTER TABLE `es_sport_type` DISABLE KEYS */;
INSERT INTO `es_sport_type` VALUES (1,'Futsal',12,6,5,1,2,NULL,2,NULL,3);
/*!40000 ALTER TABLE `es_sport_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_subscription`
--

DROP TABLE IF EXISTS `es_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_subscription` (
  `id_subscription` int(11) NOT NULL AUTO_INCREMENT,
  `id_athlete` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `jersey_num` int(3) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'INATIVO' COMMENT 'ATIVO; INATIVO',
  `id_event` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_subscription`),
  KEY `id_team` (`id_team`),
  KEY `id_athlete` (`id_athlete`)
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_subscription`
--

LOCK TABLES `es_subscription` WRITE;
/*!40000 ALTER TABLE `es_subscription` DISABLE KEYS */;
INSERT INTO `es_subscription` VALUES (25,9,11,8,'1',NULL),(26,20,10,1,'1',NULL),(27,19,10,8,'1',NULL),(28,12,10,7,'1',NULL),(30,15,10,4,'1',NULL),(31,18,10,6,'1',NULL),(32,17,10,5,'1',NULL),(34,16,10,2,'1',NULL),(35,22,10,9,'1',NULL),(36,32,15,1,'1',NULL),(37,37,15,9,'1',NULL),(38,36,15,8,'1',NULL),(39,35,15,11,'1',NULL),(40,39,15,10,'1',NULL),(41,40,15,5,'1',NULL),(42,34,15,2,'1',NULL),(43,38,15,7,'1',NULL),(44,33,15,4,'1',NULL),(45,63,18,14,'1',2),(46,60,18,1,'1',2),(47,61,18,8,'1',2),(48,62,18,4,'1',2),(49,64,18,7,'1',2),(50,65,18,9,'1',2),(53,78,17,4,'1',NULL),(54,50,17,13,'1',NULL),(56,49,17,8,'1',NULL),(58,53,17,5,'1',NULL),(59,48,17,7,'1',NULL),(60,90,27,11,'1',NULL),(61,88,27,7,'1',NULL),(62,80,27,9,'1',NULL),(63,89,27,10,'1',NULL),(64,86,27,8,'1',NULL),(65,85,27,1,'1',NULL),(66,84,27,5,'1',NULL),(67,81,27,23,'1',NULL),(68,93,26,6,'1',NULL),(69,92,26,3,'1',NULL),(70,94,26,9,'1',NULL),(71,96,26,7,'1',NULL),(72,95,26,11,'1',NULL),(73,91,26,10,'1',NULL),(74,97,26,1,'1',NULL),(75,100,26,14,'1',NULL),(76,101,26,15,'1',NULL),(77,99,26,12,'1',NULL),(79,105,28,9,'1',NULL),(80,107,28,8,'1',NULL),(81,103,28,10,'1',NULL),(83,104,28,4,'1',NULL),(84,106,28,3,'1',NULL),(85,108,28,2,'1',NULL),(86,109,28,1,'1',NULL),(87,130,29,2,'1',NULL),(88,127,29,3,'1',NULL),(89,128,29,4,'1',NULL),(90,125,29,5,'1',NULL),(91,129,29,6,'1',NULL),(92,126,29,7,'1',NULL),(93,132,10,3,'1',NULL),(94,133,10,11,'1',NULL),(95,26,9,1,'1',NULL),(96,24,9,8,'1',NULL),(97,112,9,7,'1',NULL),(98,110,9,11,'1',NULL),(99,111,9,13,'1',NULL),(100,31,9,9,'1',NULL),(101,135,9,10,'1',NULL),(102,136,13,7,'1',NULL),(103,140,13,8,'1',NULL),(104,139,13,4,'1',NULL),(105,23,13,2,'1',NULL),(106,137,13,10,'1',NULL),(107,138,13,1,'1',NULL),(108,146,11,3,'1',NULL),(109,145,11,5,'1',NULL),(110,141,11,2,'1',NULL),(111,147,11,1,'1',NULL),(112,142,11,21,'1',NULL),(113,144,11,7,'1',NULL),(114,143,11,10,'1',NULL),(115,148,12,19,'1',NULL),(117,153,12,1,'1',NULL),(118,152,12,6,'1',NULL),(119,151,12,13,'1',NULL),(121,150,12,9,'1',NULL),(122,154,12,4,'1',NULL),(123,155,13,5,'1',NULL),(124,156,13,3,'1',NULL),(125,52,17,22,'1',NULL),(126,47,17,1,'1',NULL),(127,169,18,10,'1',2),(129,170,18,26,'1',2),(130,164,18,3,'1',2),(131,165,18,6,'1',2),(132,69,19,7,'1',NULL),(133,163,19,1,'1',NULL),(134,70,19,10,'1',NULL),(135,72,19,11,'1',NULL),(136,74,19,51,'1',NULL),(137,71,19,80,'1',NULL),(138,161,19,90,'1',NULL),(139,73,19,6,'1',NULL),(140,175,20,10,'1',NULL),(141,173,20,7,'1',NULL),(142,172,20,8,'1',NULL),(143,174,20,1,'1',NULL),(144,197,12,17,'1',NULL),(146,206,38,2,'1',NULL),(147,198,38,7,'1',NULL),(148,205,38,5,'1',NULL),(149,199,38,10,'1',NULL),(150,204,38,9,'1',NULL),(151,201,38,3,'1',NULL),(152,208,38,4,'1',NULL),(153,203,38,11,'1',NULL),(154,200,38,8,'1',NULL),(155,207,38,6,'1',NULL),(156,209,18,11,'1',2),(157,214,11,11,'1',NULL),(158,224,20,2,'1',NULL),(159,223,20,9,'1',NULL),(161,267,44,1,'1',NULL),(162,264,44,2,'1',NULL),(163,266,44,3,'1',NULL),(164,263,44,4,'1',NULL),(165,262,44,5,'1',NULL),(166,269,44,6,'1',NULL),(167,268,44,7,'1',NULL),(168,270,44,8,'1',NULL),(169,265,44,9,'1',NULL),(170,261,44,10,'1',NULL),(171,274,46,1,'1',NULL),(172,275,46,2,'1',NULL),(173,272,46,3,'1',NULL),(174,273,46,4,'1',NULL),(175,277,46,5,'1',NULL),(176,276,46,6,'1',NULL),(177,271,46,7,'1',NULL),(178,283,45,1,'1',NULL),(179,279,45,2,'1',NULL),(180,281,45,3,'1',NULL),(181,278,45,4,'1',NULL),(182,280,45,5,'1',NULL),(183,282,45,6,'1',NULL),(184,287,34,1,'1',NULL),(186,284,34,3,'1',NULL),(187,290,34,4,'1',NULL),(189,295,34,6,'1',NULL),(190,285,34,7,'1',NULL),(191,289,34,8,'1',NULL),(192,288,34,9,'1',NULL),(193,291,34,10,'1',NULL),(194,293,34,11,'1',NULL),(195,292,34,12,'1',NULL),(196,300,42,1,'1',NULL),(197,297,42,2,'1',NULL),(198,299,42,3,'1',NULL),(199,296,42,4,'1',NULL),(200,298,42,5,'1',NULL),(201,310,41,1,'1',NULL),(202,306,41,2,'1',NULL),(203,305,41,3,'1',NULL),(204,307,41,4,'1',NULL),(205,303,41,5,'1',NULL),(206,301,41,6,'1',NULL),(207,304,41,7,'1',NULL),(208,308,41,8,'1',NULL),(209,302,41,9,'1',NULL),(210,309,41,10,'1',NULL),(211,325,43,1,'1',NULL),(212,323,43,2,'1',NULL),(213,311,43,3,'1',NULL),(214,321,43,4,'1',NULL),(215,319,43,5,'1',NULL),(216,317,43,6,'1',NULL),(217,312,43,7,'1',NULL),(218,322,43,1,'1',NULL),(219,316,43,9,'1',NULL),(220,327,35,1,'1',NULL),(221,329,35,2,'1',NULL),(222,336,35,3,'1',NULL),(223,331,35,4,'1',NULL),(224,338,35,5,'1',NULL),(225,334,35,6,'1',NULL),(226,332,35,7,'1',NULL),(228,239,21,1,'1',NULL),(230,236,21,22,'1',NULL),(231,240,21,7,'1',NULL),(232,238,21,5,'1',NULL),(233,246,22,2,'1',2),(234,243,22,12,'1',2),(235,244,22,13,'1',2),(236,242,22,11,'1',2),(237,245,22,21,'1',2),(238,337,23,2,'1',NULL),(239,251,23,3,'1',NULL),(240,249,23,5,'1',NULL),(241,254,23,1,'1',NULL),(242,253,23,7,'1',NULL),(243,335,23,4,'1',NULL),(244,247,23,9,'1',NULL),(245,250,23,8,'1',NULL),(247,252,23,6,'1',NULL),(248,315,24,4,'1',NULL),(249,328,24,3,'1',NULL),(250,314,24,2,'1',NULL),(251,333,24,1,'1',NULL),(253,320,24,5,'1',NULL),(255,313,24,7,'1',NULL),(256,324,24,8,'1',NULL),(257,318,24,9,'1',NULL),(258,339,25,7,'1',NULL),(260,340,25,5,'1',NULL),(261,341,25,4,'1',NULL),(262,344,25,3,'1',NULL),(263,345,25,2,'1',NULL),(264,346,25,1,'1',NULL),(265,257,47,8,'1',NULL),(266,260,47,23,'1',NULL),(267,255,47,7,'1',NULL),(268,256,47,10,'1',NULL),(269,258,47,11,'1',NULL),(271,330,24,11,'1',NULL),(272,342,25,9,'1',NULL),(273,189,36,3,'1',NULL),(274,348,36,11,'1',NULL),(275,190,36,8,'1',NULL),(276,192,36,17,'1',NULL),(277,193,36,18,'1',NULL),(278,347,36,14,'1',NULL),(279,349,36,9,'1',NULL),(280,350,36,7,'1',NULL),(281,356,37,5,'1',NULL),(282,357,37,6,'1',NULL),(283,358,37,7,'1',NULL),(284,359,26,13,'1',NULL),(285,360,26,8,'1',NULL),(287,30,14,10,'1',NULL),(288,365,14,7,'1',NULL),(289,29,14,18,'1',NULL),(290,41,14,16,'1',NULL),(291,43,14,13,'1',NULL),(292,42,14,6,'1',NULL),(293,44,14,1,'1',NULL),(294,45,14,9,'1',NULL),(295,366,14,5,'1',NULL),(296,367,14,2,'1',NULL),(297,400,48,2,'1',NULL),(298,403,48,3,'1',NULL),(299,404,48,4,'1',NULL),(300,398,48,5,'1',NULL),(301,396,48,6,'1',NULL),(302,408,48,7,'1',NULL),(303,409,48,8,'1',NULL),(304,405,48,1,'1',NULL),(305,406,48,10,'1',NULL),(306,399,48,11,'1',NULL),(307,402,48,12,'1',NULL),(308,414,49,2,'1',NULL),(309,413,49,10,'1',NULL),(310,416,49,4,'1',NULL),(311,420,49,5,'1',NULL),(312,418,49,6,'1',NULL),(313,421,49,7,'1',NULL),(314,429,29,8,'1',NULL),(315,426,29,9,'1',NULL),(316,474,32,2,'1',NULL),(317,472,32,3,'1',NULL),(318,473,32,4,'1',NULL),(319,470,32,5,'1',NULL),(320,475,32,6,'1',NULL),(321,476,32,7,'1',NULL),(322,471,32,1,'1',NULL),(323,469,32,8,'1',NULL),(324,477,18,12,'1',2),(325,98,27,6,'1',NULL),(326,478,27,2,'1',NULL),(327,487,42,6,'1',NULL),(328,491,35,8,'1',NULL),(329,492,28,7,'1',NULL),(333,364,39,91,'1',NULL),(334,363,39,5,'1',NULL),(339,507,21,2,'1',NULL),(340,506,25,8,'1',NULL),(341,241,22,8,'1',2),(342,505,39,22,'1',NULL),(343,502,39,23,'1',NULL),(344,501,39,11,'1',NULL),(345,508,39,17,'1',NULL),(346,509,16,13,'1',NULL),(347,510,16,1,'1',NULL),(348,479,50,7,'1',NULL),(349,481,50,9,'1',NULL),(350,483,50,5,'1',NULL),(351,482,50,10,'1',NULL),(352,484,50,2,'1',NULL),(353,480,50,3,'1',NULL),(354,512,16,2,'1',NULL),(355,511,16,3,'1',NULL),(356,513,16,4,'1',NULL),(357,514,16,5,'1',NULL),(358,210,30,2,'1',NULL),(359,495,30,3,'1',NULL),(360,497,30,4,'1',NULL),(361,494,30,5,'1',NULL),(362,488,30,6,'1',NULL),(363,490,30,1,'1',NULL),(364,489,30,7,'1',NULL),(365,496,30,8,'1',NULL),(366,503,30,9,'1',NULL),(367,158,30,10,'1',NULL),(368,118,33,2,'1',NULL),(369,500,33,3,'1',NULL),(370,498,33,4,'1',NULL),(371,117,33,5,'1',NULL),(372,504,33,6,'1',NULL),(373,499,33,7,'1',NULL),(374,352,37,1,'1',NULL),(375,196,37,2,'1',NULL),(376,353,37,3,'1',NULL),(377,355,37,4,'1',NULL),(378,194,36,1,'1',NULL),(379,191,36,2,'1',NULL),(380,195,36,4,'1',NULL),(381,354,37,8,'1',NULL),(383,388,52,1,'1',NULL),(384,389,52,2,'1',NULL),(385,390,52,3,'1',NULL),(387,391,52,5,'1',NULL),(388,394,52,6,'1',NULL),(389,392,52,7,'1',NULL),(390,393,52,15,'1',NULL),(392,387,52,4,'1',NULL),(393,368,53,1,'1',NULL),(394,369,53,7,'1',NULL),(395,370,53,3,'1',NULL),(397,372,53,6,'1',NULL),(398,373,53,2,'1',NULL),(400,375,53,11,'1',NULL),(401,376,53,9,'1',NULL),(402,377,54,1,'1',NULL),(404,379,54,3,'1',NULL),(405,380,54,11,'1',NULL),(406,381,54,5,'1',NULL),(407,382,54,6,'1',NULL),(408,383,54,7,'1',NULL),(409,384,54,8,'1',NULL),(411,448,55,1,'1',NULL),(412,467,55,2,'1',NULL),(413,447,55,10,'1',NULL),(414,435,55,4,'1',NULL),(415,454,55,9,'1',NULL),(416,453,55,6,'1',NULL),(417,452,55,7,'1',NULL),(418,450,55,9,'1',NULL),(433,424,56,1,'1',NULL),(434,427,56,2,'1',NULL),(439,433,56,3,'1',NULL),(446,423,56,6,'1',NULL),(447,428,56,3,'1',NULL),(449,466,55,10,'1',NULL),(450,451,55,11,'1',NULL),(454,79,17,2,'1',NULL),(455,51,17,12,'1',NULL),(456,527,21,3,'1',NULL),(457,343,25,6,'1',NULL),(458,259,47,1,'1',NULL),(459,528,54,19,'1',NULL),(460,529,16,6,'1',NULL),(461,525,51,1,'1',NULL),(462,518,51,2,'1',NULL),(463,517,51,3,'1',NULL),(464,519,51,4,'1',NULL),(465,520,51,5,'1',NULL),(466,526,51,6,'1',NULL),(467,523,51,7,'1',NULL),(468,521,51,8,'1',NULL),(469,524,51,9,'1',NULL),(470,516,51,10,'1',NULL),(471,515,51,11,'1',NULL),(472,530,21,4,'1',NULL),(473,202,38,1,'1',NULL),(474,237,22,10,'1',2),(475,531,17,11,'1',NULL),(476,457,57,1,'1',NULL),(477,465,57,2,'1',NULL),(478,464,57,3,'1',NULL),(479,462,57,4,'1',NULL),(480,461,57,5,'1',NULL),(481,463,57,6,'1',NULL),(482,456,57,11,'1',NULL),(483,460,57,6,'1',NULL),(484,459,57,9,'1',NULL),(485,401,57,11,'1',NULL),(486,532,57,8,'1',NULL),(487,534,52,4,'1',NULL),(488,533,52,11,'1',NULL),(489,535,55,11,'1',NULL),(491,439,58,2,'1',NULL),(493,446,58,4,'1',NULL),(494,434,58,6,'1',NULL),(495,449,58,5,'1',NULL),(496,440,58,7,'1',NULL),(497,536,58,8,'1',NULL),(498,425,56,5,'1',NULL),(499,430,56,7,'1',NULL),(500,468,59,4,'1',NULL),(501,419,59,3,'1',NULL),(503,407,59,1,'1',NULL),(504,395,59,6,'1',NULL),(505,412,59,7,'1',NULL),(506,411,59,3,'1',NULL),(507,537,42,8,'1',NULL),(508,538,42,9,'1',NULL),(509,539,59,2,'1',NULL),(511,540,42,7,'1',NULL),(512,541,39,9,'1',NULL),(513,542,39,50,'1',NULL),(514,543,9,20,'1',NULL),(515,544,24,10,'1',NULL),(516,545,25,10,'1',NULL),(517,386,52,1,'1',NULL),(518,374,53,4,'1',NULL),(519,371,53,5,'1',NULL),(520,378,54,10,'1',NULL),(566,49,72,NULL,'1',2),(569,200,67,NULL,'1',2),(570,202,67,NULL,'1',2),(571,203,67,NULL,'1',2),(572,205,67,NULL,'1',2);
/*!40000 ALTER TABLE `es_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_team`
--

DROP TABLE IF EXISTS `es_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_team` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_association` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  `jersey_main_color` varchar(50) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'ATIVO' COMMENT 'INATIVO; ATIVO',
  `group_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_team`),
  KEY `id_association` (`id_association`),
  KEY `id_event` (`id_event`),
  KEY `id_category` (`id_category`),
  KEY `es_equip_ibfk_4` (`id_group`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_team`
--

LOCK TABLES `es_team` WRITE;
/*!40000 ALTER TABLE `es_team` DISABLE KEYS */;
INSERT INTO `es_team` VALUES (9,'Pinda Junior',20,1,3,NULL,'#ffffff','1','B'),(10,'Pinda Mirim',20,1,4,NULL,'#ffffff','1','A'),(11,'Pinda Senior 1',20,1,2,NULL,'#fffcff','1','C'),(12,'Pinda Senior A',20,1,2,NULL,'#ffffff','1','E'),(13,'Pinda Master',20,1,5,NULL,'#ffffff','1','B'),(14,'Pinheiros',21,1,2,NULL,'#00a305','1','G'),(15,'Pinheiros',21,1,4,NULL,'#008a15','1','A'),(16,'Pinheiros',21,1,5,NULL,'#00a621','1','B'),(17,'Curitiba',27,1,2,NULL,'#00851f','1','B'),(18,'OxigÃªnio',22,1,1,NULL,'#4297ff','1','A'),(19,'Burakku',22,1,2,NULL,'#000000','1','A'),(20,'LOL',22,1,3,NULL,'#fafafa','1','A'),(21,'Go Girls FC',23,1,1,NULL,'#ffffff','1','B'),(22,' Sj.D.B.C',23,1,1,NULL,'','1','A'),(23,'Guerreiros do Futsal',23,1,4,NULL,'#ffffff','1','B'),(24,'Homens',23,1,5,NULL,'#ffffff','1','A'),(25,'Jovens',23,1,2,NULL,'','1','D'),(26,'Dread Lions',10,1,2,NULL,'','1','A'),(27,'Happy Team - I',10,1,2,NULL,'#bf3dbf','1','D'),(28,'Happy Team - II',10,1,2,NULL,'','1','E'),(29,'Time do Maguila',10,1,2,NULL,'','1','G'),(30,'SÃ£o Remo',24,1,2,NULL,'','1','G'),(32,'SeleÃ§Ã£o IMEL LIBOLAS',16,1,2,NULL,'#ff0f0f','1','F'),(33,'SÃ£o Remo',24,1,3,NULL,'','1','B'),(34,'Jabulani',25,1,2,NULL,'#ffffff','1','C'),(35,'Ailbib',25,1,2,NULL,'#ffffff','1','B'),(36,'Embura',11,1,2,NULL,'#3d373d','1','C'),(37,'Sakura de Embura',11,1,1,NULL,'','1','B'),(38,'Campinas',5,1,2,NULL,'#0800fa','1','D'),(39,'Schrolensburg',17,1,2,NULL,'#2b00d6','1','F'),(41,'The Avengers',25,1,3,NULL,'#ffffff','1','A'),(42,'Super Marios',25,1,5,NULL,'','1','A'),(43,'SaÃºde 1',25,1,2,NULL,'','1','A'),(44,'Saudetes',25,1,1,NULL,'','1','A'),(45,'Super SaÃºde',25,1,4,NULL,'','1','B'),(46,'Vovozelas',25,1,1,NULL,'','1','B'),(47,'Dream Team',23,1,3,NULL,'','1','A'),(48,'Time Master System',10,1,5,NULL,'#121112','1','B'),(49,'Time dos Fraldinhas',10,1,4,NULL,'','1','A'),(50,'Diadema Futebol Clube',10,1,3,NULL,'','1','B'),(51,'Itapevi',12,1,2,NULL,'#000000','1','F'),(52,'SRKB',7,1,1,NULL,'','1','A'),(53,'Sorocaba Junior 1',7,1,3,NULL,'','1','A'),(54,'Sorocaba Senior 1',7,1,2,NULL,'','1','E'),(55,'Sorocaba Mirim',7,1,4,NULL,'','1','B'),(56,'Sorocaba Master 1',7,1,5,NULL,'','1','A'),(57,'Sorocaba Senior 2',7,1,2,NULL,'','1','B'),(58,'Sorocaba Junior 2',7,1,3,NULL,'','1','B'),(59,'Sorocaba Master 2',7,1,5,NULL,'','1','B'),(65,'SeleÃ§Ã£o IMEL LIBOLAS',16,1,2,NULL,'#010101','1',NULL),(66,'SeleÃ§Ã£o IMEL LIBOLAS',16,1,2,NULL,'#010101','1',NULL),(67,'Chelsea FC',5,2,2,NULL,'#0031c2','1',NULL),(69,'Manchester United FC',10,2,2,NULL,'#f50000','1',NULL),(72,'Liverpool FC',27,2,2,NULL,'#f5c900','1',NULL),(75,'Campinas FC',5,2,5,NULL,'#a51d1d','1',NULL),(76,'Campinas FC',5,2,3,NULL,'#2138ed','1',NULL);
/*!40000 ALTER TABLE `es_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_user`
--

DROP TABLE IF EXISTS `es_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `phone` int(10) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `profile` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:user; 1:club-representative; 2: team-representative; 3:admin',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:inactive; 1:active',
  `id_association` int(11) DEFAULT NULL,
  `rg` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_user`
--

LOCK TABLES `es_user` WRITE;
/*!40000 ALTER TABLE `es_user` DISABLE KEYS */;
INSERT INTO `es_user` VALUES (1,'jakeline_sugimura@hotmail.com','yGmIPruz','jakeline Ay','sugimura','jakeline_sugimura@hotmail.com','1993-08-08',1591821150,'','',0,1,NULL,'',NULL,NULL),(2,'emburaman','lucas1510','Lincoln','Souza','emburaman@yahoo.com.br','1979-11-07',NULL,'','',3,1,5,'','',1),(3,'reinaldo','r3in4ld0','Reinaldo','Simizu','reinaldo.simizu@gmail.com','2012-04-05',NULL,'','',3,1,5,'',NULL,1),(4,'luana.simizu@gmail.com','luana123','Luana','Simizu','luana.simizu@gmail.com','1981-07-11',NULL,'','',0,1,5,'',NULL,1),(5,'msnakaya99@gmail.com','R36TIS8e','Mauro Satoshi','Nakaya','msnakaya99@gmail.com','0000-00-00',NULL,'','',0,1,5,'',NULL,NULL),(8,'jito','jito.123','Juliano','Ito','juliano.ito@gmail.com ','0000-00-00',NULL,NULL,NULL,1,1,5,NULL,NULL,NULL),(9,'dsugahara','dsugahara.123','Danilo','Sugahara','danyukio@gmail.com','0000-00-00',NULL,NULL,NULL,1,1,10,NULL,NULL,NULL),(10,'kmiura','kmiura.123','Kiyoiti','Miura','kmvmiura@terra.com.br','0000-00-00',NULL,NULL,NULL,1,1,11,NULL,NULL,NULL),(11,'mfujimoto','mfujimoto.123','Márcio','Fujimoto','fujimarcio@yahoo.com.br','0000-00-00',NULL,NULL,NULL,1,1,12,NULL,NULL,NULL),(12,'wgonçalves','wgonçalves.123','William','Gonçalves','williamgoncalves75@yahoo.com.br','0000-00-00',NULL,NULL,NULL,1,1,15,NULL,NULL,NULL),(13,'purbieta','purbieta.123','Pablo','Urbieta','pablourbieta@gmail.com','0000-00-00',NULL,NULL,NULL,1,1,16,NULL,NULL,NULL),(14,'ffurukawa','ffurukawa.123','FlÃ¡vio','Furukawa','furuka@gmail.com','1970-01-01',0,NULL,NULL,1,1,17,'','',NULL),(15,'wfukai','wfukai.123','Wilson','Fukai','wilsonfukai@ig.com.br','0000-00-00',NULL,NULL,NULL,1,1,18,NULL,NULL,NULL),(16,'larai','larai.123','Lucas','Arai','lucas_arai@hotmail.com','0000-00-00',NULL,NULL,NULL,1,0,20,NULL,NULL,NULL),(17,'syamada','syamada.123','Silas','Yamada','silasmy@yahoo.com.br','0000-00-00',NULL,NULL,NULL,1,1,21,NULL,NULL,NULL),(18,'vmoreira','vmoreira.123','Vinicius','Moreira','vinicius.moreira@grecofilho.com.br','0000-00-00',NULL,NULL,NULL,1,1,22,NULL,NULL,NULL),(19,'pfernandes','pfernandes.123','Polyana','Fernandes','souapoly@gmail.com','0000-00-00',NULL,NULL,NULL,1,1,23,NULL,NULL,NULL),(20,'emiyahira','emiyahira.123','Elbio','Miyahira','elbio.miyahira@imel.org.br','0000-00-00',NULL,NULL,NULL,1,1,24,NULL,NULL,NULL),(21,'oizunmi','oizunmi.123','Otávio','Izunmi','otavioryoizumi@gmail.com','0000-00-00',NULL,NULL,NULL,1,1,25,NULL,NULL,NULL),(22,'nhiranobe','nhiranobe.123','Noboru','Hiranobe','noboru.hiranobe@kyocera-componentes.com.br','0000-00-00',NULL,NULL,NULL,1,1,7,NULL,NULL,NULL),(23,'nmurahara','nmurahara.123','Natália','Murahara','natae@ig.com.br','0000-00-00',NULL,NULL,NULL,1,1,26,NULL,NULL,NULL),(26,'Rafael','shoyufeio','Rafael','Arai','rafaelarai@hotmail.com','1998-04-15',1236451567,'@RafaelArai','http://http://www.facebook.com/rafael.arai',0,1,20,'37.248.327-6',NULL,NULL),(27,'lucasarai@gmail.com','Yo3X857Z','Lucas','Arai','lucasarai@gmail.com','1991-07-13',NULL,'','',0,0,20,'',NULL,NULL),(28,'enzonakao@gmail.com','eXziD6NE','Enzo','Pereira','enzonakao@gmail.com','2001-08-08',NULL,'','',0,1,20,'',NULL,NULL),(29,'lucasarai@gmail.com','S51eBta9','Thiago','Santos','lucasarai@gmail.com','2001-11-28',NULL,'','',0,1,20,'',NULL,NULL),(30,'lucasarai@gmail.com','qh2bUtNZ','Guilherme','Marcondes','lucasarai@gmail.com','2001-11-14',NULL,'','',0,1,20,'',NULL,NULL),(31,'jorgeluiz_2cart@ig.com.br','aLY7TZ9U','Jhonatan','Santos','jorgeluiz_2cart@ig.com.br','2004-05-03',NULL,'','',0,1,20,'',NULL,NULL),(32,'lucasarai@gmail.com','VJIuXUaA','Thiago','Santos','lucasarai@gmail.com','2001-11-28',NULL,'','',0,1,20,'',NULL,NULL),(33,'lucasarai@gmail.com','sEBu7WjH','JoÃ£o Vitor','Cordeiro','lucasarai@gmail.com','2004-05-13',NULL,'','',0,1,20,'','',NULL),(34,'lucasarai@gmail.com','D3E2uB5R','Felipe','Souza','lucasarai@gmail.com','2003-02-13',NULL,'','',0,1,20,'',NULL,NULL),(35,'lucasarai@gmail.com','6P9LapIN','Bruno','Prates','lucasarai@gmail.com','2004-10-19',NULL,'','',0,1,20,'',NULL,NULL),(36,'lucasarai@gmail.com','5GtpNibq','Eduardo','Iwamoto de Oliveira','lucasarai@gmail.com','2002-05-29',NULL,'','',0,1,20,'',NULL,NULL),(37,'lucasarai@gmail.com','pbHBLq1V','Nehuen','Alvarez','lucasarai@gmail.com','2001-10-29',NULL,'','',0,1,20,'',NULL,NULL),(38,'lucasarai@gmail.com','vostUd80','Victor','Santos','lucasarai@gmail.com','2003-02-13',NULL,'','',0,1,20,'',NULL,NULL),(39,'jorgeluiz_2cart@ig.com.br','IeDhQRPE','Marcos','Marcondes','jorgeluiz_2cart@ig.com.br','1970-08-05',NULL,'','',0,1,20,'',NULL,NULL),(40,'rafaelarai@hotmail.com','mXg1WE3B','Rafael','Arai','rafaelarai@hotmail.com','1998-04-15',NULL,'','',0,1,20,'',NULL,NULL),(41,'lucasarai@gmail.com','5m9PuZsp','Leonardo','Aboud','lucasarai@gmail.com','1999-02-21',NULL,'','',0,1,20,'',NULL,NULL),(42,'gustavo.akiyoshi2012@gmail.com','JsivyEAg','Gustavo','Aoki','gustavo.akiyoshi2012@gmail.com','1997-09-09',NULL,'','',0,1,20,'',NULL,NULL),(43,'tiago.moura.lobao@hotmail.com','ZPMXtSRD','Tiago','Oliveira','tiago.moura.lobao@hotmail.com','1981-04-12',NULL,'','',0,1,20,'',NULL,NULL),(44,'eduardo_tadashi1@hotmail.com','YIvnhHit','Eduardo','Matsumoto','eduardo_tadashi1@hotmail.com','1990-05-16',NULL,'','',0,1,21,'363447210',NULL,NULL),(45,'danilo.suzuki.3@facebook.com','SZ8BT5sP','Danilo','Suzuki','danilo.suzuki.3@facebook.com','1988-09-02',NULL,'','',0,1,21,'',NULL,NULL),(46,'lucasarai@gmail.com','MYiq5VJm','Leonardo','Aboud','lucasarai@gmail.com','1999-02-21',NULL,'','',0,1,20,'',NULL,NULL),(47,'willbc','4056will','William','Bomfim Campos','willbomfim@hotmail.com','1991-09-25',1181407567,'','',0,1,NULL,'354124626',NULL,NULL),(48,'andresato@naotememail.com','JmonIb3B','AndrÃ©','Sato','andresato@naotememail.com','2001-01-01',NULL,'','',0,1,21,'39436126-x','',NULL),(49,'dalton@naotememail.com','qEHS1MA5','Dalton','Kuroyanaji','dalton@naotememail.com','2003-01-01',NULL,'','',0,1,21,'','',NULL),(50,'danilo@naotememail.com','365pve1I','Danilo','Gakimoto','danilo@naotememail.com','2005-01-01',NULL,'','',0,1,21,'',NULL,NULL),(51,'estevao@naotememail.com','0q9SHy1I','EstevÃ£o ','Rodrigues','estevao@naotememail.com','2002-01-01',NULL,'','',0,1,21,'56624655-0','',NULL),(52,'lucas@naotememail.com','Q7A8Ngj1','Lucas ','Matsuda','lucas@naotememail.com','2000-01-01',NULL,'','',0,1,21,'52781161-1',NULL,NULL),(53,'marcos@naotememail.com','YdhSTR8I','Marcos','Mombi','marcos@naotememail.com','2003-01-01',NULL,'','',0,1,21,'',NULL,NULL),(54,'mateus@naotememail.com','jERyOztS','Mateus','Gerreira','mateus@naotememail.com','2000-01-01',NULL,'','',0,1,21,'',NULL,NULL),(55,'tito@naotememail.com','oyRbhDqI','Tito','Rodrigues','tito@naotememail.com','2000-01-01',NULL,'','',0,1,21,'56524637-9',NULL,NULL),(56,'vitor@naotememail.com','4eZ81ONy','Vitor','Takemoto','vitor@naotememail.com','2001-01-01',NULL,'','',0,1,21,'53782114-4',NULL,NULL),(57,'fabiocalcio@ig.com.br','B1OXzDsJ','Fabio','Piacente','fabiocalcio@ig.com.br','1982-04-16',NULL,'','',0,1,21,'28410306-8',NULL,NULL),(58,'rafael.sacifs@hotmail.com','avGuZp2D','Rafael','Ferreira','rafael.sacifs@hotmail.com','1976-12-22',NULL,'','',0,1,21,'27250435-x',NULL,NULL),(59,'mcempada@uol.com.br','vg75ASi9','Fernando','Ferreira','mcempada@uol.com.br','1980-11-06',NULL,'','',0,1,21,'27250436-1',NULL,NULL),(60,'renantenista@hotmail.com','pX8S0oRj','Renan','Gargan','renantenista@hotmail.com','1988-08-30',NULL,'','',0,1,21,'44679207-x',NULL,NULL),(61,'silasmy@yahoo.com.br','re8z9qOQ','Silas ','Yamada','silasmy@yahoo.com.br','1988-01-31',NULL,'','',0,1,21,'28489539-1',NULL,NULL),(62,'haidekis@hotmail.com','R1c4rdoH1d3ki','Ricardo','Hideki','haidekis@hotmail.com','1980-01-01',1111111111,'','',1,1,27,'',NULL,NULL),(63,'haidekis@hotmail.com','PVes6Wuh','Hideki','Silva','haidekis@hotmail.com','1985-10-11',NULL,'','',0,1,27,'41.794.879-7',NULL,NULL),(64,'drocha','d4v1droch4','David','Rocha','dvd.jr@hotmail.com','0000-00-00',1111111111,'','',1,1,7,'',NULL,NULL),(65,'andre_hayashida@hotmail.com','URpMVgBv','Andre','Hayashida','andre_hayashida@hotmail.com','1980-03-14',NULL,'','',0,1,27,'30297574-3',NULL,NULL),(66,'seidisato@hotmail.com','3GbRrXEp','Seidi','Sato','seidisato@hotmail.com','1969-08-02',NULL,'','',0,1,27,'3.960.320-9',NULL,NULL),(67,'haidekis@hotmail.com','JmOyW6GD','Hideki','Silva','haidekis@hotmail.com','1985-10-11',NULL,'','',0,1,27,'41.794.879-7',NULL,NULL),(68,'deise.nishi@gmail.com','d31s3n1sh1mur4','Deise','Nishimura','deise.nishi@gmail.com','0000-00-00',1111111111,'','',1,1,26,'',NULL,NULL),(69,'eygon@bol.com.br','OTq12oXs','Eygon','Yamaguti','eygon@bol.com.br','1987-09-30',NULL,'','',0,1,27,'9965656-5',NULL,NULL),(70,'madinho@hotmail.com','7T0H1dVa','Madison','Hayashi','madinho@hotmail.com','1978-09-20',NULL,'','',0,1,27,' 1.316.512-7 ',NULL,NULL),(71,'o_ricks@hotmail.com','6tronEzH','Ricardo ','GonÃ§alves','o_ricks@hotmail.com','1989-09-22',NULL,'','',0,1,27,'35421901-7 ','',NULL),(72,'nkg_marcos@hotmail.com','em41dLJS','Marcos','Nakaguishi','nkg_marcos@hotmail.com','1989-11-06',NULL,'','',0,1,27,'7749545-2 ',NULL,NULL),(73,'jeamornel@hotmail.com','Nz9eTodp','Jeferson','Marinho','jeamornel@hotmail.com','1984-06-26',NULL,'','',0,1,27,'8056929-7 ',NULL,NULL),(74,'jakeline_sugimura@hotmail.com','p7anIMUe','jakeline Ay','sugimura','jakeline_sugimura@hotmail.com','1993-08-08',NULL,'','',0,1,22,'',NULL,NULL),(75,'jakeline_sugimura@hotmail.com','s4yIvR1a','jakeline Ay','sugimura','jakeline_sugimura@hotmail.com','1993-08-08',NULL,'','',0,1,NULL,'',NULL,NULL),(76,'bruna.kaori.509@facebook.com','qTg1BAUL','Kaori','Yoasa','bruna.kaori.509@facebook.com','1996-08-08',NULL,'','',0,1,22,'',NULL,NULL),(77,'kemy_keminha@hotmail.com','tg2eaPrB','Mariana Akemi','Souza','kemy_keminha@hotmail.com','1993-01-23',NULL,'','',0,1,22,'',NULL,NULL),(78,'gabriela.miyuki.18@facebook.com','5Ue136Nj','Gabriela Miyuki','Oliveira','gabriela.miyuki.18@facebook.com','1995-02-09',NULL,'','',0,1,22,'',NULL,NULL),(79,'nicole.naomi.5076@facebook.com','RtPAYvMi','Nicole',' Goes','nicole.naomi.5076@facebook.com','1992-01-07',NULL,'','',0,1,22,'',NULL,NULL),(80,'cerejase@hotmail.com','pHRvqEYD','Sergilania','Santos','cerejase@hotmail.com','1992-11-21',NULL,'','',0,1,22,'',NULL,NULL),(81,'taniaregina.ishii@facebook.com','V8HZAnJs','Tania Regina','Ishii','taniaregina.ishii@facebook.com','1980-02-08',NULL,'','',0,1,22,'',NULL,NULL),(82,'taniaregina.ishii@facebook.com','sbi1zUSW','Tania Regina','Ishii','taniaregina.ishii@facebook.com','1980-02-08',NULL,'','',0,1,22,'',NULL,NULL),(83,'taniaregina.ishii@facebook.com','OmnAdgur','Tania Regina','Ishii','taniaregina.ishii@facebook.com','1980-02-08',NULL,'','',0,1,22,'',NULL,NULL),(84,'wsfujimoto@gmail.com','LDz4gQV2','willian','fugimoto','wsfujimoto@gmail.com','1983-06-03',NULL,'','',0,1,22,'',NULL,NULL),(85,'leonardomassahikomako.enohi@facebook.com','A4aYJWQ7','Mako ','Enohi','leonardomassahikomako.enohi@facebook.com','1981-08-29',NULL,'','',0,1,22,'',NULL,NULL),(86,'isac.ono@hotmail.com','PY5Er61z','isac','ono','isac.ono@hotmail.com','1984-12-04',NULL,'','',0,1,22,'',NULL,NULL),(87,'mitsu.sugimura@facebook.com','mdaXbuJv','mitsu','sugimura','mitsu.sugimura@facebook.com','1991-05-24',NULL,'','',0,1,22,'',NULL,NULL),(88,'alex.j.nagata@hotmail.com','s5Jt9Wj2','Alex','Nagata','alex.j.nagata@hotmail.com','1987-06-25',NULL,'','',0,1,22,'',NULL,NULL),(89,'gui10ps2@hotmail.com','s8EHeI5M','guilherme','Cabral','gui10ps2@hotmail.com','1993-09-10',NULL,'','',0,1,22,'',NULL,NULL),(90,'vinicius.moreira.5201@facebook.com','ovnymJAX','Vinicius ','Moreira','vinicius.moreira.5201@facebook.com','1991-12-28',NULL,'','',0,1,22,'',NULL,NULL),(91,'anderson.salles@hotmail.com','qYtM2joh','Anderson','Salles','anderson.salles@hotmail.com','1989-06-15',NULL,'','',0,1,22,'',NULL,NULL),(92,'kenzo_matheus@hotmail.com','NLBgJiGP','Kenzo','Kague','kenzo_matheus@hotmail.com','1997-07-31',NULL,'','',0,1,22,'',NULL,NULL),(93,'marco_shiba@hotmail.com','SeUumhHI','Marco','Shibayama','marco_shiba@hotmail.com','1977-10-06',NULL,'','',0,1,27,'6210365-5',NULL,NULL),(94,'assakura_andre@hotmail.com','EgIZ1N6y','Andre','Assakura','assakura_andre@hotmail.com','1988-08-31',NULL,'','',0,1,27,'8512334-3 ',NULL,NULL),(95,'danyukio@gmail.com.br','yQzNW7O9','Danilo','Sugahara','danyukio@gmail.com.br','1979-10-25',NULL,'','',0,1,10,'236916920',NULL,NULL),(96,'rs.imuta@gmail.com','RH5OXr6h','Rafael - Teo','Imuta','rs.imuta@gmail.com','1982-12-24',NULL,'','',0,1,10,'271978690',NULL,NULL),(97,'rs.imuta@gmail.com','d14ZuW2j','Rafael - Teo','Imuta','rs.imuta@gmail.com','1982-12-24',NULL,'','',0,1,10,'271978690',NULL,NULL),(98,'rs.imuta@gmail.com','jpOr20na','Rafael - Teo','Imuta','rs.imuta@gmail.com','1982-12-24',NULL,'','',0,1,10,'271978690',NULL,NULL),(99,'jeferson.umesp@gmail.com','U1LpGOAQ','Jeferson','Souza','jeferson.umesp@gmail.com','1982-11-05',NULL,'','',0,1,10,'334284090',NULL,NULL),(100,'fe.bomfim@yahoo.com.br','4U0O9L65','Fernando Bomfim','Campos','fe.bomfim@yahoo.com.br','1985-09-09',NULL,'','',0,1,10,'354124638',NULL,NULL),(101,'doug_ogaw@hotmail.com','MdRWmeGO','Douglas Seiiji','Ogawa','doug_ogaw@hotmail.com','1987-07-31',NULL,'','',0,1,10,'361392813',NULL,NULL),(102,'doug_ogaw@hotmail.com','D71ti95N','Douglas Seiiji','Ogawa','doug_ogaw@hotmail.com','1987-07-31',NULL,'','',0,1,10,'361392813',NULL,NULL),(103,'alexandre.ushima@gmail.com','VpPD3LtU','Alexandre','Ushima','alexandre.ushima@gmail.com','1982-09-08',NULL,'','',0,1,10,'34.135.158-1',NULL,NULL),(104,'david_spfc2000@yahoo.com.br','z7Jrudet','David Santos','Souza','david_spfc2000@yahoo.com.br','1984-03-28',NULL,'','',0,1,10,'33.428.410-7',NULL,NULL),(105,'alexoyama@gmail.com','U9Mb14mz','Alex','Oyama','alexoyama@gmail.com','1111-11-11',NULL,'','',0,1,10,'',NULL,NULL),(106,'mkt_makoto@yahoo.com','1ZmPI5i4','Rodrigo Makoto','Matsumura','mkt_makoto@yahoo.com','1979-04-23',NULL,'','',0,1,10,'25661648-6',NULL,NULL),(107,'xxxx@xxxx.com','jUrVTY1y','Fabio Pereira','Santos','xxxx@xxxx.com','1982-11-03',NULL,'','',0,1,10,'35175532-9',NULL,NULL),(108,'xxxx@xxxx.com','HIJpNoBt','DENIS NASCIMENTO','SOUSA','xxxx@xxxx.com','1973-05-03',NULL,'','',0,1,10,'27755795-1',NULL,NULL),(109,'gouveia@edpbr.com.br','vUXPj1nu','Luis Carlos','Gouveia Pereira','gouveia@edpbr.com.br','1973-06-25',NULL,'','',0,1,10,'20.166.161',NULL,NULL),(110,'ryuyahiro@hotmail.com','yI1T5vjq','Regis Ryu','Yahiro','ryuyahiro@hotmail.com','1985-02-21',NULL,'','',0,1,10,'34.776.766-7',NULL,NULL),(111,'guilherme.santanda@gmail.com','vStO5Xj3','Guilherme','Santanda','guilherme.santanda@gmail.com','1984-10-21',NULL,'','',0,1,10,'',NULL,NULL),(112,'sidney-fernandes@uol.com.br','YtMjvsQp','Sidney','Fernandes','sidney-fernandes@uol.com.br','1983-01-24',NULL,'','',0,1,10,'',NULL,NULL),(113,'fntakada@hotmail.com','Rr1WStYg','FÃ¡bio','Takada','fntakada@hotmail.com','1977-12-15',NULL,'','',0,1,10,'23171201-7','',NULL),(114,'xxxx@xxxx.com','EputGbr3','Rodrigo','Tanikawa','xxxx@xxxx.com','1111-11-11',NULL,'','',0,1,10,'',NULL,NULL),(115,'xxxx@xxxx.com','QPhzD8sW','Alexandre','Polac','xxxx@xxxx.com','1111-11-11',NULL,'','',0,1,10,'',NULL,NULL),(116,'xxxx@xxxx.com','28ZPY7DS','Jonatas','Tenorio','xxxx@xxxx.com','1111-11-11',NULL,'','',0,1,10,'',NULL,NULL),(117,'xxxx@xxxx.com','z7jetMO3','Sérgio','Sem Sobrenome','xxxx@xxxx.com','1111-11-11',NULL,'','',0,1,10,'',NULL,NULL),(118,'davidyuki@gmail.com','hTu4BozZ','David','Watanabe','davidyuki@gmail.com','1111-11-11',NULL,'','',0,1,10,'',NULL,NULL),(119,'lucas.watanabe@gmail.com','gREoaPMT','Lucas','Watanabe','lucas.watanabe@gmail.com','0000-00-00',NULL,'','',0,1,10,'',NULL,NULL),(120,'xxxx@xxxx.com','6ma0BVGO','Alvaro','Matsuda','xxxx@xxxx.com','1111-11-11',NULL,'','',0,1,10,'',NULL,NULL),(121,'xxxx@xxxx.com','TbspGa57','Lucio Takeshi','Kuroki','xxxx@xxxx.com','0000-00-00',NULL,'','',0,1,10,'',NULL,NULL),(122,'eiji_dan@yahoo.com.br','Xz0va7tZ','Danilo','Hirayama','eiji_dan@yahoo.com.br','0000-00-00',NULL,'','',0,1,10,'',NULL,NULL),(123,'renato.okina@gmail.com','oEXSmPvR','Renato','Okina','renato.okina@gmail.com','0000-00-00',NULL,'','',0,1,10,'',NULL,NULL),(124,'rafael.gouvea@gmail.com','HDLIbA51','Luiz Rafael','GouvÃªa','rafael.gouvea@gmail.com','1970-01-01',NULL,'','',0,1,10,'30.129.238-3','',NULL),(125,'lucasarai@gmail.com','urvs6haQ','Rafael','Yamada','lucasarai@gmail.com','1994-10-03',NULL,'','',0,1,20,'',NULL,NULL),(126,'lucasarai@gmail.com','gYenszB1','Rodrigo','Yamada','lucasarai@gmail.com','1998-06-01',NULL,'','',0,1,20,'',NULL,NULL),(127,'victor_onoda@hotmail.com','nNq8oLOQ','Victor','Onoda','victor_onoda@hotmail.com','1996-07-03',NULL,'','',0,1,20,'',NULL,NULL),(128,'diogenesnetom@gmail.com','G6y7roa0','diogenes','rodrigues de moura neto','diogenesnetom@gmail.com','1998-11-27',NULL,'','',0,1,24,'',NULL,NULL),(129,'adautosuper@hotmail.com','i6tIvg7M','adauto ','alves da nobrega','adautosuper@hotmail.com','1998-06-29',NULL,'','',0,1,24,'',NULL,NULL),(134,'pedro.eduardo.correia@gmail.com','MLbsAJuj','Pedro','Correia','pedro.eduardo.correia@gmail.com','1992-11-18',NULL,'','',0,1,10,'49.087.932-9','',NULL),(135,'willbomfim@hotmail.com','yo431LT2','William Bomfim','Campos','willbomfim@hotmail.com','1991-09-25',NULL,'','',0,1,10,'35.412.462-6',NULL,NULL),(136,'joao_alexandre_14@hotmail.com','p3za6uNm','JoÃ£o Alexandre','Reis','joao_alexandre_14@hotmail.com','1993-05-14',NULL,'','',0,1,10,'33514443-3','',NULL),(137,'ucaspereirasouza@gmail.com','1sThVB8j','Lucas Alexandre','Pereira de Souza','ucaspereirasouza@gmail.com','1987-12-02',NULL,'','',0,1,10,'41022034-6',NULL,NULL),(138,'vitoryuki@gmail.com','MZg7qtJb','Vitor Yuki - Dolly','Iwano','vitoryuki@gmail.com','1985-01-19',NULL,'','',0,1,10,'28468601-3',NULL,NULL),(139,'felipe_yamasaka@hotmail.com','Q2TWJ6XG','Felipe - Fefoko','Yamasaka','felipe_yamasaka@hotmail.com','1993-12-16',NULL,'','',0,1,10,'363669395',NULL,NULL),(140,'lucasarai@gmail.com','IUEye147','Guilherme','Marcondes','lucasarai@gmail.com','2001-11-14',NULL,'','',0,1,20,'',NULL,NULL),(141,'lucasarai@gmail.com','jO94aWi3','Oscar','Marcondes','lucasarai@gmail.com','2001-09-01',NULL,'','',0,1,20,'',NULL,NULL),(142,'lucasarai@gmail.com','TbnP12v0','Lucas','Arai','lucasarai@gmail.com','1991-07-13',NULL,'','',0,1,20,'',NULL,NULL),(143,'lucasarai@gmail.com','80vUiQRa','Douglas','Lima','lucasarai@gmail.com','1998-01-18',NULL,'','',0,1,20,'',NULL,NULL),(144,'lucasarai@gmail.com','AbrqptXI','Egidio','Arai','lucasarai@gmail.com','1965-09-01',NULL,'','',0,1,20,'',NULL,NULL),(145,'lucasarai@gmail.com','MHZ2tvDN','Nelson','Arai','lucasarai@gmail.com','1952-12-13',NULL,'','',0,1,20,'',NULL,NULL),(146,'lucasarai@gmail.com','5UApz8Mo','Orlando','Valini','lucasarai@gmail.com','1968-04-03',NULL,'','',0,1,20,'',NULL,NULL),(147,'lucasarai@gmail.com','8Y1IBDpE','Jorge','Santos','lucasarai@gmail.com','1974-03-25',NULL,'','',0,1,20,'',NULL,NULL),(148,'lucasarai@gmail.com','JiU2TLzO','Davi','Takahashi','lucasarai@gmail.com','1969-04-21',NULL,'','',0,1,20,'',NULL,NULL),(149,'lucasarai@gmail.com','8pDRGjib','Eudes','Filho','lucasarai@gmail.com','1981-04-24',NULL,'','',0,1,20,'',NULL,NULL),(150,'lucasarai@gmail.com','ygspa1Gh','Jonas','Souza','lucasarai@gmail.com','1990-08-30',NULL,'','',0,1,20,'',NULL,NULL),(151,'lucasarai@gmail.com','PzUGQ4r8','Rafael','Souza','lucasarai@gmail.com','1989-07-07',NULL,'','',0,1,20,'',NULL,NULL),(152,'lucasarai@gmail.com','eB1WMLZQ','Luiz','Henrique','lucasarai@gmail.com','1992-07-21',NULL,'','',0,1,20,'',NULL,NULL),(153,'lucasarai@gmail.com','0MyiPSZr','Eloy','Yamada','lucasarai@gmail.com','1985-03-19',NULL,'','',0,1,20,'',NULL,NULL),(154,'lucasarai@gmail.com','nhO5ij29','Armando','Sato','lucasarai@gmail.com','1988-04-22',NULL,'','',0,1,20,'',NULL,NULL),(155,'lucasarai@gmail.com','GU4Od1yS','Fernando','Sato','lucasarai@gmail.com','1989-10-24',NULL,'','',0,1,20,'',NULL,NULL),(156,'lucasarai@gmail.com','9N7D4WYS','Diego','Neco','lucasarai@gmail.com','1989-05-15',NULL,'','',0,1,20,'',NULL,NULL),(157,'lucasarai@gmail.com','AgnQEDWM','Guilherme','Morgado','lucasarai@gmail.com','1993-02-04',NULL,'','',0,1,20,'',NULL,NULL),(158,'lucasarai@gmail.com','dV5sH2yE','William','Souza','lucasarai@gmail.com','1987-06-26',NULL,'','',0,1,20,'',NULL,NULL),(159,'lucasarai@gmail.com','oO3W0tJj','Renato','Espinoza','lucasarai@gmail.com','1977-10-13',NULL,'','',0,1,20,'',NULL,NULL),(160,'lucasarai@gmail.com','HRmdJ16V','Nicolai','Valini','lucasarai@gmail.com','1991-10-15',NULL,'','',0,1,20,'',NULL,NULL),(161,'lucasarai@gmail.com','3o7pEeNv','Kevin','Onoda','lucasarai@gmail.com','1993-03-13',NULL,'','',0,1,20,'',NULL,NULL),(162,'lucasarai@gmail.com','oib9drmU','Bruno','Vasconcellos','lucasarai@gmail.com','1984-05-29',NULL,'','',0,1,20,'',NULL,NULL),(163,'lucasarai@gmail.com','8gH4TmR9','Mauricio','Santos','lucasarai@gmail.com','1960-06-11',NULL,'','',0,1,20,'',NULL,NULL),(164,'lucasarai@gmail.com','imegPrDo','Edson','Arai','lucasarai@gmail.com','1962-04-06',NULL,'','',0,1,20,'',NULL,NULL),(165,'linikeragogo@hotmail.com','4rM7Svys','liniker','aparecido marques','linikeragogo@hotmail.com','1990-10-27',NULL,'','',0,1,24,'',NULL,NULL),(166,'sergio.teruya.3@facebook.com','5OuiAoYy','kiyoshi','teruya','sergio.teruya.3@facebook.com','1977-10-19',NULL,'','',0,1,22,'',NULL,NULL),(167,'negoshow_two@hotmail.com','2uqgS9z1','nelson ','filho','negoshow_two@hotmail.com','0000-00-00',NULL,'','',0,1,22,'',NULL,NULL),(168,'thiego.yonsei@gmail.com','3q6sW7mL','thiego','gomes','thiego.yonsei@gmail.com','1988-09-05',NULL,'','',0,1,22,'',NULL,NULL),(169,'marcyevelyn@hotmail.com','N5OPVq1A','marcy','kurossu','marcyevelyn@hotmail.com','1984-04-26',NULL,'','',0,1,22,'',NULL,NULL),(170,'heloisanaomi@gmail.com','OyBr2eRm','heloisa','pereira','heloisanaomi@gmail.com','1998-08-11',NULL,'','',0,1,22,'',NULL,NULL),(171,'talitaksaito@gmail.com','hvYTm38q','talita ','ono','talitaksaito@gmail.com','1984-01-06',NULL,'','',0,1,22,'',NULL,NULL),(172,'mi.comjesus@ig.com.br','IYXdanzW','Michele ','Muraoka','mi.comjesus@ig.com.br','1986-06-28',NULL,'','',0,1,22,'',NULL,NULL),(173,'raissanayaradias@gmail.com','ZN8zPoUt','Raissa','Dias','raissanayaradias@gmail.com','1992-01-10',NULL,'','',0,1,22,'',NULL,NULL),(174,'kevin_mtsuki@hotmail.com','RGnId4J9','Kevin','tsukioka','kevin_mtsuki@hotmail.com','1996-09-28',NULL,'','',0,1,22,'',NULL,NULL),(175,'yoshim_teruya@hotmail.com','dWM9UDsy','Davi','Sugimura','yoshim_teruya@hotmail.com','1994-11-15',NULL,'','',0,1,22,'',NULL,NULL),(176,'imel_yoshihito@hotmail.com','OoV4vYP9','Mateus','Sugimura','imel_yoshihito@hotmail.com','1997-12-14',NULL,'','',0,1,22,'',NULL,NULL),(177,'dangoes@live.com','QT3dBjDE','Andrew','goes','dangoes@live.com','1992-12-05',NULL,'','',0,1,22,'',NULL,NULL),(178,'dani.wlio@hotmail.com','yp52RSET','Daniel dos','Santos','dani.wlio@hotmail.com','1995-05-10',NULL,'','',0,1,11,'476241339',NULL,NULL),(179,'kmvmiura@terra.com.br','EUAg7pmS','kiyoiti','miura','kmvmiura@terra.com.br','1966-01-06',NULL,'','',0,1,11,'168691048',NULL,NULL),(180,'mrpelai@yahoo.com.br','hoGqPjLU','Marcos Roberto','pelai','mrpelai@yahoo.com.br','1971-03-30',NULL,'','',0,1,11,'155885054',NULL,NULL),(181,'eliasmuniz@hotmail.com.br','nGaHAoTd','Elias Muniz dos ','Santos','eliasmuniz@hotmail.com.br','1973-05-28',NULL,'','',0,1,11,'239286479','196.831.238-21',NULL),(182,'miuramarcos@terra.com.br','ESyt49Ne','Marco Yoshimi','Miura','miuramarcos@terra.com.br','1973-07-01',NULL,'','',0,1,11,'238246012',NULL,NULL),(183,'jkla.dias@bol.com.br','6XyA5Dv0','Lucas Miura','Dias','jkla.dias@bol.com.br','1992-08-24',NULL,'','',0,1,11,'492309255','',NULL),(184,'daniel_dpns47@hotmail.com','LRvrAHNm','Daniel  Pereira Neves da','Silva','daniel_dpns47@hotmail.com','1993-07-09',NULL,'','',0,1,11,'392104179','412.018.308-42',NULL),(185,'jkla.dias@bol.com.br','zmOMjYUi','Jorge Antonio','Dias','jkla.dias@bol.com.br','1962-09-16',NULL,'','',0,1,11,'112593823',NULL,NULL),(186,'kmvmiura@terra.com.br','8yRejW56','Natacha Yany ','Yoneyama','kmvmiura@terra.com.br','1990-10-04',NULL,'','',0,1,11,'498820385',NULL,NULL),(187,'lucasarai@gmail.com','hGmsOtVR','Gabriel','Silva','lucasarai@gmail.com','1986-07-31',NULL,'','',0,1,20,'',NULL,NULL),(188,'felipe.r.lagoa@hotmail.com','sJQXrSYd','Felipe','Lagoa','felipe.r.lagoa@hotmail.com','1994-06-11',NULL,'','',0,1,5,'',NULL,NULL),(189,'lucas.rosado.3954@facebook.com','rvSV2On5','Lucas ','Rosado','lucas.rosado.3954@facebook.com','1995-05-03',NULL,'','',0,1,5,'',NULL,NULL),(190,'felipe.rosadolagoa@facebook.com','8atimTbr','Wesley','Rosado','felipe.rosadolagoa@facebook.com','1993-01-01',NULL,'','',0,1,5,'',NULL,NULL),(191,'msnakaya99@gmail.com','b7vG9Bau','Satoshi ','Nakaya','msnakaya99@gmail.com','1973-09-10',NULL,'','',0,1,5,'',NULL,NULL),(192,'juliano.ito@gmail.com','14hgzWuV','Juliano','Ito','juliano.ito@gmail.com','1983-06-28',NULL,'','',0,1,5,'',NULL,NULL),(193,'felipe.rosadolagoa@facebook.com','hG93dpE6','Vinicius','Marques','felipe.rosadolagoa@facebook.com','1993-01-01',NULL,'','',0,1,5,'',NULL,NULL),(194,'reinaldo.simizu@gmail.com','WO9NpTuq','Reinaldo','Simizu','reinaldo.simizu@gmail.com','1979-07-10',NULL,'','',0,1,5,'','',NULL),(195,'jeandrobig@hotmail.com','MjtG8eTp','Jeandro','Barbosa','jeandrobig@hotmail.com','1977-05-13',NULL,'','',0,1,5,'',NULL,NULL),(196,'olacarmo@gmail.com','1ijpAqVU','Carmo','Ribeiro','olacarmo@gmail.com','1980-01-01',NULL,'','',0,1,5,'',NULL,NULL),(197,'will.miyazaki@gmail.com','MWDzAUb9','Willian','Miyazaki','will.miyazaki@gmail.com','1980-01-01',NULL,'','',0,1,5,'',NULL,NULL),(198,'juliano.ito@gmail.com','iRQqyXAd','Vanderlei','Venancio','juliano.ito@gmail.com','1990-01-01',NULL,'','',0,1,5,'',NULL,NULL),(199,'amanda.leyla@hotmail.com','INUjGmtQ','amanda','valdez','amanda.leyla@hotmail.com','1996-10-09',NULL,'','',0,1,22,'',NULL,NULL),(200,'albert_hip@hotmail.com','ohQea1m6','albert','rodrigues de moura','albert_hip@hotmail.com','1989-01-18',NULL,'','',0,1,24,'',NULL,NULL),(201,'lucasarai@gmail.com','ZMu5GAit','Claudio','Adachi','lucasarai@gmail.com','1986-11-09',NULL,'','',0,1,20,'',NULL,NULL),(203,'joel-mst@hotmail.com','JYdWbm3L','joel','miyajima','joel-mst@hotmail.com','1997-03-01',NULL,'','',0,1,22,'',NULL,NULL),(204,'zakira.zapy@hotmail.co.jp','R4s7MaG6','asaph','miyajima','zakira.zapy@hotmail.co.jp','1996-07-05',NULL,'','',0,1,22,'',NULL,NULL),(213,'souapoly@gmail.com','jGDHvidy','Polyana','Fernandes da Cruz','souapoly@gmail.com','1982-05-02',NULL,'@polyfitness','http:///www.facebook.com/polyfit',0,1,23,'35148419X','307.654.858-18',NULL),(214,'carol.fukushima@hotmail.com','U8R2d0yq','Caroline Mieko','Ribeiro Fukushima','carol.fukushima@hotmail.com','1991-02-04',NULL,'','',0,1,23,'47.101.236-1','413.188.086-05',NULL),(215,'su_za_na@hotmail.com','a6oE0iZP','Suzana ','Calasans Camargo','su_za_na@hotmail.com','1988-02-14',NULL,'','',0,1,23,'437681005','309.025.078-13',NULL),(216,'d.m.kuriyama@gmail.com','bd90Y1mL','Daniela Mari','Kuriyama','d.m.kuriyama@gmail.com','1988-12-08',NULL,'','',0,1,23,'35148419X','376.373.238-13',NULL),(217,'rebeca.nogueira@unitau.com','O74hgyUP','Rebeca','Gama Nogueira','rebeca.nogueira@unitau.com','1990-11-12',NULL,'','',0,1,23,'467476378','405.534.558-50',NULL),(218,'souapoly@gmail.com','XqgGPM46','Joana','Yamashiro Batista dos Santos','souapoly@gmail.com','1994-02-18',NULL,'','',0,1,23,'35148419X','416.123.698-04',NULL),(219,'natty.mitie@gmail.com','y4s1DZbP','NatÃ¡lia','Mieko Hatayama','natty.mitie@gmail.com','1991-04-26',NULL,'','',0,1,23,'35148419X','386.834.688-01',NULL),(220,'natalia.tamashiro@gmail.com','Ht0QyLho','NatÃ¡lia','Naomi Tavares Tamashiro','natalia.tamashiro@gmail.com','1991-12-14',NULL,'','',0,1,23,'35148419X','395.570.348-74',NULL),(221,'mary_emie@hotmail.com','Z9GNzpUi','Mariana Emi','Hatayama ','mary_emie@hotmail.com','1995-02-01',NULL,'','',0,1,23,'35148419X','438.466.318-84',NULL),(222,'raquel_nishimoto@hotmail.com','T79XnhbB','Raquel','de Pinho Nishimoto ','raquel_nishimoto@hotmail.com','1996-08-20',NULL,'','',0,1,23,'35148419X','307.654.858-18',NULL),(223,'souapoly@gmail.com','sSXDEigT','Larissa ','Tamashiro','souapoly@gmail.com','1994-01-23',NULL,'','',0,1,23,'35148419X','416.910.938-40',NULL),(224,'souapoly@gmail.com','AEVYn0h9','JoÃ£o Pedro','Correia Marzullo','souapoly@gmail.com','2002-06-26',NULL,'','',0,1,23,'561305821','451.069.128-90',NULL),(225,'souapoly@gmail.com','mS8zY59L','RennÃ£','Franco Jallais','souapoly@gmail.com','1999-12-22',NULL,'','',0,1,23,'501522979','401.889.718-90',NULL),(226,'davibettiolabe@gmail.com','o7AB1O39','Davi','Bettiol Abe','davibettiolabe@gmail.com','2004-06-29',NULL,'','',0,1,23,'551648727','307.664.858-18',NULL),(227,'pedrobettiolabe@gmail.com','HVv3QTXj','Pedro','Bettiol Abe','pedrobettiolabe@gmail.com','2001-09-06',NULL,'','',0,1,23,'551648806','307.654.858-18',NULL),(228,'souapoly@gmail.com','8p27vUX0','Bruno','Momma Takahashi','souapoly@gmail.com','2000-11-12',NULL,'','',0,1,23,'393039316','307.654.858-18',NULL),(229,'souapoly@gmail.com','UomJHGSI','Samuel','Yamamoto Sasaki Machado','souapoly@gmail.com','2001-08-17',NULL,'','',0,1,23,'50149599X','307.654.858-18',NULL),(230,'eikiluis@hotmail.com','EOA5qQB2','Eiki Luis',' Yamashiro Batista dos Santos','eikiluis@hotmail.com','2001-09-03',NULL,'','',0,1,23,'35148419x','307.654.858-18',NULL),(231,'andrezinho.lira@hotmail.com','eXqurmH3','Carlos AndrÃ©','Lira','andrezinho.lira@hotmail.com','2001-02-22',NULL,'','',0,1,23,'35148419x','307.654.858-18',NULL),(232,'souapoly@gmail.com','SeAg7iRY','Leandro','Marcelino da Silva','souapoly@gmail.com','1997-10-24',NULL,'','',0,1,23,'35148419x','307.654.858-18',NULL),(233,'makata_marcelo@hotmail.com','IiSB8hX3','Marcelo Akyioshi','Katayama','makata_marcelo@hotmail.com','1995-01-26',NULL,'@ma_katayama','',0,1,23,'36707626-3','455.731.338-88',NULL),(234,'fseiji@live.com','IrtvuYQ0','Fernando Seiji','Kubota','fseiji@live.com','1994-10-09',NULL,'@femiilk','',0,1,23,'419889668','321.236.088-74',NULL),(235,'souapoly@gmail.com','MXP3NDpT','Ricardo Yugo ','Ikedo','souapoly@gmail.com','1997-05-18',NULL,'','',0,1,23,'411301263','360.582.918-01',NULL),(236,'estevaofig_tec@hotmail.com','uRBvpYDO','EstevÃ£o','da Silva Figueira','estevaofig_tec@hotmail.com','1995-02-05',NULL,'@estevaotec','',0,1,23,'42.348.204-x','424.900.388-58',NULL),(237,'henrynishimoto@hotmail.com','57r3MQbZ','Henry ','Torita Nichimoto','henrynishimoto@hotmail.com','1997-02-24',NULL,'@henrynishimoto','',0,1,23,'367076688','352.247.228-45',NULL),(238,'sofia.bonuccelli@gmail.com','ye5mH1nY','Sofia ','B. H. Lisboa','sofia.bonuccelli@gmail.com','1996-01-31',NULL,'','',0,1,25,'384429130','451.580.228-36',NULL),(239,'mariko.hanashiro@gmail.com','9jm1O4Id','Mariko','Hanashiro','mariko.hanashiro@gmail.com','1995-09-27',NULL,'','',0,1,25,'475507423','',NULL),(240,'ieda_hiromi@hotmail.com','jMhbnaTo','Ieda Hiromi','Maemura','ieda_hiromi@hotmail.com','1995-01-25',NULL,'','',0,1,25,'364903053','442.703.798-47',NULL),(241,'fefe_naomi@hotmail.com','S8YeE26X','Fernanda','Abe','fefe_naomi@hotmail.com','1994-07-01',NULL,'','',0,1,25,'39926426','',NULL),(242,'sharonberezinalves@hotmail.com','ROD4HJgi','Sharon','Berezin Alves','sharonberezinalves@hotmail.com','1995-09-05',NULL,'','',0,1,25,'354997464','',NULL),(243,'ieda_hiromi@hotmail.com','5hNQ6yzA','Jaqueline','Chung','ieda_hiromi@hotmail.com','1995-01-01',NULL,'','',0,1,25,'367512555','',NULL),(244,'danielamita17@gmail.com','D9sdIvSJ','Daniela','Mita','danielamita17@gmail.com','1994-12-22',NULL,'','',0,1,25,'14840130','',NULL),(245,'paula_akinaga@hotmail.com','iETMWJ7y','Paula','Benitez','paula_akinaga@hotmail.com','1995-06-26',NULL,'','',0,1,25,'38760040','',NULL),(246,'paulaharumi1999@hotmail.com','P6Z53BND','Paula ','Maemura`','paulaharumi1999@hotmail.com','1999-05-29',NULL,'','',0,1,25,'38104449x','',NULL),(247,'regianematsuo@hotmail.com','6a1Bu3Y0','Regiane','Matsuo de Carvalho','regianematsuo@hotmail.com','1998-12-30',NULL,'','',0,1,25,'','',NULL),(248,'silvia_mayumi@hotmail.com','nV26j0Sd','Silvia Mayumi','Okuma','silvia_mayumi@hotmail.com','1992-03-07',NULL,'','',0,1,25,'484853983','',NULL),(249,'panny.ke@gmail.com','s6bQUytv','Keyla','Kuniy','panny.ke@gmail.com','1990-06-26',NULL,'','',0,1,25,'376744030','',NULL),(250,'mihokato_nj@hotmail.com','jPJpsZmW','Miho','Kato','mihokato_nj@hotmail.com','1992-12-30',NULL,'','',0,1,25,'329817899','',NULL),(251,'silvia_mayumi@hotmail.com','MI7nJgXd','adriana','Alves','silvia_mayumi@hotmail.com','1992-01-01',NULL,'','',0,1,25,'474079582','',NULL),(252,'angelica_a_lyka@hotmail.com','DvhaL5BM','AngÃ©lica ','Alves','angelica_a_lyka@hotmail.com','1993-12-04',NULL,'','',0,1,25,'483006385','',NULL),(253,'ryk_yrp@hotmail.com','4SX50EmY','Rebeca Yurie','Konishi','ryk_yrp@hotmail.com','1992-06-08',NULL,'','',0,1,25,'','',NULL),(254,'silvia_mayumi@hotmail.com','Gra5DQyu','NatÃ¡lia ','Diniz','silvia_mayumi@hotmail.com','1970-01-01',NULL,'','',0,1,25,'','',NULL),(255,'naoyuka@uol.com.br','uJoU0Osy','Erik','Nagasse Tateyama','naoyuka@uol.com.br','2003-06-09',NULL,'','',0,1,25,'','',NULL),(256,'naoyuka@uol.com.br','6Vu0tvb4','Caio','Nagasse Tateyama','naoyuka@uol.com.br','2000-09-07',NULL,'','',0,1,25,'55078794x','',NULL),(257,'lucashiroakinagae@hotmail.com','qXi3Suo6','Lucas Hiroaki','Nagae','lucashiroakinagae@hotmail.com','1999-10-25',NULL,'','',0,1,25,'387680885','',NULL),(258,'daniel_keih@hotmail.com','jVL7osiT','Daniel Kei','Harada','daniel_keih@hotmail.com','2000-04-19',NULL,'','',0,1,25,'50784222','',NULL),(259,'koguinha@live.com','Amh9adN0','Matheus','M. K. Barros','koguinha@live.com','2001-05-07',NULL,'','',0,1,25,'397646896','',NULL),(260,'kenjitateyama@yahoo.com.br','Y8j0gdsW','AndrÃ© Kenzo','M. Tateyama','kenjitateyama@yahoo.com.br','2000-09-04',NULL,'','',0,1,25,'','',NULL),(261,'otavioryoizumi@gmail.com','nAyTVbpB','Otavio Ryo','Izumi','otavioryoizumi@gmail.com','1982-10-16',NULL,'','',0,1,25,'34052209','',NULL),(262,'ruben_yamada@yahoo.com.br','0Xz6esy4','Ruben','Yamada','ruben_yamada@yahoo.com.br','1988-10-21',NULL,'','',0,1,25,'439015017','',NULL),(263,'yuri_akiotakeda@hotmail.com','MIyzD3Tm','Yuri Akio','Takeda','yuri_akiotakeda@hotmail.com','1988-11-20',NULL,'','',0,1,25,'460162779','',NULL),(264,'felipe_kenjitakeda@hotmail.com','GpAWY0XV','Felipe Kenji','Takeda','felipe_kenjitakeda@hotmail.com','1991-09-29',NULL,'','',0,1,25,'361564958','',NULL),(265,'alec_hayashi@yahoo.com.br','LDXYNi8P','Alec Ryuji','Hayashi','alec_hayashi@yahoo.com.br','1989-12-18',NULL,'','',0,1,25,'329501823','',NULL),(266,'aroldojr90@hotmail.com','mVEPhiqg','Aroldo','Piragibe Junior','aroldojr90@hotmail.com','1990-01-23',NULL,'','',0,1,25,'468735525','',NULL),(267,'ruben.konishi@gmail.com','B350jEO4','Ruben','Konishi','ruben.konishi@gmail.com','1990-06-27',NULL,'','',0,1,25,'466925','',NULL),(268,'hiroshi_mino@hotmail.com','yjLm8nOQ','AndrÃ© Hiroshi','Mino','hiroshi_mino@hotmail.com','1993-06-25',NULL,'','',0,1,25,'376820998','',NULL),(269,'otavioryoizumi@gmail.com','802da9yn','Kei','Kato','otavioryoizumi@gmail.com','1994-06-29',NULL,'','',0,1,25,'329817905','',NULL),(270,'gabrielbhl@gmail.com','0Lao7TeS','Gabriel','B. H. Lisboa','gabrielbhl@gmail.com','1994-10-06',NULL,'','',0,1,25,'384426426','',NULL),(271,'Kenjitakei@hotmail.com','uOoEB9MN','Nilo Kenji','Takei','Kenjitakei@hotmail.com','1989-06-20',NULL,'','',0,1,25,'33.230.201-5','',NULL),(272,'roger.taiki@hotmail.com','Adavp8Qh','Roger Taiki','Yahiro','roger.taiki@hotmail.com','1992-05-08',NULL,'','',0,1,25,'48484337-0','',NULL),(273,'mario.kurauchi@semco.com.br','0z5BHeDm','Mario','Kurauchi','mario.kurauchi@semco.com.br','1953-02-05',NULL,'','',0,1,25,'5522740','',NULL),(274,'ktokunaga@uol.com.br','S87rdRYE','Koiti','Tokunaga','ktokunaga@uol.com.br','1956-01-02',NULL,'','',0,1,25,'81783569','',NULL),(275,'mario.kurauchi@semco.com.br','yN76DQbh','Massao','Suzuki','mario.kurauchi@semco.com.br','1960-06-05',NULL,'','',0,1,25,'9807325','',NULL),(276,'myaoki@hotmial.com','ZyrSgNJ3','Marcel','Aoki','myaoki@hotmial.com','1976-06-12',NULL,'','',0,1,25,'21241505','',NULL),(277,'emerson.koike@ibest.com.br','PImbL8Ut','Emerson Rioji','Koike','emerson.koike@ibest.com.br','1971-06-12',NULL,'','',0,1,25,'16917943','',NULL),(278,'matheusteruaki@hotmail.com','J9zRPVuB','Matheus Teruaki','Nagae','matheusteruaki@hotmail.com','1996-03-12',NULL,'','',0,1,25,'38786059-7','',NULL),(279,'tiagoajk@hotmail.com','ODWMg1aj','Tiago K.','Ajeka','tiagoajk@hotmail.com','1996-01-18',NULL,'','',0,1,25,'52103131x','',NULL),(280,'leokoike@hotmail.com','M3uILrEm','Leonardo Y','Koike','leokoike@hotmail.com','1998-02-17',NULL,'','',0,1,25,'385900399','',NULL),(281,'rafael_jowh@hotmail.com','JvNPi6ny','Rafael Jow','Harada','rafael_jowh@hotmail.com','1997-08-29',NULL,'','',0,1,25,'507842212','',NULL),(282,'gabriel_tateyama@hotmail.com','daZ14VLp','Gabriel','Tateyama','gabriel_tateyama@hotmail.com','1998-07-08',NULL,'','',0,1,25,'399975147','',NULL),(283,'aurelio.cintori@gmail.com','qMROv5Tm','Aurelio','Cintori','aurelio.cintori@gmail.com','1997-05-14',NULL,'','',0,1,25,'','',NULL),(284,'gabriel.murakami@gmail.com','jZAJ1Tis','Gabriel','Murakami','gabriel.murakami@gmail.com','1996-04-30',NULL,'','',0,1,25,'384441233','',NULL),(285,'rafaelrickmatsuo@hotmail.com','B8joe5zM','Rafael Rick','M. Carvalho','rafaelrickmatsuo@hotmail.com','1996-03-18',NULL,'','',0,1,25,'44243537x','',NULL),(286,'vgoharam@hotmail.com','9BMNOh2T','Vitor Massaki','Gohara','vgoharam@hotmail.com','1996-12-05',NULL,'','',0,1,25,'','',NULL),(287,'akshiozawa@hotmail.com','mJbGjHge','Andrew Kei','Shiozawa','akshiozawa@hotmail.com','1997-02-08',NULL,'','',0,1,25,'440003519','',NULL),(288,'dkamaura@yahoo.com.br','IeqP3BVH','Daniel Kei','Kamaura','dkamaura@yahoo.com.br','1979-07-01',NULL,'','',0,1,25,'261394034','',NULL),(289,'dkamaura@yahoo.com.br','O0vSHB6m','Leandro','Ito','dkamaura@yahoo.com.br','1979-01-01',NULL,'','',0,1,25,'','',NULL),(290,'hatayamaki@hotmail.com','7vH59M20','Roberto','Akira Hatayama','hatayamaki@hotmail.com','1963-08-07',NULL,'','',0,1,23,'13.297.639','104.210.278-35',NULL),(291,'souapoly@gmail.com','Imb8znTG','Edson','Ioshiaki Katayama','souapoly@gmail.com','1963-05-31',NULL,'','',0,1,23,'14.138.887','054.361.718-18',NULL),(292,'dudu.eduardo@yahoo.com','h6o8JsR2','Anderson','Eduardo Yokoda','dudu.eduardo@yahoo.com','1972-07-23',NULL,'','',0,1,23,'23/07/1972','162.682.738-93',NULL),(293,'martim.kurauchi@yahoo.com.br','6tbjHm2W','Martim Hideki','Kurauchi','martim.kurauchi@yahoo.com.br','1987-08-13',NULL,'','',0,1,25,'34698295','',NULL),(294,'hugohanashiro@gmail.com','zo13Q6mE','Hugo','Hanashiro','hugohanashiro@gmail.com','1981-04-08',NULL,'','',0,1,25,'','',NULL),(295,'fabio.kanegaki@gmail.com.br','7ybjEYvQ','Fabio','Kanegaki','fabio.kanegaki@gmail.com.br','1970-10-01',NULL,'','',0,1,23,'19218692-9','121.103.038-59',NULL),(296,'waconcept@gmail.com','JSdhN24m','Fabio','Xaves','waconcept@gmail.com','1978-01-09',NULL,'','',0,1,25,'288551928','',NULL),(297,'luis.siramisu@embraer.com.br','JupEetZW','Luis','Mitsuo Siramisu','luis.siramisu@embraer.com.br','1959-09-06',NULL,'','',0,1,23,'12.275.573','019.377.778-98',NULL),(298,'yujiyamaguchi@yahoo.com','gjtG9aTd','Edward Yuji','Yamaguchi','yujiyamaguchi@yahoo.com','1974-04-18',NULL,'','',0,1,25,'122433968','',NULL),(299,'marceloyoshimoto@hotmail.com','08XWY4Np','Marcelo','Yoshimoto','marceloyoshimoto@hotmail.com','1972-12-16',NULL,'','',0,1,25,'188868070','',NULL),(300,'alemassaoka@yahoo.com.br','JsrQqpTi','Alexandre','Massaoka','alemassaoka@yahoo.com.br','1978-12-17',NULL,'','',0,1,25,'26185074x','',NULL),(301,'roney.marzullo@gmail.com.br','2mreIoS9','Roney','Ferreira Marzullo','roney.marzullo@gmail.com.br','1964-08-12',NULL,'','',0,1,23,'16717194-X','062.497.558-45',NULL),(302,'naoki4friend1@yahoo.com.br','bI9dZWPO','Alberto Naoki','Sugiyama','naoki4friend1@yahoo.com.br','1978-03-31',NULL,'','',0,1,25,'254935175','',NULL),(303,'souapoly@gmail.com','7YEPg5Qj','Helio','Nishimoto','souapoly@gmail.com','1963-08-10',NULL,'','',0,1,23,'10.288.047','052.471.268-90',NULL),(304,'amx.akj@gmail.com','UrOshmaY','Amadeu','Kawazue Jr','amx.akj@gmail.com','1986-06-21',NULL,'','',0,1,25,'350098141','',NULL),(305,'l1fonog@gmail.com.br','QP3dL0uR','Ebinezer','de Pinho Nogueira','l1fonog@gmail.com.br','1960-09-02',NULL,'','',0,1,23,'11.829.577-9','025.921.528-40',NULL),(306,'vendas@superset.com.br','MBDuTZGm','Diego','Fraga Martins Oliveira','vendas@superset.com.br','1983-01-10',NULL,'','',0,1,25,'352706466','',NULL),(307,'souapoly@gmail.com','35Nh8BaV','Paulo',' Hiroshi Yano','souapoly@gmail.com','1957-03-10',NULL,'','',0,1,23,'9.662.869','887.530.348-72',NULL),(308,'djjura@me.com','A79BIWvg','Jurandir',' de Oliveira Junior','djjura@me.com','1976-12-22',NULL,'','',0,1,25,'245771219','',NULL),(309,'muca_acum@hotmail.com','greq6zUZ','Murilo','Suzuki','muca_acum@hotmail.com','1985-03-25',NULL,'','',0,1,25,'44170959x','',NULL),(310,'makata_marcelo@hotmail.com','yJY2rIGu','Eduardo','Akira Katayama','makata_marcelo@hotmail.com','1959-04-09',NULL,'','',0,1,23,'10.377.077','019.409.358-14',NULL),(311,'mflx_esporte@hotmail.com','9IdbiUEX','Mauricio','Kaihami','mflx_esporte@hotmail.com','1986-01-19',NULL,'','',0,1,25,'228883937','',NULL),(312,'silvanatieco@hotmail.com','EZ56zXts','Henrique','Hideki Takahashi Sakai','silvanatieco@hotmail.com','2000-01-04',NULL,'','',0,1,23,'36904953-6','307.654.858-18',NULL),(313,'binho.saito@gmail.com','dA3WgYBv','Fabio','Saito','binho.saito@gmail.com','1987-03-21',NULL,'','',0,1,25,'436134986','',NULL),(314,'alefef@hotmail.com','6ernNtIV','Alefe','Fernandes Castro','alefef@hotmail.com','2002-04-05',NULL,'','',0,1,23,'56034348-6','307.654.858-18',NULL),(315,'djjura@me.com','8sLYZAt1','Luciano','Brunetti Virgilio','djjura@me.com','1980-01-01',NULL,'','',0,1,25,'','',NULL),(316,'dho2004@hotmail.com','2bnA3Ty6','Diego','Yanishi','dho2004@hotmail.com','1990-11-21',NULL,'','',0,1,23,'324830385','311.788.078-00',NULL),(317,'gradistonejr@hotmail.com','jd2GHz6u','Gladistone','Nogueira Junior','gradistonejr@hotmail.com','1986-09-03',NULL,'','',0,1,23,'328917746','358.142.558-03',NULL),(318,'bogustavo@yahoo.com.br','1av95PNW','Gustavo','Bo','bogustavo@yahoo.com.br','1989-12-26',NULL,'','',0,1,23,'46545077-5','228.761.118-66',NULL),(319,'mh.ozaha@gmail.com','YTs0g2jV','Mauricio','Haruo Ozaha','mh.ozaha@gmail.com','1989-01-06',NULL,'','',0,1,23,'33230520-X','228.450.678-03',NULL),(320,'priminhoti@gmail.com','PuNroh5S','Thiago','Zhao','priminhoti@gmail.com','1989-02-05',NULL,'','',0,1,23,'35148419x','233.032.968-71',NULL),(321,'mathi_moraes@yahoo.com.br','mJOohBGN','Matheus','Morais da Silva','mathi_moraes@yahoo.com.br','1985-02-03',NULL,'','',0,1,23,'442766804','352.324.998-82',NULL),(322,'su_za_na@hotmail.com','48oM5pNU','Reginaldo','Marias','su_za_na@hotmail.com','1983-02-25',NULL,'','',0,1,23,'34648016-4 ','326.789.548-03',NULL),(323,'victorfukushima@gmail.com','BLvHYsgT','Victor','Yuji Ribeiro Fukushima','victorfukushima@gmail.com','1987-01-04',NULL,'','',0,1,23,'43412671-8','364.376.268-28',NULL),(324,'leohoriuchi@hotmail.com','JDmzRvqL','Leonardo Tadashi','Horiuchi','leohoriuchi@hotmail.com','1977-10-17',NULL,'','',0,1,11,'280410050','278.818.518-99',NULL),(325,'lukas.gomes.brito@hotmail.com','ZtSiYWTq','Lucas de Brito','Gomes','lukas.gomes.brito@hotmail.com','1994-08-06',NULL,'','',0,1,11,'440392755','422.163.798-67',NULL),(326,'wwwyahoo@santoscom2.com.br','0PNHG1v8','Carlos Alberto dos','Santos','wwwyahoo@santoscom2.com.br','1966-03-10',NULL,'','',0,1,11,'395510193','271.555.728-02',NULL),(327,'ronam_roberto@hotmail.com','UVM0SXey','Ronam Roberto Silva','Santos','ronam_roberto@hotmail.com','1993-08-24',NULL,'','',0,1,11,'496310379','426.590.908-66',NULL),(328,'carolinestargirl@hotmail.com','igJBVXdO','Caroline da Conceição dos ','Santos','carolinestargirl@hotmail.com','1995-12-27',NULL,'','',0,1,11,'394905763','',NULL),(329,'carolinestargirl@hotmail.com','iM4EsnNu','Caroline da ConceiÃ§Ã£o dos ','Santos','carolinestargirl@hotmail.com','1995-12-27',NULL,'','',0,1,11,'394905763','',NULL),(330,'she_math.net@hotmail.com','meN04OXo','Sheila Souza ','Santana','she_math.net@hotmail.com','1989-03-24',NULL,'','',0,1,11,'445068346','370.292.688-73',NULL),(331,'she_math.net@hotmail.com','TX7em0QD','Ketlim  Souza','Santana','she_math.net@hotmail.com','1999-02-20',NULL,'','',0,1,11,'508253433','',NULL),(332,'scharlett.clms@htomail.com','BjisZuno','scharlett Crhustina A.M da ','Silva','scharlett.clms@htomail.com','1997-12-14',NULL,'','',0,1,11,'382621608','133.666.138-02',NULL),(333,'daniela-dpns47@hotmal.com','39VDdOSZ','Daniela Neves da','Silva','daniela-dpns47@hotmal.com','0000-00-00',NULL,'','',0,1,11,'','',NULL),(334,'elen.pri_5@hotnail.com','BpX9N0ng','Elen Cristina Alves','Roschel','elen.pri_5@hotnail.com','1997-12-15',NULL,'','',0,1,11,'368199514','',NULL),(335,'she-math.net@hotmail.com','JZMSLAQb','Elisangela','Santos','she-math.net@hotmail.com','1994-04-06',NULL,'','',0,1,11,'39495755','',NULL),(336,'mkt_makoto@yahoo.com','nbr8ioh6','Rodney ','Lusiano Bispo','mkt_makoto@yahoo.com','1979-01-15',NULL,'','',0,1,10,'33184462','',NULL),(337,'suzukiyudi@gmail.com','vXyudHia','edilson','yudi suzuki','suzukiyudi@gmail.com','1983-02-16',NULL,'','',0,1,10,'26.156.017-7','',NULL),(338,'furuka@gmail.com','JgirBTGz','flavio','furukawa','furuka@gmail.com','1987-06-04',NULL,'','',0,1,17,'445886493','354.826.888-95',NULL),(339,'tiagomarilia@pneumar.com.br','9TzGnuAd','tiago carvalho','barbosa','tiagomarilia@pneumar.com.br','1979-10-04',NULL,'','',0,1,17,'81305161','027.746.789-60',NULL),(340,'fah.miura@gmail.com','7tzmXr0o','fabricio ','miura','fah.miura@gmail.com','1986-01-04',NULL,'','',0,1,17,'4454584','354.826.748-35',NULL),(341,'de_imel@hotmail.com','trjM2PW7','diego silveira ','moia dos santos','de_imel@hotmail.com','1991-08-26',NULL,'','',0,1,17,'47922214','397.982.688-06',NULL),(342,'davimaeda@hotmail.com','e985pvsd','Davi','Maeda','davimaeda@hotmail.com','1991-07-11',NULL,'','',0,1,21,'47860271-6','',NULL),(343,'andre.sakumaminei@facebook.com.br','Tzr0sIGv','AndrÃ©','Sakuma','andre.sakumaminei@facebook.com.br','1985-06-28',NULL,'','',0,1,21,'','',NULL),(344,'milton.nak@gmail.com','VIDa3hoi','Milton','Nakanishi','milton.nak@gmail.com','1983-06-25',NULL,'','',0,1,21,'27306202-5','',NULL),(345,'albert_aron@hotmail.com','pvJYVm7s','Albert','Caetano Castro C. da Silva','albert_aron@hotmail.com','1998-09-10',NULL,'','albert_aron@hotmail.com',0,1,7,'501683999','',NULL),(346,'alemao.nordi@ig.com.br','NzqoIAgT','Giovanni','VinÃ­cius Dias Santos','alemao.nordi@ig.com.br','1996-12-06',NULL,'','',0,1,7,'423917353','451.280.508-74',NULL),(347,'alemao.nordi@ig.com.br','JgRhAie1','Bruno','Henrique SantÃ¡guida','alemao.nordi@ig.com.br','1997-01-19',NULL,'','',0,1,7,'42438461-9','450.995.948-67',NULL),(348,'lukas.ice@hotmail.com','nHBhb3JS','Lucas','Oliveira Paulique','lukas.ice@hotmail.com','1997-10-21',NULL,'','lukas.ice@hotmail.com',0,1,7,'521293303','',NULL),(349,'alemao.nordi@ig.com.br','ZH5GoJLj','Julio','CÃ©sar Palhano dos Santos','alemao.nordi@ig.com.br','1996-02-01',NULL,'','',0,1,7,'42020291-2','334.820.568-97',NULL),(350,'juh_loko@hotmail.com','Eiv4uTZ7','Anderson ','Mariano Teixeira Junior','juh_loko@hotmail.com','1995-10-14',NULL,'','juh_loko@hotmail.com',0,1,7,'41591375-5','',NULL),(351,'leo_13xd@hotmail.com','tYRiQg41','Leonardo ','Augusto Rosa dos Santos','leo_13xd@hotmail.com','1998-06-17',NULL,'','leo_13xd@hotmail.com',0,1,7,'533276998','',NULL),(352,'feeh-henriques@hotmail.com','sbj2W8vq','Felipe','da Costa Henriques','feeh-henriques@hotmail.com','1995-05-21',NULL,'','feeh-henriques@hotmail.com',0,1,7,'42218861-x','439.452.978-69',NULL),(353,'claujr_10@hotmail.com','Ey5g20SI','Junior ','Rodrigues Piovani','claujr_10@hotmail.com','1996-08-08',NULL,'','juh_top10@hotmail.com',0,1,7,'42433003-9','450.799.768-29',NULL),(354,'alemao.nordi@ig.com.br','9AOu6jh0','Marcos','Antonio Peres','alemao.nordi@ig.com.br','1992-07-31',NULL,'','',0,1,7,'48888682-x','',NULL),(355,'daniel_timao1910s2@hotmail.com','JoLTSqi9','Daniel','Freitas AdaÃ­','daniel_timao1910s2@hotmail.com','1992-09-22',NULL,'','daniel_timao1910s2@hotmail.com',0,1,7,'48890784-6','412.532.028-42',NULL),(356,'huck_60@hotmail.com','A674B1hz','Rodrigo','Oliveira Santos','huck_60@hotmail.com','1991-11-11',NULL,'','',0,1,7,'48024793-6','377.425.248-30',NULL),(357,'vinicius_andrews@hotmail.com','o5nhBJ9A','VinÃ­cius','Andrews Peres','vinicius_andrews@hotmail.com','1994-07-20',NULL,'','',0,1,7,'52008273-4','436.440.108-03',NULL),(358,'alemao.nordi@ig.com.br','MAyUi0R1','Rafael','da Silva Thomaz de Aquino','alemao.nordi@ig.com.br','1994-06-30',NULL,'','',0,1,7,'40404955-2','449.300.268-90',NULL),(359,'alemao.nordi@ig.com.br','JXig5a9R','Luiz','AndrÃ© C. Arnaud','alemao.nordi@ig.com.br','1993-01-09',NULL,'','',0,1,7,'49284776-9','415.126.878-20',NULL),(360,'alemao.nordi@ig.com.br','Gz6o3QdD','Leonildo','Carlos dos Santos','alemao.nordi@ig.com.br','1991-07-03',NULL,'','',0,1,7,'480516844','398.636.598-27',NULL),(361,'alemao.nordi@ig.com.br','BMo7aeUp','John','Leandro Cadina da Silva','alemao.nordi@ig.com.br','1991-01-13',NULL,'','',0,1,7,'47265278-9','404.179.278-94',NULL),(362,'alemao.nordi@ig.com.br','NMmWPYS1','Tiago','Nordi','alemao.nordi@ig.com.br','1986-11-10',NULL,'','',0,1,7,'34337288-5','352.630.378-99',NULL),(363,'milene.nagahara@costelaecia.com.br','NqQ68AMX','Milene ','Midori Nagahara','milene.nagahara@costelaecia.com.br','1980-05-23',NULL,'','minagahara@yahoo.com.br',0,1,7,'25985599-6','215.119.958-40',NULL),(364,'thafinifujiwara@hotmail.com','gUoutZ8h','Thafini','Soares Fujiwara','thafinifujiwara@hotmail.com','1997-03-04',NULL,'','http://thafini.fujiwara.com',0,1,7,'455892209','',NULL),(365,'brunaribeirocunha@yahoo.com.br','tsVnLNao','Bruna ','Ribeiro Cunha','brunaribeirocunha@yahoo.com.br','1991-01-31',NULL,'','http://bru_fuinha@hotmail.com',0,1,7,'47188870-9','379.168.348-98',NULL),(366,'claraguip@hotmail.com','Snbya4m2','Clara ','GuimarÃ£es Pereira','claraguip@hotmail.com','1997-10-11',NULL,'','http://claraguip@hotmail.com',0,1,7,'55049860-6','',NULL),(367,'ester.yurie@gmail.com','rUi6WRe4','Ester','Yurie Yoshimoto','ester.yurie@gmail.com','1998-12-28',NULL,'','http://ester.yurie@gmail.com',0,1,7,'39273160-5','',NULL),(368,'jsca.prado@gmail.com','uNr6mMDL','JÃ©ssica','Prado Afonso','jsca.prado@gmail.com','1995-04-18',NULL,'','http://jessiprado@ig.com.br',0,1,7,'36839077-9','319.602.738-41',NULL),(369,'karina.ichimura@gmail.com','jrXNgGbP','Karina','Tamie Ichimura','karina.ichimura@gmail.com','1993-08-23',NULL,'','http://kati_ichimura@hotmail.com',0,1,7,'49658046-2','420.018.168-12',NULL),(370,'nishi.paula@gmail.com','H6jDMAnz','Paula ','Keiko Nishi','nishi.paula@gmail.com','1993-08-15',NULL,'','http://nishi.paula@gmail.com',0,1,7,'40603006-6','431.491.008-95',NULL),(371,'karinamegumi@yahoo.com.br','3rbUmo7v','Karina','Megumi Yosida','karinamegumi@yahoo.com.br','1998-01-21',NULL,'','',0,1,7,'53948671-1','',NULL),(372,'nestoralquati@hotmail.com','3YHnUEGA','Nestor','Alquati','nestoralquati@hotmail.com','1955-02-12',NULL,'','',0,1,7,'86702312','796.184.488-00',NULL),(373,'equipesenior@hotmail.com','HrUIGMWd','Pedro','Correia','equipesenior@hotmail.com','1964-06-28',NULL,'','',0,1,10,'30010704-3','',NULL),(374,'luizmitsuo@egv-software.com.br','E6APYaQM','Luiz','Sakuno','luizmitsuo@egv-software.com.br','1958-06-05',NULL,'','',0,1,7,'','',NULL),(375,'equipesenior@hotmail.com','SsH2gQmU','JoÃ£o','Vagner','equipesenior@hotmail.com','1972-06-01',NULL,'','',0,1,10,'22348402-7','',NULL),(376,'equipesenior@hotmail.com','DPEdGy2s','Tercio','silva','equipesenior@hotmail.com','1971-07-11',NULL,'','',0,1,10,'19750065-1','',NULL),(377,'equipesenior@hotmail.com','ZYBa2QOz','Betanio ','Hercilio','equipesenior@hotmail.com','1967-02-10',NULL,'','',0,1,10,'18866711-8','',NULL),(378,'maoliveira@inser.ind.br','N8WVqHO6','Marcos','Adriano Oliveira','maoliveira@inser.ind.br','1976-09-24',NULL,'','',0,1,7,'23501172-1','252.892.008-35',NULL),(379,'equipesenior@hotmail.com','SYPDEjoV','Willian','Matsuura','equipesenior@hotmail.com','1972-08-13',NULL,'','',0,1,10,'','',NULL),(380,'equipesenior@hotmail.com','aduELnb8','Edson ','Samejima','equipesenior@hotmail.com','1973-01-25',NULL,'','',0,1,10,'22025214-2','',NULL),(381,'equipesenior@hotmail.com','ijrZWHVL','Elson','Takei','equipesenior@hotmail.com','1969-01-13',NULL,'','',0,1,10,'18256932-9','',NULL),(382,'equipesenior@hotmail.com','X23em7WG','SÃ©rgio ','de Sousa Pires','equipesenior@hotmail.com','1969-12-13',NULL,'','',0,1,10,'16868233-3','',NULL),(383,'equipesenior@hotmail.com','UJsQ8Zj0','Sione','Camilo do Nascimento','equipesenior@hotmail.com','1969-04-13',NULL,'','',0,1,10,'22353163-7','',NULL),(384,'ritaeclovis@hotmail.com','XrdZBEAM','ClÃ³vis','Yamanaka','ritaeclovis@hotmail.com','1956-09-16',NULL,'','',0,1,7,'126619451','002.869.568-29',NULL),(385,'equipesenior@hotmail.com','P0yUIj1A','Roberto','Norio Yamamoto','equipesenior@hotmail.com','1952-03-23',NULL,'','',0,1,10,'5479931','',NULL),(386,'equipesenior@hotmail.com','aWNvShAG','Robson','Miamoto','equipesenior@hotmail.com','1970-10-12',NULL,'','',0,1,10,'18921133-7','',NULL),(387,'helioeiko@hotmail.com','2ng10drT','Hélio','Otsubo','helioeiko@hotmail.com','1948-05-14',NULL,'','',0,1,7,'','',NULL),(388,'zerobfalasca@ig.com.br','91tmPoMy','JosÃ©','Roberto Falasca','zerobfalasca@ig.com.br','1962-01-09',NULL,'','',0,1,7,'92816101','045.844.168-69',NULL),(389,'suportehardness@hotmail.com','5BPavinq','Paulo','CÃ©sar Carvalho','suportehardness@hotmail.com','1970-11-20',NULL,'','',0,1,7,'18956846-x','123.009.438-59',NULL),(390,'julikoga@hotmail.com','z2Oauog1','Lucca','Koga Pereira','julikoga@hotmail.com','2002-08-07',NULL,'','',0,1,10,'52.364.228-3','',NULL),(391,'cleide_perez@hotmail.com','5gM1zvW6','Enzo','Vinicius','cleide_perez@hotmail.com','2003-03-14',NULL,'','',0,1,10,'52 729 808-6','',NULL),(392,'laerccio@gmail.com','aX792pzB','Laércio','Pereira','laerccio@gmail.com','1964-07-08',NULL,'','',0,1,7,'','',NULL),(393,'fabioyoshikawa@hotmail.com','GP6gAy5Y','Marcos','Junji Yoshikawa','fabioyoshikawa@hotmail.com','2002-04-06',NULL,'','',0,1,10,'38 468 351-4','',NULL),(394,'vergalh@ig.com.br','munGIiLd','Hugo','Vergal','vergalh@ig.com.br','1966-01-22',NULL,'','',0,1,7,'','',NULL),(395,'cassio.mcb@hotmail.com','hAudrpj4','Matheus','AraÃºjo de Barros','cassio.mcb@hotmail.com','2005-01-22',NULL,'','',0,1,10,'56 096 560-6','',NULL),(396,'e.mda@ig.com.br','sNJueM64','Everaldo','Arruda','e.mda@ig.com.br','1961-02-07',NULL,'','',0,1,7,'12977716','041.838.348-05',NULL),(397,'mkt_makoto@yahoo.com','Oe2iYVbq','Mateus','Sathler','mkt_makoto@yahoo.com','2005-01-22',NULL,'','',0,1,10,'38 864 165-4','',NULL),(398,'lucianoildefonso@yahoo.com.br','m87hvRMe','Ulisses','Idefonso','lucianoildefonso@yahoo.com.br','2002-03-17',NULL,'','',0,1,10,'50 827 588-X','',NULL),(399,'sitsi.nakazoni@voith.com','7e5Miagz','Seitsi','Nakazoni','sitsi.nakazoni@voith.com','1967-03-24',NULL,'','',0,1,7,'','',NULL),(400,'vcopeli@uol.com.br','Dg8hQEIX','Vanderlei','Venancio','vcopeli@uol.com.br','1957-05-21',NULL,'','',0,1,7,'8308111','794.250.038-15',NULL),(401,'alisson_tato10@hotmail.com','s7YmvOQE','Adilson','Onha','alisson_tato10@hotmail.com','1961-09-27',NULL,'','',0,1,7,'8407990','034.902.168-65',NULL),(402,'dvd.jr@hotmail.com','bIoJ846O','Adaelton ','M. Rocha','dvd.jr@hotmail.com','1971-07-28',NULL,'','',0,1,7,'21564779-8','156.571.868-29',NULL),(403,'pedro.eduardo.correia@gmail.com','B2A8VUYP','Kenny','Wei Lon Chan','pedro.eduardo.correia@gmail.com','1983-04-25',NULL,'','',0,1,10,'279771046','',NULL),(404,'semeplus@yahoo.com.br','X26UJyI1','AlmÃ©rio','Tutibachi','semeplus@yahoo.com.br','1959-02-15',NULL,'','',0,1,7,'113565094','011.206.138-92',NULL),(405,'smparana@hotmail.com','HSzMoa40','Wilson','Yonaha','smparana@hotmail.com','1971-01-14',NULL,'','',0,1,7,'19221827','143.892.128-42',NULL),(406,'pedro.eduardo.correia@gmail.com','1pSIgdWD','Eliseu ','Jyh Shyan Chang','pedro.eduardo.correia@gmail.com','1991-05-30',NULL,'','',0,1,10,'477470853','',NULL),(407,'pedro.mota@terra.com.br','S5qtmUig','Pedro','Dias Mota','pedro.mota@terra.com.br','1961-06-29',NULL,'','',0,1,7,'13642907','026.882.978-06',NULL),(408,'rtvidal@ibest.com.br','us3aPvYD','Robson ','T. Vidal','rtvidal@ibest.com.br','1969-01-01',NULL,'','',0,1,7,'','',NULL),(409,'celiopontes.s@bol.com.br','eIpZ6Umr','CÃ©lio ','Pontes','celiopontes.s@bol.com.br','1952-01-01',NULL,'','',0,1,7,'','',NULL),(410,'dvd.jr@hotmail.com','82qsP76Q','Jefferson ','de Moraes Bovolon','dvd.jr@hotmail.com','1965-03-28',NULL,'','',0,1,7,'17578616','558.153.409-87',NULL),(411,'dvd.jr@hotmail.com','1LdurAJZ','Jefferson ','de Moraes Bovolon Junior','dvd.jr@hotmail.com','1998-01-30',NULL,'','',0,1,7,'17578616','',NULL),(412,'dvd.jr@hotmail.com','NmJjV3s8','Jean','Lucas de Oliveira Bovolon','dvd.jr@hotmail.com','2000-08-09',NULL,'','',0,1,7,'17578616','',NULL),(413,'daniel/pedrozo@hotmail.com','Z24Vy69r','Daniel','Pedroso','daniel/pedrozo@hotmail.com','1965-01-01',NULL,'','',0,1,7,'','',NULL),(414,'francisco.mangueira@ig.com.br','6Yn5IvyG','Lucas ','Faria Mangueira','francisco.mangueira@ig.com.br','2000-01-22',NULL,'','',0,1,7,'','',NULL),(415,'dvd.jr@hotmail.com','r8L7ZBuW','Miguel','Issao Fujiwara','dvd.jr@hotmail.com','2000-02-15',NULL,'','',0,1,7,'55205288-7','',NULL),(416,'dvd.jr@hotmail.com','NRQLyPZY','Ricardo','Ap. Francisco ','dvd.jr@hotmail.com','1969-01-01',NULL,'','',0,1,7,'','',NULL),(417,'dvd.jr@hotmail.com','hibHM0V5','Mancuso','Junior','dvd.jr@hotmail.com','1969-01-01',NULL,'','',0,1,7,'','',NULL),(418,'dvd.jr@hotmail.com','u1r93ART','MÃ¡rcio','Junior','dvd.jr@hotmail.com','1969-01-01',NULL,'','',0,1,7,'','',NULL),(419,'dvd.jr@hotmail.com','n5JybY1R','Roberto','Junior','dvd.jr@hotmail.com','1969-01-01',NULL,'','',0,1,7,'','',NULL),(420,'sueliyosida@yahoo.com.br','9bN4Lp8S','Marcos','Yosida','sueliyosida@yahoo.com.br','1999-10-04',NULL,'','',0,1,7,'53948670-x','',NULL),(421,'sayuri.rosana@gmail.com','n24vaGSM','Sayuri','Yoshimoto','sayuri.rosana@gmail.com','2000-12-07',NULL,'','',0,1,7,'39273168-x','',NULL),(422,'dvd.jr@hotmail.com','bDpMhvAJ','Leonardo','Hirai','dvd.jr@hotmail.com','2001-08-11',NULL,'','',0,1,7,'55048901-0','435.498.178-58',NULL),(423,'ane.caroline_dias@hotmail.com','pTs4Zqm0','Ã‰ric','de Brito','ane.caroline_dias@hotmail.com','1999-07-15',NULL,'','',0,1,7,'','',NULL),(424,'verahiranobe@terra.com.br','qR3O0VUX','Lucas ','Hiranobe','verahiranobe@terra.com.br','2001-04-10',NULL,'','',0,1,7,'','',NULL),(425,'amantino.fsoares@gmail.com','a9PQELi7','Caio','Ricardo Cardoso','amantino.fsoares@gmail.com','2000-10-01',NULL,'','',0,1,7,'','',NULL),(426,'daisymgodoy@hotmail.com','QMd7ey9N','Heitor','Machado Godoy','daisymgodoy@hotmail.com','2002-11-06',NULL,'','',0,1,7,'','',NULL),(427,'daisymgodoy@hotmail.com','qISVeB3j','OtÃ¡vio','Machado Godoy','daisymgodoy@hotmail.com','2004-07-17',NULL,'','',0,1,7,'','',NULL),(428,'nancydelguercio@hotmail.com','VDq1ZYBT','Pedro','Del Guercio Dolacio SimÃµes','nancydelguercio@hotmail.com','2002-09-16',NULL,'','',0,1,7,'','',NULL),(429,'claraguip@hotmail.com','EU2T9b5V','HeloÃ­sa','Pereira','claraguip@hotmail.com','1997-10-11',NULL,'','',0,1,7,'','',NULL),(430,'dvd.jr@hotmail.com','8N6uU0P7','Wellinton ','Santana','dvd.jr@hotmail.com','1991-07-11',NULL,'','',0,1,7,'362573499','392.225.778-09',NULL),(431,'japa_stain@hotmail.com','24oVILmP','Danilo','Kanemaru','japa_stain@hotmail.com','1989-04-19',NULL,'','',0,1,7,'45189695-6','363.438.418-22',NULL),(432,'allisonroberto25@gmail.com','E2oeZzM0','Allisson','Nascimento','allisonroberto25@gmail.com','1990-10-05',NULL,'','',0,1,7,'','',NULL),(433,'alisson_tato10@hotmail.com','imegPrDo','Allisson','Onha','alisson_tato10@hotmail.com','1990-01-20',NULL,'','',0,1,7,'44230490-0','405.193.138-28',NULL),(434,'dvd.jr@hotmail.com','pqPMRWZm','Wilson','Versa','dvd.jr@hotmail.com','1984-09-25',NULL,'','',0,1,7,'43970120-x','333.385.508-98',NULL),(435,'dvd.jr@hotmail.com','sHyhTupm','Tiago','Inokuti','dvd.jr@hotmail.com','1987-06-11',NULL,'','',0,1,7,'','',NULL),(436,'rogeriosimizu@gmail.com','zTEWB0YJ','RogÃ©rio','Simizu','rogeriosimizu@gmail.com','1983-06-19',NULL,'','',0,1,7,'','',NULL),(437,'dvd.jr@hotmail.com','OGXTbY02','Vagner','Infante','dvd.jr@hotmail.com','1981-12-01',NULL,'','',0,1,7,'24705050-7','305.247.748-03',NULL),(438,'jaojardimneto@gmail.com','zAJbDB6o','JoÃ£o ','Jardim Neto','jaojardimneto@gmail.com','1990-12-16',NULL,'','',0,1,7,'','',NULL),(439,'fabio_takeda@hotmail.com','E9YBGaUS','FÃ¡bio','Takeda','fabio_takeda@hotmail.com','1980-01-23',NULL,'','',0,1,7,'','297.115.718-03',NULL),(440,'nancydelguercio@hotmail.com','tvAoHd0u','Ivan','Del Guercio Dolacio SimÃµes','nancydelguercio@hotmail.com','2005-11-09',NULL,'','',0,1,7,'','',NULL),(441,'tsilva16','tsilva16','TERCIO','SILVA','tsilva16@hotmail.com','1971-07-11',1198847561,'','',0,1,10,'19750065-1','080.170.558-46',NULL),(442,'dvd.jr@hotmail.com','gVpmSZqs','Laura','Miranda Rocha','dvd.jr@hotmail.com','2003-05-23',NULL,'','',0,1,7,'','',NULL),(443,'dvd.jr@hotmail.com','M8pZ5Dyb','David','Souza Rocha Junior','dvd.jr@hotmail.com','1969-01-29',NULL,'','http://dvd.jr@hotmail.com',0,1,7,'18021050','111.544.178-75',NULL),(444,'reenan-soninho@hotmail.com','hj5UzI0Z','Renan','Barbosa','reenan-soninho@hotmail.com','1997-01-05',NULL,'','',0,1,16,'','085.738.498-86',NULL),(445,'maghaive_hiphop@hotmail.com','Z24Vy69r','Maghaive','da Silva','maghaive_hiphop@hotmail.com','1989-04-21',NULL,'','',0,1,16,'531479596','378.268.778-73',NULL),(446,'pablourbieta@gmail.com','jbIhQsMP','Pablo Cezar ','Urbieta','pablourbieta@gmail.com','1985-12-12',NULL,'','',0,1,16,'337929695','358.915.248-64',NULL),(447,'nenenhiphop10@hotmail.com','yn2tdupz','Jose','Lima','nenenhiphop10@hotmail.com','1994-05-16',NULL,'','',0,1,16,'44068294','441.833.208-10',NULL),(448,'lucasjapa36@hotmail.com','vVXGqORz','Lucas','da Silva','lucasjapa36@hotmail.com','1997-06-12',NULL,'','',0,1,16,'537360001','456.229.598-88',NULL),(449,'joao4d@hotmail.com','n37zmPhT','JoÃ£o','Vicente do Nascimento','joao4d@hotmail.com','1988-05-14',NULL,'','',0,1,16,'426300713','356.404.178-89',NULL),(450,'miojo94@hotmail.com','B53DuIdj','Marcos Vinicius','Miyagi','miojo94@hotmail.com','1994-10-08',NULL,'','',0,1,16,'38561226-6','455.814.258-76',NULL),(451,'massarutakamura@gmail.com','TArZDpny','Massaru','Takamura','massarutakamura@gmail.com','1991-12-20',NULL,'','',0,1,16,'372166933','410.152.488-29',NULL),(452,'jakeline_sugimura@hotmail.com','mB9LqZiG','emili','valdez','jakeline_sugimura@hotmail.com','1998-04-11',NULL,'','',0,1,22,'','',NULL),(453,'naosei@naosei.com.br','J9VG1Ydz','Vinicius','Okano','naosei@naosei.com.br','0000-00-00',NULL,'','',0,1,10,'364078947','',NULL),(454,'caio.santos58@hotmail.com','aGBAZeEv','Caio','Santos Souza','caio.santos58@hotmail.com','1996-11-25',NULL,'','',0,1,10,'38.491.773-2','',NULL),(455,'xxxx@xxxx.com','q6auRESo','Thiago Eiji','Yoshikawa','xxxx@xxxx.com','1997-11-05',NULL,'','',0,1,10,'38.468.352-6','',NULL),(456,'xxxx@xxxx.com','UoLznG84','Eliel Frota','Caneparo','xxxx@xxxx.com','1996-09-30',NULL,'','',0,1,10,'34.446.805','',NULL),(457,'xxxx@xxxx.com','uJRizTYL','Leonardo  De Oliveira','Cruz Santos','xxxx@xxxx.com','1994-12-26',NULL,'','',0,1,10,'48.508.597-5','',NULL),(458,'xxxx@xxxx.com','hPb68RqQ','Eric Watarai','Torita','xxxx@xxxx.com','1998-06-01',NULL,'','',0,1,10,'52.548.510-7','',NULL),(459,'xxxx@xxxx.com','r9z2O46U','Steven Lee','Pena Matfuoka','xxxx@xxxx.com','1998-04-05',NULL,'','',0,1,10,'24.833.935-7','',NULL),(460,'tiagoajk@hotmail.com','Evtd5eVL','André','Nakano','tiagoajk@hotmail.com','1996-01-01',NULL,'','',0,1,25,'','',NULL),(461,'tiagoajk@hotmail.com','Zmb1aJTv','Marcos','Shoji','tiagoajk@hotmail.com','1996-01-01',NULL,'','',0,1,25,'','',NULL),(462,'martins@superset.com.br','1p2DnzQH','SebastiÃ£o','Martins','martins@superset.com.br','1955-01-17',NULL,'','',0,1,25,'5770060','',NULL),(463,'elbio.miyahira@hotmail.com','qV3onOSQ','elbio','miyahira','elbio.miyahira@hotmail.com','1973-03-09',NULL,'','',0,1,24,'17.731.255-5','166.292.508-50',NULL),(464,'felixmh@uol.com.br','0VSUtp98','felix massahiro','harada','felixmh@uol.com.br','1964-07-15',NULL,'','',0,1,24,'15652919','090.028.418-84',NULL),(465,'gugac6@hotmail.com','MWRjUum5','everson','pereira barbosa','gugac6@hotmail.com','1989-03-29',NULL,'','',0,1,24,'44.897.390-x','387.634.398-40',NULL),(466,'UbiratanR','62829201','Ubiratan','Rodrigues','ubiratan2004@aim.com','1969-12-13',1139386162,'','http://www.facebook.com/ubiratan.rodrigues.13',0,1,NULL,'17766324-8','123.472.638-62',NULL),(467,'djjura@me.com','PzqL3giA','Airton Mikio','Hobo','djjura@me.com','1980-01-01',NULL,'','',0,1,25,'34.040.737-2','',NULL),(468,'macos.tahide@gmail.com','qtJAS97m','Marcos','Takehide Watanabe','macos.tahide@gmail.com','1987-10-31',NULL,'','',0,1,10,'45980481-5','',NULL),(469,'furuka@gmail.com','nibTmOp1','flavio','furukawa','furuka@gmail.com','1987-06-04',NULL,'','',0,1,17,'445886493','354.826.888-95',NULL),(470,'elbio.miyahira@hotmail.com','oaP7pjn2','argemiro ','carneiro neto','elbio.miyahira@hotmail.com','1975-05-16',NULL,'','',0,1,24,'35.659.697-7','966.298.196-91',NULL),(471,'elbio.miyahira@hotmail.com','bIoJ846O','antonio carlos da','silva','elbio.miyahira@hotmail.com','1978-01-06',NULL,'','',0,1,24,'253172795','876.927.673-00',NULL),(472,'elbio.miyahira@hotmail.com','djOAs6NP','grover','paqui nina','elbio.miyahira@hotmail.com','1984-04-21',NULL,'','',0,1,24,'','232.246.938-60',NULL),(473,'elbio.miyahira@hotmail.com','ieHqQ1Gv','alex','mamani huaypa','elbio.miyahira@hotmail.com','1982-12-11',NULL,'','',0,1,24,'','',NULL),(474,'elbio.miyahira@hotmail.com','D1EVvRdr','davi','paqui villegas','elbio.miyahira@hotmail.com','2000-12-12',NULL,'','',0,1,24,'','',NULL),(475,'elbio.miyahira@hotmail.com','3gdZ7WAT','jonathan','meira costa','elbio.miyahira@hotmail.com','1999-06-15',NULL,'','',0,1,24,'54066684-1','',NULL),(476,'elbio.miyahira@hotmail.com','8ErdA6V4','carlos henrique','miranda da silva','elbio.miyahira@hotmail.com','2002-05-26',NULL,'','',0,1,24,'','',NULL),(477,'paulinho_bocaum@hotmail.com','0rZiodsB','paulo henrique silveira ','moia dos santos','paulinho_bocaum@hotmail.com','1994-04-15',NULL,'','',0,1,17,'412182300','425.191.278-05',NULL),(478,'gabriel.brandao.fernandes@facebook.com','Ug2ZHdRv','gabriel brandÃ£o ','fernandes','gabriel.brandao.fernandes@facebook.com','1994-03-04',NULL,'','',0,1,17,'495867731','431.382.248-81',NULL),(479,'elbio.miyahira@hotmail.com','Ap9GvgM1','hugo ','tambo quiste','elbio.miyahira@hotmail.com','1983-09-02',NULL,'','',0,1,24,'','',NULL),(480,'elbio.miyahira@hotmail.com','HhIo184L','francisco igor ','felix da silva','elbio.miyahira@hotmail.com','1996-01-03',NULL,'','',0,1,24,'54.158.860-6','449.190.868-06',NULL),(481,'fabinho_ozawa@hotmail.com','53jsMazq','fabio go ','ozawa','fabinho_ozawa@hotmail.com','1982-09-24',NULL,'','',0,1,17,'33.212.986-X','227.062.538-27',NULL),(482,'juninho_simmel@hotmail.com','L9de32pz','Edson','Simmel Junior ','juninho_simmel@hotmail.com','1985-12-13',NULL,'','',0,1,23,'43065774-2','340.777.778-79',NULL),(483,'sabrina_nakmura@yahoo.com.br','JoPvUgLB','Sabrina','Sobata Nacamura Simmel','sabrina_nakmura@yahoo.com.br','1981-12-22',NULL,'','',0,1,23,'35298054-0','225.139.918-69',NULL),(484,'lukinha_marola@hotmail.com','AZ1QsBDO','Lucas Emanuel','Lopes Gomes ','lukinha_marola@hotmail.com','1994-09-22',NULL,'','',0,1,17,'406951329','423.470.208-03',NULL),(485,'ubiratan2004@aim.com','D32d5iph','Ubiratan ','Rodrigues','ubiratan2004@aim.com','1969-12-13',NULL,'','',0,1,21,'','',NULL),(486,'heraldo.evelyn@gmail.com','LaVZT7r6','Heraldo ','Munakata','heraldo.evelyn@gmail.com','1969-07-28',NULL,'','',0,1,21,'18.514.146-8','',NULL),(487,'minamioka01@yahoo.com.br','MbnhsIQE','TÃ©rcio Hiroshi ','Minamioka','minamioka01@yahoo.com.br','1976-02-25',NULL,'','',0,1,21,'28259038-9','',NULL),(488,'ntakemoto@hotmail.com','yQzNW7O9','Nelson Yasuto ','Takemoto','ntakemoto@hotmail.com','1975-12-09',NULL,'','',0,1,21,'','',NULL),(489,'hmassaok@yahoo.com.br','pVAmHBdb','Henrique','Massaoka','hmassaok@yahoo.com.br','1975-06-14',NULL,'','',0,1,21,'','',NULL),(490,'mario.maeda@imel.org.br','7hTSMN09','Mario','Maeda','mario.maeda@imel.org.br','1961-05-16',NULL,'','',0,1,21,'10.141.854','',NULL),(491,'alexssanderdp@gmail.com','zXtvr60o','Alexssander','Donizete de Paula','alexssanderdp@gmail.com','1981-03-14',NULL,'','https://www.facebook.com/alexssanderdp',0,1,12,'335450714','282.459.008-42',NULL),(492,'andre.floco@ig.com.br','iHr3gVRT','Andre','Muller do Prado','andre.floco@ig.com.br','1985-02-27',NULL,'','https://www.facebook.com/andre.muller.39545',0,1,12,'32516337','315.281.468-24',NULL),(493,'lucks0007@hotmail.com','Gmhga8vr','Lucas','Marins','lucks0007@hotmail.com','1992-02-19',NULL,'','https://www.facebook.com/lucas.marins.543',0,1,12,'484764974','389.239.428-80',NULL),(494,'aspilosbass@gmail.com','h08HrMvJ','JosÃ© Magno','Sousa de ArÃºujo','aspilosbass@gmail.com','1982-03-11',NULL,'','https://www.facebook.com/magno.araujo.311',0,1,12,'309493018','306.954.638-29',NULL),(495,'marcio.enge@yahoo.com.br','pPEaoLGQ','MÃ¡rcio Antonio','Moreira da Silva','marcio.enge@yahoo.com.br','1971-08-02',NULL,'','https://www.facebook.com/marcioantoniomoreira.more',0,1,12,'220836838','177.445.978-77',NULL),(496,'wagner.adress@yahoo.com.br','dRT5e8oQ','Wagner','Oliveira Pereira','wagner.adress@yahoo.com.br','1976-11-12',NULL,'','https://www.facebook.com/wagner.pereira.50',0,1,12,'275395200','177.027.518-51',NULL),(497,'danilo.aspilos@gmail.com','TojWnaPb','Danilo','Rodrigues Pereira','danilo.aspilos@gmail.com','0000-00-00',NULL,'','https://www.facebook.com/danilo.rodriguespereira.3',0,1,12,'439107994','319.081.438-43',NULL),(498,'heleno101@yahoo.com.br','OMThes0J','Heleno','Almeida','heleno101@yahoo.com.br','1977-05-29',NULL,'','',0,1,7,'29453396-5','203.273.618-75',NULL),(499,'ogeidcosmo@yahoo.com.br','2r4bBahU','Diego','Cosmo de Souza','ogeidcosmo@yahoo.com.br','1984-07-12',NULL,'','https://www.facebook.com/diegocosmo.uabitapevi.si',0,1,12,'289943747','226.500.138-42',NULL),(500,'carlosalberto.blochmarins@facebook.com','LJiHsvjR','Carlos Alberto','Bloch Marins','carlosalberto.blochmarins@facebook.com','0000-00-00',NULL,'','https://www.facebook.com/carlosalberto.blochmarins',0,1,12,'241402499','143.029.288-16',NULL),(501,'fernandonemes@facebook.com','0r8WEvJ1','Fernando','Souza dos Santos Nemes','fernandonemes@facebook.com','1992-05-01',NULL,'','https://www.facebook.com/fernandonemes',0,1,12,'485735969','395.727.478-86',NULL),(502,'edgar_ribeiro@ig.com.br','s23nzYRD','Edgar','Ribeiro','edgar_ribeiro@ig.com.br','0000-00-00',NULL,'','https://www.facebook.com/eddnofake',0,1,12,'454634122','347.761.908-00',NULL),(503,'souapoly@gmail.com','mLz3Wa7q','Gabriela ','Trigo','souapoly@gmail.com','1982-05-02',NULL,'','',0,1,23,'35148419x','307.654.858-18',NULL),(504,'alemao.nordi@ig.com.br','eqM076ut','Bruno','Pereira Santos','alemao.nordi@ig.com.br','1994-11-13',NULL,'','',0,1,7,'','',NULL),(505,'vittorkn@gmail.com','jWA1oPJQ','Vittor','Nakkai','vittorkn@gmail.com','1976-04-26',NULL,'','',0,1,21,'24316920-6','',NULL),(506,'hondamariana@gmail.com','idXI3nHj','Mariana','Honda','hondamariana@gmail.com','1986-11-21',NULL,'','',0,1,23,'32871777-0','322.457.138-18',NULL),(507,'ricardo.hideki@gmail.com','J3sGyHuV','Rodrigo','Waki','ricardo.hideki@gmail.com','1982-09-29',NULL,'','',0,1,27,'29.583.122-4','',NULL),(508,'ganecobr@yahoo.com.br','OvVioI9Y','Alex','Ganeco','ganecobr@yahoo.com.br','1980-11-11',NULL,'','',0,1,7,'','',NULL),(509,'ganecobr@yahoo.com.br','7uJgXWN1','LetÃ­cia','Cristina de Oliveira Stos','ganecobr@yahoo.com.br','1985-11-11',NULL,'','',0,1,7,'','',NULL),(510,'ganecobr@yahoo.com.br','NXHgmyqD','Francine','Lopes Santaguida','ganecobr@yahoo.com.br','1985-11-11',NULL,'','',0,1,7,'','',NULL),(511,'ganecobr@yahoo.com.br','JvY4n5MP','Leonardo','Hideki Watanabe','ganecobr@yahoo.com.br','1990-11-11',NULL,'','',0,1,7,'','',NULL),(512,'ganecobr@yahoo.com.br','7dHYjSbQ','Enzo','Fukuyama','ganecobr@yahoo.com.br','1990-11-11',NULL,'','',0,1,7,'','',NULL),(513,'otavioryoizumi@gmail.com','B89YIQ7V','Paulo','Nakayama','otavioryoizumi@gmail.com','1955-11-02',NULL,'','',0,1,25,'','',NULL),(514,'otavioryoizumi@gmail.com','7PnJR91D','Milton','Koiti Sassaqui','otavioryoizumi@gmail.com','1964-09-13',NULL,'','',0,1,25,'','',NULL),(515,'ganecobr@yahoo.com.br','4iE75gqJ','JoÃ£o','Jardim','ganecobr@yahoo.com.br','1965-11-11',NULL,'','',0,1,7,'','',NULL),(516,'otavioryoizumi@gmail.com','Pau6BSQd','Claudio','Chiba','otavioryoizumi@gmail.com','1970-11-11',NULL,'','',0,1,25,'','',NULL),(517,'furuka@gmail.com','OvLHqTiV','Danilo','A. dos Santos','furuka@gmail.com','1990-02-01',NULL,'','',0,1,17,'','',NULL),(518,'furuka@gmail.com','YaDgT62v','Leandro','Cavalcanti de Souza','furuka@gmail.com','1993-10-04',NULL,'','',0,1,17,'','',NULL),(519,'lucas_arai@hotmail.com','BOyPpdGL','Alexsander','Pacheco Teixeira','lucas_arai@hotmail.com','1997-06-19',NULL,'','',0,1,20,'','',NULL),(520,'souapoly@gmail.com','zaZJGQhH','Wilson','Paulo Takahashi','souapoly@gmail.com','1966-09-22',NULL,'','',0,1,23,'','',NULL),(521,'souapoly@gmail.com','PnBWI7Ub','Naama','Mendes Junior','souapoly@gmail.com','1991-10-28',NULL,'','',0,1,23,'','',NULL),(522,' luizinhol88','03l06h99s','Luiz ','Henrique ','luizinhol88@yahoo.com','1999-06-03',1194151083,'','',0,1,NULL,'00000000000','',NULL),(523,'emburaman+teste001@gmail.com','f3cddafbef4251abe4c4cab9a89b8b3821fb1f4f','Lincoln Teste','Souza','emburaman+teste001@gmail.com','1979-11-07',NULL,NULL,NULL,0,1,NULL,'281566999','26903191879',NULL),(524,'teste@123iow.com','b6349fb3443a50cc0148a95f8af4ab27cc51181a','teste novo','novo','teste@123iow.com','1979-11-07',NULL,NULL,NULL,0,1,NULL,'321654987','321654987654',NULL),(527,'lincolnschunck@hotmail.com','f23b343a106900f4b4eca8faf407c73f20b64c87','Lincoln','Souza','lincolnschunck@hotmail.com','1979-11-07',NULL,NULL,NULL,0,1,NULL,'28156699','26903191879',NULL),(528,'lincoln','e2a8bbda57fb87262b0f7e59c3bccbbe9f361e23','Lincoln','Souza','emburaman@yahoo.com.br','1979-11-07',1938160305,NULL,NULL,0,1,NULL,'28156699','26903191879',1),(529,'lincoln','e2a8bbda57fb87262b0f7e59c3bccbbe9f361e23','Lincoln','Souza','emburaman@yahoo.com.br','1979-11-07',1938160305,NULL,NULL,0,1,NULL,'28156699','26903191879',1),(530,'lincoln','e2a8bbda57fb87262b0f7e59c3bccbbe9f361e23','Lincoln','Souza','emburaman@yahoo.com.br','1979-11-07',1938160305,NULL,NULL,0,1,NULL,'28156699','26903191879',1),(531,'lincoln','e2a8bbda57fb87262b0f7e59c3bccbbe9f361e23','Lincoln','Souza','emburaman@yahoo.com.br','1979-11-07',1938160305,NULL,NULL,0,1,NULL,'28156699','26903191879',1),(532,'testetesteteste','deff19acf61211bfc9ee203d3e10448d95499c59','teste','teste','teste@123iow.com','1979-11-07',1938160305,NULL,NULL,1,1,NULL,'28156699','26903191879',NULL);
/*!40000 ALTER TABLE `es_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_venue`
--

DROP TABLE IF EXISTS `es_venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_venue` (
  `id_venue` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `www` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_venue`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_venue`
--

LOCK TABLES `es_venue` WRITE;
/*!40000 ALTER TABLE `es_venue` DISABLE KEYS */;
INSERT INTO `es_venue` VALUES (1,'Paraiso 48','Estrada Municipal do Carmo, 1201 - Bairro do Carmo. Vargem Grande Paulista','http://www.paraiso48.com.br','paraiso48@paraiso48.com.br','(11) 3763-6100');
/*!40000 ALTER TABLE `es_venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_variables`
--

DROP TABLE IF EXISTS `sys_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_variables` (
  `var_key` varchar(255) NOT NULL,
  `var_value` longtext NOT NULL,
  `var_stringid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`var_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_variables`
--

LOCK TABLES `sys_variables` WRITE;
/*!40000 ALTER TABLE `sys_variables` DISABLE KEYS */;
INSERT INTO `sys_variables` VALUES ('gender_both','X',''),('gender_fem','F',''),('gender_male','M',''),('play_mode_single','0',''),('play_mode_team','1',''),('status_active','1',''),('status_inactive','0',''),('type_club','0',''),('type_conf','2',''),('type_fed','1','');
/*!40000 ALTER TABLE `sys_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_athletes`
--

DROP TABLE IF EXISTS `vw_athletes`;
/*!50001 DROP VIEW IF EXISTS `vw_athletes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_athletes` (
  `id_athlete` tinyint NOT NULL,
  `id_user` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `user_name` tinyint NOT NULL,
  `profile` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `id_association` tinyint NOT NULL,
  `entity` tinyint NOT NULL,
  `team_name` tinyint NOT NULL,
  `jersey_main_color` tinyint NOT NULL,
  `team_status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_games`
--

DROP TABLE IF EXISTS `vw_games`;
/*!50001 DROP VIEW IF EXISTS `vw_games`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_games` (
  `id_game` tinyint NOT NULL,
  `date_time` tinyint NOT NULL,
  `id_game_place` tinyint NOT NULL,
  `id_user_keeper` tinyint NOT NULL,
  `id_event` tinyint NOT NULL,
  `id_team_a` tinyint NOT NULL,
  `id_team_b` tinyint NOT NULL,
  `score_a` tinyint NOT NULL,
  `score_b` tinyint NOT NULL,
  `id_winner` tinyint NOT NULL,
  `quadra` tinyint NOT NULL,
  `team_a` tinyint NOT NULL,
  `team_b` tinyint NOT NULL,
  `id_category` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_score`
--

DROP TABLE IF EXISTS `vw_score`;
/*!50001 DROP VIEW IF EXISTS `vw_score`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_score` (
  `id_subscription` tinyint NOT NULL,
  `id_game` tinyint NOT NULL,
  `id_score_type` tinyint NOT NULL,
  `result` tinyint NOT NULL,
  `id_team` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_subscriptions`
--

DROP TABLE IF EXISTS `vw_subscriptions`;
/*!50001 DROP VIEW IF EXISTS `vw_subscriptions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_subscriptions` (
  `id_athlete` tinyint NOT NULL,
  `id_association` tinyint NOT NULL,
  `id_event` tinyint NOT NULL,
  `athlete_status` tinyint NOT NULL,
  `id_user` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `user_status` tinyint NOT NULL,
  `id_subscription` tinyint NOT NULL,
  `jersey_num` tinyint NOT NULL,
  `subscription_status` tinyint NOT NULL,
  `id_team` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `id_category` tinyint NOT NULL,
  `group_id` tinyint NOT NULL,
  `jersey_main_color` tinyint NOT NULL,
  `team_status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_teams`
--

DROP TABLE IF EXISTS `vw_teams`;
/*!50001 DROP VIEW IF EXISTS `vw_teams`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_teams` (
  `id` tinyint NOT NULL,
  `team_name` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `entity_id` tinyint NOT NULL,
  `entity` tinyint NOT NULL,
  `id_category` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `id_event` tinyint NOT NULL,
  `num_athletes` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_athletes`
--

/*!50001 DROP TABLE IF EXISTS `vw_athletes`*/;
/*!50001 DROP VIEW IF EXISTS `vw_athletes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_athletes` AS select `a`.`id_athlete` AS `id_athlete`,`u`.`id_user` AS `id_user`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`birthdate` AS `birthdate`,floor(((to_days(now()) - to_days(`u`.`birthdate`)) / 365)) AS `age`,`u`.`email` AS `email`,`u`.`user_name` AS `user_name`,`u`.`profile` AS `profile`,`u`.`status` AS `status`,`e`.`id_association` AS `id_association`,`e`.`name` AS `entity`,`t`.`name` AS `team_name`,`t`.`jersey_main_color` AS `jersey_main_color`,`t`.`status` AS `team_status` from ((((`es_athlete` `a` left join `es_user` `u` on((`u`.`id_user` = `a`.`id_user`))) left join `es_association` `e` on((`e`.`id_association` = `a`.`id_association`))) left join `es_subscription` `s` on((`s`.`id_athlete` = `a`.`id_athlete`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_games`
--

/*!50001 DROP TABLE IF EXISTS `vw_games`*/;
/*!50001 DROP VIEW IF EXISTS `vw_games`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_games` AS select `g`.`id_game` AS `id_game`,`g`.`date_time` AS `date_time`,`g`.`id_game_place` AS `id_game_place`,`g`.`id_user_keeper` AS `id_user_keeper`,`g`.`id_event` AS `id_event`,`g`.`id_team_a` AS `id_team_a`,`g`.`id_team_b` AS `id_team_b`,`g`.`score_a` AS `score_a`,`g`.`score_b` AS `score_b`,`g`.`id_winner` AS `id_winner`,`p`.`name` AS `quadra`,`t1`.`name` AS `team_a`,`t2`.`name` AS `team_b`,`c`.`id_category` AS `id_category`,`c`.`name` AS `category` from ((((`es_game` `g` left join `es_team` `t1` on((`t1`.`id_team` = `g`.`id_team_a`))) left join `es_team` `t2` on((`t2`.`id_team` = `g`.`id_team_b`))) left join `es_category` `c` on((`c`.`id_category` = `t1`.`id_category`))) left join `es_game_place` `p` on((`p`.`id_game_place` = `g`.`id_game_place`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_score`
--

/*!50001 DROP TABLE IF EXISTS `vw_score`*/;
/*!50001 DROP VIEW IF EXISTS `vw_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_score` AS select `es_score`.`id_subscription` AS `id_subscription`,`es_score`.`id_game` AS `id_game`,`es_score`.`id_score_type` AS `id_score_type`,count(`es_score`.`value`) AS `result`,`t`.`id_team` AS `id_team` from ((`es_score` left join `es_subscription` `s` on((`s`.`id_subscription` = `es_score`.`id_subscription`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`))) group by `es_score`.`id_subscription`,`es_score`.`id_game`,`es_score`.`id_score_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_subscriptions`
--

/*!50001 DROP TABLE IF EXISTS `vw_subscriptions`*/;
/*!50001 DROP VIEW IF EXISTS `vw_subscriptions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_subscriptions` AS select `a`.`id_athlete` AS `id_athlete`,`a`.`id_association` AS `id_association`,`s`.`id_event` AS `id_event`,`a`.`status` AS `athlete_status`,`u`.`id_user` AS `id_user`,`u`.`lastname` AS `lastname`,`u`.`firstname` AS `firstname`,`u`.`birthdate` AS `birthdate`,floor(((to_days(now()) - to_days(`u`.`birthdate`)) / 365)) AS `age`,`u`.`status` AS `user_status`,`s`.`id_subscription` AS `id_subscription`,`s`.`jersey_num` AS `jersey_num`,`s`.`status` AS `subscription_status`,`t`.`id_team` AS `id_team`,`t`.`name` AS `name`,`t`.`id_category` AS `id_category`,`t`.`group_id` AS `group_id`,`t`.`jersey_main_color` AS `jersey_main_color`,`t`.`status` AS `team_status` from (((`es_athlete` `a` left join `es_user` `u` on((`u`.`id_user` = `a`.`id_user`))) left join `es_subscription` `s` on((`s`.`id_athlete` = `a`.`id_athlete`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_teams`
--

/*!50001 DROP TABLE IF EXISTS `vw_teams`*/;
/*!50001 DROP VIEW IF EXISTS `vw_teams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_teams` AS select `t`.`id_team` AS `id`,`t`.`name` AS `team_name`,`t`.`jersey_main_color` AS `color`,`t`.`status` AS `status`,`a`.`id_association` AS `entity_id`,`a`.`name` AS `entity`,`c`.`id_category` AS `id_category`,`c`.`name` AS `category`,`e`.`id_event` AS `id_event`,(select count(0) from `vw_subscriptions` `s` where (`s`.`id_team` = `id`)) AS `num_athletes` from (((`es_team` `t` left join `es_association` `a` on((`t`.`id_association` = `a`.`id_association`))) left join `es_category` `c` on((`t`.`id_category` = `c`.`id_category`))) left join `es_event` `e` on((`t`.`id_event` = `e`.`id_event`))) where (`e`.`status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-22  0:03:27
