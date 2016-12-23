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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appeal`
--

LOCK TABLES `appeal` WRITE;
/*!40000 ALTER TABLE `appeal` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentinfo`
--

LOCK TABLES `commentinfo` WRITE;
/*!40000 ALTER TABLE `commentinfo` DISABLE KEYS */;
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
  `userID` int(10) unsigned zerofill DEFAULT NULL,
  `reasonType` tinyint(4) DEFAULT NULL COMMENT '0 成功订单  1 取消订单 2 异常订单 3 充值 ',
  `amount` bigint(20) DEFAULT NULL,
  `orderID` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`creditRecordID`),
  KEY `orderID_idx` (`orderID`),
  CONSTRAINT `orderID` FOREIGN KEY (`orderID`) REFERENCES `orderlist` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditrecord`
--

LOCK TABLES `creditrecord` WRITE;
/*!40000 ALTER TABLE `creditrecord` DISABLE KEYS */;
INSERT INTO `creditrecord` VALUES (0000000001,'2016-12-23 02:00:41',0000000022,3,200,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (0000000001,'谢振宇狗舍','九乡河河畔延小溪西行百二十步',0000000036,'我就是傻乐儿！！！',1,'res/hotel/1/picture1.jpg',NULL,NULL,NULL,0.00,10,'Xie223'),(0000000002,'伍俊的茅草屋','谢振宇狗舍旁边',0000000036,NULL,2,'res/hotel/2/picture1.jpg',NULL,NULL,NULL,0.00,20,'小俊2'),(0000000003,'越明的平房','伍俊的茅草屋旁边',0000000036,NULL,3,'res/hotel/3/picture1.jpg',NULL,NULL,NULL,0.00,37,'越明'),(0000000004,'王凡的别墅','包围狗舍茅草屋平房',0000000036,'别问我九乡河怎么看海\n我家楼高的不行',5,'res/hotel/4/picture1.jpg',NULL,NULL,NULL,0.00,2000,'大凡哥'),(0000000005,'王凡的别墅2','包围狗舍茅草屋平房（没有对比就没有伤害）',0000000036,'加房间加的累了',5,'res/hotel/5/picture1.jpg',NULL,NULL,NULL,0.00,9999,'大凡哥2'),(0000000008,'王凡的别墅5','包围狗舍茅草屋平房（没有对比就没有伤害',0000000036,'只有软工二满分的人才能住，或者请主人吃饭',5,NULL,NULL,NULL,'啥都有啊，想入非非，浮想联翩，遐想无限',5.00,9999,'大凡哥5'),(0000000009,'王凡的别墅6','包围狗舍茅草屋平房（没有对比就没有伤害',0000000036,'只有软工二满分的人才能住，或者请主人吃饭',5,NULL,NULL,NULL,'啥都有啊，想入非非，浮想联翩，遐想无限',5.00,9999,'大凡哥6'),(0000000010,'王凡的别墅7','包围狗舍茅草屋平房（没有对比就没有伤害',0000000036,'只有软工二满分的人才能住，或者请主人吃饭',5,NULL,NULL,NULL,'啥都有啊，想入非非，浮想联翩，遐想无限',5.00,9999,'大凡哥7'),(0000000011,'王凡的别墅8','包围狗舍茅草屋平房（没有对比就没有伤害',0000000036,'只有软工二满分的人才能住，或者请主人吃饭',5,NULL,NULL,NULL,'啥都有啊，想入非非，浮想联翩，遐想无限',5.00,9999,'大凡哥8'),(0000000012,'王凡的别墅9','包围狗舍茅草屋平房（没有对比就没有伤害',0000000036,'只有软工二满分的人才能住，或者请主人吃饭',5,NULL,NULL,NULL,'啥都有啊，想入非非，浮想联翩，遐想无限',5.00,9999,'大凡哥9');
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
  CONSTRAINT `orderOfHotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderOfRoomInfoID` FOREIGN KEY (`roomInfoID`) REFERENCES `roominfo` (`roomInfoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (0000000001,0000000022,0000000004,0000000060,3,'2016-12-23 02:12:07','2016-12-23 10:12:07','2016-12-23 18:00:00',NULL,NULL,0,0,2000),(0000000002,0000000022,0000000004,0000000060,3,'2016-12-23 02:13:17','2016-12-23 10:13:17','2016-12-23 18:00:00',NULL,NULL,0,0,2000),(0000000003,0000000022,0000000001,0000000054,3,'2016-12-23 02:20:04','2016-12-23 10:20:04','2016-12-23 18:00:00',NULL,NULL,0,0,10),(0000000004,0000000022,0000000001,0000000054,3,'2016-12-23 03:17:48','2016-12-23 11:17:48','2016-12-23 18:00:00',NULL,NULL,0,0,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (0000000001,1,0000000000,'大凡哥开心','就是开心','2016-12-23','2016-12-27',5,5,1,90,90);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (0000000001,'上海','上海','南京路'),(0000000002,'上海','上海','徐家汇'),(0000000003,'上海','上海','静安寺'),(0000000004,'上海','上海','淮海路'),(0000000005,'上海','上海','陆家嘴'),(0000000006,'浙江','杭州','武林'),(0000000007,'浙江','杭州','湖滨'),(0000000008,'浙江','杭州','钱江新城'),(0000000009,'浙江','杭州','城西'),(0000000010,'江苏','苏州','观前'),(0000000011,'江苏','苏州','石路'),(0000000012,'江苏','苏州','平江新城'),(0000000013,'江苏','苏州','吴中'),(0000000014,'江苏','南京','新街口'),(0000000015,'江苏','南京','湖南路'),(0000000016,'江苏','南京','夫子庙'),(0000000017,'江苏','南京','中央门'),(0000000018,'浙江','宁波','天一'),(0000000019,'浙江','宁波','城隍庙'),(0000000020,'浙江','宁波','鼓楼步行街'),(0000000021,'湖北','武汉','江汉路'),(0000000022,'湖北','武汉','中央文化区'),(0000000023,'湖北','武汉','武广'),(0000000024,'福建','厦门','中山路'),(0000000025,'湖南','长沙','五一'),(0000000026,'湖南','长沙','溁湾镇'),(0000000027,'广东','广州','天河中心'),(0000000028,'广东','广州','上下九'),(0000000029,'广东','广州','北京路'),(0000000030,'广东','深圳','华侨城'),(0000000031,'广东','深圳','东门'),(0000000032,'广东','深圳','南山'),(0000000033,'广东','深圳','龙岗'),(0000000034,'重庆','重庆','解放碑'),(0000000035,'重庆','重庆','沙坪坝'),(0000000036,'江苏','南京','栖霞区');
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
INSERT INTO `roomdate` VALUES (0000000054,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000055,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000056,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000057,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000058,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000059,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000060,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000061,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000062,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000063,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000064,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000067,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000068,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000069,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000070,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),(0000000071,'2016-12-23',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roominfo`
--

LOCK TABLES `roominfo` WRITE;
/*!40000 ALTER TABLE `roominfo` DISABLE KEYS */;
INSERT INTO `roominfo` VALUES (0000000054,0000000001,'233','最烂的狗舍',10,1,NULL,NULL),(0000000055,0000000001,'234','最好的狗舍',11,1,NULL,NULL),(0000000056,0000000002,'22','土泥巴房',20,1,NULL,NULL),(0000000057,0000000002,'33','纸房子',23,1,NULL,NULL),(0000000058,0000000003,'22','楼房',40,1,NULL,NULL),(0000000059,0000000003,'4','积木房',37,1,NULL,NULL),(0000000060,0000000004,'666','河景房',2000,1,NULL,NULL),(0000000061,0000000004,'668','河景房',2200,1,NULL,NULL),(0000000062,0000000004,'888','江景房',3000,1,NULL,NULL),(0000000063,0000000004,'8888','海景房',5000,1,NULL,NULL),(0000000064,0000000005,'33','累了',9999,1,NULL,NULL),(0000000067,0000000008,'55','加的好累啊',9999,1,NULL,NULL),(0000000068,0000000009,'55','加的好累啊',9999,1,NULL,NULL),(0000000069,0000000010,'55','加的好累啊',9999,1,NULL,NULL),(0000000070,0000000011,'55','加的好累啊',9999,1,NULL,NULL),(0000000071,0000000012,'55','加的好累啊',9999,1,NULL,NULL);
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
INSERT INTO `roomprice` VALUES (0000000054,'2016-12-23',10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10),(0000000055,'2016-12-23',11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),(0000000056,'2016-12-23',20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20),(0000000057,'2016-12-23',23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),(0000000058,'2016-12-23',40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40),(0000000059,'2016-12-23',37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37),(0000000060,'2016-12-23',2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000),(0000000061,'2016-12-23',2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200),(0000000062,'2016-12-23',3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000),(0000000063,'2016-12-23',5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000),(0000000064,'2016-12-23',9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999),(0000000067,'2016-12-23',9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999),(0000000068,'2016-12-23',9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999),(0000000069,'2016-12-23',9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999),(0000000070,'2016-12-23',9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999),(0000000071,'2016-12-23',9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999,9999);
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
  `userType` tinyint(4) NOT NULL DEFAULT '4' COMMENT '0   Customer,\n1   Staff,\n2  WebMarketer,\n3 WebManager,\n4 NoSuchUser;',
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
  UNIQUE KEY `accountName_UNIQUE` (`accountName`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0000000001,3,'68BF7764211A940EEC708C7EA029FFFC','9D71C7B0F56316F478AC0E235CA9D1B4','0660CE474129E0CE8D4E55E8E0E927F6','6BF778B2A9E82899DD637C4C4236E4A0','/res/user/1/portrait1.jpg',0,0,NULL,0,NULL,NULL,0),(0000000002,1,'0E4C2ED8F929F010FB7D35480DE0F9CD','9D71C7B0F56316F478AC0E235CA9D1B4','AC79AB0DC8311388A3B24ED236F4C294','A725AF77515BE0E8B8B5EDA8CD4BE3F0','/res/user/2/portrait2.jpg',0,0,NULL,NULL,0000000001,NULL,0),(0000000003,1,'14806ADF6C8DADB79B35BA0364E44889','9D71C7B0F56316F478AC0E235CA9D1B4','8B2F40F427D07F199E62D6C0C27D3D56','6BF778B2A9E82899DD637C4C4236E4A0','/res/user/3/portrait3.jpg',0,0,NULL,NULL,0000000002,NULL,0),(0000000004,1,'FCF6B17CF46530D843D278202D64297B','9D71C7B0F56316F478AC0E235CA9D1B4','81210D2B84344996394D71A548FD0575','C93146379F5A0BD1846BCF99D044A528','/res/user/4/portrait4.jpg',0,0,NULL,NULL,0000000003,NULL,0),(0000000005,1,'8D120F5565A612880B691EEAB3583909','9D71C7B0F56316F478AC0E235CA9D1B4','94BF3913CA229EA0A2DBE791DF2A3D97','3F0CFF80314302620AD90379943508DF','/res/user/5/portrait5.jpg',0,0,NULL,NULL,0000000004,NULL,0),(0000000006,1,'C4F1538D11CB5737C46EAFA4ED4607C9','9D71C7B0F56316F478AC0E235CA9D1B4','94BF3913CA229EA0A2DBE791DF2A3D97','3F0CFF80314302620AD90379943508DF','/res/user/6/portrait6.jpg',0,0,NULL,NULL,0000000005,NULL,0),(0000000009,1,'FA92AC9CA5578E72C8B52269068B00BC','9D71C7B0F56316F478AC0E235CA9D1B4','94BF3913CA229EA0A2DBE791DF2A3D97','3F0CFF80314302620AD90379943508DF','/res/user/9/portrait9.jpg',0,0,NULL,NULL,0000000008,NULL,0),(0000000010,1,'BD433E4D005B8B0510C1F08346FA3BF2','9D71C7B0F56316F478AC0E235CA9D1B4','94BF3913CA229EA0A2DBE791DF2A3D97','3F0CFF80314302620AD90379943508DF','/res/user/10/portrait10.jpg',0,0,NULL,NULL,0000000009,NULL,0),(0000000011,1,'636078C1FD1115D913DB5E89141331D4','9D71C7B0F56316F478AC0E235CA9D1B4','94BF3913CA229EA0A2DBE791DF2A3D97','3F0CFF80314302620AD90379943508DF','/res/user/11/portrait11.jpg',0,0,NULL,NULL,0000000010,NULL,0),(0000000012,1,'812FB04AC26511F45D7CB1AB87178B97','9D71C7B0F56316F478AC0E235CA9D1B4','94BF3913CA229EA0A2DBE791DF2A3D97','3F0CFF80314302620AD90379943508DF','/res/user/12/portrait12.jpg',0,0,NULL,NULL,0000000011,NULL,0),(0000000013,1,'834ED850CAA06E40570305BB9269C78E','9D71C7B0F56316F478AC0E235CA9D1B4','94BF3913CA229EA0A2DBE791DF2A3D97','3F0CFF80314302620AD90379943508DF','/res/user/13/portrait13.jpg',0,0,NULL,NULL,0000000012,NULL,0),(0000000014,2,'B85F1A8A46D4DEF873234B32338E61B2','9D71C7B0F56316F478AC0E235CA9D1B4','0660CE474129E0CE8D4E55E8E0E927F6','6BF778B2A9E82899DD637C4C4236E4A0','/res/user/14/portrait14.jpg',0,0,NULL,0,NULL,NULL,0),(0000000022,0,'63C4600064AC3FA7ADC79A7D6E75A38776A9353B85036F9A719227D3FA5DDC6A','9D71C7B0F56316F478AC0E235CA9D1B4','5D6F0FA66359C8BB192CBD87137F156B',NULL,'res/user/22/portrait22.jpg',250,0,NULL,0,NULL,NULL,1);
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
    if new.isOn=1 and new.userType!=0 then 
        set new.isOn=0;
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

-- Dump completed on 2016-12-23 11:53:25
