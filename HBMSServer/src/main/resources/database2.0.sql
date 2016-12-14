-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: hbmsdatabase
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `appeal`
--

DROP TABLE IF EXISTS `appeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeal` (
  `appealID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `appealTime` datetime DEFAULT '2000-01-01 00:00:00',
  `userID` varchar(10) DEFAULT NULL,
  `webMarketerID` varchar(10) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `appealState` tinyint(4) DEFAULT NULL,
  `orderID` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`appealID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appeal`
--

LOCK TABLES `appeal` WRITE;
/*!40000 ALTER TABLE `appeal` DISABLE KEYS */;
/*!40000 ALTER TABLE `appeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentinfo`
--

DROP TABLE IF EXISTS `commentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentinfo` (
  `commentID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hotelID` int(10) unsigned zerofill NOT NULL,
  `score` int(11) NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `picture1` varchar(50) DEFAULT NULL,
  `picture2` varchar(50) DEFAULT NULL,
  `picture3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  KEY `hotelID_idx` (`hotelID`),
  CONSTRAINT `hotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentinfo`
--

LOCK TABLES `commentinfo` WRITE;
/*!40000 ALTER TABLE `commentinfo` DISABLE KEYS */;
INSERT INTO `commentinfo` VALUES (0000000001,'2016-12-01 16:11:59',0000000128,9,'就是测试一下',NULL,NULL,NULL);
/*!40000 ALTER TABLE `commentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditrecord`
--

DROP TABLE IF EXISTS `creditrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditrecord` (
  `creditRecordID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` varchar(10) DEFAULT NULL,
  `changeType` tinyint(4) DEFAULT NULL,
  `reasonType` tinyint(4) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`creditRecordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditrecord`
--

LOCK TABLES `creditrecord` WRITE;
/*!40000 ALTER TABLE `creditrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `hotelID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `region` int(10) unsigned zerofill NOT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `star` tinyint(4) DEFAULT NULL,
  `environment1` varchar(50) DEFAULT NULL,
  `environment2` varchar(50) DEFAULT NULL,
  `environment3` varchar(50) DEFAULT NULL,
  `facility` varchar(200) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `lowestPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`hotelID`),
  KEY `region_idx` (`region`),
  KEY `region_idx2` (`region`),
  CONSTRAINT `region` FOREIGN KEY (`region`) REFERENCES `region` (`regionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (0000000001,'如家连锁酒店','13 Nanjing Rd.',0000000001,'a very expensive hotel',3,'NOPIC','NOPIC','NOPIC','feel like living in your own home, but a little bit noisy',3,111),(0000000002,'７天连锁酒店','120 Nanjing Rd.',0000000001,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000003,'君悦大酒店','648 Nanjing Rd.',0000000001,'a holy-expensive hotel, built in 1900',5,'NOPIC','NOPIC','NOPIC','we call it royal, what else can you imagine?',5,111),(0000000004,'格林豪泰连锁酒店','1 Yunnan Rd.',0000000001,'a fundamentally equipped hotel, and the service is of standard',2,'NOPIC','NOPIC','NOPIC','basically equipped, standardized service provided',4,111),(0000000005,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000002,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000006,'君悦大酒店','648 Tianyaoqiao Rd.',0000000002,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000007,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000002,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000008,'７天连锁酒店','120 Zhaojiabang Rd.',0000000002,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000009,'希尔顿酒店','6610 W. Nanjing Rd.',0000000003,'a holy-expensive hotel, never try without a moderate wallet',5,'NOPIC','NOPIC','NOPIC','maybe the most fantastic furnish in Shanghai',4,111),(0000000010,'汉庭连锁酒店','800 W. Nanjing Rd.',0000000003,'a very cheap chain hotel',2,'NOPIC','NOPIC','NOPIC','best choice for tourists from nearby cities',5,111),(0000000011,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000004,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000012,'君悦大酒店','648 Tianyaoqiao Rd.',0000000004,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000013,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000004,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000014,'７天连锁酒店','120 Zhaojiabang Rd.',0000000004,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000015,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000005,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000016,'君悦大酒店','648 Tianyaoqiao Rd.',0000000005,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000017,'速８连锁酒店','123 S. Wanping Rd.',0000000005,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000018,'７天连锁酒店','120 Zhaojiabang Rd.',0000000005,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000019,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000006,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000020,'君悦大酒店','648 Tianyaoqiao Rd.',0000000006,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000021,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000006,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000022,'希尔顿酒店','120 Zhaojiabang Rd.',0000000006,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000023,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000007,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000024,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000007,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000025,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000007,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000026,'７天连锁酒店','120 Zhaojiabang Rd.',0000000007,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',5,111),(0000000027,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000008,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000028,'君悦大酒店','648 Tianyaoqiao Rd.',0000000008,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000029,'速８连锁酒店','123 S. Wanping Rd.',0000000008,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000030,'希尔顿酒店','120 Zhaojiabang Rd.',0000000008,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000031,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000009,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000032,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000009,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000033,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000009,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000034,'７天连锁酒店','120 Zhaojiabang Rd.',0000000009,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000035,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000010,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000036,'君悦大酒店','648 Tianyaoqiao Rd.',0000000010,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000037,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000010,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000038,'７天连锁酒店','120 Zhaojiabang Rd.',0000000010,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',5,111),(0000000039,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000011,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000040,'君悦大酒店','648 Tianyaoqiao Rd.',0000000011,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000041,'速８连锁酒店','123 S. Wanping Rd.',0000000011,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000042,'７天连锁酒店','120 Zhaojiabang Rd.',0000000011,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000043,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000012,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',5,111),(0000000044,'君悦大酒店','648 Tianyaoqiao Rd.',0000000012,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000045,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000012,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000046,'希尔顿酒店','120 Zhaojiabang Rd.',0000000012,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000047,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000013,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000048,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000013,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000049,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000013,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',5,111),(0000000050,'７天连锁酒店','120 Zhaojiabang Rd.',0000000013,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000051,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000014,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000052,'君悦大酒店','648 Tianyaoqiao Rd.',0000000014,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000053,'速８连锁酒店','123 S. Wanping Rd.',0000000014,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000054,'希尔顿酒店','120 Zhaojiabang Rd.',0000000014,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000055,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000015,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000056,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000015,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000057,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000015,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000058,'７天连锁酒店','120 Zhaojiabang Rd.',0000000015,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',5,111),(0000000059,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000016,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000060,'君悦大酒店','648 Tianyaoqiao Rd.',0000000016,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000061,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000016,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000062,'７天连锁酒店','120 Zhaojiabang Rd.',0000000016,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000063,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000017,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000064,'君悦大酒店','648 Tianyaoqiao Rd.',0000000017,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000065,'速８连锁酒店','123 S. Wanping Rd.',0000000017,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000066,'７天连锁酒店','120 Zhaojiabang Rd.',0000000017,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000067,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000018,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000068,'君悦大酒店','648 Tianyaoqiao Rd.',0000000018,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000069,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000018,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000070,'希尔顿酒店','120 Zhaojiabang Rd.',0000000018,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000071,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000019,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',5,111),(0000000072,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000019,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000073,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000019,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000074,'７天连锁酒店','120 Zhaojiabang Rd.',0000000019,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000075,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000020,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000076,'君悦大酒店','648 Tianyaoqiao Rd.',0000000020,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000077,'速８连锁酒店','123 S. Wanping Rd.',0000000020,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000078,'希尔顿酒店','120 Zhaojiabang Rd.',0000000020,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',5,111),(0000000079,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000021,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000080,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000021,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000081,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000021,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000082,'７天连锁酒店','120 Zhaojiabang Rd.',0000000021,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000083,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000022,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000084,'君悦大酒店','648 Tianyaoqiao Rd.',0000000022,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000085,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000022,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000086,'７天连锁酒店','120 Zhaojiabang Rd.',0000000022,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',5,111),(0000000087,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000023,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000088,'君悦大酒店','648 Tianyaoqiao Rd.',0000000023,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000089,'速８连锁酒店','123 S. Wanping Rd.',0000000023,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000090,'７天连锁酒店','120 Zhaojiabang Rd.',0000000023,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000091,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000024,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000092,'君悦大酒店','648 Tianyaoqiao Rd.',0000000024,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000093,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000024,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000094,'希尔顿酒店','120 Zhaojiabang Rd.',0000000024,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000095,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000025,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',5,111),(0000000096,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000025,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000097,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000025,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000098,'７天连锁酒店','120 Zhaojiabang Rd.',0000000025,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000099,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000026,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000100,'君悦大酒店','648 Tianyaoqiao Rd.',0000000026,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000101,'速８连锁酒店','123 S. Wanping Rd.',0000000026,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000102,'希尔顿酒店','120 Zhaojiabang Rd.',0000000026,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000103,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000027,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',3,111),(0000000104,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000027,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000105,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000027,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000106,'７天连锁酒店','120 Zhaojiabang Rd.',0000000027,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',5,111),(0000000107,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000028,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',5,111),(0000000108,'君悦大酒店','648 Tianyaoqiao Rd.',0000000028,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000109,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000028,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',3,111),(0000000110,'希尔顿酒店','120 Zhaojiabang Rd.',0000000028,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',3,111),(0000000111,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000029,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',5,111),(0000000112,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000029,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000113,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000029,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000114,'７天连锁酒店','120 Zhaojiabang Rd.',0000000029,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000115,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000030,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000116,'君悦大酒店','648 Tianyaoqiao Rd.',0000000030,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000117,'速８连锁酒店','123 S. Wanping Rd.',0000000030,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000118,'希尔顿酒店','120 Zhaojiabang Rd.',0000000030,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000119,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000031,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000120,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,98),(0000000121,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000031,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',5,111),(0000000122,'７天连锁酒店','120 Zhaojiabang Rd.',0000000031,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000123,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000032,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',5,111),(0000000124,'君悦大酒店','648 Tianyaoqiao Rd.',0000000032,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000125,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000032,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000126,'７天连锁酒店','120 Zhaojiabang Rd.',0000000032,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000127,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000033,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',3,111),(0000000128,'君悦大酒店','648 Tianyaoqiao Rd.',0000000033,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000129,'速８连锁酒店','123 S. Wanping Rd.',0000000033,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000130,'７天连锁酒店','120 Zhaojiabang Rd.',0000000033,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',4,111),(0000000131,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000034,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000132,'君悦大酒店','648 Tianyaoqiao Rd.',0000000034,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000133,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000034,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000134,'希尔顿酒店','120 Zhaojiabang Rd.',0000000034,'a very cheap hotel',3,'NOPIC','NOPIC','NOPIC','good enough, but a little bit noisy',5,111),(0000000135,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000035,'a secret garden hidden inside of the downtown',3,'NOPIC','NOPIC','NOPIC','environment is not good',2,111),(0000000136,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000035,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,'NOPIC','NOPIC','NOPIC','everything is perfect except the traffic',4,111),(0000000137,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000035,'a very cheap chain hotel',3,'NOPIC','NOPIC','NOPIC','maybe the service here is better than other chains',4,111),(0000000139,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4,111),(0000000140,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4,111),(0000000141,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4,111),(0000000142,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4,111),(0000000143,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4,111);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelpromotion`
--

DROP TABLE IF EXISTS `hotelpromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelpromotion` (
  `hotelPromotionID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `hotelID` int(10) unsigned zerofill NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `startDate` date DEFAULT '2000-01-01',
  `endDate` date DEFAULT '2030-01-01',
  `minRankAvailable` int(11) DEFAULT '1',
  `maxRankAvailable` int(11) DEFAULT '10',
  PRIMARY KEY (`hotelPromotionID`),
  KEY `promotionOfHotelID_idx` (`hotelID`),
  CONSTRAINT `promotionOfHotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelpromotion`
--

LOCK TABLES `hotelpromotion` WRITE;
/*!40000 ALTER TABLE `hotelpromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelpromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `orderID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `generateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cancelTime` datetime DEFAULT NULL,
  `executeDDL` datetime DEFAULT NULL,
  `hotelID` int(10) unsigned zerofill NOT NULL,
  `orderState` tinyint(4) DEFAULT NULL,
  `checkinTime` datetime DEFAULT NULL,
  `checkoutTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `hasChild` tinyint(4) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `orderOfHotelID_idx` (`hotelID`),
  CONSTRAINT `orderOfHotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `regionID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `regionName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (0000000001,'上海','上海','南京路'),(0000000002,'上海','上海','徐家汇'),(0000000003,'上海','上海','静安寺'),(0000000004,'上海','上海','淮海路'),(0000000005,'上海','上海','陆家嘴'),(0000000006,'浙江','杭州','武林'),(0000000007,'浙江','杭州','湖滨'),(0000000008,'浙江','杭州','钱江新城'),(0000000009,'浙江','杭州','城西'),(0000000010,'江苏','苏州','观前'),(0000000011,'江苏','苏州','石路'),(0000000012,'江苏','苏州','平江新城'),(0000000013,'江苏','苏州','吴中'),(0000000014,'江苏','南京','新街口'),(0000000015,'江苏','南京','湖南路'),(0000000016,'江苏','南京','夫子庙'),(0000000017,'江苏','南京','中央门'),(0000000018,'浙江','宁波','天一'),(0000000019,'浙江','宁波','城隍庙'),(0000000020,'浙江','宁波','鼓楼步行街'),(0000000021,'湖北','武汉','江汉路'),(0000000022,'湖北','武汉','中央文化区'),(0000000023,'湖北','武汉','武广'),(0000000024,'福建','厦门','中山路'),(0000000025,'湖南','长沙','五一'),(0000000026,'湖南','长沙','溁湾镇'),(0000000027,'广东','广州','天河中心'),(0000000028,'广东','广州','上下九'),(0000000029,'广东','广州','北京路'),(0000000030,'广东','深圳','华侨城'),(0000000031,'广东','深圳','东门'),(0000000032,'广东','深圳','南山'),(0000000033,'广东','深圳','龙岗'),(0000000034,'重庆','重庆','解放碑'),(0000000035,'重庆','重庆','沙坪坝');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomdate`
--

DROP TABLE IF EXISTS `roomdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomdate` (
  `roomInfoID` int(10) unsigned zerofill NOT NULL,
  `curDay` date NOT NULL,
  `day00` tinyint(4) DEFAULT '1',
  `day01` tinyint(4) DEFAULT '1',
  `day02` tinyint(4) DEFAULT '1',
  `day03` tinyint(4) DEFAULT '1',
  `day04` tinyint(4) DEFAULT '1',
  `day05` tinyint(4) DEFAULT '1',
  `day06` tinyint(4) DEFAULT '1',
  `day07` tinyint(4) DEFAULT '1',
  `day08` tinyint(4) DEFAULT '1',
  `day09` tinyint(4) DEFAULT '1',
  `day10` tinyint(4) DEFAULT '1',
  `day11` tinyint(4) DEFAULT '1',
  `day12` tinyint(4) DEFAULT '1',
  `day13` tinyint(4) DEFAULT '1',
  `day14` tinyint(4) DEFAULT '1',
  `day15` tinyint(4) DEFAULT '1',
  `day16` tinyint(4) DEFAULT '1',
  `day17` tinyint(4) DEFAULT '1',
  `day18` tinyint(4) DEFAULT '1',
  `day19` tinyint(4) DEFAULT '1',
  `day20` tinyint(4) DEFAULT '1',
  `day21` tinyint(4) DEFAULT '1',
  `day22` tinyint(4) DEFAULT '1',
  `day23` tinyint(4) DEFAULT '1',
  `day24` tinyint(4) DEFAULT '1',
  `day25` tinyint(4) DEFAULT '1',
  `day26` tinyint(4) DEFAULT '1',
  `day27` tinyint(4) DEFAULT '1',
  `day28` tinyint(4) DEFAULT '1',
  `day29` tinyint(4) DEFAULT '0',
  `day30` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`roomInfoID`),
  CONSTRAINT `roomInfoID` FOREIGN KEY (`roomInfoID`) REFERENCES `roominfo` (`roomInfoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录从当前日期起0-30天是否可用\n0为不可用，1为可用\n//与此类似可实现每天价格不同，进一步实现酒店房型中最低价格。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomdate`
--

LOCK TABLES `roomdate` WRITE;
/*!40000 ALTER TABLE `roomdate` DISABLE KEYS */;
INSERT INTO `roomdate` VALUES (0000000001,'2016-12-03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000003,'2016-12-03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000009,'2016-12-03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000010,'2016-12-03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000011,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000012,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000013,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000014,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000015,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000016,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000017,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000018,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000019,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000020,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000021,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000022,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000023,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000024,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000025,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000026,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000027,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000028,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000029,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000030,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000031,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000032,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000033,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000034,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000035,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000036,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000037,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000038,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000039,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),(0000000040,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1),(0000000041,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1),(0000000042,'2016-12-03',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1);
/*!40000 ALTER TABLE `roomdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roominfo`
--

DROP TABLE IF EXISTS `roominfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roominfo` (
  `roomInfoID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `hotelID` int(10) unsigned zerofill NOT NULL,
  `roomID` varchar(10) DEFAULT NULL,
  `roomType` varchar(30) DEFAULT NULL,
  `defaultPrice` int(11) unsigned NOT NULL,
  `roomState` tinyint(4) DEFAULT '1',
  `detailedInfo1` datetime DEFAULT NULL COMMENT '对于入住状态，包含入住时间\n对于退房状态，包含实际离开时间',
  `detailedInfo2` datetime DEFAULT NULL COMMENT '对于入住状态，包含预计离开时间\n对于退房状态，此项为空',
  PRIMARY KEY (`roomInfoID`),
  KEY `hotelID_idx` (`hotelID`),
  KEY `hotelID_idx2` (`hotelID`),
  CONSTRAINT `roomOfHotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roominfo`
--

LOCK TABLES `roominfo` WRITE;
/*!40000 ALTER TABLE `roominfo` DISABLE KEYS */;
INSERT INTO `roominfo` VALUES (0000000001,0000000120,'888','豪华大床房',290,1,'2016-12-01 21:14:39','2016-12-01 21:14:39'),(0000000003,0000000120,'888','豪华大床房',1222,2,'2016-12-01 00:00:00','2016-12-01 00:00:00'),(0000000004,0000000020,'888','豪华大床房',300,2,'2016-12-01 00:00:00','2016-12-01 00:00:00'),(0000000005,0000000120,'888','豪华大床房',300,2,'2016-12-01 00:00:00','2016-12-01 00:00:00'),(0000000006,0000000020,'888','豪华大床房',300,2,'2016-12-01 00:00:00','2016-12-01 00:00:00'),(0000000007,0000000120,'888','豪华大床房',300,2,'2016-12-01 00:00:00','2016-12-01 00:00:00'),(0000000008,0000000119,'666','测试房',222,NULL,NULL,NULL),(0000000009,0000000119,'666','测试房',222,NULL,NULL,NULL),(0000000010,0000000119,'666','测试房',211,0,NULL,NULL),(0000000011,0000000119,'666','测试房',222,1,NULL,NULL),(0000000012,0000000119,'666','测试房',222,1,NULL,NULL),(0000000013,0000000119,'666','测试房',222,1,NULL,NULL),(0000000014,0000000119,'666','测试房',222,1,NULL,NULL),(0000000015,0000000119,'666','测试房',222,1,NULL,NULL),(0000000016,0000000119,'666','测试房',222,1,NULL,NULL),(0000000017,0000000119,'666','测试房',222,1,NULL,NULL),(0000000018,0000000119,'666','测试房',222,1,NULL,NULL),(0000000019,0000000119,'666','测试房',222,1,NULL,NULL),(0000000020,0000000119,'666','测试房',222,1,NULL,NULL),(0000000021,0000000119,'666','测试房',222,1,NULL,NULL),(0000000022,0000000119,'666','测试房',222,1,NULL,NULL),(0000000023,0000000119,'666','测试房',222,1,NULL,NULL),(0000000024,0000000119,'666','测试房',222,1,NULL,NULL),(0000000025,0000000119,'666','测试房',222,1,NULL,NULL),(0000000026,0000000119,'666','测试房',222,1,NULL,NULL),(0000000027,0000000119,'666','测试房',222,1,NULL,NULL),(0000000028,0000000119,'666','测试房',222,1,NULL,NULL),(0000000029,0000000119,'666','测试房',222,1,NULL,NULL),(0000000030,0000000119,'666','测试房',222,1,NULL,NULL),(0000000031,0000000119,'666','测试房',222,1,NULL,NULL),(0000000032,0000000119,'666','测试房',222,1,NULL,NULL),(0000000033,0000000119,'666','测试房',222,1,NULL,NULL),(0000000034,0000000119,'666','测试房',222,1,NULL,NULL),(0000000035,0000000119,'666','测试房',222,1,NULL,NULL),(0000000036,0000000119,'666','测试房',222,1,NULL,NULL),(0000000037,0000000119,'666','测试房',222,1,NULL,NULL),(0000000038,0000000119,'666','测试房',222,1,NULL,NULL),(0000000039,0000000119,'666','测试房',222,1,NULL,NULL),(0000000040,0000000119,'666','测试房',222,1,NULL,NULL),(0000000041,0000000119,'666','测试房',222,1,NULL,NULL),(0000000042,0000000119,'666','测试房',222,1,NULL,NULL);
/*!40000 ALTER TABLE `roominfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`roominfo_AFTER_INSERT` AFTER INSERT ON `roominfo` FOR EACH ROW
BEGIN
   insert into roomdate(roomInfoID,curDay) values(new.roomInfoID,now());
   insert into roomprice(roomInfoID,curDay,defaultPrice) values(new.roomInfoID,now(),new.defaultPrice);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`roominfo_AFTER_UPDATE` AFTER UPDATE ON `roominfo` FOR EACH ROW
BEGIN
    if old.defaultPrice!=new.defaultPrice then
    update roomprice set roomprice.defaultPrice = new.defaultPrice where roomprice.roomInfoID = new.roomInfoID;
    end if;
    
    if old.roomState!=new.roomState then
        if new.roomState =0 then
        update roomdate 
        set day00=0,
        day01=0,
        day02=0,
        day03=0,
        day04=0,
        day05=0,
        day06=0,
        day07=0,
        day08=0,
        day09=0,
        day10=0,
        day11=0,
        day12=0,
        day13=0,
        day14=0,
        day15=0,
        day16=0,
        day17=0,
        day18=0,
        day19=0,
        day20=0,
        day21=0,
        day22=0,
        day23=0,
        day24=0,
        day25=0,
        day26=0,
        day27=0,
        day28=0,
        day29=0,
        day30=0
        where roomdate.roomInfoID = new.roomInfoID;
        else 
         update roomdate 
        set day00=1,
        day01=1,
        day02=1,
        day03=1,
        day04=1,
        day05=1,
        day06=1,
        day07=1,
        day08=1,
        day09=1,
        day10=1,
        day11=1,
        day12=1,
        day13=1,
        day14=1,
        day15=1,
        day16=1,
        day17=1,
        day18=1,
        day19=1,
        day20=1,
        day21=1,
        day22=1,
        day23=1,
        day24=1,
        day25=1,
        day26=1,
        day27=1,
        day28=1,
        day29=1,
        day30=1   
        where roomdate.roomInfoID = new.roomInfoID;
        end if;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roomprice`
--

DROP TABLE IF EXISTS `roomprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomprice` (
  `roomInfoID` int(10) unsigned zerofill NOT NULL,
  `curDay` date NOT NULL,
  `defaultPrice` int(11) unsigned NOT NULL DEFAULT '0',
  `day00` int(11) unsigned DEFAULT '0',
  `day01` int(11) unsigned DEFAULT '0',
  `day02` int(11) unsigned DEFAULT '0',
  `day03` int(11) unsigned DEFAULT '0',
  `day04` int(11) unsigned DEFAULT '0',
  `day05` int(11) unsigned DEFAULT '0',
  `day06` int(11) unsigned DEFAULT '0',
  `day07` int(11) unsigned DEFAULT '0',
  `day08` int(11) unsigned DEFAULT '0',
  `day09` int(11) unsigned DEFAULT '0',
  `day10` int(11) unsigned DEFAULT '0',
  `day11` int(11) unsigned DEFAULT '0',
  `day12` int(11) unsigned DEFAULT '0',
  `day13` int(11) unsigned DEFAULT '0',
  `day14` int(11) unsigned DEFAULT '0',
  `day15` int(11) unsigned DEFAULT '0',
  `day16` int(11) unsigned DEFAULT '0',
  `day17` int(11) unsigned DEFAULT '0',
  `day18` int(11) unsigned DEFAULT '0',
  `day19` int(11) unsigned DEFAULT '0',
  `day20` int(11) unsigned DEFAULT '0',
  `day21` int(11) unsigned DEFAULT '0',
  `day22` int(11) unsigned DEFAULT '0',
  `day23` int(11) unsigned DEFAULT '0',
  `day24` int(11) unsigned DEFAULT '0',
  `day25` int(11) unsigned DEFAULT '0',
  `day26` int(11) unsigned DEFAULT '0',
  `day27` int(11) unsigned DEFAULT '0',
  `day28` int(11) unsigned DEFAULT '0',
  `day29` int(11) unsigned DEFAULT '0',
  `day30` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`roomInfoID`),
  CONSTRAINT `roomPrice` FOREIGN KEY (`roomInfoID`) REFERENCES `roominfo` (`roomInfoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录从当前日期起0-30天的价格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomprice`
--

LOCK TABLES `roomprice` WRITE;
/*!40000 ALTER TABLE `roomprice` DISABLE KEYS */;
INSERT INTO `roomprice` VALUES (0000000001,'2016-12-03',290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290),(0000000003,'2016-12-03',1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222),(0000000004,'2016-12-03',142,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,150,0,142),(0000000005,'2016-12-03',142,300,0,0,111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0,142),(0000000008,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000009,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000010,'2016-12-03',211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211),(0000000011,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000012,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000013,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000014,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000015,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000016,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000017,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000018,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000019,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000020,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000021,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000022,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000023,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000024,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000025,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000026,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000027,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000028,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000029,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000030,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000031,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000032,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000033,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000034,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000035,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000036,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000037,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000038,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000039,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000040,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000041,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000042,'2016-12-03',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222);
/*!40000 ALTER TABLE `roomprice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`roomprice_BEFORE_INSERT` BEFORE INSERT ON `roomprice` FOR EACH ROW
BEGIN
 set new.day00=new.defaultPrice,
    new.day01=new.defaultPrice,
    new.day02=new.defaultPrice,
    new.day03=new.defaultPrice,
    new.day04=new.defaultPrice,
    new.day05=new.defaultPrice,
    new.day06=new.defaultPrice,
    new.day07=new.defaultPrice,
    new.day08=new.defaultPrice,
    new.day09=new.defaultPrice,
    new.day10=new.defaultPrice,
    new.day11=new.defaultPrice,
    new.day12=new.defaultPrice,
    new.day13=new.defaultPrice,
    new.day14=new.defaultPrice,
    new.day15=new.defaultPrice,
    new.day16=new.defaultPrice,
    new.day17=new.defaultPrice,
    new.day18=new.defaultPrice,
    new.day19=new.defaultPrice,
    new.day20=new.defaultPrice,
    new.day21=new.defaultPrice,
    new.day22=new.defaultPrice,
    new.day23=new.defaultPrice,
    new.day24=new.defaultPrice,
    new.day25=new.defaultPrice,
    new.day26=new.defaultPrice,
    new.day27=new.defaultPrice,
    new.day28=new.defaultPrice,
    new.day29=new.defaultPrice,
    new.day30=new.defaultPrice ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`roomprice_AFTER_UPDATE` before UPDATE ON `roomprice` FOR EACH ROW
BEGIN
    if old.defaultPrice!= new.defaultPrice  then 
    set new.day00=new.defaultPrice,
    new.day01=new.defaultPrice,
    new.day02=new.defaultPrice,
    new.day03=new.defaultPrice,
    new.day04=new.defaultPrice,
    new.day05=new.defaultPrice,
    new.day06=new.defaultPrice,
    new.day07=new.defaultPrice,
    new.day08=new.defaultPrice,
    new.day09=new.defaultPrice,
    new.day10=new.defaultPrice,
    new.day11=new.defaultPrice,
    new.day12=new.defaultPrice,
    new.day13=new.defaultPrice,
    new.day14=new.defaultPrice,
    new.day15=new.defaultPrice,
    new.day16=new.defaultPrice,
    new.day17=new.defaultPrice,
    new.day18=new.defaultPrice,
    new.day19=new.defaultPrice,
    new.day20=new.defaultPrice,
    new.day21=new.defaultPrice,
    new.day22=new.defaultPrice,
    new.day23=new.defaultPrice,
    new.day24=new.defaultPrice,
    new.day25=new.defaultPrice,
    new.day26=new.defaultPrice,
    new.day27=new.defaultPrice,
    new.day28=new.defaultPrice,
    new.day29=new.defaultPrice,
    new.day30=new.defaultPrice ;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` varchar(10) DEFAULT NULL,
  `accountName` varchar(30) DEFAULT 'User',
  `password` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT 'User',
  `contact` varchar(30) DEFAULT NULL,
  `portrait` varchar(50) DEFAULT NULL,
  `creditValue` bigint(20) DEFAULT NULL,
  `memberType` tinyint(4) DEFAULT NULL,
  `memberInfo` varchar(30) DEFAULT NULL,
  `rank` smallint(6) DEFAULT NULL,
  `hotelID` int(10) unsigned zerofill DEFAULT NULL,
  `workID` varchar(30) DEFAULT NULL,
  KEY `user_idx` (`hotelID`),
  CONSTRAINT `user` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webpromotion`
--

DROP TABLE IF EXISTS `webpromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webpromotion` (
  `webPromotionID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `webPromotionType` tinyint(4) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `startDate` date DEFAULT '2000-01-01',
  `endDate` date DEFAULT '2050-01-01',
  `minRankAvailable` int(11) DEFAULT '1',
  `maxRankAvailable` int(11) DEFAULT '10',
  `regionAvailableList` varchar(3003) DEFAULT '000',
  PRIMARY KEY (`webPromotionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webpromotion`
--

LOCK TABLES `webpromotion` WRITE;
/*!40000 ALTER TABLE `webpromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `webpromotion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-03 19:47:37
