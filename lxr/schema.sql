-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: rxr3
-- ------------------------------------------------------
-- Server version	5.1.49-3

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
-- Table structure for table `lxr_declarations`
--

DROP TABLE IF EXISTS `lxr_declarations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lxr_declarations` (
  `declid` smallint(6) NOT NULL AUTO_INCREMENT,
  `langid` tinyint(4) NOT NULL,
  `declaration` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`declid`,`langid`)
) ENGINE=MyISAM AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lxr_files`
--

DROP TABLE IF EXISTS `lxr_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lxr_files` (
  `filename` char(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `revision` char(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fileid`),
  KEY `lxr_filelookup` (`filename`)
) ENGINE=MyISAM AUTO_INCREMENT=48919 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lxr_indexes`
--

DROP TABLE IF EXISTS `lxr_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lxr_indexes` (
  `symid` int(11) NOT NULL,
  `fileid` int(11) NOT NULL,
  `line` int(11) NOT NULL,
  `langid` tinyint(4) NOT NULL,
  `type` smallint(6) NOT NULL,
  `relsym` int(11) DEFAULT NULL,
  KEY `lxr_indexindex` (`symid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lxr_releases`
--

DROP TABLE IF EXISTS `lxr_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lxr_releases` (
  `fileid` int(11) NOT NULL,
  `releaseid` char(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fileid`,`releaseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lxr_status`
--

DROP TABLE IF EXISTS `lxr_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lxr_status` (
  `fileid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lxr_symbols`
--

DROP TABLE IF EXISTS `lxr_symbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lxr_symbols` (
  `symname` char(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `symid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symid`),
  UNIQUE KEY `lxr_symbolindex` (`symname`)
) ENGINE=MyISAM AUTO_INCREMENT=210669 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lxr_usage`
--

DROP TABLE IF EXISTS `lxr_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lxr_usage` (
  `fileid` int(11) NOT NULL,
  `line` int(11) NOT NULL,
  `symid` int(11) NOT NULL,
  KEY `lxr_usageindex` (`symid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-25 19:51:43
