CREATE DATABASE  IF NOT EXISTS `goodcesidb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `goodcesidb`;
-- MySQL dump 10.13  Distrib 8.0.15, for Linux (x86_64)
--
-- Host: localhost    Database: goodcesidb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT INTO `SEQUENCE` VALUES ('SEQ_GEN',1400);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `ID` bigint(20) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1301,'Vintage'),(1302,'Livres'),(1303,'DVD / Blu-Ray'),(1304,'Neuf'),(1305,'Déco'),(1351,'Jouets');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `PUBLICATIONDATE` datetime DEFAULT NULL,
  `SHIPPINGCHARGE` double DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL,
  `SELLER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ITEM_SELLER_ID` (`SELLER_ID`),
  CONSTRAINT `FK_ITEM_SELLER_ID` FOREIGN KEY (`SELLER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (21,'Bon état. manque la figurine','Coffret Alien',50.99,'2017-03-27 17:13:04',3,0,1,1500,1306),(22,'non utilisé. vendu pour cause de doublon','la conjuration des imbéciles',3.5,'2017-03-27 17:16:07',2,0,1,200,1306),(23,'en bon état','Lampe Art Déco',152,'2017-03-27 17:18:46',25,0,1,2000,1306),(24,'jamais ouvertes','12 blisters cartes Magic',10.99,'2017-03-27 18:06:09',0.8,0,1,50,1306),(25,'Edition Poche -couverture cornée','Secret Show',2.5,'2017-03-27 18:07:12',2,0,1,200,1306),(26,'original.toujours dans sa boîte','Monchichi',99,'2017-03-27 18:08:46',5,0,1,300,1307),(27,'rouge. jamais utilisé','Casque Moto',50.5,'2017-03-27 18:09:50',12.99,0,1,1000,1307),(28,'pièce rare.','figurine Yoda',199,'2017-03-28 10:40:51',5.5,0,1,800,1307),(29,'Blu ray neuf avec emballage','Drive',9,'2017-03-28 10:46:05',2,0,1,350,1307),(30,'bon état.il faut revernir ','chaise style Louis XVI',90,'2017-03-28 14:26:41',30,0,1,4000,1306),(31,'trilogie exceptionnelle.','Ca - Stephen King',2.5,'2017-03-28 14:28:14',2,0,1,420,1307),(32,'version DVD','Heat',9,'2017-03-28 14:33:54',3,1,2,200,1307),(33,'couverture abîmée','le pays où l\'on n\'arrive jamais',0.99,'2017-03-28 14:39:26',3,0,1,150,1307),(34,'jamais écoutée','intégrale Mickael Jackson',15,'2017-03-28 14:41:24',3,1,2,500,1306);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item_category` (
  `categories_ID` bigint(20) NOT NULL,
  `items_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`categories_ID`,`items_ID`),
  KEY `FK_ITEM_CATEGORY_items_ID` (`items_ID`),
  CONSTRAINT `FK_ITEM_CATEGORY_categories_ID` FOREIGN KEY (`categories_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FK_ITEM_CATEGORY_items_ID` FOREIGN KEY (`items_ID`) REFERENCES `item` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_category`
--

LOCK TABLES `item_category` WRITE;
/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
INSERT INTO `item_category` VALUES (1303,21),(1302,22),(1304,22),(1301,23),(1305,23),(1304,24),(1302,25),(1301,26),(1304,26),(1351,26),(1304,27),(1301,28),(1305,28),(1351,28),(1303,29),(1304,29),(1301,30),(1305,30),(1302,31),(1303,32),(1302,33),(1303,34),(1304,34);
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemorder`
--

DROP TABLE IF EXISTS `itemorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itemorder` (
  `ORDERDATE` date DEFAULT NULL,
  `SHIPPINGDATE` date DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TOTALPRICE` double DEFAULT NULL,
  `BUYER_ID` bigint(20) DEFAULT NULL,
  `ORDEREDITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDEREDITEM_ID`),
  KEY `FK_ItemOrder_USER_ID` (`BUYER_ID`),
  CONSTRAINT `FK_ItemOrder_ORDEREDITEM_ID` FOREIGN KEY (`ORDEREDITEM_ID`) REFERENCES `item` (`ID`),
  CONSTRAINT `FK_ItemOrder_USER_ID` FOREIGN KEY (`BUYER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemorder`
--

LOCK TABLES `itemorder` WRITE;
/*!40000 ALTER TABLE `itemorder` DISABLE KEYS */;
INSERT INTO `itemorder` VALUES ('2017-10-11','2017-10-11',2,12,1306,32),('2017-03-28','2017-03-28',2,18,1308,34);
/*!40000 ALTER TABLE `itemorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN_UNIQUE` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (453,NULL,'admin1@goodcesi.com','Admin1','Admin1','admin1','25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7'),(1306,'100 rue des inconnus','jdoe@unknown.com','John','Doe','jdoe','f70ac8759070f800b9d1ccf6f51417fb0690c60a2801b8a5ea08f2ecedab1723'),(1307,'13 rue des ventes','manu.vendeur@jevends.com','Manu','Vendeur','ven1','54d08f5f2a6d391aecf2294a5b85f24432ea945cd227b41b8ee25064bec44067'),(1308,'66 rue des achats compulsifs - 13xxx le Sud','mich@gmail.com','Michel','Acheteur','ach1','cd86d693212a848716397dbd8143fb08c7822b2c3f670d0c1516863e4a357f00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_usergroup`
--

DROP TABLE IF EXISTS `user_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_usergroup` (
  `groups_ID` bigint(20) NOT NULL,
  `users_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`groups_ID`,`users_ID`),
  KEY `FK_USER_USERGROUP_users_ID` (`users_ID`),
  CONSTRAINT `FK_USER_USERGROUP_groups_ID` FOREIGN KEY (`groups_ID`) REFERENCES `usergroup` (`ID`),
  CONSTRAINT `FK_USER_USERGROUP_users_ID` FOREIGN KEY (`users_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_usergroup`
--

LOCK TABLES `user_usergroup` WRITE;
/*!40000 ALTER TABLE `user_usergroup` DISABLE KEYS */;
INSERT INTO `user_usergroup` VALUES (3,453),(1,1306),(2,1306),(2,1307),(1,1308);
/*!40000 ALTER TABLE `user_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usergroup` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'peut acheter des articles','acheteurs'),(2,'peut vendre des articles','vendeurs'),(3,'administre la plateforme','administrateurs');
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_groups_view`
--

DROP TABLE IF EXISTS `users_groups_view`;
/*!50001 DROP VIEW IF EXISTS `users_groups_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `users_groups_view` AS SELECT 
 1 AS `login`,
 1 AS `password`,
 1 AS `groupname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `users_groups_view`
--

/*!50001 DROP VIEW IF EXISTS `users_groups_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_groups_view` AS select `u`.`LOGIN` AS `login`,`u`.`PASSWORD` AS `password`,`g`.`NAME` AS `groupname` from ((`user_usergroup` `ug` join `user` `u` on((`u`.`ID` = `ug`.`users_ID`))) join `usergroup` `g` on((`g`.`ID` = `ug`.`groups_ID`))) */;
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

-- Dump completed on 2019-04-08 14:05:24
