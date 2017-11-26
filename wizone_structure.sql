-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: wibupt
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `type` varchar(40) DEFAULT NULL,
  `monTime` int(11) NOT NULL,
  `activity` double DEFAULT NULL,
  PRIMARY KEY (`monTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityinday`
--

DROP TABLE IF EXISTS `activityinday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityinday` (
  `monTime` int(11) NOT NULL,
  `type` int(2) NOT NULL DEFAULT '0',
  `activity` double DEFAULT NULL,
  PRIMARY KEY (`monTime`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arTarget`
--

DROP TABLE IF EXISTS `arTarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arTarget` (
  `targetId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `targetName` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `openTime` varchar(255) NOT NULL,
  `floorNumber` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`targetId`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `arTarget_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groupindex` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branddis`
--

DROP TABLE IF EXISTS `branddis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branddis` (
  `time` date NOT NULL DEFAULT '0000-00-00',
  `counter` double DEFAULT NULL,
  `cKnown` double DEFAULT NULL,
  `cUnknown` double DEFAULT NULL,
  `apple` double DEFAULT NULL,
  `samsung` double DEFAULT NULL,
  `xiaomi` double DEFAULT NULL,
  `htc` double DEFAULT NULL,
  `huawei` double DEFAULT NULL,
  `murata` double DEFAULT NULL,
  `intel` double DEFAULT NULL,
  `honhai` double DEFAULT NULL,
  `nokia` double DEFAULT NULL,
  `lenovo` double DEFAULT NULL,
  `liteon` double DEFAULT NULL,
  `sony` double DEFAULT NULL,
  `meizu` double DEFAULT NULL,
  `inpro` double DEFAULT NULL,
  `lg` double DEFAULT NULL,
  `AzureWave` double DEFAULT NULL,
  `oppo` double DEFAULT NULL,
  `zte` double DEFAULT NULL,
  `bbk` double DEFAULT NULL,
  `arris` double DEFAULT NULL,
  `coolpad` double DEFAULT NULL,
  `asus` double DEFAULT NULL,
  `gionee` double DEFAULT NULL,
  `tp_link` double DEFAULT NULL,
  `K_Touch` double DEFAULT NULL,
  `AcSiP` double DEFAULT NULL,
  `AsiaPacific` double DEFAULT NULL,
  `ChiMei` double DEFAULT NULL,
  `Foxconn` double DEFAULT NULL,
  `Garmin` double DEFAULT NULL,
  `Gemtek` double DEFAULT NULL,
  `MediaTek` double DEFAULT NULL,
  `Qualcomm` double DEFAULT NULL,
  `Hisense` double DEFAULT NULL,
  `Roving` double DEFAULT NULL,
  `Simcom` double DEFAULT NULL,
  `SHARP` double DEFAULT NULL,
  `Wisol` double DEFAULT NULL,
  `Wistron` double DEFAULT NULL,
  `Amoi` double DEFAULT NULL,
  `BIRD` double DEFAULT NULL,
  `Philips` double DEFAULT NULL,
  `TCL` double DEFAULT NULL,
  `other` double DEFAULT NULL,
  `vivo` double DEFAULT NULL,
  `leTv` double DEFAULT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edges`
--

DROP TABLE IF EXISTS `edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edges` (
  `source` text,
  `target` text,
  `time` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78171657 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goandcome`
--

DROP TABLE IF EXISTS `goandcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goandcome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT NULL,
  `comeIn` int(11) DEFAULT NULL,
  `goOut` int(11) DEFAULT NULL,
  `gateId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4564 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupindex`
--

DROP TABLE IF EXISTS `groupindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupindex` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `heatmap`
--

DROP TABLE IF EXISTS `heatmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heatmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `monTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `heatmap_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groupindex` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5653321 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `macbrand_oui`
--

DROP TABLE IF EXISTS `macbrand_oui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macbrand_oui` (
  `mac` varchar(18) NOT NULL,
  `brand` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monindex`
--

DROP TABLE IF EXISTS `monindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monindex` (
  `monid` varchar(15) NOT NULL DEFAULT '',
  `monModle` varchar(40) DEFAULT NULL,
  `monAdd` varchar(100) DEFAULT NULL,
  `wallType` varchar(40) DEFAULT NULL,
  `wallExp` int(2) DEFAULT NULL,
  `wallDis` int(2) DEFAULT NULL,
  `monname` varchar(100) NOT NULL,
  `total` int(6) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `rssin` double DEFAULT NULL,
  `rssout` double DEFAULT NULL,
  PRIMARY KEY (`monid`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `monindex_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groupindex` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realgate`
--

DROP TABLE IF EXISTS `realgate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realgate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL,
  `gateid` varchar(20) DEFAULT NULL,
  `alldata` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realtime_statistic`
--

DROP TABLE IF EXISTS `realtime_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realtime_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `statistic` int(11) DEFAULT NULL,
  `monTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realtime_traffic`
--

DROP TABLE IF EXISTS `realtime_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realtime_traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `traffic` int(11) DEFAULT NULL,
  `monTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realtimedata_in`
--

DROP TABLE IF EXISTS `realtimedata_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realtimedata_in` (
  `monTime` int(10) DEFAULT NULL,
  `traffic` int(4) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  KEY `groupid` (`groupid`),
  CONSTRAINT `realtimedata_in_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groupindex` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `totalinfo`
--

DROP TABLE IF EXISTS `totalinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totalinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT NULL,
  `comein` int(5) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `totalinfo_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groupindex` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `traffic_today`
--

DROP TABLE IF EXISTS `traffic_today`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic_today` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `daytraffic` int(11) DEFAULT NULL,
  `monTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(4) DEFAULT NULL,
  `userName` varchar(40) NOT NULL,
  `passwd` varchar(40) NOT NULL,
  `userType` varchar(40) NOT NULL,
  `contract` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitrecord`
--

DROP TABLE IF EXISTS `visitrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitrecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mac` char(12) DEFAULT NULL,
  `inTime` int(10) DEFAULT NULL,
  `offTime` int(10) DEFAULT NULL,
  `dwellTime` int(10) DEFAULT NULL,
  `monid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mac` (`mac`)
) ENGINE=InnoDB AUTO_INCREMENT=1077451 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-25 17:34:52
