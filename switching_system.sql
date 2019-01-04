-- MySQL dump 10.16  Distrib 10.3.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: switching_system
-- ------------------------------------------------------
-- Server version	10.3.9-MariaDB-1:10.3.9+maria~xenial

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
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biller`
--

DROP TABLE IF EXISTS `biller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `host` varchar(100) NOT NULL,
  `port` int(11) NOT NULL,
  `path` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `active` enum('active','inactive') NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biller`
--

LOCK TABLES `biller` WRITE;
/*!40000 ALTER TABLE `biller` DISABLE KEYS */;
/*!40000 ALTER TABLE `biller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission`
--

DROP TABLE IF EXISTS `commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) NOT NULL,
  `remark` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `process` enum('pending','processing','processed') NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission`
--

LOCK TABLES `commission` WRITE;
/*!40000 ALTER TABLE `commission` DISABLE KEYS */;
/*!40000 ALTER TABLE `commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `city_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `latitude` text NOT NULL,
  `longitude` text NOT NULL,
  `balance` bigint(20) NOT NULL,
  `minimal_balance` bigint(20) NOT NULL DEFAULT 1000000,
  `active` enum('verifying','active','inactive','verified','reject','removed') NOT NULL,
  `created_date` int(11) NOT NULL,
  `last_active` int(11) NOT NULL,
  `level` enum('basic','pro','enterprise') NOT NULL DEFAULT 'basic',
  `type` enum('partner','retail','user') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_access`
--

DROP TABLE IF EXISTS `merchant_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchant_level` int(11) NOT NULL,
  `service_group_id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_access`
--

LOCK TABLES `merchant_access` WRITE;
/*!40000 ALTER TABLE `merchant_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_log`
--

DROP TABLE IF EXISTS `message_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_log` (
  `id` bigint(20) NOT NULL,
  `cycle` bigint(20) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `stats` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_log`
--

LOCK TABLES `message_log` WRITE;
/*!40000 ALTER TABLE `message_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutation`
--

DROP TABLE IF EXISTS `mutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) NOT NULL,
  `merchant_id` bigint(20) NOT NULL,
  `debit` bigint(20) NOT NULL,
  `credit` bigint(20) NOT NULL,
  `remark` text NOT NULL,
  `current_balance` bigint(20) NOT NULL,
  `last_balance` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutation`
--

LOCK TABLES `mutation` WRITE;
/*!40000 ALTER TABLE `mutation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) NOT NULL,
  `sender` varchar(150) NOT NULL,
  `receiver` varchar(150) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `stats` enum('pending','sending','sent','failed') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `process_log` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biller_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `active` enum('active','inactive') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_group`
--

DROP TABLE IF EXISTS `service_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` enum('active','inactive') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_group`
--

LOCK TABLES `service_group` WRITE;
/*!40000 ALTER TABLE `service_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `tipe` varchar(32) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `nilai` varchar(256) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'UPL_USR','upload_path','./uploads/users/',1),(2,'UPL_USR','allowed_types','png|jpg|gif|jpeg',1),(3,'UPL_USR','max_size','200',1),(4,'UPL_USR','overwrite','TRUE',1),(5,'UPL_USR','max_height','0',1),(6,'UPL_USR','max_width','0',1),(7,'CORE','URL','http://localhost/npCore',1),(9,'CORE','PORT','8080',1),(10,'CORE_PATH','PAY','/transaction/pay',1),(11,'CORE_PATH','INQ','/transaction/inq',1),(12,'CORE_PATH','REV','/transaction/rev',1),(13,'UPL_AGENT','upload_path','./uploads/agent/',1),(14,'UPL_AGENT','allowed_types','png|jpg|gif|jpeg',1),(15,'UPL_AGENT','max_size','200',1),(16,'UPL_AGENT','overwrite','TRUE',1),(17,'UPL_AGENT','max_height','0',1),(18,'UPL_AGENT','max_width','0',1),(20,'UPL_CONTENT','upload_path','./uploads/content/',1),(21,'UPL_CONTENT','allowed_types','png|jpg|gif|jpeg',1),(22,'UPL_CONTENT','max_size','200',1),(23,'UPL_CONTENT','overwrite','TRUE',1),(24,'UPL_CONTENT','max_height','0',1),(25,'UPL_CONTENT','max_width','0',1);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_grup_akses`
--

DROP TABLE IF EXISTS `sys_grup_akses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_grup_akses` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `sys_grup_user_id` int(6) unsigned NOT NULL,
  `sys_menu_id` int(6) unsigned NOT NULL,
  `baca` tinyint(4) DEFAULT 0,
  `tambah` tinyint(4) DEFAULT 0,
  `ubah` tinyint(4) DEFAULT 0,
  `hapus` tinyint(4) DEFAULT 0,
  `cetak` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id_grup_user` (`sys_grup_user_id`),
  KEY `id_menu` (`sys_menu_id`),
  CONSTRAINT `sys_grup_akses_sys_grup_user_id_fk` FOREIGN KEY (`sys_grup_user_id`) REFERENCES `sys_grup_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `sys_grup_akses_sys_menu_id_fk` FOREIGN KEY (`sys_menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_grup_akses`
--

LOCK TABLES `sys_grup_akses` WRITE;
/*!40000 ALTER TABLE `sys_grup_akses` DISABLE KEYS */;
INSERT INTO `sys_grup_akses` VALUES (1,2,2,1,1,1,1,1),(2,2,3,1,1,1,1,1),(3,2,9,1,1,1,1,1),(4,2,14,1,1,1,1,1),(286,2,40,1,1,1,1,1),(289,2,43,1,1,1,1,1),(290,2,44,1,1,1,1,1),(291,2,45,1,1,1,1,1),(297,2,51,1,1,1,1,1),(298,2,52,1,1,1,1,1),(306,2,60,1,1,1,1,1),(307,2,61,1,1,1,1,1),(324,2,78,1,1,1,1,1),(325,2,79,1,1,1,1,1),(326,2,80,1,1,1,1,1),(327,2,81,1,1,1,1,1),(328,2,82,1,1,1,1,1),(329,2,83,1,1,1,1,1),(330,3,2,0,0,0,0,0),(331,3,3,0,0,0,0,0),(332,3,9,0,0,0,0,0),(333,3,14,0,0,0,0,0),(334,3,51,0,0,0,0,0),(335,3,52,0,0,0,0,0),(336,3,61,1,1,0,0,0),(337,3,78,0,0,0,0,0),(338,3,40,0,0,0,0,0),(339,3,43,0,0,0,0,0),(340,3,44,0,0,0,0,0),(341,3,45,0,0,0,0,0),(342,3,60,0,0,0,0,0),(343,3,81,0,0,0,0,0),(344,3,83,0,0,0,0,0),(345,3,79,0,0,0,0,0),(346,3,80,0,0,0,0,0),(347,3,82,0,0,0,0,0),(348,2,84,1,1,1,1,1),(349,3,84,0,0,0,0,0),(351,4,2,0,0,0,0,0),(352,4,3,0,0,0,0,0),(353,4,9,0,0,0,0,0),(354,4,14,0,0,0,0,0),(355,4,51,0,0,0,0,0),(356,4,52,1,1,1,1,0),(357,4,61,0,0,0,0,0),(358,4,78,0,0,0,0,0),(359,4,40,0,0,0,0,0),(360,4,43,0,0,0,0,0),(361,4,44,0,0,0,0,0),(362,4,45,0,0,0,0,0),(363,4,60,0,0,0,0,0),(364,4,81,0,0,0,0,0),(365,4,83,0,0,0,0,0),(366,4,79,0,0,0,0,0),(367,4,80,0,0,0,0,0),(368,4,82,0,0,0,0,0),(369,4,84,0,0,0,0,0),(370,2,85,1,1,1,1,1),(371,3,85,0,0,0,0,0),(372,4,85,0,0,0,0,0),(373,2,86,1,1,1,1,1),(374,3,86,1,1,1,1,1),(375,4,86,1,1,1,1,1),(376,2,87,1,1,1,1,1),(377,3,87,1,1,1,1,1),(378,4,87,1,1,1,1,1),(379,2,88,1,1,1,1,1),(380,3,88,1,1,1,1,1),(381,4,88,1,1,1,1,1),(382,2,89,1,1,1,1,1),(383,3,89,1,1,1,1,1),(384,4,89,1,1,1,1,1),(385,2,90,1,1,1,1,1),(386,3,90,0,0,0,0,0),(387,4,90,0,0,0,0,0),(388,2,91,1,1,1,1,1),(389,3,91,1,1,1,1,1),(390,4,91,1,1,1,1,1),(391,2,92,1,1,1,1,1),(392,3,92,0,0,0,0,0),(393,4,92,0,0,0,0,0);
/*!40000 ALTER TABLE `sys_grup_akses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_force_logout_after_insert` AFTER INSERT ON `sys_grup_akses` FOR EACH ROW UPDATE sys_user SET force_logout=1 WHERE sys_grup_user_id=0 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fn_force_logout_after_update` AFTER UPDATE ON `sys_grup_akses` FOR EACH ROW UPDATE sys_user SET force_logout=1 WHERE sys_grup_user_id=0 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_grup_user`
--

DROP TABLE IF EXISTS `sys_grup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_grup_user` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) NOT NULL,
  `keterangan` varchar(128) DEFAULT NULL,
  `is_merchant_grup` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_grup_user`
--

LOCK TABLES `sys_grup_user` WRITE;
/*!40000 ALTER TABLE `sys_grup_user` DISABLE KEYS */;
INSERT INTO `sys_grup_user` VALUES (2,'Administrator','Administrator',0,1),(3,'Operator','Pengelola data non finansial',0,1),(4,'Finance','Pengelola finansial',0,1);
/*!40000 ALTER TABLE `sys_grup_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sys_grup_user_set_sys_grup_akses` AFTER INSERT ON `sys_grup_user` FOR EACH ROW BEGIN
INSERT INTO sys_grup_akses (sys_grup_user_id, sys_menu_id, baca, tambah, ubah, hapus, cetak)
		SELECT NEW.ID, id, 0, 0, 0, 0, 0 FROM sys_menu;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sys_user_id` int(6) unsigned NOT NULL,
  `log_event` varchar(128) DEFAULT NULL,
  `log_object` varchar(128) DEFAULT NULL,
  `log_ref_key` varchar(128) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `log_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_id` (`sys_user_id`),
  KEY `log_date` (`log_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1901 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,2,'Show','customer/customer','','2018-05-31','23:17:28'),(2,2,'Show','customer/customer','','2018-05-31','23:17:39'),(3,2,'Show','agen/agen','','2018-05-31','23:17:41'),(4,2,'Show','dokter/dokter','','2018-05-31','23:17:43'),(5,2,'Show','dokter/kategori','','2018-05-31','23:17:44'),(6,2,'Show','produk/produk','','2018-05-31','23:17:46'),(7,2,'Show','produk/kategori','','2018-05-31','23:17:48'),(8,2,'Show','produk/kategori','','2018-05-31','23:17:51'),(9,2,'Show','produk/kategori','','2018-05-31','23:17:58'),(10,2,'Show','customer/customer','','2018-06-04','09:41:06'),(11,2,'Show','agen/agen','','2018-06-04','09:41:09'),(12,7,'Show','setting/menu','','2018-07-06','11:12:44'),(13,7,'Update','setting/menu','9','2018-07-06','11:13:30'),(14,7,'Show','setting/menu','','2018-07-06','11:13:30'),(15,7,'Remove','setting/menu','67','2018-07-06','11:16:50'),(16,7,'Show','setting/menu','','2018-07-06','11:16:50'),(17,7,'Remove','setting/menu','63','2018-07-06','11:16:55'),(18,7,'Show','setting/menu','','2018-07-06','11:16:55'),(19,7,'Remove','setting/menu','66','2018-07-06','11:17:10'),(20,7,'Show','setting/menu','','2018-07-06','11:17:10'),(21,7,'Show','setting/menu','','2018-07-06','11:17:21'),(22,7,'Update','setting/menu','61','2018-07-06','11:18:06'),(23,7,'Show','setting/menu','','2018-07-06','11:18:06'),(24,7,'Update','setting/menu','51','2018-07-06','11:18:37'),(25,7,'Show','setting/menu','','2018-07-06','11:18:37'),(26,7,'Show','setting/menu','','2018-07-06','11:18:56'),(27,7,'Show','setting/menu','','2018-07-06','11:19:19'),(28,7,'Remove','setting/menu','42','2018-07-06','11:19:38'),(29,7,'Show','setting/menu','','2018-07-06','11:19:38'),(30,7,'Show','setting/menu','','2018-07-06','11:20:41'),(31,7,'Add','setting/menu','78','2018-07-06','11:21:46'),(32,7,'Show','setting/menu','','2018-07-06','11:21:46'),(33,7,'Show','setting/menu','','2018-07-06','11:22:36'),(34,7,'Update','setting/menu','78','2018-07-06','11:28:11'),(35,7,'Show','setting/menu','','2018-07-06','11:28:11'),(36,7,'Update','setting/menu','51','2018-07-06','11:38:21'),(37,7,'Show','setting/menu','','2018-07-06','11:38:21'),(38,7,'Update','setting/menu','52','2018-07-06','11:39:14'),(39,7,'Show','setting/menu','','2018-07-06','11:39:14'),(40,7,'Update','setting/menu','9','2018-07-06','11:39:22'),(41,7,'Show','setting/menu','','2018-07-06','11:39:22'),(42,7,'Show','setting/menu','','2018-07-06','11:40:26'),(43,7,'Update','setting/menu','9','2018-07-06','11:40:37'),(44,7,'Show','setting/menu','','2018-07-06','11:40:37'),(45,7,'Update','setting/menu','61','2018-07-06','11:40:45'),(46,7,'Show','setting/menu','','2018-07-06','11:40:45'),(47,7,'Show','customer/customer','','2018-07-06','13:17:09'),(48,7,'Show','customer/customer','','2018-07-06','13:18:40'),(49,7,'Show','agen/agen','','2018-07-06','13:28:23'),(50,7,'Show','agen/agen','','2018-07-06','13:57:01'),(51,7,'Show','agen/agen','','2018-07-06','13:58:45'),(52,7,'Show','agen/agen','','2018-07-06','14:01:27'),(53,7,'Show','agen/agen','','2018-07-06','14:02:42'),(54,7,'Show','agen/agen','','2018-07-06','15:46:05'),(55,7,'Show','agen/agen','','2018-07-06','15:46:27'),(56,7,'Show','agen/agen','','2018-07-06','15:46:34'),(57,7,'Show','principal/principal','','2018-07-06','16:11:16'),(58,7,'Show','agen/agen','','2018-07-06','16:11:58'),(59,7,'Export','principal/principal','','2018-07-06','16:12:58'),(60,7,'Show','principal/principal','','2018-07-06','16:13:13'),(61,7,'Show','agen/agen','','2018-07-06','16:18:29'),(62,7,'Show','principal/principal','','2018-07-06','16:18:35'),(63,7,'Show','principal/principal','','2018-07-06','16:18:59'),(64,7,'Show','principal/principal','','2018-07-06','16:19:08'),(65,7,'Show','setting/menu','','2018-07-06','16:19:48'),(66,7,'Show','setting/menu','','2018-07-06','16:20:24'),(67,7,'Show','principal/principal','','2018-07-06','16:21:21'),(68,7,'Show','log/auditrail','','2018-07-06','16:23:59'),(69,7,'Show','agen/agen','','2018-07-06','16:24:55'),(70,7,'Show','setting/menu','','2018-07-06','16:25:02'),(71,7,'Show','setting/user','','2018-07-06','16:27:29'),(72,7,'Show','setting/user','','2018-07-06','16:28:09'),(73,7,'Remove','setting/user','2','2018-07-06','16:28:12'),(74,7,'Show','setting/user','','2018-07-06','16:28:12'),(75,7,'Set Password','setting/user','6','2018-07-06','16:28:38'),(76,7,'Show','principal/principal','','2018-07-06','16:32:42'),(77,7,'Show','principal/principal','','2018-07-06','16:32:48'),(78,7,'Show','principal/principal','','2018-07-06','16:32:50'),(79,6,'Show','setting/user','','2018-07-06','16:34:24'),(80,6,'Show','setting/user','','2018-07-06','16:34:36'),(81,6,'Add','setting/user','8','2018-07-06','16:35:29'),(82,6,'Show','setting/user','','2018-07-06','16:35:29'),(83,6,'Show','setting/user','','2018-07-06','16:39:30'),(84,6,'Show','setting/menu','','2018-07-06','16:39:34'),(85,6,'Show','setting/menu','','2018-07-06','16:40:08'),(86,6,'Update','setting/menu','71','2018-07-06','16:40:33'),(87,6,'Show','setting/menu','','2018-07-06','16:40:33'),(88,6,'Show','setting/menu','','2018-07-06','16:40:46'),(89,6,'Add','setting/menu','79','2018-07-06','17:07:42'),(90,6,'Show','setting/menu','','2018-07-06','17:07:42'),(91,6,'Show','setting/menu','','2018-07-06','17:15:39'),(92,6,'Add','setting/menu','80','2018-07-06','17:18:15'),(93,6,'Show','setting/menu','','2018-07-06','17:18:15'),(94,6,'Show','setting/menu','','2018-07-06','17:18:49'),(95,6,'Show','setting/grup_akses','','2018-07-06','17:18:56'),(96,6,'Update','setting/grup_akses','324','2018-07-06','17:19:07'),(97,6,'Show','setting/grup_akses','','2018-07-06','17:19:07'),(98,6,'Show','setting/menu','','2018-07-06','17:19:38'),(99,6,'Show','setting/menu','','2018-07-06','17:19:46'),(100,6,'Show','setting/grup_akses','','2018-07-06','17:19:49'),(101,6,'Update','setting/grup_akses','325','2018-07-06','17:19:56'),(102,6,'Show','setting/grup_akses','','2018-07-06','17:19:56'),(103,6,'Show','setting/grup_akses','','2018-07-06','17:20:02'),(104,6,'Update','setting/grup_akses','326','2018-07-06','17:20:10'),(105,6,'Show','setting/grup_akses','','2018-07-06','17:20:10'),(106,6,'Show','setting/menu','','2018-07-06','17:20:33'),(107,6,'Add','setting/menu','81','2018-07-06','17:21:26'),(108,6,'Show','setting/menu','','2018-07-06','17:21:26'),(109,6,'Show','setting/menu','','2018-07-06','17:26:51'),(110,6,'Show','setting/grup_akses','','2018-07-06','17:27:35'),(111,6,'Update','setting/grup_akses','327','2018-07-06','17:27:42'),(112,6,'Show','setting/grup_akses','','2018-07-06','17:27:42'),(113,6,'Update','setting/menu','72','2018-07-06','17:28:12'),(114,6,'Show','setting/menu','','2018-07-06','17:28:12'),(115,6,'Show','setting/menu','','2018-07-06','17:30:29'),(116,6,'Show','setting/menu','','2018-07-06','17:30:34'),(117,6,'Update','setting/menu','79','2018-07-06','17:30:47'),(118,6,'Show','setting/menu','','2018-07-06','17:30:47'),(119,6,'Update','setting/menu','80','2018-07-06','17:30:56'),(120,6,'Show','setting/menu','','2018-07-06','17:30:56'),(121,6,'Show','other/insurance','','2018-07-06','18:29:49'),(122,6,'Show','other/surety','','2018-07-06','18:29:52'),(123,6,'Show','other/surety','','2018-07-06','18:30:04'),(124,6,'Show','other/insurance','','2018-07-06','18:30:07'),(125,6,'Show','other/insurance','','2018-07-06','18:30:15'),(126,6,'Show','other/insurance','','2018-07-06','18:30:21'),(127,7,'Show','setting/user','','2018-07-06','20:17:39'),(128,6,'Show','setting/user','','2018-07-06','20:17:47'),(129,6,'Set Password','setting/user','8','2018-07-06','20:18:05'),(130,6,'Show','agen/agen','','2018-07-06','20:18:51'),(131,6,'Show','setting/menu','','2018-07-06','20:43:14'),(132,6,'Update','setting/menu','73','2018-07-06','20:43:31'),(133,6,'Show','setting/menu','','2018-07-06','20:43:31'),(134,6,'Show','setting/menu','','2018-07-06','20:43:36'),(135,6,'Update','setting/menu','74','2018-07-06','20:43:44'),(136,6,'Show','setting/menu','','2018-07-06','20:43:45'),(137,6,'Show','agen/agen','','2018-07-06','20:44:02'),(138,6,'Show','setting/menu','','2018-07-06','20:44:09'),(139,6,'Remove','setting/menu','73','2018-07-06','20:44:30'),(140,6,'Show','setting/menu','','2018-07-06','20:44:30'),(141,6,'Remove','setting/menu','74','2018-07-06','20:44:44'),(142,6,'Show','setting/menu','','2018-07-06','20:44:44'),(143,6,'Remove','setting/menu','72','2018-07-06','20:45:07'),(144,6,'Show','setting/menu','','2018-07-06','20:45:07'),(145,6,'Remove','setting/menu','71','2018-07-06','20:45:30'),(146,6,'Show','setting/menu','','2018-07-06','20:45:30'),(147,8,'Show','principal/principal','','2018-07-06','20:45:45'),(148,8,'Add','principal/principal','1','2018-07-06','20:48:50'),(149,8,'Show','principal/principal','','2018-07-06','20:48:51'),(150,6,'Remove','setting/menu','75','2018-07-06','20:49:53'),(151,6,'Show','setting/menu','','2018-07-06','20:49:53'),(152,8,'Show','principal/principal','','2018-07-06','20:49:55'),(153,6,'Remove','setting/menu','76','2018-07-06','20:49:57'),(154,6,'Show','setting/menu','','2018-07-06','20:49:57'),(155,6,'Remove','setting/menu','77','2018-07-06','20:50:03'),(156,6,'Show','setting/menu','','2018-07-06','20:50:03'),(157,8,'Show','principal/principal','','2018-07-06','20:50:14'),(158,8,'Show','principal/principal','','2018-07-06','20:50:23'),(159,8,'Show','setting/menu','','2018-07-06','20:51:19'),(160,6,'Add','setting/menu','82','2018-07-06','20:52:52'),(161,6,'Show','setting/menu','','2018-07-06','20:52:52'),(162,6,'Show','setting/grup_akses','','2018-07-06','20:53:03'),(163,6,'Update','setting/grup_akses','328','2018-07-06','20:53:10'),(164,6,'Show','setting/grup_akses','','2018-07-06','20:53:10'),(165,6,'Show','setting/menu','','2018-07-06','20:53:52'),(166,6,'Update','setting/menu','81','2018-07-06','20:55:17'),(167,6,'Show','setting/menu','','2018-07-06','20:55:17'),(168,6,'Add','setting/menu','83','2018-07-06','20:56:36'),(169,6,'Show','setting/menu','','2018-07-06','20:56:36'),(170,6,'Show','setting/grup_akses','','2018-07-06','20:56:43'),(171,6,'Update','setting/grup_akses','329','2018-07-06','20:56:49'),(172,6,'Show','setting/grup_akses','','2018-07-06','20:56:49'),(173,6,'Show','setting/menu','','2018-07-06','20:57:20'),(174,8,'Show','principal/principal','','2018-07-06','21:02:12'),(175,6,'Update','setting/menu','61','2018-07-06','21:11:12'),(176,6,'Show','setting/menu','','2018-07-06','21:11:12'),(177,6,'Show','setting/menu','','2018-07-06','21:34:04'),(178,6,'Show','setting/menu','','2018-07-06','21:34:27'),(179,6,'Update','setting/menu','81','2018-07-06','21:34:50'),(180,6,'Show','setting/menu','','2018-07-06','21:34:50'),(181,6,'Show','report/mutation','','2018-07-06','21:34:59'),(182,6,'Show','principal/principal','','2018-07-06','21:35:21'),(183,8,'Show','other/surety','','2018-07-06','21:38:45'),(184,6,'Show','principal/principal','','2018-07-06','21:45:08'),(185,6,'Show','report/mutation','','2018-07-06','21:45:13'),(186,8,'Show','other/rate','','2018-07-06','21:46:41'),(187,8,'Show','other/rate','','2018-07-06','21:47:29'),(188,8,'Show','other/rate','','2018-07-06','21:47:34'),(189,8,'Show','other/rate','','2018-07-06','21:47:40'),(190,8,'Show','other/rate','','2018-07-06','21:47:43'),(191,8,'Show','other/rate','','2018-07-06','21:49:34'),(192,8,'Show','other/rate','','2018-07-06','21:49:56'),(193,8,'Show','other/rate','','2018-07-06','21:50:39'),(194,8,'Show','other/rate','','2018-07-06','21:53:39'),(195,8,'Show','other/rate','','2018-07-06','21:54:03'),(196,8,'Show','other/rate','','2018-07-06','21:54:10'),(197,8,'Remove','other/rate','1','2018-07-06','21:54:31'),(198,8,'Show','other/rate','','2018-07-06','21:54:31'),(199,8,'Show','other/rate','','2018-07-06','21:54:59'),(200,6,'Show','report/mutation','','2018-07-06','21:56:32'),(201,8,'Show','principal/principal','','2018-07-06','21:58:09'),(202,6,'Show','report/mutation','','2018-07-06','21:59:46'),(203,6,'Add','report/mutation','1','2018-07-06','22:00:52'),(204,6,'Show','report/mutation','','2018-07-06','22:00:52'),(205,8,'Show','other/rate','','2018-07-06','22:03:14'),(206,8,'Show','other/insurance','','2018-07-06','22:03:39'),(207,8,'Show','other/rate','','2018-07-06','22:03:41'),(208,8,'Show','principal/principal','','2018-07-06','22:06:18'),(209,8,'Show','principal/principal','','2018-07-06','22:06:26'),(210,8,'Update','principal/principal','1','2018-07-06','22:06:35'),(211,8,'Show','principal/principal','','2018-07-06','22:06:35'),(212,8,'Remove','principal/principal','1','2018-07-06','22:06:42'),(213,8,'Show','principal/principal','','2018-07-06','22:06:42'),(214,8,'Show','principal/principal','','2018-07-06','22:08:02'),(215,6,'Show','report/mutation','','2018-07-06','22:08:37'),(216,6,'Remove','report/mutation','1','2018-07-06','22:08:40'),(217,6,'Show','report/mutation','','2018-07-06','22:08:40'),(218,6,'Add','report/mutation','2','2018-07-06','22:08:55'),(219,6,'Show','report/mutation','','2018-07-06','22:08:55'),(220,8,'Add','principal/principal','2','2018-07-06','22:09:55'),(221,8,'Show','principal/principal','','2018-07-06','22:09:55'),(222,6,'Show','report/mutation','','2018-07-06','22:11:26'),(223,8,'Show','principal/principal','','2018-07-06','22:13:35'),(224,6,'Update','report/mutation','1','2018-07-06','22:13:45'),(225,6,'Show','report/mutation','','2018-07-06','22:13:45'),(226,6,'Show','report/mutation','','2018-07-06','22:14:15'),(227,6,'Show','report/mutation','','2018-07-06','22:14:23'),(228,6,'Show','report/mutation','','2018-07-06','22:14:25'),(229,8,'Show','principal/principal','','2018-07-06','22:22:39'),(230,8,'Show','principal/principal','','2018-07-06','22:22:42'),(231,8,'Show','principal/principal','','2018-07-06','22:23:43'),(232,8,'Show','principal/principal','','2018-07-06','22:30:40'),(233,8,'Show','principal/principal','','2018-07-06','22:31:21'),(234,6,'Show','report/mutation','','2018-07-06','22:32:48'),(235,6,'Show','agen/agen','','2018-07-06','22:32:50'),(236,8,'Show','principal/principal','','2018-07-06','22:33:03'),(237,8,'Show','principal/principal','','2018-07-06','22:33:55'),(238,8,'Show','principal/principal','','2018-07-06','22:35:31'),(239,8,'Show','principal/principal','','2018-07-06','22:35:31'),(240,8,'Show','principal/principal','','2018-07-06','22:35:52'),(241,6,'Add','agen/agen','2','2018-07-06','22:37:33'),(242,6,'Show','agen/agen','','2018-07-06','22:37:33'),(243,6,'Update','agen/agen','1','2018-07-06','22:37:47'),(244,6,'Show','agen/agen','','2018-07-06','22:37:47'),(245,6,'Show','report/mutation','','2018-07-06','22:38:09'),(246,6,'Show','other/insurance','','2018-07-06','22:38:12'),(247,8,'Show','principal/principal','','2018-07-06','22:38:20'),(248,6,'Add','other/insurance','1','2018-07-06','22:40:12'),(249,6,'Show','other/insurance','','2018-07-06','22:40:12'),(250,6,'Update','other/insurance','1','2018-07-06','22:40:19'),(251,6,'Show','other/insurance','','2018-07-06','22:40:19'),(252,6,'Show','other/insurance','','2018-07-06','22:41:13'),(253,6,'Show','other/surety','','2018-07-06','22:51:06'),(254,6,'Add','other/surety','1','2018-07-06','22:51:24'),(255,6,'Show','other/surety','','2018-07-06','22:51:24'),(256,6,'Show','other/surety','','2018-07-06','22:51:50'),(257,6,'Show','other/surety','','2018-07-06','22:52:04'),(258,6,'Add','other/surety','2','2018-07-06','22:52:14'),(259,6,'Show','other/surety','','2018-07-06','22:52:14'),(260,6,'Show','other/insurance','','2018-07-06','22:52:20'),(261,6,'Show','other/insurance','','2018-07-06','22:52:28'),(262,6,'Show','other/insurance','','2018-07-06','22:54:34'),(263,8,'Show','principal/principal','','2018-07-06','23:20:10'),(264,8,'Show','principal/principal','','2018-07-06','23:20:43'),(265,8,'Show','principal/principal','','2018-07-06','23:20:55'),(266,8,'Show','principal/principal','','2018-07-06','23:42:37'),(267,8,'Show','principal/principal','','2018-07-06','23:47:46'),(268,8,'Show','principal/principal','','2018-07-06','23:48:29'),(269,8,'Show','principal/principal','','2018-07-06','23:50:11'),(270,8,'Show','principal/principal','','2018-07-07','00:20:42'),(271,8,'Show','principal/principal','','2018-07-07','00:22:37'),(272,8,'Show','principal/principal','','2018-07-07','00:23:34'),(273,8,'Show','principal/principal','','2018-07-07','00:25:04'),(274,8,'Show','principal/principal','','2018-07-07','00:30:26'),(275,8,'Show','principal/principal','','2018-07-07','00:34:09'),(276,8,'Show','principal/principal','','2018-07-07','00:34:28'),(277,8,'Show','principal/principal','','2018-07-07','00:40:43'),(278,8,'Show','principal/principal','','2018-07-07','00:45:37'),(279,6,'Show','agen/agen','','2018-07-07','00:47:56'),(280,6,'Show','agen/agen','','2018-07-07','00:49:58'),(281,6,'Show','agen/agen','','2018-07-07','00:59:11'),(282,8,'Show','principal/principal','','2018-07-07','01:00:00'),(283,6,'Show','setting/konfigurasi','','2018-07-07','01:44:57'),(284,6,'Show','setting/user','','2018-07-07','01:45:04'),(285,6,'Show','setting/grup_user','','2018-07-07','01:45:16'),(286,6,'Show','setting/grup_akses','','2018-07-07','01:45:21'),(287,6,'Add','setting/grup_user','3','2018-07-07','01:50:22'),(288,6,'Show','setting/grup_user','','2018-07-07','01:50:22'),(289,6,'Show','setting/menu','','2018-07-07','01:50:30'),(290,6,'Update','setting/menu','45','2018-07-07','01:50:42'),(291,6,'Show','setting/menu','','2018-07-07','01:50:42'),(292,6,'Show','principal/principal','','2018-07-07','01:50:55'),(293,6,'Show','principal/principal','','2018-07-07','01:51:36'),(294,6,'Show','agen/agen','','2018-07-07','01:51:38'),(295,6,'Show','principal/principal','','2018-07-07','01:51:42'),(296,6,'Show','agen/agen','','2018-07-07','01:52:00'),(297,6,'Show','agen/agen','','2018-07-07','01:52:03'),(298,6,'Show','report/mutation','','2018-07-07','01:52:05'),(299,8,'Show','principal/principal','','2018-07-07','01:53:09'),(300,6,'Show','principal/principal','','2018-07-07','01:53:20'),(301,6,'Show','agen/agen','','2018-07-07','01:53:48'),(302,6,'Show','report/mutation','','2018-07-07','01:53:50'),(303,6,'Show','other/insurance','','2018-07-07','01:53:53'),(304,6,'Show','other/insurance','','2018-07-07','01:53:55'),(305,6,'Show','other/surety','','2018-07-07','01:53:57'),(306,6,'Show','log/auditrail','','2018-07-07','01:54:01'),(307,6,'Show','setting/user','','2018-07-07','01:54:10'),(308,6,'Show','setting/konfigurasi','','2018-07-07','01:54:13'),(309,6,'Show','setting/user','','2018-07-07','01:54:15'),(310,6,'Show','setting/user','','2018-07-07','01:54:48'),(311,6,'Show','agen/agen','','2018-07-07','01:56:38'),(312,6,'Show','agen/agen','','2018-07-07','01:57:05'),(313,6,'Show','agen/agen','','2018-07-07','01:57:41'),(314,6,'Show','setting/user','','2018-07-07','01:58:22'),(315,6,'Show','production/production','','2018-07-07','01:59:28'),(316,6,'Show','production/production','','2018-07-07','02:26:35'),(317,6,'Show','other/rate','','2018-07-07','02:33:01'),(318,6,'Show','agen/agen','','2018-07-07','02:35:31'),(319,6,'Show','other/rate','','2018-07-07','02:36:39'),(320,6,'Add','other/rate','2','2018-07-07','02:37:08'),(321,6,'Show','other/rate','','2018-07-07','02:37:08'),(322,6,'Update','other/rate','1','2018-07-07','02:37:15'),(323,6,'Show','other/rate','','2018-07-07','02:37:15'),(324,6,'Show','production/production','','2018-07-07','02:37:26'),(325,6,'Show','other/insurance','','2018-07-07','02:38:01'),(326,6,'Show','production/production','','2018-07-10','18:06:01'),(327,6,'Show','production/production','','2018-07-10','18:07:28'),(328,6,'Show','production/production','','2018-07-10','18:08:55'),(329,6,'Show','other/insurance','','2018-07-10','18:08:58'),(330,6,'Show','other/rate','','2018-07-10','18:09:02'),(331,6,'Show','other/surety','','2018-07-10','18:13:00'),(332,6,'Show','other/surety','','2018-07-10','18:13:12'),(333,6,'Update','other/surety','1','2018-07-10','18:14:18'),(334,6,'Show','other/surety','','2018-07-10','18:14:18'),(335,6,'Update','other/surety','1','2018-07-10','18:14:31'),(336,6,'Show','other/surety','','2018-07-10','18:14:31'),(337,6,'Add','other/surety','3','2018-07-10','18:14:43'),(338,6,'Show','other/surety','','2018-07-10','18:14:43'),(339,6,'Add','other/surety','4','2018-07-10','18:14:55'),(340,6,'Show','other/surety','','2018-07-10','18:14:55'),(341,6,'Show','setting/menu','','2018-07-10','18:15:04'),(342,6,'Update','setting/menu','80','2018-07-10','18:15:21'),(343,6,'Show','setting/menu','','2018-07-10','18:15:21'),(344,6,'Show','other/rate','','2018-07-10','18:15:26'),(345,6,'Show','other/rate','','2018-07-10','18:15:40'),(346,6,'Show','other/insurance','','2018-07-10','18:15:49'),(347,6,'Show','other/insurance','','2018-07-10','18:16:05'),(348,6,'Update','other/insurance','1','2018-07-10','18:16:19'),(349,6,'Show','other/insurance','','2018-07-10','18:16:19'),(350,6,'Show','production/production','','2018-07-10','18:18:05'),(351,6,'Show','agen/agen','','2018-07-10','18:18:07'),(352,6,'Show','production/production','','2018-07-10','18:18:09'),(353,6,'Show','principal/principal','','2018-07-10','18:18:09'),(354,6,'Show','principal/principal','','2018-07-10','18:18:22'),(355,6,'Update','principal/principal','1','2018-07-10','18:18:39'),(356,6,'Show','principal/principal','','2018-07-10','18:18:39'),(357,6,'Show','agen/agen','','2018-07-10','18:18:46'),(358,6,'Show','production/production','','2018-07-10','18:18:48'),(359,6,'Show','agen/agen','','2018-07-10','18:18:50'),(360,6,'Show','production/production','','2018-07-10','18:19:01'),(361,6,'Show','production/production','','2018-07-10','18:19:13'),(362,6,'Show','setting/menu','','2018-07-10','18:20:16'),(363,6,'Update','setting/menu','83','2018-07-10','18:20:41'),(364,6,'Show','setting/menu','','2018-07-10','18:20:41'),(365,6,'Show','production/production','','2018-07-10','18:21:08'),(366,6,'Show','production/production','','2018-07-10','18:26:12'),(367,6,'Show','setting/menu','','2018-07-10','18:31:48'),(368,6,'Add','setting/menu','84','2018-07-10','18:33:15'),(369,6,'Show','setting/menu','','2018-07-10','18:33:15'),(370,6,'Show','setting/grup_akses','','2018-07-10','18:33:21'),(371,6,'Show','setting/menu','','2018-07-10','18:33:29'),(372,6,'Show','setting/grup_akses','','2018-07-10','18:33:32'),(373,6,'Update','setting/grup_akses','348','2018-07-10','18:33:40'),(374,6,'Show','setting/grup_akses','','2018-07-10','18:33:40'),(375,6,'Show','setting/menu','','2018-07-10','18:34:20'),(376,6,'Show','other/cost','','2018-07-10','18:34:46'),(377,6,'Show','setting/menu','','2018-07-10','20:06:15'),(378,6,'Show','setting/grup_user','','2018-07-10','20:06:23'),(379,6,'Show','setting/menu','','2018-07-10','20:06:33'),(380,6,'Show','setting/grup_akses','','2018-07-10','20:06:44'),(381,6,'Update','setting/grup_akses','336','2018-07-10','20:06:58'),(382,6,'Show','setting/grup_akses','','2018-07-10','20:06:58'),(383,6,'Show','production/production','','2018-07-10','20:07:07'),(384,6,'Show','agen/agen','','2018-07-10','20:07:10'),(385,6,'Show','setting/grup_user','','2018-07-10','20:07:34'),(386,6,'Add','setting/grup_user','4','2018-07-10','20:07:53'),(387,6,'Show','setting/grup_user','','2018-07-10','20:07:53'),(388,6,'Show','setting/menu','','2018-07-10','20:07:57'),(389,6,'Show','setting/grup_akses','','2018-07-10','20:08:03'),(390,6,'Update','setting/grup_akses','356','2018-07-10','20:08:23'),(391,6,'Show','setting/grup_akses','','2018-07-10','20:08:23'),(392,6,'Show','report/mutation','','2018-07-10','20:08:34'),(393,6,'Show','other/insurance','','2018-07-10','20:09:18'),(394,6,'Show','production/production','','2018-07-10','20:09:23'),(395,6,'Show','production/production','','2018-07-10','20:10:07'),(396,6,'Show','other/cost','','2018-07-10','22:41:32'),(397,6,'Show','other/cost','','2018-07-10','22:50:05'),(398,6,'Add','other/cost','3','2018-07-10','22:50:35'),(399,6,'Show','other/cost','','2018-07-10','22:50:35'),(400,6,'Show','report/mutation','','2018-07-10','22:50:42'),(401,6,'Show','other/cost','','2018-07-10','22:50:59'),(402,6,'Update','other/cost','1','2018-07-10','22:51:09'),(403,6,'Show','other/cost','','2018-07-10','22:51:09'),(404,6,'Show','report/mutation','','2018-07-10','22:51:12'),(405,6,'Show','other/insurance','','2018-07-10','22:51:16'),(406,6,'Show','other/cost','','2018-07-10','22:51:18'),(407,6,'Update','other/cost','1','2018-07-10','22:51:33'),(408,6,'Show','other/cost','','2018-07-10','22:51:33'),(409,6,'Show','report/mutation','','2018-07-10','22:51:46'),(410,6,'Show','report/mutation','','2018-07-10','22:51:57'),(411,6,'Show','other/rate','','2018-07-10','22:53:49'),(412,6,'Show','agen/agen','','2018-07-10','22:54:10'),(413,6,'Show','principal/principal','','2018-07-10','22:54:15'),(414,6,'Show','setting/grup_user','','2018-07-10','22:54:48'),(415,6,'Show','setting/grup_akses','','2018-07-10','22:54:52'),(416,6,'Show','setting/grup_akses','','2018-07-10','22:55:03'),(417,6,'Show','setting/user','','2018-07-10','22:55:16'),(418,6,'Add','setting/user','9','2018-07-10','22:55:41'),(419,6,'Show','setting/user','','2018-07-10','22:55:41'),(420,6,'Add','setting/user','10','2018-07-10','22:56:21'),(421,6,'Show','setting/user','','2018-07-10','22:56:21'),(422,6,'Set Password','setting/user','9','2018-07-10','22:56:42'),(423,9,'Show','production/production','','2018-07-10','22:57:28'),(424,9,'Show','production/production','','2018-07-10','22:57:30'),(425,6,'Show','setting/grup_user','','2018-07-10','22:57:46'),(426,6,'Show','setting/grup_akses','','2018-07-10','22:57:48'),(427,6,'Show','setting/konfigurasi','','2018-07-10','22:59:55'),(428,6,'Show','setting/user','','2018-07-10','22:59:59'),(429,6,'Show','report/mutation','','2018-07-10','23:00:02'),(430,6,'Show','setting/menu','','2018-07-10','23:14:44'),(431,6,'Show','setting/menu','','2018-07-10','23:17:04'),(432,6,'Update','setting/menu','2','2018-07-10','23:17:15'),(433,6,'Show','setting/menu','','2018-07-10','23:17:15'),(434,6,'Show','setting/user','','2018-07-10','23:17:35'),(435,6,'Show','setting/grup_user','','2018-07-10','23:17:47'),(436,6,'Show','setting/grup_akses','','2018-07-10','23:17:50'),(437,6,'Show','principal/principal','','2018-07-10','23:17:56'),(438,6,'Show','production/production','','2018-07-10','23:24:17'),(439,6,'Show','principal/principal','','2018-07-10','23:28:27'),(440,6,'Show','principal/principal','','2018-07-10','23:30:48'),(441,6,'Show','principal/principal','','2018-07-10','23:30:52'),(442,6,'Show','principal/principal','','2018-07-10','23:31:05'),(443,6,'Show','principal/principal','','2018-07-10','23:31:34'),(444,6,'Show','principal/principal','','2018-07-10','23:31:38'),(445,6,'Show','principal/principal','','2018-07-10','23:33:23'),(446,6,'Show','principal/principal','','2018-07-10','23:35:27'),(447,6,'Show','principal/principal','','2018-07-10','23:36:36'),(448,6,'Show','log/auditrail','','2018-07-10','23:37:03'),(449,6,'Show','setting/user','','2018-07-10','23:37:31'),(450,6,'Show','setting/menu','','2018-07-10','23:37:42'),(451,6,'Update','setting/menu','40','2018-07-10','23:40:25'),(452,6,'Show','setting/menu','','2018-07-10','23:40:25'),(453,6,'Update','setting/menu','43','2018-07-10','23:40:51'),(454,6,'Show','setting/menu','','2018-07-10','23:40:51'),(455,6,'Update','setting/menu','45','2018-07-10','23:41:12'),(456,6,'Show','setting/menu','','2018-07-10','23:41:12'),(457,6,'Update','setting/menu','44','2018-07-10','23:41:22'),(458,6,'Show','setting/menu','','2018-07-10','23:41:22'),(459,6,'Show','setting/menu','','2018-07-10','23:44:00'),(460,6,'Update','setting/menu','52','2018-07-10','23:44:09'),(461,6,'Show','setting/menu','','2018-07-10','23:44:09'),(462,6,'Show','agen/agen','','2018-07-10','23:44:20'),(463,6,'Show','setting/menu','','2018-07-10','23:47:44'),(464,6,'Update','setting/menu','81','2018-07-10','23:47:59'),(465,6,'Show','setting/menu','','2018-07-10','23:47:59'),(466,6,'Show','principal/principal','','2018-07-11','11:59:41'),(467,6,'Show','principal/principal','','2018-07-11','11:59:42'),(468,6,'Show','production/production','','2018-07-11','11:59:45'),(469,6,'Show','agen/agen','','2018-07-11','13:46:31'),(470,6,'Show','agen/agen','','2018-07-11','13:46:46'),(471,6,'Show','agen/agen','','2018-07-11','13:46:50'),(472,6,'Show','agen/agen','','2018-07-11','14:02:24'),(473,6,'Show','agen/agen','','2018-07-11','14:02:52'),(474,6,'Show','agen/agen','','2018-07-11','14:33:08'),(475,6,'Show','production/production','','2018-07-11','14:33:11'),(476,6,'Show','production/production','','2018-07-11','14:41:00'),(477,6,'Show','agen/agen','','2018-07-11','14:41:02'),(478,6,'Show','agen/agen','','2018-07-11','14:41:04'),(479,6,'Show','agen/agen','','2018-07-11','14:41:57'),(480,6,'Show','agen/agen','','2018-07-11','14:44:42'),(481,6,'Show','agen/agen','','2018-07-11','14:49:25'),(482,6,'Show','agen/agen','','2018-07-11','14:53:35'),(483,6,'Show','agen/agen','','2018-07-11','15:05:53'),(484,6,'Show','agen/agen','','2018-07-11','15:09:06'),(485,6,'Show','agen/agen','','2018-07-11','15:09:28'),(486,6,'Show','production/production','','2018-07-11','18:35:30'),(487,6,'Show','agen/agen','','2018-07-11','18:35:31'),(488,6,'Show','agen/agen','','2018-07-11','18:37:55'),(489,6,'Show','agen/agen','','2018-07-20','17:39:27'),(490,6,'Show','production/production','','2018-07-20','17:39:29'),(491,6,'Show','report/mutation','','2018-07-20','17:39:32'),(492,6,'Show','production/production','','2018-07-20','17:39:40'),(493,6,'Show','setting/menu','','2018-07-20','17:41:03'),(494,6,'Add','setting/menu','85','2018-07-20','17:42:36'),(495,6,'Show','setting/menu','','2018-07-20','17:42:36'),(496,6,'Show','setting/grup_akses','','2018-07-20','17:42:44'),(497,6,'Update','setting/grup_akses','370','2018-07-20','17:42:52'),(498,6,'Show','setting/grup_akses','','2018-07-20','17:42:52'),(499,6,'Show','obligee/obligee','','2018-07-20','17:43:05'),(500,6,'Add','obligee/obligee','1','2018-07-20','17:43:26'),(501,6,'Show','obligee/obligee','','2018-07-20','17:43:26'),(502,6,'Show','production/production','','2018-07-20','17:43:28'),(503,6,'Show','other/insurance','','2018-07-20','17:43:59'),(504,6,'Show','other/rate','','2018-07-20','17:44:08'),(505,6,'Add','other/rate','3','2018-07-20','17:45:13'),(506,6,'Show','other/rate','','2018-07-20','17:45:14'),(507,6,'Add','other/rate','4','2018-07-20','17:45:58'),(508,6,'Show','other/rate','','2018-07-20','17:45:58'),(509,6,'Add','production/production','3','2018-07-20','17:49:47'),(510,6,'Show','production/production','','2018-07-20','17:49:47'),(511,6,'Show','production/production','','2018-07-20','17:50:29'),(512,6,'Show','obligee/obligee','','2018-07-20','18:00:28'),(513,6,'Show','production/production','','2018-07-20','18:19:45'),(514,6,'Show','production/production','','2018-07-20','18:20:17'),(515,6,'Show','production/production','','2018-07-21','02:04:18'),(516,0,'Show','production/production','','2018-07-21','02:41:47'),(517,0,'Show','production/production','','2018-07-21','02:41:50'),(518,6,'Show','obligee/obligee','','2018-07-21','02:42:10'),(519,6,'Show','production/production','','2018-07-21','02:42:18'),(520,6,'Show','production/production','','2018-07-25','10:55:37'),(521,6,'Show','production/production','','2018-07-25','11:47:26'),(522,6,'Show','production/production','','2018-07-25','11:47:46'),(523,6,'Show','setting/menu','','2018-07-25','11:48:42'),(524,6,'Update','setting/menu','78','2018-07-25','11:49:04'),(525,6,'Show','setting/menu','','2018-07-25','11:49:04'),(526,6,'Update','setting/menu','78','2018-07-25','11:49:23'),(527,6,'Show','setting/menu','','2018-07-25','11:49:23'),(528,6,'Update','setting/menu','9','2018-07-25','11:52:06'),(529,6,'Show','setting/menu','','2018-07-25','11:52:06'),(530,6,'Update','setting/menu','52','2018-07-25','11:52:30'),(531,6,'Show','setting/menu','','2018-07-25','11:52:30'),(532,6,'Update','setting/menu','85','2018-07-25','11:52:46'),(533,6,'Show','setting/menu','','2018-07-25','11:52:46'),(534,6,'Update','setting/menu','79','2018-07-25','11:53:04'),(535,6,'Show','setting/menu','','2018-07-25','11:53:04'),(536,6,'Update','setting/menu','61','2018-07-25','11:54:03'),(537,6,'Show','setting/menu','','2018-07-25','11:54:03'),(538,6,'Update','setting/menu','84','2018-07-25','11:54:16'),(539,6,'Show','setting/menu','','2018-07-25','11:54:16'),(540,6,'Show','setting/menu','','2018-07-25','11:54:54'),(541,6,'Update','setting/menu','80','2018-07-25','11:55:20'),(542,6,'Show','setting/menu','','2018-07-25','11:55:20'),(543,6,'Update','setting/menu','82','2018-07-25','11:55:31'),(544,6,'Show','setting/menu','','2018-07-25','11:55:31'),(545,6,'Show','other/rate','','2018-07-25','11:56:25'),(546,6,'Show','production/production','','2018-07-25','11:56:55'),(547,6,'Show','setting/menu','','2018-07-26','03:13:46'),(548,6,'Show','agen/agen','','2018-07-26','07:56:09'),(549,6,'Show','agen/agen','','2018-07-26','07:56:11'),(550,6,'Show','agen/agen','','2018-07-26','07:56:13'),(551,6,'Show','production/production','','2018-08-01','06:27:46'),(552,6,'Show','production/production','','2018-08-01','06:28:24'),(553,6,'Show','other/rate','','2018-08-01','06:28:43'),(554,6,'Show','other/rate','','2018-08-01','06:29:02'),(555,6,'Show','production/production','','2018-08-01','06:35:07'),(556,6,'Show','production/production','','2018-08-01','06:35:22'),(557,8,'Show','agen/agen','','2018-08-01','12:14:16'),(558,8,'Show','agen/agen','','2018-08-01','12:14:28'),(559,8,'Show','other/surety','','2018-08-01','12:14:39'),(560,8,'Show','other/rate','','2018-08-01','12:14:42'),(561,8,'Show','other/insurance','','2018-08-01','12:14:46'),(562,8,'Show','obligee/obligee','','2018-08-01','12:14:48'),(563,8,'Show','production/production','','2018-08-01','12:14:54'),(564,8,'Show','principal/principal','','2018-08-01','12:18:00'),(565,8,'Add','principal/principal','3','2018-08-01','12:19:07'),(566,8,'Show','principal/principal','','2018-08-01','12:19:07'),(567,8,'Show','production/production','','2018-08-01','12:19:32'),(568,8,'Show','production/production','','2018-08-01','12:20:55'),(569,8,'Show','production/production','','2018-08-01','12:21:55'),(570,8,'Show','production/production','','2018-08-01','12:23:00'),(571,8,'Show','production/production','','2018-08-01','12:26:38'),(572,8,'Show','principal/principal','','2018-08-01','12:28:12'),(573,8,'Show','production/production','','2018-08-01','12:28:38'),(574,8,'Show','other/rate','','2018-08-01','12:30:05'),(575,8,'Show','production/production','','2018-08-01','12:30:12'),(576,8,'Show','production/production','','2018-08-01','12:30:29'),(577,8,'Show','other/rate','','2018-08-01','12:31:09'),(578,8,'Show','agen/agen','','2018-08-01','12:31:21'),(579,8,'Show','other/rate','','2018-08-01','12:31:27'),(580,8,'Add','other/rate','5','2018-08-01','12:31:54'),(581,8,'Show','other/rate','','2018-08-01','12:31:54'),(582,8,'Show','agen/agen','','2018-08-01','12:32:45'),(583,8,'Show','production/production','','2018-08-01','12:32:48'),(584,8,'Show','production/production','','2018-08-01','12:34:48'),(585,8,'Show','production/production','','2018-08-01','12:36:16'),(586,8,'Show','production/production','','2018-08-01','12:37:50'),(587,8,'Show','other/cost','','2018-08-01','12:47:33'),(588,8,'Show','other/cost','','2018-08-02','10:10:07'),(589,8,'Show','production/production','','2018-08-02','10:10:14'),(590,8,'Show','production/production','','2018-08-03','03:52:37'),(591,8,'Show','production/production','','2018-08-03','03:52:54'),(592,8,'Show','production/production','','2018-08-03','03:53:02'),(593,8,'Show','production/production','','2018-08-03','04:24:20'),(594,8,'Show','production/production','','2018-08-03','04:24:26'),(595,8,'Show','production/production','','2018-08-03','04:24:41'),(596,6,'Show','production/production','','2018-08-04','02:27:38'),(597,6,'Show','production/production','','2018-08-04','02:27:55'),(598,6,'Show','production/production','','2018-08-04','02:28:12'),(599,6,'Show','agen/agen','','2018-08-04','02:28:55'),(600,6,'Show','agen/agen','','2018-08-04','02:31:50'),(601,6,'Show','production/production','','2018-08-04','02:32:36'),(602,6,'Show','principal/principal','','2018-08-04','02:32:38'),(603,6,'Show','principal/principal','','2018-08-04','02:33:15'),(604,6,'Update','principal/principal','1','2018-08-04','02:34:01'),(605,6,'Show','principal/principal','','2018-08-04','02:34:01'),(606,6,'Add','principal/principal','4','2018-08-04','02:35:24'),(607,6,'Show','principal/principal','','2018-08-04','02:35:24'),(608,6,'Show','production/production','','2018-08-04','02:35:29'),(609,6,'Show','obligee/obligee','','2018-08-04','02:35:33'),(610,6,'Add','obligee/obligee','2','2018-08-04','02:36:55'),(611,6,'Show','obligee/obligee','','2018-08-04','02:36:58'),(612,6,'Show','other/insurance','','2018-08-04','02:37:09'),(613,6,'Show','other/surety','','2018-08-04','02:37:34'),(614,6,'Show','other/rate','','2018-08-04','02:38:04'),(615,6,'Show','other/surety','','2018-08-04','02:38:16'),(616,6,'Update','other/surety','1','2018-08-04','02:38:30'),(617,6,'Show','other/surety','','2018-08-04','02:38:30'),(618,6,'Show','other/surety','','2018-08-04','02:38:36'),(619,6,'Update','other/surety','1','2018-08-04','02:38:45'),(620,6,'Show','other/surety','','2018-08-04','02:38:45'),(621,6,'Update','other/surety','1','2018-08-04','02:38:51'),(622,6,'Show','other/surety','','2018-08-04','02:38:51'),(623,6,'Update','other/surety','1','2018-08-04','02:38:58'),(624,6,'Show','other/surety','','2018-08-04','02:38:58'),(625,6,'Show','agen/agen','','2018-08-04','02:39:55'),(626,6,'Show','principal/principal','','2018-08-04','02:40:16'),(627,6,'Show','principal/principal','','2018-08-04','02:40:39'),(628,6,'Show','obligee/obligee','','2018-08-04','02:40:41'),(629,6,'Show','obligee/obligee','','2018-08-04','02:41:27'),(630,6,'Show','other/insurance','','2018-08-04','02:42:40'),(631,6,'Show','other/surety','','2018-08-04','02:42:43'),(632,6,'Show','other/rate','','2018-08-04','02:42:46'),(633,6,'Update','other/rate','1','2018-08-04','02:43:27'),(634,6,'Show','other/rate','','2018-08-04','02:43:27'),(635,6,'Show','other/rate','','2018-08-04','02:45:23'),(636,6,'Show','other/rate','','2018-08-04','02:47:09'),(637,6,'Show','agen/agen','','2018-08-04','02:48:35'),(638,6,'Show','other/insurance','','2018-08-04','02:51:40'),(639,6,'Show','other/insurance','','2018-08-04','02:51:41'),(640,6,'Show','other/rate','','2018-08-04','02:52:35'),(641,6,'Show','production/production','','2018-08-04','02:53:13'),(642,6,'Show','production/production','','2018-08-04','02:56:35'),(643,6,'Show','setting/menu','','2018-08-04','02:56:45'),(644,6,'Update','setting/menu','61','2018-08-04','02:57:05'),(645,6,'Show','setting/menu','','2018-08-04','02:57:05'),(646,6,'Show','production/production','','2018-08-04','02:57:32'),(647,6,'Add','production/production','4','2018-08-04','03:02:53'),(648,6,'Show','production/production','','2018-08-04','03:02:53'),(649,8,'Show','setting/menu','','2018-08-24','13:01:01'),(650,8,'Add','setting/menu','86','2018-08-24','13:02:05'),(651,8,'Show','setting/menu','','2018-08-24','13:02:06'),(652,8,'Show','setting/grup_akses','','2018-08-24','13:02:22'),(653,8,'Update','setting/grup_akses','373','2018-08-24','13:02:31'),(654,8,'Show','setting/grup_akses','','2018-08-24','13:02:31'),(655,8,'Update','setting/grup_akses','374','2018-08-24','13:02:37'),(656,8,'Show','setting/grup_akses','','2018-08-24','13:02:38'),(657,8,'Update','setting/grup_akses','375','2018-08-24','13:02:44'),(658,8,'Show','setting/grup_akses','','2018-08-24','13:02:44'),(659,8,'Add','setting/menu','87','2018-08-24','13:03:52'),(660,8,'Show','setting/menu','','2018-08-24','13:03:52'),(661,8,'Show','setting/grup_akses','','2018-08-24','13:03:59'),(662,8,'Update','setting/grup_akses','376','2018-08-24','13:04:05'),(663,8,'Show','setting/grup_akses','','2018-08-24','13:04:05'),(664,8,'Update','setting/grup_akses','377','2018-08-24','13:04:12'),(665,8,'Show','setting/grup_akses','','2018-08-24','13:04:12'),(666,8,'Update','setting/grup_akses','378','2018-08-24','13:04:18'),(667,8,'Show','setting/grup_akses','','2018-08-24','13:04:18'),(668,8,'Add','setting/menu','88','2018-08-24','13:04:58'),(669,8,'Show','setting/menu','','2018-08-24','13:04:58'),(670,8,'Show','setting/grup_akses','','2018-08-24','13:05:04'),(671,8,'Update','setting/grup_akses','379','2018-08-24','13:05:11'),(672,8,'Show','setting/grup_akses','','2018-08-24','13:05:11'),(673,8,'Update','setting/grup_akses','380','2018-08-24','13:05:16'),(674,8,'Show','setting/grup_akses','','2018-08-24','13:05:16'),(675,8,'Update','setting/grup_akses','381','2018-08-24','13:05:22'),(676,8,'Show','setting/grup_akses','','2018-08-24','13:05:22'),(677,8,'Show','setting/menu','','2018-08-24','13:06:17'),(678,8,'Add','setting/menu','89','2018-08-24','13:07:14'),(679,8,'Show','setting/menu','','2018-08-24','13:07:14'),(680,8,'Show','setting/grup_akses','','2018-08-24','13:07:18'),(681,8,'Update','setting/grup_akses','382','2018-08-24','13:07:25'),(682,8,'Show','setting/grup_akses','','2018-08-24','13:07:25'),(683,8,'Update','setting/grup_akses','383','2018-08-24','13:07:31'),(684,8,'Show','setting/grup_akses','','2018-08-24','13:07:31'),(685,8,'Update','setting/grup_akses','384','2018-08-24','13:07:37'),(686,8,'Show','setting/grup_akses','','2018-08-24','13:07:37'),(687,8,'Show','productionreport/productionreport','','2018-08-24','13:07:50'),(688,8,'Show','setting/menu','','2018-08-24','13:07:54'),(689,8,'Show','setting/menu','','2018-08-24','13:08:22'),(690,8,'Show','productionreport/productionreport','','2018-08-24','13:08:33'),(691,8,'Show','production/production','','2018-08-24','13:08:45'),(692,8,'Remove','production/production','4','2018-08-24','13:08:49'),(693,8,'Show','production/production','','2018-08-24','13:08:49'),(694,8,'Remove','production/production','3','2018-08-24','13:08:52'),(695,8,'Show','production/production','','2018-08-24','13:08:52'),(696,8,'Show','setting/menu','','2018-08-24','22:15:27'),(697,8,'Update','setting/menu','89','2018-08-24','22:15:45'),(698,8,'Show','setting/menu','','2018-08-24','22:15:45'),(699,8,'Show','productionreport/productionreport','','2018-08-24','22:15:54'),(700,8,'Show','agen/agen','','2018-08-25','00:48:07'),(701,8,'Show','principal/principal','','2018-08-25','00:48:21'),(702,8,'Show','principal/principal','','2018-08-25','00:48:33'),(703,8,'Update','principal/principal','1','2018-08-25','00:48:42'),(704,8,'Show','principal/principal','','2018-08-25','00:48:42'),(705,8,'Show','obligee/obligee','','2018-08-25','00:48:49'),(706,8,'Show','other/insurance','','2018-08-25','00:48:55'),(707,8,'Update','other/insurance','1','2018-08-25','00:49:41'),(708,8,'Show','other/insurance','','2018-08-25','00:49:41'),(709,8,'Show','other/surety','','2018-08-25','00:49:46'),(710,8,'Update','other/surety','1','2018-08-25','00:50:09'),(711,8,'Show','other/surety','','2018-08-25','00:50:11'),(712,8,'Update','other/surety','1','2018-08-25','00:50:25'),(713,8,'Show','other/surety','','2018-08-25','00:50:25'),(714,8,'Update','other/surety','1','2018-08-25','00:50:38'),(715,8,'Show','other/surety','','2018-08-25','00:50:38'),(716,8,'Update','other/surety','1','2018-08-25','00:51:16'),(717,8,'Show','other/surety','','2018-08-25','00:51:16'),(718,8,'Show','other/rate','','2018-08-25','00:51:21'),(719,8,'Remove','other/rate','3','2018-08-25','00:51:27'),(720,8,'Show','other/rate','','2018-08-25','00:51:27'),(721,8,'Remove','other/rate','4','2018-08-25','00:51:30'),(722,8,'Show','other/rate','','2018-08-25','00:51:30'),(723,8,'Remove','other/rate','5','2018-08-25','00:51:34'),(724,8,'Show','other/rate','','2018-08-25','00:51:34'),(725,8,'Add','other/rate','6','2018-08-25','00:52:51'),(726,8,'Show','other/rate','','2018-08-25','00:52:51'),(727,8,'Show','production/production','','2018-08-25','00:52:58'),(728,8,'Show','other/insurance','','2018-08-25','00:55:08'),(729,8,'Update','other/insurance','1','2018-08-25','00:55:57'),(730,8,'Show','other/insurance','','2018-08-25','00:55:57'),(731,8,'Add','production/production','5','2018-08-25','01:05:00'),(732,8,'Show','production/production','','2018-08-25','01:05:01'),(733,8,'Show','report/branch','','2018-08-25','01:05:14'),(734,8,'Show','production/production','','2018-08-25','01:05:31'),(735,8,'Show','productionreport/productionreport','','2018-08-25','01:07:07'),(736,8,'Update','productionreport/productionreport','1','2018-08-25','01:07:41'),(737,8,'Show','productionreport/productionreport','','2018-08-25','01:07:41'),(738,8,'Show','production/production','','2018-08-25','01:07:55'),(739,8,'Show','productionreport/productionreport','','2018-08-25','01:08:38'),(740,8,'Show','production/production','','2018-08-25','01:18:47'),(741,8,'Show','production/production','','2018-08-25','01:19:31'),(742,8,'Show','log/auditrail','','2018-08-25','01:48:28'),(743,8,'Show','setting/user','','2018-08-25','01:48:39'),(744,8,'Add','setting/user','11','2018-08-25','01:49:32'),(745,8,'Show','setting/user','','2018-08-25','01:49:32'),(746,8,'Show','other/cost','','2018-08-25','01:51:42'),(747,8,'Show','other/rate','','2018-08-25','01:51:44'),(748,8,'Show','setting/user','','2018-08-25','01:51:49'),(749,8,'Set Password','setting/user','11','2018-08-25','01:52:16'),(750,8,'Set Password','setting/user','11','2018-08-25','01:53:13'),(751,11,'Show','production/production','','2018-08-25','02:51:07'),(752,11,'Show','other/cost','','2018-08-25','02:51:24'),(753,11,'Show','other/surety','','2018-08-25','02:51:47'),(754,11,'Show','production/production','','2018-08-25','02:52:04'),(755,11,'Show','principal/principal','','2018-08-25','02:53:03'),(756,11,'Add','principal/principal','5','2018-08-25','02:54:08'),(757,11,'Show','principal/principal','','2018-08-25','02:54:08'),(758,11,'Show','obligee/obligee','','2018-08-25','02:54:39'),(759,11,'Add','obligee/obligee','3','2018-08-25','02:55:19'),(760,11,'Show','obligee/obligee','','2018-08-25','02:55:19'),(761,11,'Show','other/insurance','','2018-08-25','02:56:06'),(762,11,'Show','other/rate','','2018-08-25','02:56:31'),(763,11,'Show','other/insurance','','2018-08-25','02:56:35'),(764,11,'Show','other/rate','','2018-08-25','02:56:38'),(765,11,'Show','other/insurance','','2018-08-25','02:56:45'),(766,11,'Show','other/insurance','','2018-08-25','02:56:58'),(767,11,'Update','other/insurance','1','2018-08-25','02:57:54'),(768,11,'Show','other/insurance','','2018-08-25','02:57:54'),(769,11,'Add','other/insurance','2','2018-08-25','02:58:58'),(770,11,'Show','other/insurance','','2018-08-25','02:58:59'),(771,11,'Show','agen/agen','','2018-08-25','03:00:12'),(772,11,'Add','agen/agen','3','2018-08-25','03:02:41'),(773,11,'Show','agen/agen','','2018-08-25','03:02:41'),(774,11,'Show','other/rate','','2018-08-25','03:02:53'),(775,11,'Add','other/rate','7','2018-08-25','03:03:56'),(776,11,'Show','other/rate','','2018-08-25','03:03:56'),(777,11,'Show','other/insurance','','2018-08-25','03:08:27'),(778,11,'Update','other/insurance','1','2018-08-25','03:08:42'),(779,11,'Show','other/insurance','','2018-08-25','03:08:42'),(780,11,'Add','production/production','6','2018-08-25','03:09:57'),(781,11,'Show','production/production','','2018-08-25','03:09:57'),(782,11,'Show','productionreport/productionreport','','2018-08-25','03:12:26'),(783,11,'Show','production/production','','2018-08-25','03:16:05'),(784,0,'Show','production/production','','2018-08-25','03:40:36'),(785,8,'Show','production/production','','2018-08-25','03:40:45'),(786,11,'Show','production/production','','2018-08-25','03:49:26'),(787,8,'Show','production/production','','2018-08-25','04:27:30'),(788,11,'Show','other/rate','','2018-08-25','04:35:09'),(789,8,'Show','production/production','','2018-08-25','05:24:53'),(790,8,'Show','other/rate','','2018-08-25','05:37:13'),(791,8,'Show','productionreport/productionreport','','2018-08-26','08:09:09'),(792,8,'Show','productionreport/productionreport','','2018-08-26','08:14:30'),(793,8,'Show','other/insurance','','2018-08-26','08:16:06'),(794,8,'Update','other/insurance','1','2018-08-26','08:16:36'),(795,8,'Show','other/insurance','','2018-08-26','08:16:36'),(796,8,'Update','other/insurance','1','2018-08-26','08:16:44'),(797,8,'Show','other/insurance','','2018-08-26','08:16:44'),(798,8,'Show','production/production','','2018-08-26','08:16:50'),(799,8,'Show','productionreport/productionreport','','2018-08-26','08:25:40'),(800,8,'Show','productionreport/productionreport','','2018-08-26','08:28:18'),(801,8,'Show','production/production','','2018-08-27','02:27:53'),(802,8,'Show','productionreport/productionreport','','2018-08-27','02:49:00'),(803,8,'Update','productionreport/productionreport','1','2018-08-27','02:49:17'),(804,8,'Show','productionreport/productionreport','','2018-08-27','02:49:17'),(805,8,'Update','productionreport/productionreport','1','2018-08-27','02:49:42'),(806,8,'Show','productionreport/productionreport','','2018-08-27','02:49:43'),(807,8,'Update','productionreport/productionreport','1','2018-08-27','02:49:57'),(808,8,'Show','productionreport/productionreport','','2018-08-27','02:49:57'),(809,8,'Update','productionreport/productionreport','1','2018-08-27','02:50:10'),(810,8,'Show','productionreport/productionreport','','2018-08-27','02:50:10'),(811,8,'Show','production/production','','2018-08-27','02:50:13'),(812,11,'Show','production/production','','2018-08-28','02:27:05'),(813,11,'Show','production/production','','2018-08-28','02:48:03'),(814,11,'Show','production/production','','2018-08-28','02:48:38'),(815,11,'Show','productionreport/productionreport','','2018-08-28','02:51:37'),(816,11,'Show','productionreport/productionreport','','2018-08-28','02:51:53'),(817,11,'Show','productionreport/productionreport','','2018-08-28','02:52:05'),(818,11,'Show','productionreport/productionreport','','2018-08-28','02:52:16'),(819,11,'Show','productionreport/productionreport','','2018-08-28','02:52:26'),(820,11,'Show','productionreport/productionreport','','2018-08-28','02:52:41'),(821,11,'Add','productionreport/productionreport','5','2018-08-28','02:53:44'),(822,11,'Show','productionreport/productionreport','','2018-08-28','02:53:44'),(823,11,'Show','production/production','','2018-08-28','02:54:18'),(824,8,'Show','productionreport/productionreport','','2018-09-14','11:03:08'),(825,8,'Update','productionreport/productionreport','1','2018-09-14','11:03:27'),(826,8,'Show','productionreport/productionreport','','2018-09-14','11:03:27'),(827,8,'Show','productionreport/productionreport','','2018-09-14','11:03:27'),(828,8,'Show','production/production','','2018-09-14','11:07:52'),(829,8,'Show','productionreport/productionreport','','2018-09-14','11:08:16'),(830,8,'Show','productionreport/productionreport','','2018-09-14','11:08:38'),(831,8,'Show','productionreport/productionreport','','2018-09-14','11:11:53'),(832,8,'Update','productionreport/productionreport','1','2018-09-14','11:12:39'),(833,8,'Show','productionreport/productionreport','','2018-09-14','11:12:39'),(834,8,'Show','production/production','','2018-09-14','11:12:45'),(835,8,'Update','productionreport/productionreport','1','2018-09-14','11:20:11'),(836,8,'Show','productionreport/productionreport','','2018-09-14','11:20:11'),(837,8,'Show','production/production','','2018-09-14','11:20:15'),(838,8,'Update','productionreport/productionreport','1','2018-09-14','11:23:52'),(839,8,'Show','productionreport/productionreport','','2018-09-14','11:23:52'),(840,8,'Update','productionreport/productionreport','1','2018-09-14','11:25:18'),(841,8,'Show','productionreport/productionreport','','2018-09-14','11:25:18'),(842,8,'Show','productionreport/productionreport','','2018-09-14','11:25:18'),(843,8,'Show','productionreport/productionreport','','2018-09-14','11:25:52'),(844,8,'Update','productionreport/productionreport','1','2018-09-14','11:27:04'),(845,8,'Show','productionreport/productionreport','','2018-09-14','11:27:04'),(846,8,'Update','productionreport/productionreport','1','2018-09-14','11:30:36'),(847,8,'Show','productionreport/productionreport','','2018-09-14','11:30:36'),(848,8,'Show','productionreport/productionreport','','2018-09-14','11:33:44'),(849,8,'Update','productionreport/productionreport','1','2018-09-14','11:36:17'),(850,8,'Show','productionreport/productionreport','','2018-09-14','11:36:17'),(851,8,'Show','productionreport/productionreport','','2018-09-14','11:37:48'),(852,8,'Update','productionreport/productionreport','1','2018-09-14','11:38:24'),(853,8,'Show','productionreport/productionreport','','2018-09-14','11:38:24'),(854,8,'Show','production/production','','2018-09-14','11:38:26'),(855,8,'Update','productionreport/productionreport','1','2018-09-14','11:39:17'),(856,8,'Show','productionreport/productionreport','','2018-09-14','11:39:17'),(857,8,'Show','productionreport/productionreport','','2018-09-14','11:39:29'),(858,8,'Update','productionreport/productionreport','1','2018-09-14','11:43:35'),(859,8,'Show','productionreport/productionreport','','2018-09-14','11:43:35'),(860,8,'Update','productionreport/productionreport','1','2018-09-14','11:48:30'),(861,8,'Show','productionreport/productionreport','','2018-09-14','11:48:30'),(862,8,'Show','other/cost','','2018-09-15','01:16:16'),(863,8,'Show','production/production','','2018-09-15','01:16:22'),(864,8,'Show','setting/menu','','2018-09-15','01:18:32'),(865,8,'Add','setting/menu','90','2018-09-15','01:19:58'),(866,8,'Show','setting/menu','','2018-09-15','01:19:59'),(867,8,'Show','setting/grup_akses','','2018-09-15','01:20:02'),(868,8,'Update','setting/grup_akses','385','2018-09-15','01:20:12'),(869,8,'Show','setting/grup_akses','','2018-09-15','01:20:12'),(870,8,'Update','setting/menu','89','2018-09-15','01:23:52'),(871,8,'Show','setting/menu','','2018-09-15','01:23:52'),(872,8,'Update','setting/menu','90','2018-09-15','01:25:49'),(873,8,'Show','setting/menu','','2018-09-15','01:25:51'),(874,8,'Show','setting/menu','','2018-09-15','01:27:40'),(875,8,'Update','setting/menu','90','2018-09-15','01:27:51'),(876,8,'Show','setting/menu','','2018-09-15','01:27:51'),(877,8,'Show','setting/menu','','2018-09-15','01:28:13'),(878,8,'Update','setting/menu','90','2018-09-15','01:31:01'),(879,8,'Show','setting/menu','','2018-09-15','01:31:01'),(880,8,'Show','setting/menu','','2018-09-15','01:31:28'),(881,8,'Update','setting/menu','90','2018-09-15','01:31:38'),(882,8,'Show','setting/menu','','2018-09-15','01:31:38'),(883,8,'Show','production/production','','2018-09-15','03:08:39'),(884,8,'Show','productionreport/productionreport','','2018-09-15','03:12:12'),(885,8,'Show','productionreport/productionreport','','2018-09-15','03:22:27'),(886,8,'Show','productionreport/productionreport','','2018-09-15','03:22:42'),(887,8,'Update','productionreport/productionreport','1','2018-09-15','03:29:47'),(888,8,'Show','productionreport/productionreport','','2018-09-15','03:29:48'),(889,8,'Show','productionreport/productionreport','','2018-09-15','03:30:02'),(890,8,'Show','productionreport/productionreport','','2018-09-15','03:30:19'),(891,8,'Show','productionreport/productionreport','','2018-09-15','03:30:37'),(892,8,'Add','productionreport/productionreport','6','2018-09-15','03:35:30'),(893,8,'Show','productionreport/productionreport','','2018-09-15','03:35:30'),(894,8,'Add','productionreport/productionreport','7','2018-09-15','03:36:47'),(895,8,'Show','productionreport/productionreport','','2018-09-15','03:36:47'),(896,8,'Add','productionreport/productionreport','8','2018-09-15','03:37:31'),(897,8,'Show','productionreport/productionreport','','2018-09-15','03:37:31'),(898,8,'Update','productionreport/productionreport','1','2018-09-15','03:38:37'),(899,8,'Show','productionreport/productionreport','','2018-09-15','03:38:37'),(900,8,'Show','productionreport/productionreport','','2018-09-15','03:39:09'),(901,8,'Update','productionreport/productionreport','1','2018-09-15','03:39:21'),(902,8,'Show','productionreport/productionreport','','2018-09-15','03:39:21'),(903,8,'Add','productionreport/productionreport','9','2018-09-15','03:39:43'),(904,8,'Show','productionreport/productionreport','','2018-09-15','03:39:43'),(905,8,'Show','productionreport/productionreport','','2018-09-15','03:39:47'),(906,8,'Show','productionreport/productionreport','','2018-09-15','03:39:56'),(907,8,'Show','productionreport/productionreport','','2018-09-15','03:40:07'),(908,8,'Show','productionreport/productionreport','','2018-09-15','03:40:17'),(909,8,'Update','productionreport/productionreport','1','2018-09-15','03:40:39'),(910,8,'Show','productionreport/productionreport','','2018-09-15','03:40:39'),(911,8,'Show','productionreport/productionreport','','2018-09-15','03:41:14'),(912,8,'Show','productionreport/productionreport','','2018-09-15','03:41:22'),(913,8,'Show','productionreport/productionreport','','2018-09-15','03:41:29'),(914,8,'Show','productionreport/productionreport','','2018-09-15','03:41:35'),(915,8,'Show','productionreport/productionreport','','2018-09-15','03:41:42'),(916,8,'Show','productionreport/productionreport','','2018-09-15','03:42:25'),(917,8,'Add','productionreport/productionreport','10','2018-09-15','03:42:48'),(918,8,'Update','productionreport/productionreport','1','2018-09-15','03:42:50'),(919,8,'Show','productionreport/productionreport','','2018-09-15','03:42:50'),(920,8,'Show','productionreport/productionreport','','2018-09-15','03:42:59'),(921,8,'Show','productionreport/productionreport','','2018-09-15','03:43:00'),(922,8,'Show','productionreport/productionreport','','2018-09-15','03:45:07'),(923,8,'Update','productionreport/productionreport','1','2018-09-15','03:45:50'),(924,8,'Show','productionreport/productionreport','','2018-09-15','03:45:50'),(925,8,'Show','productionreport/productionreport','','2018-09-15','03:47:38'),(926,8,'Update','productionreport/productionreport','1','2018-09-15','03:51:31'),(927,8,'Show','productionreport/productionreport','','2018-09-15','03:51:31'),(928,8,'Show','productionreport/productionreport','','2018-09-15','03:52:16'),(929,8,'Add','productionreport/productionreport','11','2018-09-15','03:54:25'),(930,8,'Show','productionreport/productionreport','','2018-09-15','03:54:25'),(931,8,'Update','productionreport/productionreport','1','2018-09-15','03:55:43'),(932,8,'Show','productionreport/productionreport','','2018-09-15','03:55:43'),(933,8,'Show','productionreport/productionreport','','2018-09-15','03:57:19'),(934,8,'Add','productionreport/productionreport','12','2018-09-15','04:00:14'),(935,8,'Show','productionreport/productionreport','','2018-09-15','04:00:14'),(936,8,'Show','productionreport/productionreport','','2018-09-15','04:00:53'),(937,8,'Update','productionreport/productionreport','1','2018-09-15','04:01:16'),(938,8,'Show','productionreport/productionreport','','2018-09-15','04:01:17'),(939,8,'Show','productionreport/productionreport','','2018-09-15','04:06:11'),(940,8,'Show','productionreport/productionreport','','2018-09-15','04:06:34'),(941,8,'Add','productionreport/productionreport','13','2018-09-15','04:08:49'),(942,8,'Show','productionreport/productionreport','','2018-09-15','04:08:50'),(943,8,'Add','productionreport/productionreport','14','2018-09-15','04:12:37'),(944,8,'Show','productionreport/productionreport','','2018-09-15','04:12:37'),(945,8,'Show','productionreport/productionreport','','2018-09-15','04:13:29'),(946,8,'Remove','productionreport/productionreport','11','2018-09-15','04:13:33'),(947,8,'Show','productionreport/productionreport','','2018-09-15','04:13:33'),(948,8,'Show','production/production','','2018-09-15','04:25:03'),(949,8,'Show','production/production','','2018-09-15','04:27:10'),(950,11,'Show','production/production','','2018-09-15','04:29:12'),(951,11,'Show','productionreport/productionreport','','2018-09-15','04:45:30'),(952,11,'Update','productionreport/productionreport','1','2018-09-15','04:46:56'),(953,11,'Show','productionreport/productionreport','','2018-09-15','04:46:56'),(954,11,'Show','production/production','','2018-09-15','04:47:05'),(955,11,'Show','productionreport/productionreport','','2018-09-15','04:48:41'),(956,11,'Update','productionreport/productionreport','1','2018-09-15','04:49:40'),(957,11,'Show','productionreport/productionreport','','2018-09-15','04:49:40'),(958,11,'Update','productionreport/productionreport','1','2018-09-15','04:55:21'),(959,11,'Show','productionreport/productionreport','','2018-09-15','04:55:22'),(960,11,'Update','productionreport/productionreport','1','2018-09-15','04:59:41'),(961,11,'Show','productionreport/productionreport','','2018-09-15','04:59:41'),(962,11,'Update','productionreport/productionreport','1','2018-09-15','05:04:13'),(963,11,'Show','productionreport/productionreport','','2018-09-15','05:04:13'),(964,11,'Update','productionreport/productionreport','1','2018-09-15','05:07:49'),(965,11,'Show','productionreport/productionreport','','2018-09-15','05:07:49'),(966,11,'Update','productionreport/productionreport','1','2018-09-15','05:12:25'),(967,11,'Show','productionreport/productionreport','','2018-09-15','05:12:26'),(968,11,'Update','productionreport/productionreport','1','2018-09-15','05:20:53'),(969,11,'Show','productionreport/productionreport','','2018-09-15','05:20:53'),(970,11,'Update','productionreport/productionreport','1','2018-09-15','05:25:00'),(971,11,'Show','productionreport/productionreport','','2018-09-15','05:25:00'),(972,11,'Show','production/production','','2018-09-15','05:29:12'),(973,11,'Update','productionreport/productionreport','1','2018-09-15','05:30:26'),(974,11,'Show','productionreport/productionreport','','2018-09-15','05:30:26'),(975,11,'Show','production/production','','2018-09-15','05:30:43'),(976,11,'Update','productionreport/productionreport','1','2018-09-15','05:34:01'),(977,11,'Show','productionreport/productionreport','','2018-09-15','05:34:01'),(978,11,'Show','production/production','','2018-09-15','05:37:12'),(979,11,'Show','production/production','','2018-09-15','05:37:39'),(980,11,'Update','productionreport/productionreport','1','2018-09-15','05:38:49'),(981,11,'Show','productionreport/productionreport','','2018-09-15','05:38:49'),(982,11,'Update','productionreport/productionreport','1','2018-09-15','05:45:58'),(983,11,'Show','productionreport/productionreport','','2018-09-15','05:45:58'),(984,11,'Show','productionreport/productionreport','','2018-09-15','05:47:32'),(985,11,'Update','productionreport/productionreport','1','2018-09-15','05:48:14'),(986,11,'Show','productionreport/productionreport','','2018-09-15','05:48:14'),(987,11,'Update','productionreport/productionreport','1','2018-09-15','05:51:25'),(988,11,'Show','productionreport/productionreport','','2018-09-15','05:51:25'),(989,11,'Update','productionreport/productionreport','1','2018-09-15','05:54:33'),(990,11,'Show','productionreport/productionreport','','2018-09-15','05:54:33'),(991,11,'Update','productionreport/productionreport','1','2018-09-15','05:59:13'),(992,11,'Show','productionreport/productionreport','','2018-09-15','05:59:13'),(993,11,'Update','productionreport/productionreport','1','2018-09-15','06:03:08'),(994,11,'Show','productionreport/productionreport','','2018-09-15','06:03:08'),(995,11,'Update','productionreport/productionreport','1','2018-09-15','06:03:33'),(996,11,'Show','productionreport/productionreport','','2018-09-15','06:03:34'),(997,11,'Update','productionreport/productionreport','1','2018-09-15','06:07:42'),(998,11,'Show','productionreport/productionreport','','2018-09-15','06:07:42'),(999,11,'Update','productionreport/productionreport','1','2018-09-15','06:10:48'),(1000,11,'Show','productionreport/productionreport','','2018-09-15','06:10:48'),(1001,11,'Update','productionreport/productionreport','1','2018-09-15','06:11:24'),(1002,11,'Show','productionreport/productionreport','','2018-09-15','06:11:24'),(1003,11,'Update','productionreport/productionreport','1','2018-09-15','06:12:56'),(1004,11,'Show','productionreport/productionreport','','2018-09-15','06:12:56'),(1005,11,'Update','productionreport/productionreport','1','2018-09-15','06:15:37'),(1006,11,'Show','productionreport/productionreport','','2018-09-15','06:15:37'),(1007,11,'Update','productionreport/productionreport','1','2018-09-15','06:18:49'),(1008,11,'Show','productionreport/productionreport','','2018-09-15','06:18:49'),(1009,11,'Update','productionreport/productionreport','1','2018-09-15','06:19:13'),(1010,11,'Show','productionreport/productionreport','','2018-09-15','06:19:13'),(1011,11,'Update','productionreport/productionreport','1','2018-09-15','06:22:59'),(1012,11,'Show','productionreport/productionreport','','2018-09-15','06:22:59'),(1013,11,'Update','productionreport/productionreport','1','2018-09-15','06:24:00'),(1014,11,'Show','productionreport/productionreport','','2018-09-15','06:24:00'),(1015,0,'Show','productionreport/productionreport','','2018-09-15','06:25:15'),(1016,8,'Show','productionreport/productionreport','','2018-09-15','06:25:37'),(1017,11,'Update','productionreport/productionreport','1','2018-09-15','06:26:32'),(1018,11,'Show','productionreport/productionreport','','2018-09-15','06:26:32'),(1019,8,'Update','productionreport/productionreport','1','2018-09-15','06:27:49'),(1020,8,'Show','productionreport/productionreport','','2018-09-15','06:27:50'),(1021,8,'Update','productionreport/productionreport','1','2018-09-15','06:31:22'),(1022,8,'Show','productionreport/productionreport','','2018-09-15','06:31:23'),(1023,11,'Show','productionreport/productionreport','','2018-09-15','06:31:42'),(1024,11,'Update','productionreport/productionreport','1','2018-09-15','06:31:56'),(1025,11,'Show','productionreport/productionreport','','2018-09-15','06:31:56'),(1026,8,'Show','productionreport/productionreport','','2018-09-15','06:36:16'),(1027,8,'Show','production/production','','2018-09-15','06:36:40'),(1028,0,'Show','production/production','','2018-09-15','07:00:15'),(1029,8,'Show','production/production','','2018-09-15','07:00:34'),(1030,8,'Show','production/production','','2018-09-15','07:00:39'),(1031,8,'Show','production/production','','2018-09-15','07:01:45'),(1032,8,'Show','other/insurance','','2018-09-20','06:51:41'),(1033,6,'Show','productionreport/productionreport','','2018-09-20','12:35:30'),(1034,6,'Show','productionreport/productionreport','','2018-09-20','12:35:51'),(1035,6,'Show','production/production','','2018-09-20','12:35:55'),(1036,6,'Show','production/production','','2018-09-20','12:36:25'),(1037,6,'Show','production/production','','2018-09-20','12:36:30'),(1038,6,'Show','setting/menu','','2018-09-20','12:37:34'),(1039,6,'Show','setting/grup_user','','2018-09-20','12:37:50'),(1040,8,'Show','setting/menu','','2018-09-20','16:08:54'),(1041,8,'Show','setting/menu','','2018-09-20','16:09:00'),(1042,8,'Add','setting/menu','91','2018-09-20','16:09:58'),(1043,8,'Show','setting/menu','','2018-09-20','16:09:58'),(1044,8,'Show','setting/menu','','2018-09-20','16:10:10'),(1045,8,'Show','setting/grup_akses','','2018-09-20','16:10:16'),(1046,8,'Update','setting/grup_akses','388','2018-09-20','16:10:27'),(1047,8,'Show','setting/grup_akses','','2018-09-20','16:10:27'),(1048,8,'Update','setting/grup_akses','389','2018-09-20','16:10:34'),(1049,8,'Show','setting/grup_akses','','2018-09-20','16:10:34'),(1050,8,'Update','setting/grup_akses','390','2018-09-20','16:10:41'),(1051,8,'Show','setting/grup_akses','','2018-09-20','16:10:41'),(1052,8,'Show','other/insurance','','2018-09-20','16:11:06'),(1053,8,'Update','other/insurance','1','2018-09-20','16:11:50'),(1054,8,'Show','other/insurance','','2018-09-20','16:11:50'),(1055,8,'Update','other/insurance','1','2018-09-20','16:12:07'),(1056,8,'Show','other/insurance','','2018-09-20','16:12:07'),(1057,8,'Add','other/insurance','3','2018-09-20','16:12:47'),(1058,8,'Show','other/insurance','','2018-09-20','16:12:47'),(1059,8,'Add','other/insurance','4','2018-09-20','16:13:08'),(1060,8,'Show','other/insurance','','2018-09-20','16:13:08'),(1061,8,'Add','other/insurance','5','2018-09-20','16:13:25'),(1062,8,'Show','other/insurance','','2018-09-20','16:13:25'),(1063,8,'Show','other/rateinsurance','','2018-09-20','16:13:30'),(1064,8,'Show','other/rate','','2018-09-22','02:10:08'),(1065,8,'Show','other/rateinsurance','','2018-09-22','02:10:41'),(1066,8,'Show','principal/principal','','2018-09-22','02:10:47'),(1067,8,'Show','agen/agen','','2018-09-22','02:10:58'),(1068,11,'Show','productionreport/productionreport','','2018-09-24','03:42:00'),(1069,11,'Show','other/rate','','2018-09-24','03:42:38'),(1070,11,'Show','production/production','','2018-09-29','05:11:35'),(1071,11,'Show','production/production','','2018-09-29','05:11:35'),(1072,11,'Show','production/production','','2018-09-29','05:12:21'),(1073,11,'Show','other/insurance','','2018-09-29','05:12:47'),(1074,11,'Show','other/insurance','','2018-09-29','05:13:04'),(1075,11,'Show','production/production','','2018-09-29','05:13:04'),(1076,11,'Show','production/production','','2018-09-29','05:13:06'),(1077,11,'Show','production/production','','2018-09-29','05:13:06'),(1078,11,'Show','principal/principal','','2018-09-29','05:22:25'),(1079,11,'Add','principal/principal','6','2018-09-29','05:23:54'),(1080,11,'Show','principal/principal','','2018-09-29','05:23:54'),(1081,11,'Show','obligee/obligee','','2018-09-29','05:24:11'),(1082,11,'Show','production/production','','2018-09-29','05:24:16'),(1083,11,'Show','production/production','','2018-09-29','05:24:18'),(1084,11,'Show','production/production','','2018-09-29','05:24:19'),(1085,11,'Show','agen/agen','','2018-09-29','05:24:26'),(1086,11,'Show','agen/agen','','2018-09-29','05:24:27'),(1087,11,'Show','other/rate','','2018-09-29','05:24:33'),(1088,11,'Show','other/rate','','2018-09-29','05:24:33'),(1089,11,'Show','production/production','','2018-09-29','05:24:50'),(1090,11,'Show','production/production','','2018-09-29','05:24:52'),(1091,11,'Show','production/production','','2018-09-29','05:24:56'),(1092,11,'Show','production/production','','2018-09-29','05:25:00'),(1093,11,'Show','production/production','','2018-09-29','05:25:11'),(1094,11,'Show','production/production','','2018-09-29','05:25:11'),(1095,11,'Show','other/cost','','2018-09-29','05:30:02'),(1096,11,'Show','other/cost','','2018-09-29','05:30:06'),(1097,11,'Show','other/cost','','2018-09-29','05:30:07'),(1098,11,'Show','other/cost','','2018-09-29','05:30:09'),(1099,11,'Show','other/cost','','2018-09-29','05:30:10'),(1100,11,'Show','other/cost','','2018-09-29','05:30:57'),(1101,11,'Show','report/remainingmoney','','2018-09-29','05:33:41'),(1102,11,'Show','report/branch','','2018-09-29','05:33:52'),(1103,8,'Show','production/production','','2018-10-02','01:36:42'),(1104,8,'Add','production/production','7','2018-10-02','01:37:31'),(1105,8,'Show','production/production','','2018-10-02','01:37:32'),(1106,11,'Show','production/production','','2018-10-03','01:45:43'),(1107,11,'Show','principal/principal','','2018-10-03','01:50:14'),(1108,11,'Remove','principal/principal','5','2018-10-03','01:50:29'),(1109,11,'Show','principal/principal','','2018-10-03','01:50:29'),(1110,11,'Show','obligee/obligee','','2018-10-03','01:50:46'),(1111,11,'Show','production/production','','2018-10-03','01:53:36'),(1112,11,'Update','production/production','1','2018-10-03','01:59:52'),(1113,11,'Show','production/production','','2018-10-03','01:59:53'),(1114,11,'Show','production/production','','2018-10-03','02:00:44'),(1115,11,'Show','production/production','','2018-10-03','02:01:52'),(1116,11,'Update','production/production','1','2018-10-03','02:02:39'),(1117,11,'Show','production/production','','2018-10-03','02:02:39'),(1118,11,'Show','other/rateinsurance','','2018-10-03','02:07:51'),(1119,11,'Show','other/surety','','2018-10-03','02:08:20'),(1120,11,'Show','other/rateinsurance','','2018-10-03','02:08:22'),(1121,11,'Show','other/insurance','','2018-10-03','02:08:24'),(1122,11,'Show','agen/agen','','2018-10-03','02:08:55'),(1123,11,'Show','production/production','','2018-10-03','02:08:59'),(1124,11,'Show','production/production','','2018-10-03','02:10:13'),(1125,11,'Add','production/production','8','2018-10-03','02:13:35'),(1126,11,'Show','production/production','','2018-10-03','02:13:35'),(1127,11,'Update','production/production','1','2018-10-03','02:13:54'),(1128,11,'Show','production/production','','2018-10-03','02:13:54'),(1129,11,'Update','production/production','1','2018-10-03','02:14:06'),(1130,11,'Show','production/production','','2018-10-03','02:14:06'),(1131,11,'Show','report/remainingmoney','','2018-10-03','02:40:13'),(1132,11,'Export','report/remainingmoney','','2018-10-03','02:40:27'),(1133,11,'Show','production/production','','2018-10-03','02:50:36'),(1134,11,'Show','production/production','','2018-10-03','02:50:38'),(1135,11,'Show','report/daily','','2018-10-03','03:00:54'),(1136,11,'Export','report/daily','','2018-10-03','03:00:59'),(1137,11,'Show','production/production','','2018-10-03','03:02:04'),(1138,11,'Show','production/production','','2018-10-03','03:02:32'),(1139,11,'Update','production/production','1','2018-10-03','03:04:11'),(1140,11,'Show','production/production','','2018-10-03','03:04:11'),(1141,11,'Show','report/daily','','2018-10-03','03:05:03'),(1142,11,'Show','report/daily','','2018-10-03','03:05:10'),(1143,11,'Show','report/daily','','2018-10-03','03:05:14'),(1144,11,'Show','report/remainingmoney','','2018-10-03','03:05:39'),(1145,11,'Export','report/remainingmoney','','2018-10-03','03:05:44'),(1146,11,'Show','report/branch','','2018-10-03','03:09:21'),(1147,11,'Show','report/branch','','2018-10-03','03:11:30'),(1148,11,'Show','report/branch','','2018-10-03','03:11:47'),(1149,11,'Show','report/branch','','2018-10-03','03:12:42'),(1150,11,'Show','report/branch','','2018-10-03','03:12:53'),(1151,11,'Show','production/production','','2018-10-03','03:15:27'),(1152,11,'Show','production/production','','2018-10-03','03:15:39'),(1153,11,'Show','principal/principal','','2018-10-03','03:17:51'),(1154,11,'Show','production/production','','2018-10-03','03:25:25'),(1155,11,'Show','production/production','','2018-10-03','03:26:05'),(1156,8,'Show','productionreport/productionreport','','2018-10-05','06:13:20'),(1157,0,'Show','obligee/obligee','','2018-10-05','07:07:54'),(1158,8,'Show','obligee/obligee','','2018-10-05','07:08:01'),(1159,8,'Show','productionreport/productionreport','','2018-10-05','07:38:58'),(1160,8,'Show','setting/menu','','2018-10-05','07:39:21'),(1161,8,'Show','setting/menu','','2018-10-05','07:39:59'),(1162,8,'Add','setting/menu','92','2018-10-05','07:40:14'),(1163,8,'Show','setting/menu','','2018-10-05','07:40:14'),(1164,8,'Show','setting/menu','','2018-10-05','07:40:21'),(1165,8,'Show','setting/grup_akses','','2018-10-05','07:40:26'),(1166,8,'Update','setting/grup_akses','391','2018-10-05','07:40:32'),(1167,8,'Show','setting/grup_akses','','2018-10-05','07:40:32'),(1168,8,'Show','acceptances/acceptances','','2018-10-05','07:40:46'),(1169,8,'Add','acceptances/acceptances','1','2018-10-05','07:41:31'),(1170,8,'Show','acceptances/acceptances','','2018-10-05','07:41:31'),(1171,8,'Add','acceptances/acceptances','2','2018-10-05','07:42:13'),(1172,8,'Show','acceptances/acceptances','','2018-10-05','07:42:13'),(1173,8,'Add','acceptances/acceptances','3','2018-10-05','07:42:46'),(1174,8,'Show','acceptances/acceptances','','2018-10-05','07:42:47'),(1175,8,'Show','acceptances/acceptances','','2018-10-05','08:17:10'),(1176,8,'Update','acceptances/acceptances','1','2018-10-05','08:17:28'),(1177,8,'Show','acceptances/acceptances','','2018-10-05','08:17:28'),(1178,8,'Update','acceptances/acceptances','1','2018-10-05','08:17:43'),(1179,8,'Show','acceptances/acceptances','','2018-10-05','08:17:43'),(1180,8,'Update','acceptances/acceptances','1','2018-10-05','08:17:56'),(1181,8,'Show','acceptances/acceptances','','2018-10-05','08:17:56'),(1182,8,'Show','production/production','','2018-10-05','08:21:23'),(1183,8,'Show','production/production','','2018-10-06','01:43:18'),(1184,8,'Show','production/production','','2018-10-06','01:44:04'),(1185,8,'Show','production/production','','2018-10-06','01:44:05'),(1186,6,'Show','acceptances/acceptances','','2018-10-06','09:03:30'),(1187,6,'Show','production/production','','2018-10-06','09:03:34'),(1188,6,'Show','acceptances/acceptances','','2018-10-06','09:03:45'),(1189,6,'Show','production/production','','2018-10-06','09:04:09'),(1190,6,'Show','production/production','','2018-10-06','09:04:45'),(1191,6,'Export','production/production','','2018-10-06','09:06:12'),(1192,6,'Export','production/production','','2018-10-06','09:06:12'),(1193,6,'Add','production/production','9','2018-10-06','09:11:30'),(1194,6,'Show','production/production','','2018-10-06','09:11:30'),(1195,6,'Show','acceptances/acceptances','','2018-10-06','09:12:43'),(1196,6,'Show','production/production','','2018-10-06','09:12:46'),(1197,6,'Show','report/daily','','2018-10-06','09:13:16'),(1198,6,'Show','report/daily','','2018-10-06','09:14:08'),(1199,6,'Show','acceptances/acceptances','','2018-10-06','09:14:39'),(1200,6,'Show','productionreport/productionreport','','2018-10-06','09:15:16'),(1201,6,'Show','acceptances/acceptances','','2018-10-06','09:15:51'),(1202,6,'Show','acceptances/acceptances','','2018-10-06','09:16:16'),(1203,6,'Show','production/production','','2018-10-06','09:16:21'),(1204,6,'Show','production/production','','2018-10-06','09:16:32'),(1205,6,'Show','report/daily','','2018-10-06','09:18:07'),(1206,6,'Show','report/daily','','2018-10-06','09:18:49'),(1207,6,'Show','production/production','','2018-10-06','09:20:42'),(1208,6,'Update','production/production','1','2018-10-06','09:21:18'),(1209,6,'Show','production/production','','2018-10-06','09:21:18'),(1210,6,'Show','report/daily','','2018-10-06','09:22:28'),(1211,6,'Show','report/daily','','2018-10-06','09:23:01'),(1212,6,'Show','report/mutation','','2018-10-06','09:23:09'),(1213,6,'Show','report/daily','','2018-10-06','09:23:15'),(1214,6,'Export','report/daily','','2018-10-06','09:23:26'),(1215,6,'Export','report/daily','','2018-10-06','09:23:26'),(1216,6,'Show','production/production','','2018-10-06','09:25:31'),(1217,6,'Show','principal/principal','','2018-10-06','09:39:57'),(1218,11,'Show','production/production','','2018-10-09','03:28:17'),(1219,11,'Show','production/production','','2018-10-09','03:29:47'),(1220,11,'Show','principal/principal','','2018-10-09','03:29:58'),(1221,11,'Add','principal/principal','7','2018-10-09','03:36:32'),(1222,11,'Show','principal/principal','','2018-10-09','03:36:32'),(1223,11,'Show','obligee/obligee','','2018-10-09','03:36:40'),(1224,11,'Add','obligee/obligee','4','2018-10-09','03:42:45'),(1225,11,'Show','obligee/obligee','','2018-10-09','03:42:45'),(1226,11,'Show','production/production','','2018-10-09','03:42:48'),(1227,11,'Add','production/production','10','2018-10-09','04:29:23'),(1228,11,'Show','production/production','','2018-10-09','04:29:23'),(1229,11,'Add','production/production','11','2018-10-09','04:33:59'),(1230,11,'Show','production/production','','2018-10-09','04:33:59'),(1231,11,'Update','production/production','1','2018-10-09','04:34:28'),(1232,11,'Show','production/production','','2018-10-09','04:34:28'),(1233,11,'Show','report/branch','','2018-10-09','04:35:07'),(1234,11,'Show','report/remainingmoney','','2018-10-09','04:35:12'),(1235,11,'Show','report/remainingmoney','','2018-10-09','04:35:19'),(1236,11,'Show','report/branch','','2018-10-09','04:35:28'),(1237,11,'Export','report/branch','','2018-10-09','04:35:33'),(1238,11,'Export','report/branch','','2018-10-09','04:35:33'),(1239,11,'Show','production/production','','2018-10-09','04:35:43'),(1240,11,'Update','production/production','1','2018-10-09','04:35:52'),(1241,11,'Show','production/production','','2018-10-09','04:35:52'),(1242,11,'Update','production/production','1','2018-10-09','04:36:05'),(1243,11,'Show','production/production','','2018-10-09','04:36:05'),(1244,11,'Show','report/remainingmoney','','2018-10-09','04:36:09'),(1245,8,'Show','production/production','','2018-10-09','04:43:35'),(1246,8,'Show','report/daily','','2018-10-09','04:43:53'),(1247,8,'Show','other/cost','','2018-10-09','04:44:03'),(1248,8,'Show','report/branch','','2018-10-09','04:44:07'),(1249,0,'Show','report/branch','','2018-10-09','05:12:10'),(1250,8,'Show','report/branch','','2018-10-09','05:12:20'),(1251,8,'Show','report/daily','','2018-10-09','05:13:23'),(1252,8,'Show','report/remainingmoney','','2018-10-09','05:13:26'),(1253,0,'Show','report/remainingmoney','','2018-10-09','09:48:22'),(1254,11,'Show','production/production','','2018-10-16','02:00:27'),(1255,11,'Show','report/branch','','2018-10-16','02:00:48'),(1256,11,'Export','report/branch','','2018-10-16','02:00:55'),(1257,11,'Show','production/production','','2018-10-16','02:02:47'),(1258,11,'Update','production/production','1','2018-10-16','02:03:25'),(1259,11,'Show','production/production','','2018-10-16','02:03:25'),(1260,11,'Show','report/remainingmoney','','2018-10-16','02:05:42'),(1261,11,'Show','report/daily','','2018-10-16','02:05:57'),(1262,11,'Show','report/daily','','2018-10-16','02:06:13'),(1263,11,'Show','report/remainingmoney','','2018-10-16','02:06:46'),(1264,11,'Export','report/remainingmoney','','2018-10-16','02:07:57'),(1265,11,'Show','production/production','','2018-10-16','02:10:52'),(1266,11,'Update','production/production','1','2018-10-16','02:11:06'),(1267,11,'Show','production/production','','2018-10-16','02:11:06'),(1268,0,'Show','production/production','','2018-10-16','02:12:04'),(1269,11,'Show','production/production','','2018-10-16','02:16:22'),(1270,11,'Show','report/branch','','2018-10-16','02:17:26'),(1271,11,'Show','production/production','','2018-10-16','02:27:45'),(1272,11,'Show','production/production','','2018-10-16','02:27:54'),(1273,11,'Show','production/production','','2018-10-16','02:30:06'),(1274,11,'Update','production/production','1','2018-10-16','02:30:38'),(1275,11,'Show','production/production','','2018-10-16','02:30:38'),(1276,11,'Show','production/production','','2018-10-16','02:31:04'),(1277,11,'Show','agen/agen','','2018-10-16','02:33:25'),(1278,11,'Show','agen/agen','','2018-10-16','02:33:38'),(1279,11,'Update','agen/agen','1','2018-10-16','02:34:00'),(1280,11,'Show','agen/agen','','2018-10-16','02:34:00'),(1281,11,'Show','production/production','','2018-10-16','02:34:03'),(1282,11,'Show','production/production','','2018-10-16','02:34:08'),(1283,11,'Show','acceptances/acceptances','','2018-10-16','02:34:33'),(1284,11,'Show','acceptances/acceptances','','2018-10-16','02:34:45'),(1285,11,'Show','agen/agen','','2018-10-16','02:34:48'),(1286,11,'Show','agen/agen','','2018-10-16','02:35:03'),(1287,11,'Show','other/rate','','2018-10-16','02:35:11'),(1288,11,'Show','other/rate','','2018-10-16','02:35:43'),(1289,11,'Show','other/rate','','2018-10-16','02:35:45'),(1290,11,'Show','other/rate','','2018-10-16','02:36:01'),(1291,11,'Show','other/rate','','2018-10-16','02:36:35'),(1292,0,'Show','production/production','','2018-10-16','03:32:35'),(1293,11,'Show','production/production','','2018-10-16','03:47:42'),(1294,11,'Show','production/production','','2018-10-16','03:48:20'),(1295,11,'Show','production/production','','2018-10-16','03:48:28'),(1296,11,'Update','production/production','1','2018-10-16','03:49:07'),(1297,11,'Show','production/production','','2018-10-16','03:49:07'),(1298,11,'Show','production/production','','2018-10-20','05:42:31'),(1299,11,'Show','other/insurance','','2018-10-20','05:42:41'),(1300,11,'Show','production/production','','2018-10-20','05:42:50'),(1301,11,'Show','production/production','','2018-10-20','05:42:54'),(1302,11,'Show','principal/principal','','2018-10-20','05:43:03'),(1303,11,'Show','principal/principal','','2018-10-20','05:43:11'),(1304,11,'Update','principal/principal','1','2018-10-20','05:43:33'),(1305,11,'Show','principal/principal','','2018-10-20','05:43:34'),(1306,11,'Show','obligee/obligee','','2018-10-20','05:43:36'),(1307,11,'Update','obligee/obligee','1','2018-10-20','05:44:07'),(1308,11,'Show','obligee/obligee','','2018-10-20','05:44:08'),(1309,11,'Show','production/production','','2018-10-20','05:44:09'),(1310,11,'Show','production/production','','2018-10-20','05:44:11'),(1311,11,'Show','other/insurance','','2018-10-20','05:44:33'),(1312,11,'Show','other/surety','','2018-10-20','05:44:42'),(1313,11,'Show','production/production','','2018-10-20','05:44:46'),(1314,11,'Add','production/production','12','2018-10-20','05:49:58'),(1315,11,'Show','production/production','','2018-10-20','05:49:58'),(1316,11,'Show','production/production','','2018-10-20','05:50:08'),(1317,11,'Show','principal/principal','','2018-10-20','05:50:48'),(1318,11,'Update','principal/principal','1','2018-10-20','05:51:09'),(1319,11,'Show','principal/principal','','2018-10-20','05:51:09'),(1320,11,'Show','obligee/obligee','','2018-10-20','05:51:13'),(1321,11,'Show','production/production','','2018-10-20','05:51:24'),(1322,11,'Add','production/production','13','2018-10-20','05:56:51'),(1323,11,'Show','production/production','','2018-10-20','05:56:51'),(1324,11,'Show','principal/principal','','2018-10-20','05:57:01'),(1325,11,'Show','principal/principal','','2018-10-20','05:57:05'),(1326,11,'Add','principal/principal','8','2018-10-20','05:58:21'),(1327,11,'Show','principal/principal','','2018-10-20','05:58:21'),(1328,11,'Show','obligee/obligee','','2018-10-20','05:58:35'),(1329,11,'Add','obligee/obligee','5','2018-10-20','05:59:23'),(1330,11,'Show','obligee/obligee','','2018-10-20','05:59:23'),(1331,11,'Show','production/production','','2018-10-20','05:59:24'),(1332,11,'Show','agen/agen','','2018-10-20','06:02:08'),(1333,11,'Show','production/production','','2018-10-20','06:02:34'),(1334,11,'Add','production/production','14','2018-10-20','06:06:43'),(1335,11,'Show','production/production','','2018-10-20','06:06:43'),(1336,11,'Show','principal/principal','','2018-10-20','06:06:51'),(1337,11,'Add','principal/principal','9','2018-10-20','06:08:28'),(1338,11,'Show','principal/principal','','2018-10-20','06:08:28'),(1339,11,'Show','obligee/obligee','','2018-10-20','06:08:35'),(1340,11,'Add','obligee/obligee','6','2018-10-20','06:10:10'),(1341,11,'Show','obligee/obligee','','2018-10-20','06:10:10'),(1342,11,'Show','production/production','','2018-10-20','06:10:14'),(1343,11,'Add','production/production','15','2018-10-20','06:13:38'),(1344,11,'Show','production/production','','2018-10-20','06:13:38'),(1345,11,'Show','principal/principal','','2018-10-20','06:13:53'),(1346,11,'Add','principal/principal','10','2018-10-20','06:14:53'),(1347,11,'Show','principal/principal','','2018-10-20','06:14:53'),(1348,11,'Show','obligee/obligee','','2018-10-20','06:14:57'),(1349,11,'Add','obligee/obligee','7','2018-10-20','06:16:43'),(1350,11,'Show','obligee/obligee','','2018-10-20','06:16:43'),(1351,11,'Show','production/production','','2018-10-20','06:24:07'),(1352,11,'Show','production/production','','2018-10-20','06:24:08'),(1353,11,'Show','obligee/obligee','','2018-10-20','06:27:56'),(1354,11,'Show','production/production','','2018-10-20','06:28:07'),(1355,11,'Add','production/production','16','2018-10-20','06:32:50'),(1356,11,'Show','production/production','','2018-10-20','06:32:51'),(1357,11,'Show','production/production','','2018-10-20','06:46:58'),(1358,11,'Show','principal/principal','','2018-10-20','06:47:01'),(1359,11,'Show','principal/principal','','2018-10-20','06:48:42'),(1360,11,'Add','principal/principal','11','2018-10-20','06:50:17'),(1361,11,'Show','principal/principal','','2018-10-20','06:50:17'),(1362,11,'Show','obligee/obligee','','2018-10-20','06:50:21'),(1363,11,'Add','obligee/obligee','8','2018-10-20','06:51:00'),(1364,11,'Show','obligee/obligee','','2018-10-20','06:51:00'),(1365,11,'Show','production/production','','2018-10-20','06:51:02'),(1366,11,'Add','production/production','17','2018-10-20','06:54:49'),(1367,11,'Show','production/production','','2018-10-20','06:54:49'),(1368,11,'Show','production/production','','2018-10-20','06:54:54'),(1369,11,'Show','production/production','','2018-10-20','06:55:57'),(1370,11,'Show','production/production','','2018-10-20','06:56:38'),(1371,11,'Show','principal/principal','','2018-10-20','06:56:50'),(1372,11,'Add','principal/principal','12','2018-10-20','06:58:08'),(1373,11,'Show','principal/principal','','2018-10-20','06:58:08'),(1374,11,'Show','obligee/obligee','','2018-10-20','06:58:13'),(1375,11,'Add','obligee/obligee','9','2018-10-20','07:03:38'),(1376,11,'Show','obligee/obligee','','2018-10-20','07:03:38'),(1377,11,'Show','production/production','','2018-10-20','07:03:40'),(1378,11,'Show','production/production','','2018-10-20','07:03:42'),(1379,11,'Show','production/production','','2018-10-20','07:03:44'),(1380,11,'Add','production/production','18','2018-10-20','07:13:01'),(1381,11,'Show','production/production','','2018-10-20','07:13:01'),(1382,11,'Show','principal/principal','','2018-10-20','07:13:10'),(1383,11,'Add','principal/principal','13','2018-10-20','07:14:20'),(1384,11,'Show','principal/principal','','2018-10-20','07:14:20'),(1385,11,'Show','obligee/obligee','','2018-10-20','07:14:25'),(1386,11,'Add','obligee/obligee','10','2018-10-20','07:15:25'),(1387,11,'Show','obligee/obligee','','2018-10-20','07:15:25'),(1388,11,'Show','production/production','','2018-10-20','07:15:29'),(1389,11,'Add','production/production','19','2018-10-20','07:19:55'),(1390,11,'Show','production/production','','2018-10-20','07:19:55'),(1391,11,'Show','principal/principal','','2018-10-20','07:20:10'),(1392,11,'Show','obligee/obligee','','2018-10-20','07:20:15'),(1393,11,'Show','principal/principal','','2018-10-20','07:20:18'),(1394,11,'Add','principal/principal','14','2018-10-20','07:21:12'),(1395,11,'Show','principal/principal','','2018-10-20','07:21:13'),(1396,11,'Show','obligee/obligee','','2018-10-20','07:21:24'),(1397,11,'Add','obligee/obligee','11','2018-10-20','07:22:11'),(1398,11,'Show','obligee/obligee','','2018-10-20','07:22:11'),(1399,11,'Show','production/production','','2018-10-20','07:22:14'),(1400,11,'Add','production/production','20','2018-10-20','07:25:11'),(1401,11,'Show','production/production','','2018-10-20','07:25:11'),(1402,11,'Show','principal/principal','','2018-10-20','07:25:27'),(1403,11,'Add','principal/principal','15','2018-10-20','07:26:12'),(1404,11,'Show','principal/principal','','2018-10-20','07:26:12'),(1405,11,'Show','obligee/obligee','','2018-10-20','07:26:14'),(1406,11,'Add','obligee/obligee','12','2018-10-20','07:26:49'),(1407,11,'Show','obligee/obligee','','2018-10-20','07:26:49'),(1408,11,'Show','production/production','','2018-10-20','07:26:52'),(1409,11,'Add','production/production','21','2018-10-20','07:30:04'),(1410,11,'Show','production/production','','2018-10-20','07:30:04'),(1411,11,'Show','principal/principal','','2018-10-20','07:30:12'),(1412,11,'Add','principal/principal','16','2018-10-20','07:31:31'),(1413,11,'Show','principal/principal','','2018-10-20','07:31:31'),(1414,11,'Show','obligee/obligee','','2018-10-20','07:31:34'),(1415,11,'Add','obligee/obligee','13','2018-10-20','07:32:29'),(1416,11,'Show','obligee/obligee','','2018-10-20','07:32:29'),(1417,11,'Show','production/production','','2018-10-20','07:32:31'),(1418,11,'Add','production/production','22','2018-10-20','07:36:44'),(1419,11,'Show','production/production','','2018-10-20','07:36:44'),(1420,11,'Show','principal/principal','','2018-10-20','07:36:48'),(1421,11,'Show','principal/principal','','2018-10-20','07:36:55'),(1422,11,'Add','principal/principal','17','2018-10-20','07:37:35'),(1423,11,'Show','principal/principal','','2018-10-20','07:37:35'),(1424,11,'Show','obligee/obligee','','2018-10-20','07:37:38'),(1425,11,'Add','obligee/obligee','14','2018-10-20','08:02:54'),(1426,11,'Show','obligee/obligee','','2018-10-20','08:02:54'),(1427,11,'Show','production/production','','2018-10-20','08:02:55'),(1428,11,'Add','production/production','23','2018-10-20','08:04:56'),(1429,11,'Show','production/production','','2018-10-20','08:04:56'),(1430,11,'Show','production/production','','2018-10-22','01:09:45'),(1431,11,'Show','principal/principal','','2018-10-22','01:10:23'),(1432,11,'Add','principal/principal','18','2018-10-22','01:12:06'),(1433,11,'Show','principal/principal','','2018-10-22','01:12:06'),(1434,11,'Show','production/production','','2018-10-22','01:12:09'),(1435,11,'Show','obligee/obligee','','2018-10-22','01:12:11'),(1436,11,'Add','obligee/obligee','15','2018-10-22','01:13:14'),(1437,11,'Show','obligee/obligee','','2018-10-22','01:13:14'),(1438,11,'Show','production/production','','2018-10-22','01:13:16'),(1439,11,'Add','production/production','24','2018-10-22','01:17:36'),(1440,11,'Show','production/production','','2018-10-22','01:17:37'),(1441,11,'Show','principal/principal','','2018-10-22','01:17:50'),(1442,11,'Add','principal/principal','19','2018-10-22','01:19:08'),(1443,11,'Show','principal/principal','','2018-10-22','01:19:08'),(1444,11,'Show','obligee/obligee','','2018-10-22','01:19:12'),(1445,11,'Add','obligee/obligee','16','2018-10-22','01:20:10'),(1446,11,'Show','obligee/obligee','','2018-10-22','01:20:13'),(1447,11,'Show','production/production','','2018-10-22','01:20:15'),(1448,11,'Add','production/production','25','2018-10-22','01:24:31'),(1449,11,'Show','production/production','','2018-10-22','01:24:32'),(1450,11,'Show','principal/principal','','2018-10-22','01:24:39'),(1451,11,'Add','principal/principal','20','2018-10-22','01:25:59'),(1452,11,'Show','principal/principal','','2018-10-22','01:25:59'),(1453,11,'Show','production/production','','2018-10-22','01:26:00'),(1454,11,'Show','obligee/obligee','','2018-10-22','01:26:03'),(1455,11,'Add','obligee/obligee','17','2018-10-22','01:27:55'),(1456,11,'Show','obligee/obligee','','2018-10-22','01:27:55'),(1457,11,'Show','production/production','','2018-10-22','01:27:56'),(1458,11,'Add','production/production','26','2018-10-22','01:33:13'),(1459,11,'Show','production/production','','2018-10-22','01:33:13'),(1460,11,'Show','principal/principal','','2018-10-22','01:33:20'),(1461,11,'Add','principal/principal','21','2018-10-22','01:35:39'),(1462,11,'Show','principal/principal','','2018-10-22','01:35:39'),(1463,11,'Show','obligee/obligee','','2018-10-22','01:35:43'),(1464,11,'Add','obligee/obligee','18','2018-10-22','01:36:19'),(1465,11,'Show','obligee/obligee','','2018-10-22','01:36:19'),(1466,11,'Show','production/production','','2018-10-22','01:36:22'),(1467,11,'Add','production/production','27','2018-10-22','01:38:55'),(1468,11,'Show','production/production','','2018-10-22','01:38:55'),(1469,11,'Show','production/production','','2018-10-22','01:39:29'),(1470,11,'Show','production/production','','2018-10-22','01:41:02'),(1471,11,'Show','production/production','','2018-10-22','01:42:16'),(1472,11,'Show','production/production','','2018-10-22','01:58:15'),(1473,8,'Show','production/production','','2018-10-22','02:37:22'),(1474,8,'Show','other/surety','','2018-10-22','02:37:27'),(1475,8,'Show','production/production','','2018-10-22','02:40:19'),(1476,8,'Show','production/production','','2018-10-22','02:40:34'),(1477,8,'Show','productionreport/productionreport','','2018-10-22','02:41:28'),(1478,8,'Show','other/insurance','','2018-10-22','02:41:51'),(1479,8,'Show','production/production','','2018-10-22','02:47:08'),(1480,8,'Show','production/production','','2018-10-22','02:48:06'),(1481,8,'Show','other/insurance','','2018-10-22','02:48:18'),(1482,8,'Show','principal/principal','','2018-10-22','02:50:40'),(1483,11,'Show','other/insurance','','2018-10-22','02:54:10'),(1484,11,'Show','other/insurance','','2018-10-22','02:54:17'),(1485,8,'Show','production/production','','2018-10-22','02:56:27'),(1486,8,'Show','productionreport/productionreport','','2018-10-22','03:06:57'),(1487,8,'Show','acceptances/acceptances','','2018-10-22','03:06:59'),(1488,8,'Update','acceptances/acceptances','1','2018-10-22','03:07:29'),(1489,8,'Show','acceptances/acceptances','','2018-10-22','03:07:29'),(1490,8,'Update','acceptances/acceptances','1','2018-10-22','03:07:37'),(1491,8,'Show','acceptances/acceptances','','2018-10-22','03:07:37'),(1492,8,'Update','acceptances/acceptances','1','2018-10-22','03:07:48'),(1493,8,'Show','acceptances/acceptances','','2018-10-22','03:07:48'),(1494,8,'Show','production/production','','2018-10-22','03:07:54'),(1495,8,'Show','principal/principal','','2018-10-22','03:09:15'),(1496,8,'Show','principal/principal','','2018-10-22','03:11:43'),(1497,8,'Update','principal/principal','1','2018-10-22','03:11:55'),(1498,8,'Show','principal/principal','','2018-10-22','03:11:56'),(1499,8,'Show','production/production','','2018-10-22','03:11:57'),(1500,8,'Show','productionreport/productionreport','','2018-10-22','03:12:22'),(1501,8,'Show','production/production','','2018-10-22','03:15:17'),(1502,11,'Update','other/insurance','1','2018-10-22','03:27:40'),(1503,11,'Show','other/insurance','','2018-10-22','03:27:41'),(1504,11,'Show','production/production','','2018-10-22','03:27:44'),(1505,11,'Show','principal/principal','','2018-10-22','03:28:33'),(1506,11,'Update','principal/principal','1','2018-10-22','03:28:49'),(1507,11,'Show','principal/principal','','2018-10-22','03:28:49'),(1508,11,'Show','production/production','','2018-10-22','03:28:51'),(1509,11,'Show','other/insurance','','2018-10-22','03:29:12'),(1510,8,'Show','production/production','','2018-10-22','03:40:04'),(1511,8,'Show','productionreport/productionreport','','2018-10-22','03:40:10'),(1512,11,'Show','other/insurance','','2018-10-22','03:40:41'),(1513,11,'Show','other/insurance','','2018-10-22','03:40:48'),(1514,11,'Show','production/production','','2018-10-22','03:40:54'),(1515,11,'Show','other/insurance','','2018-10-22','03:41:11'),(1516,11,'Update','other/insurance','1','2018-10-22','03:41:49'),(1517,11,'Show','other/insurance','','2018-10-22','03:41:49'),(1518,11,'Show','production/production','','2018-10-22','03:41:51'),(1519,11,'Show','production/production','','2018-10-22','03:42:11'),(1520,11,'Show','other/insurance','','2018-10-22','03:42:16'),(1521,8,'Show','acceptances/acceptances','','2018-10-22','03:46:00'),(1522,8,'Show','other/insurance','','2018-10-22','03:46:07'),(1523,8,'Show','production/production','','2018-10-22','03:46:30'),(1524,8,'Show','productionreport/productionreport','','2018-10-22','03:47:28'),(1525,8,'Update','productionreport/productionreport','1','2018-10-22','03:47:42'),(1526,8,'Show','productionreport/productionreport','','2018-10-22','03:47:43'),(1527,0,'Update','other/insurance','1','2018-10-22','04:11:51'),(1528,0,'Show','other/insurance','','2018-10-22','04:11:51'),(1529,0,'Show','other/insurance','','2018-10-22','04:12:04'),(1530,0,'Show','production/production','','2018-10-22','04:12:08'),(1531,11,'Show','other/insurance','','2018-10-22','04:12:44'),(1532,11,'Show','production/production','','2018-10-22','04:12:57'),(1533,11,'Show','acceptances/acceptances','','2018-10-22','04:13:21'),(1534,11,'Show','other/insurance','','2018-10-22','04:13:26'),(1535,11,'Show','production/production','','2018-10-22','04:14:22'),(1536,11,'Show','other/insurance','','2018-10-22','04:15:06'),(1537,11,'Update','other/insurance','1','2018-10-22','04:17:18'),(1538,11,'Show','other/insurance','','2018-10-22','04:17:18'),(1539,0,'Show','other/insurance','','2018-10-22','06:01:52'),(1540,11,'Show','production/production','','2018-10-22','06:02:55'),(1541,11,'Show','production/production','','2018-10-22','06:03:23'),(1542,11,'Show','other/insurance','','2018-10-22','06:03:28'),(1543,11,'Update','other/insurance','1','2018-10-22','06:04:28'),(1544,11,'Show','other/insurance','','2018-10-22','06:04:28'),(1545,11,'Show','principal/principal','','2018-10-22','06:04:30'),(1546,11,'Show','production/production','','2018-10-22','06:04:45'),(1547,11,'Show','production/production','','2018-10-22','06:05:02'),(1548,11,'Show','principal/principal','','2018-10-22','06:09:12'),(1549,11,'Show','production/production','','2018-10-22','06:09:26'),(1550,11,'Show','principal/principal','','2018-10-22','06:09:45'),(1551,11,'Update','principal/principal','1','2018-10-22','06:09:55'),(1552,11,'Show','principal/principal','','2018-10-22','06:09:55'),(1553,11,'Update','principal/principal','1','2018-10-22','06:10:06'),(1554,11,'Show','principal/principal','','2018-10-22','06:10:06'),(1555,11,'Update','principal/principal','1','2018-10-22','06:10:18'),(1556,11,'Show','principal/principal','','2018-10-22','06:10:18'),(1557,11,'Update','principal/principal','1','2018-10-22','06:10:28'),(1558,11,'Show','principal/principal','','2018-10-22','06:10:28'),(1559,11,'Update','principal/principal','1','2018-10-22','06:10:37'),(1560,11,'Show','principal/principal','','2018-10-22','06:10:37'),(1561,11,'Update','principal/principal','1','2018-10-22','06:10:50'),(1562,11,'Show','principal/principal','','2018-10-22','06:10:50'),(1563,11,'Update','principal/principal','1','2018-10-22','06:10:59'),(1564,11,'Show','principal/principal','','2018-10-22','06:11:00'),(1565,11,'Show','principal/principal','','2018-10-22','06:11:10'),(1566,11,'Update','principal/principal','1','2018-10-22','06:11:25'),(1567,11,'Show','principal/principal','','2018-10-22','06:11:25'),(1568,11,'Show','principal/principal','','2018-10-22','06:14:45'),(1569,11,'Show','principal/principal','','2018-10-22','06:14:51'),(1570,11,'Update','principal/principal','1','2018-10-22','06:15:05'),(1571,11,'Show','principal/principal','','2018-10-22','06:15:05'),(1572,11,'Update','principal/principal','1','2018-10-22','06:15:18'),(1573,11,'Show','principal/principal','','2018-10-22','06:15:19'),(1574,11,'Update','principal/principal','1','2018-10-22','06:15:30'),(1575,11,'Show','principal/principal','','2018-10-22','06:15:30'),(1576,11,'Show','principal/principal','','2018-10-22','06:15:38'),(1577,11,'Update','principal/principal','1','2018-10-22','06:15:53'),(1578,11,'Show','principal/principal','','2018-10-22','06:15:53'),(1579,11,'Update','principal/principal','1','2018-10-22','06:16:07'),(1580,11,'Show','principal/principal','','2018-10-22','06:16:07'),(1581,11,'Update','principal/principal','1','2018-10-22','06:16:19'),(1582,11,'Show','principal/principal','','2018-10-22','06:16:19'),(1583,11,'Show','production/production','','2018-10-22','06:16:26'),(1584,11,'Show','production/production','','2018-10-22','06:17:30'),(1585,11,'Show','production/production','','2018-10-22','06:18:25'),(1586,11,'Show','other/insurance','','2018-10-22','06:19:04'),(1587,11,'Show','obligee/obligee','','2018-10-22','06:20:29'),(1588,11,'Show','other/insurance','','2018-10-22','06:22:43'),(1589,11,'Show','production/production','','2018-10-22','06:23:11'),(1590,11,'Show','other/insurance','','2018-10-22','06:23:44'),(1591,8,'Show','other/insurance','','2018-10-22','06:30:35'),(1592,8,'Show','production/production','','2018-10-22','06:30:55'),(1593,8,'Show','production/production','','2018-10-22','06:31:49'),(1594,11,'Show','production/production','','2018-10-22','06:35:10'),(1595,11,'Show','production/production','','2018-10-22','06:36:37'),(1596,11,'Show','principal/principal','','2018-10-22','06:37:05'),(1597,11,'Show','production/production','','2018-10-22','06:37:30'),(1598,11,'Show','other/insurance','','2018-10-22','06:37:35'),(1599,11,'Show','principal/principal','','2018-10-22','06:37:39'),(1600,11,'Update','principal/principal','1','2018-10-22','06:37:54'),(1601,11,'Show','principal/principal','','2018-10-22','06:37:54'),(1602,11,'Show','production/production','','2018-10-22','06:37:56'),(1603,11,'Show','principal/principal','','2018-10-22','06:38:20'),(1604,11,'Update','principal/principal','1','2018-10-22','06:38:44'),(1605,11,'Show','principal/principal','','2018-10-22','06:38:44'),(1606,11,'Show','production/production','','2018-10-22','06:38:47'),(1607,11,'Show','principal/principal','','2018-10-22','06:39:26'),(1608,11,'Update','principal/principal','1','2018-10-22','06:39:44'),(1609,11,'Show','principal/principal','','2018-10-22','06:39:44'),(1610,11,'Update','principal/principal','1','2018-10-22','06:40:08'),(1611,11,'Show','principal/principal','','2018-10-22','06:40:08'),(1612,11,'Show','principal/principal','','2018-10-22','06:40:18'),(1613,11,'Update','principal/principal','1','2018-10-22','06:40:32'),(1614,11,'Show','principal/principal','','2018-10-22','06:40:32'),(1615,11,'Show','production/production','','2018-10-22','06:40:34'),(1616,11,'Show','principal/principal','','2018-10-22','06:41:21'),(1617,11,'Update','principal/principal','1','2018-10-22','06:41:39'),(1618,11,'Show','principal/principal','','2018-10-22','06:41:39'),(1619,11,'Update','principal/principal','1','2018-10-22','06:41:53'),(1620,11,'Show','principal/principal','','2018-10-22','06:41:53'),(1621,11,'Update','principal/principal','1','2018-10-22','06:42:12'),(1622,11,'Show','principal/principal','','2018-10-22','06:42:12'),(1623,11,'Update','principal/principal','1','2018-10-22','06:42:28'),(1624,11,'Show','principal/principal','','2018-10-22','06:42:28'),(1625,11,'Update','principal/principal','1','2018-10-22','06:42:45'),(1626,11,'Show','principal/principal','','2018-10-22','06:42:45'),(1627,11,'Update','principal/principal','1','2018-10-22','06:42:58'),(1628,11,'Show','principal/principal','','2018-10-22','06:42:58'),(1629,11,'Update','principal/principal','1','2018-10-22','06:43:13'),(1630,11,'Show','principal/principal','','2018-10-22','06:43:13'),(1631,11,'Update','principal/principal','1','2018-10-22','06:43:32'),(1632,11,'Show','principal/principal','','2018-10-22','06:43:32'),(1633,11,'Update','principal/principal','1','2018-10-22','06:43:46'),(1634,11,'Show','principal/principal','','2018-10-22','06:43:46'),(1635,11,'Update','principal/principal','1','2018-10-22','06:43:59'),(1636,11,'Show','principal/principal','','2018-10-22','06:43:59'),(1637,11,'Show','principal/principal','','2018-10-22','06:44:07'),(1638,11,'Show','principal/principal','','2018-10-22','06:44:15'),(1639,11,'Update','principal/principal','1','2018-10-22','06:44:24'),(1640,11,'Show','principal/principal','','2018-10-22','06:44:24'),(1641,11,'Show','production/production','','2018-10-22','06:47:45'),(1642,11,'Show','production/production','','2018-10-22','06:53:40'),(1643,11,'Show','production/production','','2018-10-22','06:56:52'),(1644,11,'Show','acceptances/acceptances','','2018-10-22','06:57:09'),(1645,11,'Show','production/production','','2018-10-22','06:57:15'),(1646,11,'Show','other/surety','','2018-10-22','06:57:30'),(1647,11,'Update','other/surety','1','2018-10-22','06:57:49'),(1648,11,'Show','other/surety','','2018-10-22','06:57:49'),(1649,11,'Show','production/production','','2018-10-22','06:57:52'),(1650,11,'Show','production/production','','2018-10-30','01:44:33'),(1651,11,'Show','production/production','','2018-10-30','02:08:03'),(1652,11,'Show','production/production','','2018-10-30','02:08:49'),(1653,11,'Show','production/production','','2018-10-30','02:08:58'),(1654,11,'Show','production/production','','2018-10-30','02:10:13'),(1655,11,'Show','other/rate','','2018-10-30','02:10:20'),(1656,11,'Show','other/insurance','','2018-10-30','02:10:25'),(1657,0,'Show','productionreport/productionreport','','2018-10-30','05:33:14'),(1658,11,'Show','production/production','','2018-11-06','01:21:06'),(1659,11,'Show','production/production','','2018-11-06','01:33:03'),(1660,11,'Show','production/production','','2018-11-06','01:33:33'),(1661,11,'Show','production/production','','2018-11-06','01:34:53'),(1662,11,'Show','production/production','','2018-11-06','01:35:28'),(1663,11,'Show','production/production','','2018-11-06','01:37:33'),(1664,11,'Show','acceptances/acceptances','','2018-11-06','01:38:24'),(1665,11,'Update','acceptances/acceptances','1','2018-11-06','01:38:53'),(1666,11,'Show','acceptances/acceptances','','2018-11-06','01:38:56'),(1667,11,'Show','production/production','','2018-11-06','01:39:13'),(1668,11,'Show','production/production','','2018-11-06','01:41:54'),(1669,11,'Show','production/production','','2018-11-06','01:54:23'),(1670,11,'Show','production/production','','2018-11-06','01:54:57'),(1671,11,'Show','acceptances/acceptances','','2018-11-06','02:15:49'),(1672,11,'Show','acceptances/acceptances','','2018-11-06','02:18:06'),(1673,11,'Show','acceptances/acceptances','','2018-11-06','02:18:07'),(1674,11,'Show','acceptances/acceptances','','2018-11-06','02:18:07'),(1675,11,'Show','acceptances/acceptances','','2018-11-06','02:20:51'),(1676,11,'Show','production/production','','2018-11-06','02:20:56'),(1677,11,'Show','production/production','','2018-11-06','02:20:56'),(1678,11,'Show','production/production','','2018-11-06','02:24:15'),(1679,11,'Show','production/production','','2018-11-06','02:24:15'),(1680,11,'Show','production/production','','2018-11-06','02:25:30'),(1681,11,'Show','production/production','','2018-11-06','02:26:52'),(1682,11,'Show','production/production','','2018-11-06','02:26:53'),(1683,11,'Show','production/production','','2018-11-06','02:28:24'),(1684,11,'Show','production/production','','2018-11-06','02:28:35'),(1685,11,'Show','production/production','','2018-11-06','02:28:35'),(1686,11,'Show','production/production','','2018-11-06','02:28:39'),(1687,11,'Show','production/production','','2018-11-06','02:28:44'),(1688,11,'Show','production/production','','2018-11-06','02:29:18'),(1689,11,'Show','production/production','','2018-11-06','02:29:33'),(1690,11,'Show','production/production','','2018-11-06','02:29:36'),(1691,11,'Show','production/production','','2018-11-06','02:30:00'),(1692,11,'Update','production/production','1','2018-11-06','02:31:18'),(1693,11,'Show','production/production','','2018-11-06','02:31:18'),(1694,11,'Show','report/branch','','2018-11-06','02:31:27'),(1695,11,'Show','production/production','','2018-11-06','02:32:19'),(1696,11,'Show','production/production','','2018-11-06','02:33:07'),(1697,11,'Show','report/branch','','2018-11-06','02:33:55'),(1698,11,'Show','other/rateinsurance','','2018-11-06','02:35:16'),(1699,11,'Show','other/rate','','2018-11-06','02:35:20'),(1700,11,'Show','other/rateinsurance','','2018-11-06','02:35:33'),(1701,11,'Show','other/rate','','2018-11-06','02:36:11'),(1702,11,'Show','production/production','','2018-11-06','02:51:14'),(1703,11,'Show','production/production','','2018-11-06','02:51:17'),(1704,11,'Show','acceptances/acceptances','','2018-11-06','02:55:34'),(1705,11,'Update','acceptances/acceptances','1','2018-11-06','03:09:08'),(1706,11,'Show','acceptances/acceptances','','2018-11-06','03:09:08'),(1707,11,'Show','production/production','','2018-11-06','03:09:17'),(1708,11,'Show','production/production','','2018-11-06','03:09:17'),(1709,11,'Show','production/production','','2018-11-06','03:09:25'),(1710,11,'Show','acceptances/acceptances','','2018-11-06','03:10:10'),(1711,11,'Show','acceptances/acceptances','','2018-11-06','03:10:42'),(1712,11,'Update','acceptances/acceptances','1','2018-11-06','03:11:27'),(1713,11,'Show','acceptances/acceptances','','2018-11-06','03:11:27'),(1714,11,'Show','acceptances/acceptances','','2018-11-06','03:11:28'),(1715,11,'Show','acceptances/acceptances','','2018-11-06','03:11:28'),(1716,11,'Show','production/production','','2018-11-06','03:11:29'),(1717,11,'Show','production/production','','2018-11-06','03:11:33'),(1718,8,'Show','productionreport/productionreport','','2018-11-13','06:05:41'),(1719,8,'Show','productionreport/productionreport','','2018-11-13','06:06:07'),(1720,8,'Show','productionreport/productionreport','','2018-11-13','06:06:11'),(1721,8,'Remove','productionreport/productionreport','1','2018-11-13','06:06:44'),(1722,8,'Show','productionreport/productionreport','','2018-11-13','06:06:44'),(1723,8,'Remove','productionreport/productionreport','2','2018-11-13','06:06:50'),(1724,8,'Show','productionreport/productionreport','','2018-11-13','06:06:50'),(1725,8,'Remove','productionreport/productionreport','3','2018-11-13','06:06:57'),(1726,8,'Show','productionreport/productionreport','','2018-11-13','06:06:57'),(1727,8,'Remove','productionreport/productionreport','4','2018-11-13','06:07:01'),(1728,8,'Show','productionreport/productionreport','','2018-11-13','06:07:01'),(1729,8,'Update','productionreport/productionreport','1','2018-11-13','06:07:18'),(1730,8,'Show','productionreport/productionreport','','2018-11-13','06:07:18'),(1731,8,'Update','productionreport/productionreport','1','2018-11-13','06:07:27'),(1732,8,'Show','productionreport/productionreport','','2018-11-13','06:07:28'),(1733,8,'Update','productionreport/productionreport','1','2018-11-13','06:08:01'),(1734,8,'Show','productionreport/productionreport','','2018-11-13','06:08:01'),(1735,8,'Update','productionreport/productionreport','1','2018-11-13','06:08:26'),(1736,8,'Show','productionreport/productionreport','','2018-11-13','06:08:26'),(1737,8,'Update','productionreport/productionreport','1','2018-11-13','06:08:35'),(1738,8,'Show','productionreport/productionreport','','2018-11-13','06:08:35'),(1739,8,'Update','productionreport/productionreport','1','2018-11-13','06:08:45'),(1740,8,'Show','productionreport/productionreport','','2018-11-13','06:08:45'),(1741,8,'Show','productionreport/productionreport','','2018-11-13','06:08:54'),(1742,8,'Update','productionreport/productionreport','1','2018-11-13','06:09:11'),(1743,8,'Show','productionreport/productionreport','','2018-11-13','06:09:11'),(1744,8,'Update','productionreport/productionreport','1','2018-11-13','06:09:18'),(1745,8,'Show','productionreport/productionreport','','2018-11-13','06:09:19'),(1746,8,'Update','productionreport/productionreport','1','2018-11-13','06:09:29'),(1747,8,'Show','productionreport/productionreport','','2018-11-13','06:09:29'),(1748,8,'Update','productionreport/productionreport','1','2018-11-13','06:09:37'),(1749,8,'Show','productionreport/productionreport','','2018-11-13','06:09:37'),(1750,8,'Update','productionreport/productionreport','1','2018-11-13','06:09:45'),(1751,8,'Show','productionreport/productionreport','','2018-11-13','06:09:45'),(1752,8,'Show','productionreport/productionreport','','2018-11-13','06:11:56'),(1753,8,'Show','productionreport/productionreport','','2018-11-13','06:12:08'),(1754,8,'Add','productionreport/productionreport','15','2018-11-13','06:13:55'),(1755,8,'Show','productionreport/productionreport','','2018-11-13','06:13:55'),(1756,8,'Show','productionreport/productionreport','','2018-11-13','06:14:07'),(1757,8,'Update','productionreport/productionreport','1','2018-11-13','06:14:40'),(1758,8,'Show','productionreport/productionreport','','2018-11-13','06:14:40'),(1759,8,'Show','productionreport/productionreport','','2018-11-13','06:15:10'),(1760,8,'Add','productionreport/productionreport','16','2018-11-13','06:15:35'),(1761,8,'Show','productionreport/productionreport','','2018-11-13','06:15:35'),(1762,8,'Show','productionreport/productionreport','','2018-11-13','06:16:04'),(1763,8,'Add','productionreport/productionreport','17','2018-11-13','06:16:37'),(1764,8,'Show','productionreport/productionreport','','2018-11-13','06:16:37'),(1765,8,'Show','productionreport/productionreport','','2018-11-13','06:17:16'),(1766,8,'Add','productionreport/productionreport','18','2018-11-13','06:17:45'),(1767,8,'Show','productionreport/productionreport','','2018-11-13','06:17:45'),(1768,8,'Show','productionreport/productionreport','','2018-11-13','06:18:08'),(1769,8,'Add','productionreport/productionreport','19','2018-11-13','06:18:28'),(1770,8,'Show','productionreport/productionreport','','2018-11-13','06:18:28'),(1771,8,'Add','productionreport/productionreport','20','2018-11-13','06:19:25'),(1772,8,'Show','productionreport/productionreport','','2018-11-13','06:19:25'),(1773,8,'Show','productionreport/productionreport','','2018-11-13','06:19:32'),(1774,8,'Add','productionreport/productionreport','21','2018-11-13','06:20:16'),(1775,8,'Show','productionreport/productionreport','','2018-11-13','06:20:16'),(1776,8,'Show','productionreport/productionreport','','2018-11-13','06:20:18'),(1777,8,'Add','productionreport/productionreport','22','2018-11-13','06:21:17'),(1778,8,'Show','productionreport/productionreport','','2018-11-13','06:21:18'),(1779,8,'Show','productionreport/productionreport','','2018-11-13','06:21:20'),(1780,8,'Add','productionreport/productionreport','23','2018-11-13','06:22:07'),(1781,8,'Show','productionreport/productionreport','','2018-11-13','06:22:08'),(1782,8,'Show','acceptances/acceptances','','2018-11-13','06:22:18'),(1783,8,'Show','acceptances/acceptances','','2018-11-13','06:22:21'),(1784,8,'Show','acceptances/acceptances','','2018-11-13','06:22:47'),(1785,8,'Show','productionreport/productionreport','','2018-11-13','06:25:25'),(1786,8,'Show','acceptances/acceptances','','2018-11-13','06:25:27'),(1787,8,'Update','acceptances/acceptances','1','2018-11-13','06:26:20'),(1788,8,'Show','acceptances/acceptances','','2018-11-13','06:26:20'),(1789,8,'Update','acceptances/acceptances','1','2018-11-13','06:26:52'),(1790,8,'Show','acceptances/acceptances','','2018-11-13','06:26:52'),(1791,11,'Show','principal/principal','','2018-11-19','02:40:38'),(1792,11,'Show','principal/principal','','2018-11-19','02:40:51'),(1793,11,'Show','production/production','','2018-11-19','02:41:06'),(1794,11,'Show','production/production','','2018-11-19','02:41:16'),(1795,11,'Show','production/production','','2018-11-19','02:41:28'),(1796,11,'Show','production/production','','2018-11-19','02:41:50'),(1797,11,'Show','productionreport/productionreport','','2018-11-19','02:41:58'),(1798,8,'Show','productionreport/productionreport','','2018-11-19','02:43:44'),(1799,8,'Show','productionreport/productionreport','','2018-11-19','02:44:44'),(1800,8,'Show','other/insurance','','2018-11-19','02:45:09'),(1801,8,'Show','other/insurance','','2018-11-19','02:45:10'),(1802,11,'Update','productionreport/productionreport','1','2018-11-19','02:45:16'),(1803,11,'Show','productionreport/productionreport','','2018-11-19','02:45:16'),(1804,8,'Show','other/insurance','','2018-11-19','02:45:21'),(1805,0,'Show','other/insurance','','2018-11-19','02:45:35'),(1806,8,'Show','other/insurance','','2018-11-19','02:45:54'),(1807,8,'Show','other/insurance','','2018-11-19','02:45:54'),(1808,8,'Show','other/insurance','','2018-11-19','02:46:09'),(1809,8,'Show','production/production','','2018-11-19','02:46:40'),(1810,11,'Show','production/production','','2018-11-19','02:47:36'),(1811,11,'Show','production/production','','2018-11-19','03:24:29'),(1812,11,'Show','production/production','','2018-11-22','06:56:04'),(1813,11,'Show','production/production','','2018-11-26','02:59:22'),(1814,6,'Show','productionreport/productionreport','','2018-12-07','16:32:57'),(1815,6,'Show','setting/menu','','2018-12-07','16:33:16'),(1816,6,'Show','setting/grup_akses','','2018-12-07','16:33:25'),(1817,6,'Show','productionreport/productionreport','','2018-12-07','16:48:06'),(1818,6,'Show','agen/agen','','2018-12-07','16:48:44'),(1819,6,'Show','other/cost','','2018-12-07','16:49:14'),(1820,6,'Show','setting/grup_user','','2018-12-07','16:49:51'),(1821,6,'Show','setting/menu','','2018-12-07','16:50:06'),(1822,6,'Show','setting/grup_akses','','2018-12-07','16:50:28'),(1823,11,'Show','production/production','','2018-12-08','05:21:30'),(1824,11,'Show','production/production','','2018-12-08','05:39:40'),(1825,11,'Show','production/production','','2018-12-08','05:40:08'),(1826,11,'Show','production/production','','2018-12-08','05:44:46'),(1827,11,'Show','production/production','','2018-12-08','05:45:27'),(1828,11,'Show','production/production','','2018-12-08','05:46:11'),(1829,11,'Add','production/production','28','2018-12-08','05:50:33'),(1830,11,'Show','production/production','','2018-12-08','05:50:33'),(1831,11,'Show','agen/agen','','2018-12-08','05:56:58'),(1832,11,'Update','agen/agen','1','2018-12-08','05:58:02'),(1833,11,'Show','agen/agen','','2018-12-08','05:58:02'),(1834,11,'Show','production/production','','2018-12-08','05:58:06'),(1835,11,'Show','production/production','','2018-12-08','05:58:42'),(1836,11,'Update','production/production','1','2018-12-08','06:00:01'),(1837,11,'Show','production/production','','2018-12-08','06:00:01'),(1838,11,'Show','production/production','','2018-12-08','06:00:42'),(1839,11,'Update','production/production','1','2018-12-08','06:01:40'),(1840,11,'Show','production/production','','2018-12-08','06:01:40'),(1841,11,'Show','agen/agen','','2018-12-08','06:04:43'),(1842,11,'Show','agen/agen','','2018-12-08','06:04:56'),(1843,11,'Show','agen/agen','','2018-12-08','06:05:04'),(1844,11,'Show','agen/agen','','2018-12-08','06:05:24'),(1845,11,'Show','agen/agen','','2018-12-08','06:05:37'),(1846,11,'Show','agen/agen','','2018-12-08','06:05:55'),(1847,11,'Show','acceptances/acceptances','','2018-12-08','06:05:58'),(1848,11,'Show','production/production','','2018-12-08','06:06:02'),(1849,11,'Show','production/production','','2018-12-08','06:06:04'),(1850,11,'Show','production/production','','2018-12-08','06:06:11'),(1851,11,'Show','production/production','','2018-12-08','06:07:30'),(1852,11,'Show','production/production','','2018-12-08','06:08:14'),(1853,11,'Show','productionreport/productionreport','','2018-12-08','06:09:16'),(1854,11,'Show','productionreport/productionreport','','2018-12-08','06:09:42'),(1855,11,'Show','productionreport/productionreport','','2018-12-08','06:09:42'),(1856,11,'Add','productionreport/productionreport','24','2018-12-08','06:11:13'),(1857,11,'Show','productionreport/productionreport','','2018-12-08','06:11:13'),(1858,11,'Show','production/production','','2018-12-08','06:11:26'),(1859,11,'Show','production/production','','2018-12-08','06:12:11'),(1860,11,'Show','agen/agen','','2018-12-08','06:15:03'),(1861,11,'Show','agen/agen','','2018-12-08','06:16:12'),(1862,11,'Show','production/production','','2018-12-08','06:16:15'),(1863,11,'Show','productionreport/productionreport','','2018-12-08','06:25:50'),(1864,11,'Update','productionreport/productionreport','1','2018-12-08','06:28:08'),(1865,11,'Show','productionreport/productionreport','','2018-12-08','06:28:08'),(1866,11,'Show','production/production','','2018-12-08','06:28:10'),(1867,11,'Show','production/production','','2018-12-08','06:30:31'),(1868,11,'Update','productionreport/productionreport','1','2018-12-08','06:33:24'),(1869,11,'Show','productionreport/productionreport','','2018-12-08','06:33:24'),(1870,11,'Update','productionreport/productionreport','1','2018-12-08','06:34:32'),(1871,11,'Show','productionreport/productionreport','','2018-12-08','06:34:32'),(1872,11,'Update','productionreport/productionreport','1','2018-12-08','06:35:35'),(1873,11,'Show','productionreport/productionreport','','2018-12-08','06:35:36'),(1874,11,'Update','productionreport/productionreport','1','2018-12-08','06:41:08'),(1875,11,'Show','productionreport/productionreport','','2018-12-08','06:41:08'),(1876,8,'Show','production/production','','2018-12-12','07:15:17'),(1877,8,'Show','production/production','','2018-12-12','09:16:35'),(1878,8,'Show','production/production','','2018-12-12','09:43:59'),(1879,11,'Show','production/production','','2018-12-15','05:17:13'),(1880,11,'Show','production/production','','2018-12-15','05:21:08'),(1881,11,'Show','other/cost','','2018-12-15','05:21:13'),(1882,11,'Show','report/branch','','2018-12-15','05:22:02'),(1883,11,'Show','production/production','','2018-12-15','05:29:53'),(1884,11,'Update','production/production','1','2018-12-15','05:30:15'),(1885,11,'Show','production/production','','2018-12-15','05:30:15'),(1886,11,'Update','production/production','1','2018-12-15','05:30:46'),(1887,11,'Show','production/production','','2018-12-15','05:30:46'),(1888,8,'Show','production/production','','2018-12-15','06:20:33'),(1889,8,'Show','production/production','','2018-12-15','11:34:52'),(1890,8,'Show','other/rateinsurance','','2018-12-15','11:35:03'),(1891,8,'Show','other/insurance','','2018-12-15','11:35:30'),(1892,8,'Show','other/rate','','2018-12-15','11:36:20'),(1893,8,'Show','other/rate','','2018-12-15','11:36:33'),(1894,8,'Show','other/rateinsurance','','2018-12-15','11:38:06'),(1895,8,'Show','other/insurance','','2018-12-15','11:38:57'),(1896,8,'Add','other/insurance','7','2018-12-15','11:39:31'),(1897,8,'Show','other/insurance','','2018-12-15','11:39:31'),(1898,8,'Show','other/rateinsurance','','2018-12-15','11:39:41'),(1899,8,'Show','other/rate','','2018-12-16','02:53:34'),(1900,8,'Show','other/rate','','2018-12-16','02:53:44');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_map_user_merchant`
--

DROP TABLE IF EXISTS `sys_map_user_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_map_user_merchant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_user_id` int(6) unsigned NOT NULL,
  `merchant_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_id` (`sys_user_id`),
  CONSTRAINT `sys_map_user_merchant_sys_user_id_fk` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_map_user_merchant`
--

LOCK TABLES `sys_map_user_merchant` WRITE;
/*!40000 ALTER TABLE `sys_map_user_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_map_user_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_induk` int(6) unsigned NOT NULL DEFAULT 0,
  `menu` varchar(128) NOT NULL,
  `uri` varchar(256) DEFAULT NULL,
  `urutan` int(6) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `icon` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_induk` (`id_induk`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (2,0,'Dashboard','dashboard',0,1,'desktop'),(3,0,'Setting','setting',11,1,'cogs'),(9,78,'Principal','principal/principal',2,1,'university'),(14,0,'Log User','log/auditrail',12,1,'edit'),(40,3,'Menu','setting/menu',1,1,'book'),(43,3,'Grup User','setting/grup_user',1,1,'users'),(44,3,'User','setting/user',2,1,'user'),(45,3,'Konfigurasi System','setting/konfigurasi',1,1,'cog'),(51,0,'Laporan','laporan/laporan',4,1,'line-chart'),(52,78,'Agen','agen/agen',1,1,'male'),(60,3,'Grup Akses','setting/grup_akses',0,0,'circle'),(61,0,'Surety Bond','production/production',2,1,'file-text'),(78,0,'Data','other/other',1,1,'list'),(79,78,'Asuransi','other/insurance',4,1,'heartbeat'),(80,78,'Jenis Jaminan','other/surety',5,1,'window-restore'),(81,51,'Mutasi','report/mutation',0,1,'exchange'),(82,78,'Rate','other/rate',6,1,'bar-chart'),(83,51,'Laporan kas','report/profit',1,1,'usd'),(84,0,'Pengeluaran','other/cost',2,1,'money'),(85,78,'Obligee','obligee/obligee',3,1,'briefcase'),(86,51,'Laporan Produksi Cabang','report/branch',0,1,'usd'),(87,51,'Uang Sisa Agen','report/remainingmoney',0,1,'usd'),(88,51,'Laporan Kas Harian','report/daily',0,1,'usd'),(89,0,'Template Polis','productionreport/productionreport',0,1,'archive'),(90,0,'Setor Cicil Agen','other/bulkpay',0,1,'money'),(91,78,'Rate Asuransi','other/rateinsurance',0,1,'bar-chart'),(92,0,'akseptasi','acceptances/acceptances',0,1,'archive');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sys_menu_set_sys_grup_akses_trg` AFTER INSERT ON `sys_menu` FOR EACH ROW BEGIN
INSERT INTO sys_grup_akses (sys_grup_user_id, sys_menu_id, baca, tambah, ubah, hapus, cetak)
		SELECT id, NEW.id, 0, 0, 0, 0, 0 FROM sys_grup_user WHERE status=1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `sys_grup_user_id` int(6) unsigned NOT NULL,
  `username` varchar(128) NOT NULL,
  `userpassword` varchar(128) DEFAULT NULL,
  `nama` varchar(256) NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `poto` varchar(256) DEFAULT NULL,
  `is_merchant` tinyint(4) DEFAULT 0,
  `force_logout` tinyint(1) NOT NULL DEFAULT 0,
  `login_failed_count` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_blocked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_2` (`username`),
  KEY `sys_grup_user_id` (`sys_grup_user_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (6,2,'ryan','$2y$10$Cx9EYo/FglTY/mpkf7cINuCUr/IpORzvH1wCm2dwJq3n2JVx9Zf.C','Ryan Nanda',1,NULL,0,0,0,0),(7,3,'guest','$2y$10$usS8GoPaYotm9i3.9eYAvOrZCQg69kHTZ/zJH/ImLp5zpIaUF5fOS','Tamu',1,NULL,0,0,0,0),(8,2,'young','$2y$10$Nl5AToRnsURAH6NtBem5wev5fLjqTUPklbrhGMzdtsiz2DwPIPnM2','Youngky Andreas',1,NULL,0,0,0,0),(9,3,'operator','$2y$10$PGb4Ewzg8nzegZHeWC2AyeNi/iHrw2oyBmWUQ.q3ks8ZzivVYpeDS','Operator',1,NULL,0,0,0,0),(10,4,'finance',NULL,'Finance',1,NULL,0,0,0,0),(11,2,'tester','$2y$10$/A6pkeDIm.SbP.NAjqxqgu0PdJ8H.UpPMONae8Z66/uvTU0VZdfSy','tester',1,NULL,0,0,0,0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topup`
--

DROP TABLE IF EXISTS `topup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stats` enum('pending','processing','processed') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topup`
--

LOCK TABLES `topup` WRITE;
/*!40000 ALTER TABLE `topup` DISABLE KEYS */;
/*!40000 ALTER TABLE `topup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `produk_id` bigint(20) NOT NULL,
  `biller_id` bigint(20) NOT NULL,
  `merchant_id` bigint(20) NOT NULL,
  `message_cycle_id` bigint(20) NOT NULL,
  `type` enum('administration','inquiry','payment') NOT NULL,
  `via` enum('cpanel','mobile','web','mweb','manual','system') NOT NULL,
  `basic_price` bigint(20) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `fee` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `response_code` varchar(25) NOT NULL,
  `response_desc` varchar(250) NOT NULL,
  `remark` text NOT NULL,
  `additional_data_1` varchar(200) NOT NULL,
  `additional_data_2` varchar(200) NOT NULL,
  `additional_data_3` varchar(200) NOT NULL,
  `additional_data_4` varchar(200) NOT NULL,
  `additional_data_5` varchar(200) NOT NULL,
  `additional_data_6` varchar(200) NOT NULL,
  `additional_data_7` varchar(200) NOT NULL,
  `additional_data_8` varchar(200) NOT NULL,
  `additional_data_9` varchar(200) NOT NULL,
  `additional_data_10` text NOT NULL,
  `additional_data_11` varchar(200) NOT NULL,
  `additional_data_12` varchar(200) NOT NULL,
  `additional_data_13` varchar(200) NOT NULL,
  `additional_data_14` varchar(200) NOT NULL,
  `additional_data_15` varchar(200) NOT NULL,
  `additional_data_16` varchar(200) NOT NULL,
  `additional_data_17` varchar(200) NOT NULL,
  `additional_data_18` varchar(200) NOT NULL,
  `additional_data_19` varchar(200) NOT NULL,
  `additional_data_20` text NOT NULL,
  `additional_data_21` varchar(200) NOT NULL,
  `additional_data_22` varchar(200) NOT NULL,
  `additional_data_23` varchar(200) NOT NULL,
  `additional_data_24` varchar(200) NOT NULL,
  `additional_data_25` varchar(200) NOT NULL,
  `additional_data_26` varchar(200) NOT NULL,
  `additional_data_27` varchar(200) NOT NULL,
  `additional_data_28` varchar(200) NOT NULL,
  `additional_data_29` varchar(200) NOT NULL,
  `additional_data_30` text NOT NULL,
  `additional_data_31` varchar(200) NOT NULL,
  `additional_data_32` varchar(200) NOT NULL,
  `additional_data_33` varchar(200) NOT NULL,
  `additional_data_34` varchar(200) NOT NULL,
  `additional_data_35` varchar(200) NOT NULL,
  `additional_data_36` varchar(200) NOT NULL,
  `additional_data_37` varchar(200) NOT NULL,
  `additional_data_38` varchar(200) NOT NULL,
  `additional_data_39` varchar(200) NOT NULL,
  `additional_data_40` text NOT NULL,
  `additional_data_41` varchar(200) NOT NULL,
  `additional_data_42` varchar(200) NOT NULL,
  `additional_data_43` varchar(200) NOT NULL,
  `additional_data_44` varchar(200) NOT NULL,
  `additional_data_45` varchar(200) NOT NULL,
  `additional_data_46` varchar(200) NOT NULL,
  `additional_data_47` varchar(200) NOT NULL,
  `additional_data_48` varchar(200) NOT NULL,
  `additional_data_49` varchar(200) NOT NULL,
  `additional_data_50` text NOT NULL,
  `additional_data_51` varchar(200) NOT NULL,
  `additional_data_52` varchar(200) NOT NULL,
  `additional_data_53` varchar(200) NOT NULL,
  `additional_data_54` varchar(200) NOT NULL,
  `additional_data_55` varchar(200) NOT NULL,
  `additional_data_56` varchar(200) NOT NULL,
  `additional_data_57` varchar(200) NOT NULL,
  `additional_data_58` varchar(200) NOT NULL,
  `additional_data_59` varchar(200) NOT NULL,
  `additional_data_60` text NOT NULL,
  `additional_data_61` varchar(200) NOT NULL,
  `additional_data_62` varchar(200) NOT NULL,
  `additional_data_63` varchar(200) NOT NULL,
  `additional_data_64` varchar(200) NOT NULL,
  `additional_data_65` varchar(200) NOT NULL,
  `additional_data_66` varchar(200) NOT NULL,
  `additional_data_67` varchar(200) NOT NULL,
  `additional_data_68` varchar(200) NOT NULL,
  `additional_data_69` varchar(200) NOT NULL,
  `additional_data_70` text NOT NULL,
  `additional_data_71` varchar(200) NOT NULL,
  `additional_data_72` varchar(200) NOT NULL,
  `additional_data_73` varchar(200) NOT NULL,
  `additional_data_74` varchar(200) NOT NULL,
  `additional_data_75` varchar(200) NOT NULL,
  `additional_data_76` varchar(200) NOT NULL,
  `additional_data_77` varchar(200) NOT NULL,
  `additional_data_78` varchar(200) NOT NULL,
  `additional_data_79` varchar(200) NOT NULL,
  `additional_data_80` text NOT NULL,
  `additional_data_81` varchar(200) NOT NULL,
  `additional_data_82` varchar(200) NOT NULL,
  `additional_data_83` varchar(200) NOT NULL,
  `additional_data_84` varchar(200) NOT NULL,
  `additional_data_85` varchar(200) NOT NULL,
  `additional_data_86` varchar(200) NOT NULL,
  `additional_data_87` varchar(200) NOT NULL,
  `additional_data_88` varchar(200) NOT NULL,
  `additional_data_89` varchar(200) NOT NULL,
  `additional_data_90` text NOT NULL,
  `additional_data_91` varchar(200) NOT NULL,
  `additional_data_92` varchar(200) NOT NULL,
  `additional_data_93` varchar(200) NOT NULL,
  `additional_data_94` varchar(200) NOT NULL,
  `additional_data_95` varchar(200) NOT NULL,
  `additional_data_96` varchar(200) NOT NULL,
  `additional_data_97` varchar(200) NOT NULL,
  `additional_data_98` varchar(200) NOT NULL,
  `additional_data_99` varchar(200) NOT NULL,
  `additional_data_100` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_buffer`
--

DROP TABLE IF EXISTS `transaction_buffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_buffer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `produk_id` bigint(20) NOT NULL,
  `biller_id` bigint(20) NOT NULL,
  `merchant_id` bigint(20) NOT NULL,
  `message_cycle_id` bigint(20) NOT NULL,
  `type` enum('administration','inquiry','payment') NOT NULL,
  `via` enum('cpanel','mobile','web','mweb','manual','system') NOT NULL,
  `basic_price` bigint(20) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `fee` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `response_code` varchar(25) NOT NULL,
  `response_desc` varchar(250) NOT NULL,
  `remark` text NOT NULL,
  `additional_data_1` varchar(200) NOT NULL,
  `additional_data_2` varchar(200) NOT NULL,
  `additional_data_3` varchar(200) NOT NULL,
  `additional_data_4` varchar(200) NOT NULL,
  `additional_data_5` varchar(200) NOT NULL,
  `additional_data_6` varchar(200) NOT NULL,
  `additional_data_7` varchar(200) NOT NULL,
  `additional_data_8` varchar(200) NOT NULL,
  `additional_data_9` varchar(200) NOT NULL,
  `additional_data_10` text NOT NULL,
  `additional_data_11` varchar(200) NOT NULL,
  `additional_data_12` varchar(200) NOT NULL,
  `additional_data_13` varchar(200) NOT NULL,
  `additional_data_14` varchar(200) NOT NULL,
  `additional_data_15` varchar(200) NOT NULL,
  `additional_data_16` varchar(200) NOT NULL,
  `additional_data_17` varchar(200) NOT NULL,
  `additional_data_18` varchar(200) NOT NULL,
  `additional_data_19` varchar(200) NOT NULL,
  `additional_data_20` text NOT NULL,
  `additional_data_21` varchar(200) NOT NULL,
  `additional_data_22` varchar(200) NOT NULL,
  `additional_data_23` varchar(200) NOT NULL,
  `additional_data_24` varchar(200) NOT NULL,
  `additional_data_25` varchar(200) NOT NULL,
  `additional_data_26` varchar(200) NOT NULL,
  `additional_data_27` varchar(200) NOT NULL,
  `additional_data_28` varchar(200) NOT NULL,
  `additional_data_29` varchar(200) NOT NULL,
  `additional_data_30` text NOT NULL,
  `additional_data_31` varchar(200) NOT NULL,
  `additional_data_32` varchar(200) NOT NULL,
  `additional_data_33` varchar(200) NOT NULL,
  `additional_data_34` varchar(200) NOT NULL,
  `additional_data_35` varchar(200) NOT NULL,
  `additional_data_36` varchar(200) NOT NULL,
  `additional_data_37` varchar(200) NOT NULL,
  `additional_data_38` varchar(200) NOT NULL,
  `additional_data_39` varchar(200) NOT NULL,
  `additional_data_40` text NOT NULL,
  `additional_data_41` varchar(200) NOT NULL,
  `additional_data_42` varchar(200) NOT NULL,
  `additional_data_43` varchar(200) NOT NULL,
  `additional_data_44` varchar(200) NOT NULL,
  `additional_data_45` varchar(200) NOT NULL,
  `additional_data_46` varchar(200) NOT NULL,
  `additional_data_47` varchar(200) NOT NULL,
  `additional_data_48` varchar(200) NOT NULL,
  `additional_data_49` varchar(200) NOT NULL,
  `additional_data_50` text NOT NULL,
  `additional_data_51` varchar(200) NOT NULL,
  `additional_data_52` varchar(200) NOT NULL,
  `additional_data_53` varchar(200) NOT NULL,
  `additional_data_54` varchar(200) NOT NULL,
  `additional_data_55` varchar(200) NOT NULL,
  `additional_data_56` varchar(200) NOT NULL,
  `additional_data_57` varchar(200) NOT NULL,
  `additional_data_58` varchar(200) NOT NULL,
  `additional_data_59` varchar(200) NOT NULL,
  `additional_data_60` text NOT NULL,
  `additional_data_61` varchar(200) NOT NULL,
  `additional_data_62` varchar(200) NOT NULL,
  `additional_data_63` varchar(200) NOT NULL,
  `additional_data_64` varchar(200) NOT NULL,
  `additional_data_65` varchar(200) NOT NULL,
  `additional_data_66` varchar(200) NOT NULL,
  `additional_data_67` varchar(200) NOT NULL,
  `additional_data_68` varchar(200) NOT NULL,
  `additional_data_69` varchar(200) NOT NULL,
  `additional_data_70` text NOT NULL,
  `additional_data_71` varchar(200) NOT NULL,
  `additional_data_72` varchar(200) NOT NULL,
  `additional_data_73` varchar(200) NOT NULL,
  `additional_data_74` varchar(200) NOT NULL,
  `additional_data_75` varchar(200) NOT NULL,
  `additional_data_76` varchar(200) NOT NULL,
  `additional_data_77` varchar(200) NOT NULL,
  `additional_data_78` varchar(200) NOT NULL,
  `additional_data_79` varchar(200) NOT NULL,
  `additional_data_80` text NOT NULL,
  `additional_data_81` varchar(200) NOT NULL,
  `additional_data_82` varchar(200) NOT NULL,
  `additional_data_83` varchar(200) NOT NULL,
  `additional_data_84` varchar(200) NOT NULL,
  `additional_data_85` varchar(200) NOT NULL,
  `additional_data_86` varchar(200) NOT NULL,
  `additional_data_87` varchar(200) NOT NULL,
  `additional_data_88` varchar(200) NOT NULL,
  `additional_data_89` varchar(200) NOT NULL,
  `additional_data_90` text NOT NULL,
  `additional_data_91` varchar(200) NOT NULL,
  `additional_data_92` varchar(200) NOT NULL,
  `additional_data_93` varchar(200) NOT NULL,
  `additional_data_94` varchar(200) NOT NULL,
  `additional_data_95` varchar(200) NOT NULL,
  `additional_data_96` varchar(200) NOT NULL,
  `additional_data_97` varchar(200) NOT NULL,
  `additional_data_98` varchar(200) NOT NULL,
  `additional_data_99` varchar(200) NOT NULL,
  `additional_data_100` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_buffer`
--

LOCK TABLES `transaction_buffer` WRITE;
/*!40000 ALTER TABLE `transaction_buffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_buffer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-04 16:54:17
