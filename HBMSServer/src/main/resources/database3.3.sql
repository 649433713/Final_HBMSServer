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
  `orderID` int(10) unsigned zerofill NOT NULL,
  `appealTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `userID` int(10) unsigned zerofill NOT NULL,
  `webMarketerID` int(10) unsigned zerofill DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `appealState` tinyint(4) DEFAULT '0' COMMENT 'Undealt   0\nSuccess  1\nFailure  2',
  `price` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`appealID`),
  KEY `userKey_idx` (`userID`),
  KEY `orderKey_idx` (`orderID`),
  KEY `webmarketerKey_idx` (`webMarketerID`),
  CONSTRAINT `orderKey` FOREIGN KEY (`orderID`) REFERENCES `orderlist` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userKey` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `webmarketerKey` FOREIGN KEY (`webMarketerID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appeal`
--

LOCK TABLES `appeal` WRITE;
/*!40000 ALTER TABLE `appeal` DISABLE KEYS */;
INSERT INTO `appeal` VALUES (0000000001,0000000010,'2000-01-01 00:00:00',0000000001,NULL,'不服',0,NULL),(0000000002,0000000010,'2016-12-11 21:03:30',0000000001,NULL,'不服',0,NULL),(0000000003,0000000037,'2016-12-20 00:46:08',0000000008,NULL,'申诉玩玩',0,NULL);
/*!40000 ALTER TABLE `appeal` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`appeal_BEFORE_INSERT` BEFORE INSERT ON `appeal` FOR EACH ROW
BEGIN
    set new.price = (select price from orderlist where orderlist.orderID = new.orderID);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`appeal_AFTER_INSERT` AFTER INSERT ON `appeal` FOR EACH ROW
BEGIN
    update orderlist set orderstate = 4 where orderlist.orderID = new.orderID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`appeal_AFTER_UPDATE` AFTER UPDATE ON `appeal` FOR EACH ROW
BEGIN
    if new.appealState=1 and old.appealState!=1 then
     update orderlist set orderState = 3 where orderlist.orderID = new.orderID;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;

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
  `picture1` varchar(100) DEFAULT NULL,
  `picture2` varchar(100) DEFAULT NULL,
  `picture3` varchar(100) DEFAULT NULL,
  `orderID` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `hotelID_idx` (`hotelID`),
  KEY `orderID_idx` (`orderID`),
  CONSTRAINT `hotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentinfo`
--

LOCK TABLES `commentinfo` WRITE;
/*!40000 ALTER TABLE `commentinfo` DISABLE KEYS */;
INSERT INTO `commentinfo` VALUES (0000000001,'2016-12-20 11:27:58',0000000128,9,'就是测试一下',NULL,NULL,NULL,0000000001),(0000000002,'2016-12-20 11:27:58',0000000128,8,'test',NULL,NULL,NULL,0000000001),(0000000003,'2016-12-20 11:27:58',0000000128,7,'test',NULL,NULL,NULL,0000000001),(0000000004,'2016-12-20 11:27:58',0000000128,6,NULL,NULL,NULL,NULL,0000000001),(0000000005,'2016-12-20 11:27:58',0000000128,7,NULL,NULL,NULL,NULL,0000000001),(0000000006,'2016-12-20 11:27:58',0000000120,8,'great',NULL,NULL,NULL,0000000001);
/*!40000 ALTER TABLE `commentinfo` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`commentinfo_AFTER_INSERT` AFTER INSERT ON `commentinfo` FOR EACH ROW
BEGIN
    update hotel set score = (select format(avg(score),2) from commentinfo where hotelID = new.hotelID) where hotel.hotelID = new.hotelID;
    update orderlist set orderState = 5 where new.orderID = orderlist.orderID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `creditrecord`
--

DROP TABLE IF EXISTS `creditrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditrecord` (
  `creditRecordID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int(10) unsigned zerofill NOT NULL,
  `reasonType` tinyint(4) DEFAULT NULL COMMENT '0 成功订单  1 取消订单 2 异常订单 3 充值 ',
  `amount` bigint(20) DEFAULT NULL,
  `orderID` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`creditRecordID`),
  KEY `userID _idx` (`userID`),
  KEY `orderID_idx` (`orderID`),
  CONSTRAINT `orderID` FOREIGN KEY (`orderID`) REFERENCES `orderlist` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userID ` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditrecord`
--

LOCK TABLES `creditrecord` WRITE;
/*!40000 ALTER TABLE `creditrecord` DISABLE KEYS */;
INSERT INTO `creditrecord` VALUES (0000000001,'2016-12-09 14:56:34',0000000001,0,333,0000000006),(0000000002,'2016-12-09 15:01:48',0000000001,3,222,0000000019),(0000000003,'2016-12-09 15:01:48',0000000001,0,222,0000000019),(0000000004,'2016-12-09 15:03:36',0000000001,2,-333,0000000005),(0000000005,'2016-12-09 15:26:57',0000000001,0,333,0000000004),(0000000006,'2016-12-09 15:27:28',0000000001,2,-333,0000000003),(0000000007,'2016-12-09 15:27:54',0000000001,3,333,0000000003),(0000000008,'2016-12-09 15:27:54',0000000001,0,333,0000000003),(0000000009,'2016-12-18 10:00:00',0000000001,2,-333,0000000002),(0000000010,'2016-12-18 10:00:00',0000000001,2,-333,0000000020),(0000000011,'2016-12-18 10:00:00',0000000001,2,-333,0000000021),(0000000012,'2016-12-18 10:00:00',0000000001,2,-333,0000000022),(0000000013,'2016-12-18 10:00:00',0000000001,2,-333,0000000023),(0000000014,'2016-12-18 10:00:00',0000000001,2,-333,0000000024),(0000000015,'2016-12-18 10:00:00',0000000001,2,-333,0000000025),(0000000016,'2016-12-18 10:00:00',0000000001,2,-333,0000000026),(0000000017,'2016-12-18 10:00:00',0000000001,2,-333,0000000027),(0000000018,'2016-12-18 10:00:00',0000000001,2,-333,0000000028),(0000000019,'2016-12-18 10:00:00',0000000001,2,-333,0000000029),(0000000020,'2016-12-18 10:00:00',0000000001,2,-333,0000000030),(0000000021,'2016-12-18 10:00:00',0000000001,2,-333,0000000031),(0000000022,'2016-12-18 10:00:00',0000000001,2,-333,0000000032),(0000000023,'2016-12-18 10:00:00',0000000001,2,-333,0000000033),(0000000024,'2016-12-18 10:00:00',0000000001,2,-333,0000000034),(0000000025,'2016-12-18 12:15:41',0000000001,3,22,NULL);
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
  `environment1` varchar(100) DEFAULT NULL,
  `environment2` varchar(100) DEFAULT NULL,
  `environment3` varchar(100) DEFAULT NULL,
  `facility` varchar(200) DEFAULT NULL,
  `score` double(3,2) DEFAULT NULL,
  `lowestPrice` int(11) DEFAULT NULL,
  `accountName` varchar(100) NOT NULL DEFAULT '暂无',
  PRIMARY KEY (`hotelID`),
  KEY `region_idx` (`region`),
  KEY `region_idx2` (`region`),
  CONSTRAINT `region` FOREIGN KEY (`region`) REFERENCES `region` (`regionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (0000000001,'如家连锁酒店','13 Nanjing Rd.',0000000001,'a very expensive hotel',3,NULL,NULL,NULL,'feel like living in your own home, but a little bit noisy',3.00,0,'暂无'),(0000000002,'７天连锁酒店','120 Nanjing Rd.',0000000001,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000003,'君悦大酒店','648 Nanjing Rd.',0000000001,'a holy-expensive hotel, built in 1900',5,NULL,NULL,NULL,'we call it royal, what else can you imagine?',5.00,0,'暂无'),(0000000004,'格林豪泰连锁酒店','1 Yunnan Rd.',0000000001,'a fundamentally equipped hotel, and the service is of standard',2,NULL,NULL,NULL,'basically equipped, standardized service provided',4.00,0,'暂无'),(0000000005,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000002,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000006,'君悦大酒店','648 Tianyaoqiao Rd.',0000000002,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000007,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000002,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000008,'７天连锁酒店','120 Zhaojiabang Rd.',0000000002,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000009,'希尔顿酒店','6610 W. Nanjing Rd.',0000000003,'a holy-expensive hotel, never try without a moderate wallet',5,NULL,NULL,NULL,'maybe the most fantastic furnish in Shanghai',4.00,0,'暂无'),(0000000010,'汉庭连锁酒店','800 W. Nanjing Rd.',0000000003,'a very cheap chain hotel',2,NULL,NULL,NULL,'best choice for tourists from nearby cities',5.00,0,'暂无'),(0000000011,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000004,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000012,'君悦大酒店','648 Tianyaoqiao Rd.',0000000004,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000013,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000004,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000014,'７天连锁酒店','120 Zhaojiabang Rd.',0000000004,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000015,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000005,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000016,'君悦大酒店','648 Tianyaoqiao Rd.',0000000005,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000017,'速８连锁酒店','123 S. Wanping Rd.',0000000005,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000018,'７天连锁酒店','120 Zhaojiabang Rd.',0000000005,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000019,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000006,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000021,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000006,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000022,'希尔顿酒店','120 Zhaojiabang Rd.',0000000006,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000023,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000007,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000024,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000007,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000025,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000007,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000026,'７天连锁酒店','120 Zhaojiabang Rd.',0000000007,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',5.00,0,'暂无'),(0000000027,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000008,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000028,'君悦大酒店','648 Tianyaoqiao Rd.',0000000008,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000029,'速８连锁酒店','123 S. Wanping Rd.',0000000008,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000030,'希尔顿酒店','120 Zhaojiabang Rd.',0000000008,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000031,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000009,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000032,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000009,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000033,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000009,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000034,'７天连锁酒店','120 Zhaojiabang Rd.',0000000009,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000035,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000010,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000036,'君悦大酒店','648 Tianyaoqiao Rd.',0000000010,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000037,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000010,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000038,'７天连锁酒店','120 Zhaojiabang Rd.',0000000010,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',5.00,0,'暂无'),(0000000039,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000011,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000040,'君悦大酒店','648 Tianyaoqiao Rd.',0000000011,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000041,'速８连锁酒店','123 S. Wanping Rd.',0000000011,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000042,'７天连锁酒店','120 Zhaojiabang Rd.',0000000011,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000043,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000012,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',5.00,0,'暂无'),(0000000044,'君悦大酒店','648 Tianyaoqiao Rd.',0000000012,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000045,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000012,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000046,'希尔顿酒店','120 Zhaojiabang Rd.',0000000012,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000047,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000013,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000048,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000013,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000049,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000013,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',5.00,0,'暂无'),(0000000050,'７天连锁酒店','120 Zhaojiabang Rd.',0000000013,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000051,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000014,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000052,'君悦大酒店','648 Tianyaoqiao Rd.',0000000014,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000053,'速８连锁酒店','123 S. Wanping Rd.',0000000014,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000054,'希尔顿酒店','120 Zhaojiabang Rd.',0000000014,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000055,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000015,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000056,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000015,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000057,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000015,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000058,'７天连锁酒店','120 Zhaojiabang Rd.',0000000015,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',5.00,0,'暂无'),(0000000059,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000016,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000060,'君悦大酒店','648 Tianyaoqiao Rd.',0000000016,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000061,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000016,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000062,'７天连锁酒店','120 Zhaojiabang Rd.',0000000016,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000063,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000017,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000064,'君悦大酒店','648 Tianyaoqiao Rd.',0000000017,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000065,'速８连锁酒店','123 S. Wanping Rd.',0000000017,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000066,'７天连锁酒店','120 Zhaojiabang Rd.',0000000017,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000067,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000018,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000068,'君悦大酒店','648 Tianyaoqiao Rd.',0000000018,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000069,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000018,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000070,'希尔顿酒店','120 Zhaojiabang Rd.',0000000018,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000071,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000019,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',5.00,0,'暂无'),(0000000072,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000019,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000073,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000019,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000074,'７天连锁酒店','120 Zhaojiabang Rd.',0000000019,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000075,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000020,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000076,'君悦大酒店','648 Tianyaoqiao Rd.',0000000020,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000077,'速８连锁酒店','123 S. Wanping Rd.',0000000020,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000078,'希尔顿酒店','120 Zhaojiabang Rd.',0000000020,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',5.00,0,'暂无'),(0000000079,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000021,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000080,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000021,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000081,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000021,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000082,'７天连锁酒店','120 Zhaojiabang Rd.',0000000021,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000083,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000022,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000084,'君悦大酒店','648 Tianyaoqiao Rd.',0000000022,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000085,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000022,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000086,'７天连锁酒店','120 Zhaojiabang Rd.',0000000022,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',5.00,0,'暂无'),(0000000087,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000023,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000088,'君悦大酒店','648 Tianyaoqiao Rd.',0000000023,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000089,'速８连锁酒店','123 S. Wanping Rd.',0000000023,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000090,'７天连锁酒店','120 Zhaojiabang Rd.',0000000023,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000091,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000024,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000092,'君悦大酒店','648 Tianyaoqiao Rd.',0000000024,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000093,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000024,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000094,'希尔顿酒店','120 Zhaojiabang Rd.',0000000024,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000095,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000025,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',5.00,0,'暂无'),(0000000096,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000025,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000097,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000025,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000098,'７天连锁酒店','120 Zhaojiabang Rd.',0000000025,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000099,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000026,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000100,'君悦大酒店','648 Tianyaoqiao Rd.',0000000026,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000101,'速８连锁酒店','123 S. Wanping Rd.',0000000026,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000102,'希尔顿酒店','120 Zhaojiabang Rd.',0000000026,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000103,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000027,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',3.00,0,'暂无'),(0000000104,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000027,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000105,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000027,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000106,'７天连锁酒店','120 Zhaojiabang Rd.',0000000027,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',5.00,0,'暂无'),(0000000107,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000028,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',5.00,0,'暂无'),(0000000108,'君悦大酒店','648 Tianyaoqiao Rd.',0000000028,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000109,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000028,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',3.00,0,'暂无'),(0000000110,'希尔顿酒店','120 Zhaojiabang Rd.',0000000028,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',3.00,0,'暂无'),(0000000111,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000029,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',5.00,0,'暂无'),(0000000112,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000029,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000113,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000029,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000114,'７天连锁酒店','120 Zhaojiabang Rd.',0000000029,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000115,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000030,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000116,'君悦大酒店','648 Tianyaoqiao Rd.',0000000030,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000118,'希尔顿酒店','120 Zhaojiabang Rd.',0000000030,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,23,'暂无'),(0000000119,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000031,'a secret garden hidden inside of the downtown',3,'hhhh',NULL,NULL,'environment is not good',2.00,222,'暂无'),(0000000120,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',8.00,290,'暂无'),(0000000121,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000031,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',5.00,0,'暂无'),(0000000122,'７天连锁酒店','120 Zhaojiabang Rd.',0000000031,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000123,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000032,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',5.00,0,'暂无'),(0000000124,'君悦大酒店','648 Tianyaoqiao Rd.',0000000032,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000125,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000032,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000126,'７天连锁酒店','120 Zhaojiabang Rd.',0000000032,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000127,'格林豪泰连锁酒店','100 Tianyaoqiao Rd.',0000000033,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',3.00,0,'暂无'),(0000000128,'君悦大酒店','648 Tianyaoqiao Rd.',0000000033,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',7.40,0,'暂无'),(0000000129,'速８连锁酒店','123 S. Wanping Rd.',0000000033,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000130,'７天连锁酒店','120 Zhaojiabang Rd.',0000000033,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',4.00,0,'暂无'),(0000000131,'速８连锁酒店','100 Tianyaoqiao Rd.',0000000034,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000132,'君悦大酒店','648 Tianyaoqiao Rd.',0000000034,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000133,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000034,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000134,'希尔顿酒店','120 Zhaojiabang Rd.',0000000034,'a very cheap hotel',3,NULL,NULL,NULL,'good enough, but a little bit noisy',5.00,0,'暂无'),(0000000135,'７天连锁酒店','100 Tianyaoqiao Rd.',0000000035,'a secret garden hidden inside of the downtown',3,NULL,NULL,NULL,'environment is not good',2.00,0,'暂无'),(0000000136,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000035,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000137,'格林豪泰连锁酒店','123 S. Wanping Rd.',0000000035,'a very cheap chain hotel',3,NULL,NULL,NULL,'maybe the service here is better than other chains',4.00,0,'暂无'),(0000000139,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000140,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000141,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000142,'希尔顿酒店','648 Tianyaoqiao Rd.',0000000031,'a holy-expensive hotel, built in 2016, symbolize the life of the rich',5,NULL,NULL,NULL,'everything is perfect except the traffic',4.00,0,'暂无'),(0000000143,'王凡的别墅','不可知之地',0000000001,'贼好就是找不到',5,'C:\\Users\\凡\\git\\Final_HBMSServer2\\HBMSServer\\res\\hotel\\143/picture1.jpg','C:\\Users\\凡\\git\\Final_HBMSServer2\\HBMSServer\\res\\hotel\\143/picture2.jpg','C:\\Users\\凡\\git\\Final_HBMSServer2\\HBMSServer\\res\\hotel\\143/picture3.jpg','啥都与',9.90,NULL,'大凡哥'),(0000000144,'王凡的别墅','不可知之地',0000000001,'贼好就是找不到',5,NULL,NULL,NULL,'啥都与',9.90,NULL,'大凡哥'),(0000000145,'王凡的别墅','不可知之地',0000000001,'贼好就是找不到',5,NULL,NULL,NULL,'啥都与',9.90,NULL,'大凡哥'),(0000000146,'王凡的别墅','不可知之地',0000000001,'贼好就是找不到',5,NULL,NULL,NULL,'啥都与',9.90,NULL,'大凡哥');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`hotel_AFTER_DELETE` AFTER DELETE ON `hotel` FOR EACH ROW
BEGIN
    delete from user where user.hotelID = old.hotelID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `orderID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned zerofill NOT NULL,
  `hotelID` int(10) unsigned zerofill NOT NULL,
  `roomInfoID` int(10) unsigned zerofill NOT NULL,
  `orderState` tinyint(4) DEFAULT '0' COMMENT 'Unexecuted  0\nExecuted  1\nAbnormal  2\nCancelled  3\nAppealing  4\nCommented 5',
  `generateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cancelTime` datetime DEFAULT NULL,
  `executeDDL` datetime DEFAULT NULL,
  `checkinTime` datetime DEFAULT NULL,
  `checkoutTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `hasChild` tinyint(4) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `orderOfHotelID_idx` (`hotelID`),
  KEY `oderOfUserID_idx` (`userID`),
  KEY `orderOfRoomInfoID_idx` (`roomInfoID`),
  CONSTRAINT `oderOfUserID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderOfHotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orderOfRoomInfoID` FOREIGN KEY (`roomInfoID`) REFERENCES `roominfo` (`roomInfoID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (0000000001,0000000001,0000000120,0000000007,1,'2016-12-06 09:20:23',NULL,'2016-12-06 18:00:00','2016-12-06 14:19:51','2016-12-06 17:59:03',2,0,168),(0000000002,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000003,0000000001,0000000120,0000000003,1,'2016-12-15 17:55:46',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000004,0000000001,0000000120,0000000003,1,'2016-12-15 17:55:46',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000005,0000000001,0000000120,0000000003,2,'2016-12-15 17:55:46',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000006,0000000001,0000000120,0000000003,1,'2016-12-15 17:55:46',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000007,0000000001,0000000120,0000000003,3,'2016-12-06 15:22:54','2016-12-06 23:22:54',NULL,NULL,NULL,2,1,333),(0000000008,0000000001,0000000120,0000000003,3,'2016-12-06 16:05:59','2016-12-07 00:05:59',NULL,NULL,NULL,2,1,333),(0000000009,0000000001,0000000120,0000000003,3,'2016-12-06 16:11:12','2016-12-07 00:11:12',NULL,NULL,NULL,2,1,333),(0000000010,0000000001,0000000120,0000000003,4,'2016-12-07 17:05:21',NULL,'2016-12-08 00:00:00',NULL,NULL,2,1,333),(0000000011,0000000001,0000000120,0000000003,2,'2016-12-08 06:50:03',NULL,'2016-12-08 00:00:00',NULL,NULL,2,1,333),(0000000012,0000000001,0000000120,0000000003,2,'2016-12-08 06:50:03',NULL,'2016-12-08 00:00:00',NULL,NULL,2,1,333),(0000000013,0000000001,0000000120,0000000009,2,'2016-12-08 06:50:03',NULL,'2016-12-08 00:00:00',NULL,NULL,2,1,333),(0000000014,0000000001,0000000120,0000000010,3,'2016-12-06 16:22:20','2016-12-07 00:22:20',NULL,NULL,NULL,2,1,333),(0000000015,0000000001,0000000120,0000000010,2,'2016-12-08 06:50:03',NULL,'2016-12-08 00:00:00',NULL,NULL,2,1,333),(0000000016,0000000001,0000000120,0000000018,3,'2016-12-06 17:02:26','2016-12-07 01:02:26',NULL,NULL,NULL,2,1,333),(0000000017,0000000001,0000000120,0000000018,2,'2016-12-07 13:47:38',NULL,'2016-12-07 18:00:00',NULL,NULL,2,1,333),(0000000018,0000000001,0000000120,0000000020,3,'2016-12-06 17:04:17','2016-12-07 01:04:17',NULL,NULL,NULL,2,1,333),(0000000019,0000000001,0000000120,0000000020,1,'2016-12-09 15:01:48',NULL,'2016-12-08 18:00:00',NULL,NULL,2,1,222),(0000000020,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000021,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000022,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000023,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000024,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000025,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000026,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 18:00:00',NULL,NULL,2,1,333),(0000000027,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000028,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000029,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000030,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000031,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000032,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000033,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000034,0000000001,0000000120,0000000003,2,'2016-12-18 10:00:00',NULL,'2016-12-16 00:00:00',NULL,NULL,2,1,333),(0000000035,0000000008,0000000119,0000000013,0,'2016-12-19 13:08:48',NULL,'2016-12-18 00:00:00',NULL,NULL,0,0,159),(0000000036,0000000008,0000000119,0000000014,0,'2016-12-19 16:32:11',NULL,'2016-12-19 00:00:00',NULL,NULL,0,0,159),(0000000037,0000000008,0000000119,0000000008,4,'2016-12-19 16:46:08',NULL,'2016-12-21 00:00:00',NULL,NULL,0,0,159),(0000000038,0000000008,0000000119,0000000013,0,'2016-12-19 16:48:01',NULL,'2016-12-19 18:00:00',NULL,NULL,0,0,159),(0000000039,0000000008,0000000119,0000000014,0,'2016-12-19 16:50:49',NULL,'2016-12-19 18:00:00',NULL,NULL,0,0,159),(0000000040,0000000008,0000000119,0000000021,0,'2016-12-19 17:24:26',NULL,'2016-12-19 18:00:00',NULL,NULL,0,0,159),(0000000041,0000000008,0000000119,0000000021,0,'2016-12-19 18:05:46',NULL,'2016-12-19 18:00:00',NULL,NULL,0,0,159),(0000000042,0000000008,0000000119,0000000010,0,'2016-12-19 18:17:49',NULL,'2016-12-19 18:00:00',NULL,NULL,0,0,211),(0000000043,0000000008,0000000119,0000000053,0,'2016-12-19 18:20:47',NULL,'2016-12-19 18:00:00',NULL,NULL,0,0,140),(0000000045,0000000008,0000000119,0000000013,0,'2016-12-19 18:29:07',NULL,'2016-12-20 18:00:00',NULL,NULL,0,0,159),(0000000046,0000000008,0000000119,0000000053,0,'2016-12-20 03:14:21',NULL,'2016-12-20 18:00:00',NULL,NULL,0,0,140),(0000000047,0000000008,0000000119,0000000014,0,'2016-12-20 03:15:02',NULL,'2016-12-20 18:00:00',NULL,NULL,0,0,159),(0000000048,0000000008,0000000119,0000000015,0,'2016-12-20 03:15:24',NULL,'2016-12-20 18:00:00',NULL,NULL,0,0,159);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`orderlist_BEFORE_INSERT` BEFORE INSERT ON `orderlist` FOR EACH ROW
BEGIN
    set new.executeDDL = DATE_ADD(new.executeDDL, INTERVAL +18 HOUR);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`orderlist_AFTER_UPDATE` AFTER UPDATE ON `orderlist` FOR EACH ROW
BEGIN
    if (new.orderState =1 and old.orderState!=1) then
    update roominfo set roomState =3,detailedInfo1 = new.checkinTime,detailedInfo2 =DATE_ADD(CURDATE(), INTERVAL +36 HOUR) where roominfo.roomInfoID=new.roomInfoID;
        if old.orderState=0 then
            update user set creditValue = creditValue+new.price where user.userID = new.userID;
            insert into creditrecord(userID,reasonType,amount,orderID) values(new.userID,0,new.price,new.orderID);
        end if;
        if old.orderState=2 then
            update user set creditValue = creditValue+new.price where user.userID = new.userID;
            insert into creditrecord(userID,reasonType,amount,orderID) values(new.userID,3,new.price,new.orderID);
            update user set creditValue = creditValue+new.price where user.userID = new.userID;
            insert into creditrecord(userID,reasonType,amount,orderID) values(new.userID,0,new.price,new.orderID);
        end if;
    else
        if new.checkoutTIme is not null and old.checkoutTime is null then
        update roominfo set roomState =1 where roominfo.roomInfoID=new.roomInfoID;
        end if;
    end if;
    if(new.orderState=2 and old.orderState!=2) then
        update user set creditValue = creditValue-new.price where user.userID = new.userID;
        insert into creditrecord(userID,reasonType,amount,orderID) values(new.userID,2,-new.price,new.orderID);
    end if;
    if(new.orderState=3 and old.orderState!=3) then
        if timestampdiff(hour,new.cancelTime,new.executeDDL)<6 then
            update user set creditValue = creditValue-new.price/2 where user.userID = new.userID;
            insert into creditrecord(userID,reasonType,amount,orderID) values(new.userID,1,-new.price/2,new.orderID);
        end if;
    end if;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `promotionID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `promotionType` tinyint(4) DEFAULT NULL COMMENT '0 为酒店促销 region为hotelID\n1 为网站促销 region为促销商圈',
  `region` int(10) unsigned zerofill NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `startDate` date DEFAULT '2000-01-01',
  `endDate` date DEFAULT '2030-01-01',
  `minRankAvailable` int(11) DEFAULT '1',
  `maxRankAvailable` int(11) DEFAULT '10',
  `type` tinyint(4) NOT NULL COMMENT '如果是0，discount 为满减优惠具体金额\n如果是1，discount为打折优惠折扣（eg：95折存95）',
  `requirement` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL,
  PRIMARY KEY (`promotionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `rank` tinyint(4) NOT NULL,
  `discount` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  UNIQUE KEY `rank_UNIQUE` (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (0,100,0),(1,98,500),(2,96,1500),(3,93,3000),(4,90,6000),(5,85,10000),(6,80,25000),(7,70,50000);
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`rank_AFTER_UPDATE` AFTER UPDATE ON `rank` FOR EACH ROW
BEGIN
    set @i = (select max(userID) from user);
      set @j=0;
      while @j<@i do
          set @value = (select creditValue from user where userID = @j);
          call setRank(@value,@out);
          update user set rank = @out where userID = @j;
          set @j=@j+1;
      end while;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `roomdate` VALUES (0000000001,'2016-12-20',0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000008,'2016-12-20',0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000009,'2016-12-20',0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000010,'2016-12-20',0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000011,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000012,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000013,'2016-12-20',0,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000014,'2016-12-20',0,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000015,'2016-12-20',1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000016,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000017,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000018,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000019,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000020,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000021,'2016-12-20',0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000022,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000023,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000024,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000025,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000026,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000027,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000028,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000029,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000030,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000031,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000032,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000033,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000034,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000035,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000036,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000037,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000038,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000039,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000040,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000041,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000042,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000043,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000044,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000045,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000046,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000047,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000048,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000049,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000050,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000051,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000052,'2016-12-20',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(0000000053,'2016-12-20',0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1);
/*!40000 ALTER TABLE `roomdate` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`roomdate_AFTER_UPDATE` AFTER UPDATE ON `roomdate` FOR EACH ROW
BEGIN
    if old.day00 = 1 and new.day00 =0 then
        update roominfo set roomState=2, detailedInfo1=DATE_ADD(CURDATE(), INTERVAL +12 HOUR),detailedInfo2=null where roominfo.roominfoID = new.roominfoID; 
        end if;
        
    if old.day00 = 0 and new.day00 =1 then
        if (select roomState from roominfo where roominfo.roomInfoID = new.roomInfoID) = 2 then
            update roominfo set roomState = 1 where roominfo.roomInfoID = new.roomInfoID;
        end if;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `roomState` tinyint(4) DEFAULT '1' COMMENT 'Unavailable  0\nBlank  1\nBooked  2 \nCheckined  3',
  `detailedInfo1` datetime DEFAULT NULL COMMENT ' 对于Checkined状态，包含入住时间.\n 对于Blank状态，null。\n 对于Booked，包含预计入住时间（当天12点）',
  `detailedInfo2` datetime DEFAULT NULL COMMENT ' 对于Checkined状态，包含预计离开时间（第二天12点）.\n 对于Blank状态，包含实际离开时间。\n 对于Booked，null',
  PRIMARY KEY (`roomInfoID`),
  KEY `hotelID_idx` (`hotelID`),
  KEY `hotelID_idx2` (`hotelID`),
  CONSTRAINT `roomOfHotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roominfo`
--

LOCK TABLES `roominfo` WRITE;
/*!40000 ALTER TABLE `roominfo` DISABLE KEYS */;
INSERT INTO `roominfo` VALUES (0000000001,0000000120,'888','豪华大床房',290,3,'2016-12-06 14:19:51','2016-12-01 21:14:39'),(0000000003,0000000120,'888','豪华大床房',1222,3,NULL,'2016-12-10 12:00:00'),(0000000005,0000000120,'888','豪华大床房',300,3,'2016-12-06 14:19:51','2016-12-01 00:00:00'),(0000000007,0000000120,'888','豪华大床房',300,1,NULL,'2016-12-06 17:20:23'),(0000000008,0000000119,'665','测试房',160,3,'2016-12-06 14:19:51',NULL),(0000000009,0000000119,'666','测试房2',222,2,'2016-12-20 12:00:00',NULL),(0000000010,0000000119,'666','测试房2',211,2,'2016-12-20 12:00:00',NULL),(0000000011,0000000119,'666','测试房2',222,2,'2016-12-19 12:00:00',NULL),(0000000012,0000000119,'666','测试房2',222,2,'2016-12-19 12:00:00',NULL),(0000000013,0000000119,'666','测试房',222,2,'2016-12-20 12:00:00',NULL),(0000000014,0000000119,'666','测试房',222,2,'2016-12-20 12:00:00',NULL),(0000000015,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000016,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000017,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000018,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000019,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000020,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000021,0000000119,'666','测试房',159,2,'2016-12-20 12:00:00',NULL),(0000000022,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000023,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000024,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000025,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000026,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000027,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000028,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000029,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000030,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000031,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000032,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000033,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000034,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000035,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000036,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000037,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000038,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000039,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000040,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000041,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000042,0000000119,'666','测试房',222,2,'2016-12-19 12:00:00',NULL),(0000000043,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000044,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000045,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000046,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000047,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000048,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000049,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000050,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000051,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000052,0000000118,'2322','sfsfs',23,2,'2016-12-19 12:00:00',NULL),(0000000053,0000000119,'222','测试房3',140,2,'2016-12-20 12:00:00',NULL);
/*!40000 ALTER TABLE `roominfo` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
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
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`roominfo_BEFORE_UPDATE` BEFORE UPDATE ON `roominfo` FOR EACH ROW
BEGIN
    if new.roomState=1 and old.roomState=3 then
        update orderlist set checkoutTime = now() where orderlist.roomInfoID = new.roomInfoID and executeDDL=DATE_ADD(CURDATE(), INTERVAL -6 HOUR);
        if (select day00 from roomdate where roomdate.roomInfoID=new.roomInfoID)=0 then
        set new.roomState=2, new.detailedInfo1=DATE_ADD(CURDATE(), INTERVAL +12 HOUR),new.detailedInfo2=null;
        else set new.detailedInfo1=null,new.detailedInfo2 = now();
        end if;
    
    
    else if new.roomState=1 and old.roomState!=new.roomState then
        set new.detailedInfo1=null,new.detailedInfo2=null;
    end if;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
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
            if old.roomState=0 then
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
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;

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
INSERT INTO `roomprice` VALUES (0000000001,'2016-12-20',290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290),(0000000003,'2016-12-20',1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222,1222),(0000000005,'2016-12-20',142,0,0,0,0,0,0,0,0,0,0,0,0,300,0,0,110,0,0,0,0,0,0,0,0,0,0,0,0,0,0,142),(0000000008,'2016-12-20',160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160),(0000000009,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000010,'2016-12-20',211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211),(0000000011,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000012,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000013,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000014,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000015,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000016,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000017,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000018,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000019,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000020,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000021,'2016-12-20',159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159),(0000000022,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000023,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000024,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000025,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000026,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000027,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000028,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000029,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000030,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000031,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000032,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000033,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000034,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000035,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000036,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000037,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000038,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000039,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000040,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000041,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000042,'2016-12-20',222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222),(0000000043,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000044,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000045,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000046,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000047,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000048,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000049,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000050,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000051,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000052,'2016-12-20',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000053,'2016-12-20',140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140);
/*!40000 ALTER TABLE `roomprice` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
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
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
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
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userType` tinyint(4) NOT NULL DEFAULT '4',
  `accountName` varchar(100) NOT NULL DEFAULT 'User',
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT 'User',
  `contact` varchar(100) DEFAULT NULL,
  `portrait` varchar(100) DEFAULT NULL,
  `creditValue` bigint(20) DEFAULT NULL,
  `memberType` tinyint(4) DEFAULT NULL,
  `memberInfo` varchar(30) DEFAULT NULL COMMENT '对于非会员，企业/个人信息为空，对于普通会员，企业/个人信息为生日，对于企业会员，企业/会员信息为工作单位',
  `rank` smallint(6) DEFAULT NULL,
  `hotelID` int(10) unsigned zerofill DEFAULT NULL,
  `workID` varchar(30) DEFAULT NULL,
  `isOn` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `accountName_UNIQUE` (`accountName`),
  KEY `user_idx` (`hotelID`),
  CONSTRAINT `user` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0000000001,0,'旖旎丶F','CE1A3C825365C16F45B867F3D163C1E8','王凡','15996262016',NULL,20679,2,'南京大学',5,NULL,NULL,0),(0000000003,0,'das','fdsf','fsf','sff',NULL,12,1,'sdfs',0,NULL,NULL,0),(0000000004,1,'68BF7764211A940EEC708C7EA029FFFC','76E6E3622BC88F3387761EF635D1B7F7','0660CE474129E0CE8D4E55E8E0E927F6','19294D4009CB429AD838AF1D1DDD9ED1',NULL,0,0,'null',0,0000000120,NULL,0),(0000000006,3,'14806ADF6C8DADB79B35BA0364E44889','76E6E3622BC88F3387761EF635D1B7F7','0660CE474129E0CE8D4E55E8E0E927F6','19294D4009CB429AD838AF1D1DDD9ED1','C:\\Users\\凡\\git\\Final_HBMSServer2\\HBMSServer\\res\\user\\6/portrait6.jpg',0,0,NULL,0,NULL,NULL,0),(0000000007,2,'B85F1A8A46D4DEF873234B32338E61B2','76E6E3622BC88F3387761EF635D1B7F7','0660CE474129E0CE8D4E55E8E0E927F6','19294D4009CB429AD838AF1D1DDD9ED1','C:\\Users\\凡\\git\\Final_HBMSServer2\\HBMSServer\\res\\user\\7/portrait7.jpg',0,0,NULL,0,NULL,NULL,0),(0000000008,0,'6F8064BFCA604623F3ECBFCDD99C2276','2F376BF97356119F6BAC44CB55653B58','5D6F0FA66359C8BB192CBD87137F156B',NULL,'C:\\Users\\凡\\git\\Final_HBMSServer2\\HBMSServer\\res\\user\\8/portrait8.jpg',50,0,NULL,1,NULL,NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `hbmsdatabase`.`user_BEFORE_UPDATE` BEFORE UPDATE ON `user` FOR EACH ROW
BEGIN
    if new.creditValue!=old.creditValue then
        call setRank(new.creditValue,@rank);
        set new.rank = @rank;
     end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'hbmsdatabase'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `updateOrderState` */;
DELIMITER ;;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`admin`@`%`*/ /*!50106 EVENT `updateOrderState` ON SCHEDULE EVERY 1 DAY STARTS '2016-12-08 18:00:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
CALL updateOrderState();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;;
/*!50106 DROP EVENT IF EXISTS `updateRoom` */;;
DELIMITER ;;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`admin`@`%`*/ /*!50106 EVENT `updateRoom` ON SCHEDULE EVERY 1 DAY STARTS '2016-12-09 00:00:30' ON COMPLETION PRESERVE ENABLE DO BEGIN
CALL updateRoomDate();
call updateRoomPrice();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'hbmsdatabase'
--
/*!50003 DROP PROCEDURE IF EXISTS `getLowestPrice` */;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `getLowestPrice`(in hotelID int,in difference varchar(40))
BEGIN
	
	SET @v_sql=CONCAT('select min(', difference,') from (select roomInfoID from roominfo where roominfo.hotelID = ',hotelID,') temp inner join roomprice on temp.roomInfoID = roomprice.roomInfoID');
    
    prepare test from @v_sql;

    execute test;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `setRank` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `setRank`(in creditValue int,out newRank int)
BEGIN
	set@rank0 = (select value from rank where rank.rank =0) ;
    set@rank1 = (select value from rank where rank.rank =1) ;
    set@rank2 = (select value from rank where rank.rank =2) ;
    set@rank3 = (select value from rank where rank.rank =3) ;
    set@rank4 = (select value from rank where rank.rank =4) ;
    set@rank5 = (select value from rank where rank.rank =5) ;
    set@rank6 = (select value from rank where rank.rank =6) ;
    set@rank7 = (select value from rank where rank.rank =7) ;
	
	set newRank =0;
    if (creditValue>=@rank1 and creditValue<@rank2) then
		set newRank=1;
    elseif (creditValue>=@rank2 and creditValue<@rank3) then
		set newRank=2;
	elseif (creditValue>=@rank3 and creditValue<@rank4) then
		set newRank=3;
	elseif (creditValue>=@rank4 and creditValue<@rank5)then
		set newRank=4;
	elseif (creditValue>=@rank5 and creditValue<@rank6) then
		set newRank=5;
	elseif (creditValue>=@rank6 and creditValue<@rank7) then
		set newRank=6;
	elseif (creditValue>=@rank7) then
		set newRank=7;

	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testCall` */;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `testCall`(in difference varchar(40))
BEGIN
	set @temp = concat("select min(",difference,") curPrice,hotelID from roomprice inner join roominfo on roomprice.roomInfoID = roominfo.roomInfoID group by hotelID");
	prepare stmt from @temp;
    execute stmt;
    deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLowestPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `updateLowestPrice`(in difference varchar(40))
BEGIN
	set @temp = concat(" update hotel inner join (select hotelID,min(defaultPrice) price from ((select hotel.hotelID hotelID,roominfo.roomInfoID hh,defaultPrice 
from hotel inner join roominfo on roominfo.hotelID = hotel.hotelID)temp inner join roomdate on hh = roomdate.roomInfoID)where ",difference," =1 group by hotelID)temp2 
set lowestPrice = price where hotel.hotelID = temp2.hotelID");
    prepare stmt from @temp;
    execute stmt;
    deallocate prepare stmt;
	
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateOrderState` */;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `updateOrderState`()
BEGIN
	
    update orderlist set orderState = 2 where now()>=executeDDL and orderState =0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `updateRoomDate` */;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `updateRoomDate`()
BEGIN
	update roomdate set curDay = curdate(),
    day00 = day01,
    day01 = day02,
    day02 = day03,
    day03 = day04,
    day04 = day05,
    day05 = day06,
	day06 = day07,
    day07 = day08,
    day08 = day09,
    day09 = day10,
    day10 = day11,
    day11 = day12,
    day12 = day13,
    day13 = day14,
    day14 = day15,
    day15 = day16,
    day16 = day17,
    day17 = day18,
    day18 = day19,
    day19 = day20,
    day20 = day21,
    day21 = day22,
    day22 = day23,
    day23 = day24,
    day24 = day25,
    day25 = day26,
	day26 = day27,
    day27 = day28,
    day28 = day29,
    day29 = day30,
    day30 = 1
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `updateRoomPrice` */;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `updateRoomPrice`()
BEGIN

update roomprice set curDay = curdate(),
    day00 = day01,
    day01 = day02,
    day02 = day03,
    day03 = day04,
    day04 = day05,
    day05 = day06,
	day06 = day07,
    day07 = day08,
    day08 = day09,
    day09 = day10,
    day10 = day11,
    day11 = day12,
    day12 = day13,
    day13 = day14,
    day14 = day15,
    day15 = day16,
    day16 = day17,
    day17 = day18,
    day18 = day19,
    day19 = day20,
    day20 = day21,
    day21 = day22,
    day22 = day23,
    day23 = day24,
    day24 = day25,
    day25 = day26,
	day26 = day27,
    day27 = day28,
    day28 = day29,
    day29 = day01,
    day30 = defaultPrice; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `hbmsdatabase` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-21 17:50:17
