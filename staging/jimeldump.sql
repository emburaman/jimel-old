-- MySQL dump 10.13  Distrib 5.5.36, for Linux (x86_64)
--
-- Host: localhost    Database: jimeltest01
-- ------------------------------------------------------
-- Server version	5.5.36

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
  PRIMARY KEY (`id_association`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_association`
--

LOCK TABLES `es_association` WRITE;
/*!40000 ALTER TABLE `es_association` DISABLE KEYS */;
INSERT INTO `es_association` VALUES (5,'IMeL Campinas',1,8),(7,'IMeL Sorocaba',1,8),(8,'ConcÃ­lio Nikkei',1,0),(9,'IMeL Apucarana',1,8),(10,'IMeL Diadema',1,8),(11,'IMeL Embura',1,8),(12,'IMeL Itapevi',1,8),(13,'IMeL JaÃ§anÃ£',1,8),(14,'IMeL Jardim Planalto',1,8),(15,'IMeL JordanÃ³polis',1,8),(16,'IMeL Liberdade',1,8),(17,'IMeL MarÃ­lia',1,8),(18,'IMeL Mogi das Cruzes',1,8),(19,'IMeL Novo Alvoecer',1,8),(20,'IMeL Pindamoiangaba',1,8),(21,'IMeL Pinheiros',1,8),(22,'IMeL Santana',1,8),(23,'IMeL SÃ£o JosÃ© dos Campos',1,8),(24,'IMeL SÃ£o Remo',1,8),(25,'IMeL SaÃºde',1,8),(26,'IMeL Vila Mariana',1,8),(27,'IMeL Curitiba',1,8);
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
  `jersey_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_athlete`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_athlete`
--

LOCK TABLES `es_athlete` WRITE;
/*!40000 ALTER TABLE `es_athlete` DISABLE KEYS */;
INSERT INTO `es_athlete` VALUES (1,1014,21,2,1,0),(2,1015,21,2,1,0),(3,1016,21,2,1,0),(4,1017,21,2,1,0),(5,1020,21,2,1,0),(6,1021,21,2,1,0),(7,1022,21,2,1,0),(8,1023,21,2,1,0),(9,1024,21,2,1,0),(10,1025,21,2,1,0),(11,1026,21,2,1,0),(12,1027,21,2,1,0),(13,1028,21,2,1,0),(15,1030,21,2,1,0),(16,1031,16,2,1,2),(17,1032,21,2,1,0),(18,1033,21,2,1,0),(19,1034,21,2,1,0),(20,1035,21,2,1,0),(21,1036,21,2,1,0),(22,1037,21,2,1,0),(23,1038,21,2,1,0),(24,1039,21,2,1,0),(25,1040,21,2,1,0),(26,1041,21,2,1,0),(27,1042,20,2,1,8),(28,1044,21,2,1,0),(29,1045,21,2,1,0),(30,1046,21,2,1,0),(31,1047,21,2,1,0),(32,1048,18,2,1,10),(33,1049,21,2,1,0),(34,1050,21,2,1,0),(35,1051,21,2,1,0);
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
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_category`
--

LOCK TABLES `es_category` WRITE;
/*!40000 ALTER TABLE `es_category` DISABLE KEYS */;
INSERT INTO `es_category` VALUES (1,1,0,'Feminino',NULL,'1','F',NULL,NULL),(2,1,0,'Senior',NULL,'1','M',NULL,NULL),(3,1,0,'Junior',NULL,'1','M',13,17),(4,1,0,'Mirim',NULL,'1','X',7,12),(5,1,1,'Master',NULL,'1','M',30,NULL),(6,1,2,'Veteranos',NULL,'1','M',46,NULL);
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
  PRIMARY KEY (`id_event`)
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
  `is_finished` tinyint(4) DEFAULT '0',
  `id_group` varchar(5) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `alloc` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_game`
--

LOCK TABLES `es_game` WRITE;
/*!40000 ALTER TABLE `es_game` DISABLE KEYS */;
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
  PRIMARY KEY (`id_game_place`)
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
  `id_group` varchar(20) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT '1' COMMENT '1 - ATIVO; 0 - INATIVO',
  `id_category` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_group`
--

LOCK TABLES `es_group` WRITE;
/*!40000 ALTER TABLE `es_group` DISABLE KEYS */;
INSERT INTO `es_group` VALUES ('A','1',1),('B','1',1),('A','1',2),('B','1',2),('C','1',2),('D','1',2),('E','1',2),('F','1',2),('A','1',3),('B','1',3),('C','1',3),('A','1',4),('A','1',5),('B','1',5),('A','1',6),('B','1',6);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_score`
--

LOCK TABLES `es_score` WRITE;
/*!40000 ALTER TABLE `es_score` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_score_type`
--

LOCK TABLES `es_score_type` WRITE;
/*!40000 ALTER TABLE `es_score_type` DISABLE KEYS */;
INSERT INTO `es_score_type` VALUES (1,'Gol'),(2,'Falta'),(3,'Cartão Vermelho'),(4,'Cartão Amarelo'),(5,'Substituição'),(6,'Gol Contra');
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
  PRIMARY KEY (`id_subscription`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_subscription`
--

LOCK TABLES `es_subscription` WRITE;
/*!40000 ALTER TABLE `es_subscription` DISABLE KEYS */;
INSERT INTO `es_subscription` VALUES (6,9,1,NULL,'1',2),(8,11,1,NULL,'1',2),(19,12,2,NULL,'1',2),(20,4,3,NULL,'1',2),(21,1,3,NULL,'1',2),(22,2,3,NULL,'1',2),(24,3,3,NULL,'1',2),(25,5,2,NULL,'1',2),(26,6,2,NULL,'1',2),(27,7,2,NULL,'1',2),(28,8,3,NULL,'1',2),(29,10,1,NULL,'1',2),(30,13,2,NULL,'1',2),(31,15,3,NULL,'1',2),(32,19,1,NULL,'1',2),(33,23,1,NULL,'1',2),(34,22,3,NULL,'1',2),(35,17,2,NULL,'1',2),(36,18,2,NULL,'1',2),(37,21,2,NULL,'1',2),(39,20,1,NULL,'1',2),(40,24,3,NULL,'1',2),(41,25,1,NULL,'1',2),(42,26,1,NULL,'1',2),(43,28,1,NULL,'1',2),(44,31,2,NULL,'1',2),(45,33,3,NULL,'1',2),(47,34,1,NULL,'1',2),(48,35,3,NULL,'1',2);
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
  `id_group` varchar(11) DEFAULT NULL,
  `jersey_main_color` varchar(50) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'ATIVO' COMMENT 'INATIVO; ATIVO',
  `group_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_team`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_team`
--

LOCK TABLES `es_team` WRITE;
/*!40000 ALTER TABLE `es_team` DISABLE KEYS */;
INSERT INTO `es_team` VALUES (1,'Pinheiros - Junior',21,2,3,'','#e23636','1',''),(2,'Pinheiros - SÃªnior',21,2,2,'','#5add61','1',''),(3,'Pinheiros - Master',21,2,5,'','#9c9c9c','1',''),(4,'Senior Pinda 1',20,2,2,'','#ffffff','1',NULL),(5,'Senior Pinda 2',20,2,2,'','#cccccc','1',NULL),(6,'Junior Pinda',20,2,3,'','#ffffff','1',NULL),(7,'Mirim Pinda',20,2,4,'','#FFFFFF','1',NULL),(8,'Master Pinda',20,2,5,'','#FFFFFF','1',NULL),(11,'Mirim Pinda 2',20,2,4,'','#e81111','1',NULL),(12,'Imel Mogi',18,2,2,'','#ffffff','1','');
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
  `phone` varchar(20) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `profile` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:user; 1:club-representative; 2: team-representative; 3:admin',
  `gender` varchar(1) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:inactive; 1:active',
  `id_association` int(11) DEFAULT NULL,
  `rg` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  `chg_pwd` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_user`
--

LOCK TABLES `es_user` WRITE;
/*!40000 ALTER TABLE `es_user` DISABLE KEYS */;
INSERT INTO `es_user` VALUES (1,'emburaman','f146bde488269ec832d9da532bc0bbf1e0b1d207','Lincoln','Souza','emburaman@gmail.com','1979-11-07','(19) 9 8249-6232',NULL,NULL,3,'M',1,8,'','',1,0),(2,'rsimizu','96664142e006e0bfc5e83bd3d21be6a3bba47f88','Reinaldo','Simizu','reinaldo.simizu@gmail.com','1970-01-01','',NULL,NULL,3,'M',1,8,'','',1,0),(3,'reinaldo1','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Reinaldo','Representante 1','reinaldo.simizu@gmail.com','1970-01-01','',NULL,NULL,1,'M',1,7,'','',NULL,0),(4,'reinaldo2','f878da5a09a104ac15a65d97a926b2076ddd8a3d','Reinaldo','Representante 2','reinaldo.simizu@gmail.com','1970-01-01','',NULL,NULL,1,'M',1,17,'','',1,0),(5,'lincoln','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Lincoln','Souza','emburaman@gmail.com','1979-11-07','',NULL,NULL,1,'M',1,5,'','',NULL,0),(10,'sato.elton@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Elton','Sato','sato.elton@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,9,'','',NULL,0),(11,'rosado.lagoa@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Felipe','Rosado','rosado.lagoa@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,5,'','',NULL,0),(12,'hideki_ueda17@hotmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Hideki','Ueda','hideki_ueda17@hotmail.com','1980-01-01','',NULL,NULL,1,'M',1,27,'','',NULL,0),(13,'jeferson.umesp@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Jeferson','Souza','jeferson.umesp@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,10,'','',NULL,0),(14,'kmvmiura@terra.com.br','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Kyioti','Miura','kmvmiura@terra.com.br','1980-01-01','',NULL,NULL,1,'M',1,11,'','',NULL,0),(15,'aspilosbass@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','JosÃ© Magno','AraÃºjo','aspilosbass@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,12,'','',NULL,0),(16,'jessica.silvamonteiro@gmacfs.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','JÃ©ssica','Monteiro','jessica.silvamonteiro@gmacfs.com','1980-01-01','',NULL,NULL,1,'M',1,15,'','',NULL,0),(17,'pablourbieta@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Pablo','Urbieta','pablourbieta@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,16,'','',NULL,0),(18,'fah.miura@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Fabricio','Miura','fah.miura@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,17,'','',NULL,0),(19,'ly.sugawara@uol.com.br','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Luiz','Sugawara','ly.sugawara@uol.com.br','1980-01-01','',NULL,NULL,1,'M',1,19,'','',NULL,0),(20,'lucasarai@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Lucas','Arai','lucasarai@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,20,'','',NULL,0),(21,'rafael.sacifs@hotmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Rafael','Ferreira','rafael.sacifs@hotmail.com','1980-01-01','',NULL,NULL,1,'M',1,21,'','',NULL,0),(22,'jakeline_sugimura@hotmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Jakeline','Sugimura','jakeline_sugimura@hotmail.com','1970-01-01','',NULL,NULL,1,'F',1,22,'49.583.986-2','',0,0),(23,'norberto.crystal@uol.com.br','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Norberto','Nishimoto','norberto.crystal@uol.com.br','1980-01-01','',NULL,NULL,1,'M',1,23,'','',NULL,0),(24,'elbio.miyahira@imel.org.br','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Elbio','Miyahira','elbio.miyahira@imel.org.br','1980-01-01','',NULL,NULL,1,'M',1,24,'','',NULL,0),(25,'otavioryoizumi@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','OtÃ¡vio','Izumi','otavioryoizumi@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,25,'','',NULL,0),(26,'daniel.yoshimoto@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Daniel','Yoshimoto','daniel.yoshimoto@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,7,'','',NULL,0),(27,'andre.koshiyama@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','AndrÃ©','Koshiyama','andre.koshiyama@gmail.com','1980-01-01','',NULL,NULL,1,'M',1,26,'','',NULL,0),(1014,'rafael.sacifs@hotmail.com','09d1f8d3b210acea2c2de1dafcbd5d181a3ed49b','Rafael','Ferreira da Silva','rafael.sacifs@hotmail.com','1976-12-22',NULL,NULL,NULL,0,'M',1,21,'27250435-X','18624119804',0,0),(1015,'heraldo.evelyn@gmail.com','396ac15fe6dbe7cc52ab701b113f4a9a4ec2497f','Heraldo','Shoji Munakata','heraldo.evelyn@gmail.com','1969-07-28',NULL,NULL,NULL,0,'M',1,21,'18.514.146-8','125.787.058-01',0,0),(1016,'Ricardo.barcelos@elgin.com.br','4810332ef50bed1da56888f31de2feb4d13f8180','Ricardo','Nunes Barcelos','Ricardo.barcelos@elgin.com.br','1978-06-25',NULL,NULL,NULL,0,'M',1,21,'29.572.691','256.918.988-09',0,0),(1017,'ntakemoto@hotmail.com','e6ec29caf497d41aed89fb4b4f67cc14f87a44db','Nelson','Yasuto Takemoto','ntakemoto@hotmail.com','1975-12-09',NULL,NULL,NULL,0,'M',1,21,'222824633','25060823873',0,0),(1018,'davidyuki@gmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','David','Yuki','davidyuki@gmail.com','1970-01-01','',NULL,NULL,1,'M',1,27,'','',NULL,0),(1020,'lucasyudiuemura@gmail.com','f6159e636b2db8e82ffc4902c91f53f56149b3c6','Lucas','Yudi Uemura','lucasyudiuemura@gmail.com','1990-06-05',NULL,NULL,NULL,0,'M',1,21,'35919175-7','078202049-66',0,0),(1021,'bruno.uemura@usp.br','75368914ea7a06619a6383cccc0caf57c3acd577','Bruno','Kendy Uemura','bruno.uemura@usp.br','1990-06-05',NULL,NULL,NULL,0,'M',1,21,'35857299-X','078202069-00',0,0),(1022,'oteb.taka@gmail.com','b262768a5e029c48af7c86fa385ffc9f7b506547','Roberto','Yochio Takahashi','oteb.taka@gmail.com','1990-10-03',NULL,NULL,NULL,0,'M',1,21,'348540632','392668568-94',0,0),(1023,'mcempada@uol.com.br','9dc27fb68f42d3a82b6ceb7841e397416770ee38','Fernando','Ferreira da Silva','mcempada@uol.com.br','1980-11-06',NULL,NULL,NULL,0,'M',1,21,'27250436-1','275940278-92',0,0),(1024,'titokrodrigues@yahoo.com.br','da3a9053dcba629e50aa3f0ad684042737bd1892','Tito','Kusaba Rodrigues','titokrodrigues@yahoo.com.br','1999-11-11',NULL,NULL,NULL,0,'M',1,21,'56.524.637-9','456370988-32',0,0),(1025,'filipeyukio@yahoo.com.br','b25021f0054f9f826068234f5f136e4ac81c03b2','Filipe','Yukio Sato','filipeyukio@yahoo.com.br','1997-10-19',NULL,NULL,NULL,0,'M',1,21,'394360424','436616398-54',0,0),(1026,'t.luri@terra.com.br','78215d32fecee518d837d0e66b60d4cab78aac03','Vitor','Yukio Takemoto','t.luri@terra.com.br','2001-06-19',NULL,NULL,NULL,0,'M',1,21,'53.728.114-4','439.868.148-50',0,0),(1027,'danilo.shirahata@gmail.com','73d8c471b6b44c40c5a812fbf8c8a5a907308671','Danilo','Shirahata Suzuki','danilo.shirahata@gmail.com','1988-09-02',NULL,NULL,NULL,0,'M',1,21,'39682378-6','369.927.448-95',0,0),(1028,'edutadashi1990@gmail.com','693716fd396a9774d7b7b3e49850e5d26d525278','Eduardo','Tadashi Matsumoto','edutadashi1990@gmail.com','1990-05-16',NULL,NULL,NULL,0,'M',1,21,'36344721-0','390563588-71',0,0),(1030,'jcmorita@ig.com.br','8b84203fc321cedd542c9b43b1c1230f26a551b4','Julio','Cesar Morita','jcmorita@ig.com.br','1967-07-30',NULL,NULL,NULL,0,'M',1,21,'11832819','127822238-36',0,0),(1031,'pablourbieta@gmail.com','c7df01ee3dfa333018ced4ae38139e19edfa0483','Pablo Cezar','Urbieta','pablourbieta@gmail.com','1985-12-12',NULL,NULL,NULL,0,'M',1,16,'337929695','35891524864',0,0),(1032,'rafael.ideriha@hotmail.com','1ea13fadf891dc9504408a7c4cc6fbd33f104a20','Rafael','Leite Ideriha','rafael.ideriha@hotmail.com','1991-07-20',NULL,NULL,NULL,0,'M',1,21,'340963410','41297708881',0,0),(1033,'davimaeda@hotmail.com','4a2d5b33ecb6b588d7d919043f1fed8360417d26','Davi','Adiwardana Maeda','davimaeda@hotmail.com','1991-07-11',NULL,NULL,NULL,0,'M',1,21,'478602716','38033310804',0,0),(1034,'lucas.matsuda@hotmail.com','80c24c7a4a720ace6636dc6556cf17b2d31fb32b','Lucas','Kioshi Matsuda','lucas.matsuda@hotmail.com','2000-04-16',NULL,NULL,NULL,0,'M',1,21,'527811671','',0,0),(1035,'','da39a3ee5e6b4b0d3255bfef95601890afd80709','EstevÃ£o','Kusaba Rodrigues','titokrodrigues@yahoo.com.br','2001-05-13',NULL,NULL,NULL,0,'M',1,21,'56.524.637-9','456370988-32',0,0),(1036,'tiagoriujyueda@gmail.com','b1b0a946273853de162330271a545cf5279cb05f','Tiago','Riuji Ueda','tiagoriujyueda@gmail.com','1994-09-22',NULL,NULL,NULL,0,'M',1,21,'451587613','37121396831',0,0),(1037,'jorgenishikawa@gmail.com','6324e3cc688d9c8dbbc8ff073abd02e1647ef0ce','Jorge','Nishikawa','jorgenishikawa@gmail.com','1962-11-28',NULL,NULL,NULL,0,'M',1,21,'14788957','03601525895',0,0),(1038,'jonatamsouza@hotmail.com','52924b3f751129e684f576b9621e4c2b54d94ae1','Jonata','de Souza Machado','jonatamsouza@hotmail.com','1997-07-06',NULL,NULL,NULL,0,'M',1,21,'531009798','',0,0),(1039,'hmassaoka@yahoo.com.br','27e460984143abc8c7af62d8636c3ec20adb6ec8','Henrique','Massaoka','hmassaoka@yahoo.com.br','1975-06-14',NULL,NULL,NULL,0,'M',1,21,'261850738','21260438864',0,0),(1040,'rafael.sacifs@hotmail.com','09d1f8d3b210acea2c2de1dafcbd5d181a3ed49b','Pedro','Kenzo Yamamoto','rafael.sacifs@hotmail.com','1997-12-31',NULL,NULL,NULL,0,'M',1,21,'39585475-1','35293605895',0,0),(1041,'rafael.sacifs@hotmail.com','09d1f8d3b210acea2c2de1dafcbd5d181a3ed49b','Fernando','Yukio Yamamoto','rafael.sacifs@hotmail.com','1997-12-31',NULL,NULL,NULL,0,'M',1,21,'39585474X','35293603841',0,0),(1042,'','da39a3ee5e6b4b0d3255bfef95601890afd80709','Lucas ','Arai','lucasarai@gmail.com','1991-07-13',NULL,NULL,NULL,0,'M',1,20,'','',0,0),(1043,'vinicius_pinesso@hotmail.com','4c84e3d5fe6b0e1dd74b9e51bd4c140645f679d7','Vinicius','Pinesso','vinicius_pinesso@hotmail.com','1970-01-01','',NULL,NULL,1,'M',1,18,'','',NULL,0),(1044,'nilla_014@hotmail.com','2dfc8dc679326d5bcaf59f0929fee42b4be22d21','Matheus','Ferreira da Silva','nilla_014@hotmail.com','2000-01-11',NULL,NULL,NULL,0,'M',1,21,'38854466-1','',0,0),(1045,'nilla_014@hotmail.com','2dfc8dc679326d5bcaf59f0929fee42b4be22d21','Danila','Ferreira Ribeiro','nilla_014@hotmail.com','1997-08-11',NULL,NULL,NULL,0,'F',1,21,'38770958-7','353116158/00',0,0),(1046,'rafael.sacifs@hotmail.com','09d1f8d3b210acea2c2de1dafcbd5d181a3ed49b','Isabela','de Oliveira Ferreira','rafael.sacifs@hotmail.com','2001-06-25',NULL,NULL,NULL,0,'F',1,21,'38559585-2','',0,0),(1047,'Silasmy@yahoo.com.br','8806d62627da885d6d5a2b4b193739e961c2e786','Silas','Makoto Yamada','Silasmy@yahoo.com.br','1988-01-31',NULL,NULL,NULL,0,'M',1,21,'284895301','36904883898',0,0),(1048,'vinicius_pinesso@hotmail.com','5a87a2c483d1d2e377bb1c43de6cf7bc88be2f87','Vinicius ','Pinesso','vinicius_pinesso@hotmail.com','1982-05-22',NULL,NULL,NULL,0,'M',1,18,'339331823','30613875877',0,0),(1049,'emerson.yamauchi@gmail.com','f99aece10eab8dacec9872ab7b2dda184869341f','Emerson','Yamauchi','emerson.yamauchi@gmail.com','1977-10-04',NULL,NULL,NULL,0,'M',1,21,'27758099-7','267956318-26',0,0),(1050,'rafael.sacifs@hotmail.com','09d1f8d3b210acea2c2de1dafcbd5d181a3ed49b','Vinicius','Yudi Niyata','rafael.sacifs@hotmail.com','1998-10-01',NULL,NULL,NULL,0,'M',1,21,'391536643','',0,0),(1051,'ubiratan2004@aim.com','5244423f9eb48e1867c27d1948343eec5842d6b5','Ubiratan','Rodrigues','ubiratan2004@aim.com','1969-12-13',NULL,NULL,NULL,0,'M',1,21,'177663248','12347263862',0,0);
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
  `gender` tinyint NOT NULL,
  `id_association` tinyint NOT NULL,
  `entity` tinyint NOT NULL,
  `id_subscription` tinyint NOT NULL,
  `id_team` tinyint NOT NULL,
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
  `sequence` tinyint NOT NULL,
  `alloc` tinyint NOT NULL,
  `date_time` tinyint NOT NULL,
  `id_game_place` tinyint NOT NULL,
  `id_user_keeper` tinyint NOT NULL,
  `id_event` tinyint NOT NULL,
  `id_team_a` tinyint NOT NULL,
  `id_team_b` tinyint NOT NULL,
  `score_a` tinyint NOT NULL,
  `score_b` tinyint NOT NULL,
  `id_winner` tinyint NOT NULL,
  `id_group` tinyint NOT NULL,
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
  `id_team` tinyint NOT NULL,
  `id_event` tinyint NOT NULL
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
  `gender` tinyint NOT NULL,
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
  `group` tinyint NOT NULL,
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
/*!50001 VIEW `vw_athletes` AS select `a`.`id_athlete` AS `id_athlete`,`u`.`id_user` AS `id_user`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`birthdate` AS `birthdate`,floor(((to_days(now()) - to_days(`u`.`birthdate`)) / 365)) AS `age`,`u`.`email` AS `email`,`u`.`user_name` AS `user_name`,`u`.`profile` AS `profile`,`u`.`status` AS `status`,`u`.`gender` AS `gender`,`e`.`id_association` AS `id_association`,`e`.`name` AS `entity`,`s`.`id_subscription` AS `id_subscription`,`t`.`id_team` AS `id_team`,`t`.`name` AS `team_name`,`t`.`jersey_main_color` AS `jersey_main_color`,`t`.`status` AS `team_status` from ((((`es_athlete` `a` left join `es_user` `u` on((`u`.`id_user` = `a`.`id_user`))) left join `es_association` `e` on((`e`.`id_association` = `a`.`id_association`))) left join `es_subscription` `s` on((`s`.`id_athlete` = `a`.`id_athlete`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`))) */;
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
/*!50001 VIEW `vw_games` AS select `g`.`id_game` AS `id_game`,`g`.`sequence` AS `sequence`,`g`.`alloc` AS `alloc`,`g`.`date_time` AS `date_time`,`g`.`id_game_place` AS `id_game_place`,`g`.`id_user_keeper` AS `id_user_keeper`,`g`.`id_event` AS `id_event`,`g`.`id_team_a` AS `id_team_a`,`g`.`id_team_b` AS `id_team_b`,`g`.`score_a` AS `score_a`,`g`.`score_b` AS `score_b`,`g`.`id_winner` AS `id_winner`,`t1`.`id_group` AS `id_group`,`p`.`name` AS `quadra`,`t1`.`name` AS `team_a`,`t2`.`name` AS `team_b`,`c`.`id_category` AS `id_category`,`c`.`name` AS `category` from ((((`es_game` `g` left join `es_team` `t1` on((`t1`.`id_team` = `g`.`id_team_a`))) left join `es_team` `t2` on((`t2`.`id_team` = `g`.`id_team_b`))) left join `es_category` `c` on((`c`.`id_category` = `t1`.`id_category`))) left join `es_game_place` `p` on((`p`.`id_game_place` = `g`.`id_game_place`))) */;
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
/*!50001 VIEW `vw_score` AS select `es_score`.`id_subscription` AS `id_subscription`,`es_score`.`id_game` AS `id_game`,`es_score`.`id_score_type` AS `id_score_type`,count(`es_score`.`value`) AS `result`,`t`.`id_team` AS `id_team`,`t`.`id_event` AS `id_event` from ((`es_score` left join `es_subscription` `s` on((`s`.`id_subscription` = `es_score`.`id_subscription`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`))) group by `es_score`.`id_subscription`,`es_score`.`id_game`,`es_score`.`id_score_type` */;
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
/*!50001 VIEW `vw_subscriptions` AS select `a`.`id_athlete` AS `id_athlete`,`a`.`id_association` AS `id_association`,`s`.`id_event` AS `id_event`,`a`.`status` AS `athlete_status`,`u`.`id_user` AS `id_user`,`u`.`lastname` AS `lastname`,`u`.`firstname` AS `firstname`,`u`.`birthdate` AS `birthdate`,floor(((to_days(now()) - to_days(`u`.`birthdate`)) / 365)) AS `age`,`u`.`gender` AS `gender`,`u`.`status` AS `user_status`,`s`.`id_subscription` AS `id_subscription`,`s`.`jersey_num` AS `jersey_num`,`s`.`status` AS `subscription_status`,`t`.`id_team` AS `id_team`,`t`.`name` AS `name`,`t`.`id_category` AS `id_category`,`t`.`group_id` AS `group_id`,`t`.`jersey_main_color` AS `jersey_main_color`,`t`.`status` AS `team_status` from (((`es_athlete` `a` left join `es_user` `u` on((`u`.`id_user` = `a`.`id_user`))) left join `es_subscription` `s` on((`s`.`id_athlete` = `a`.`id_athlete`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`))) */;
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
/*!50001 VIEW `vw_teams` AS select `t`.`id_team` AS `id`,`t`.`name` AS `team_name`,`t`.`jersey_main_color` AS `color`,`t`.`status` AS `status`,`t`.`id_group` AS `group`,`a`.`id_association` AS `entity_id`,`a`.`name` AS `entity`,`c`.`id_category` AS `id_category`,`c`.`name` AS `category`,`e`.`id_event` AS `id_event`,(select count(0) from `vw_subscriptions` `s` where (`s`.`id_team` = `id`)) AS `num_athletes` from (((`es_team` `t` left join `es_association` `a` on((`t`.`id_association` = `a`.`id_association`))) left join `es_category` `c` on((`t`.`id_category` = `c`.`id_category`))) left join `es_event` `e` on((`t`.`id_event` = `e`.`id_event`))) where (`e`.`status` = 1) */;
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

-- Dump completed on 2014-06-18 14:33:01
