-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: db_prijava
-- ------------------------------------------------------
-- Server version	5.5.10

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
-- Current Database: `db_prijava`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_prijava` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_prijava`;

--
-- Table structure for table `daysinfo`
--

DROP TABLE IF EXISTS `daysinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daysinfo` (
  `Day` int(10) unsigned NOT NULL,
  `DayName` varchar(20) NOT NULL,
  PRIMARY KEY (`Day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daysinfo`
--

LOCK TABLES `daysinfo` WRITE;
/*!40000 ALTER TABLE `daysinfo` DISABLE KEYS */;
INSERT INTO `daysinfo` VALUES (1,'Nedelja'),(2,'Ponedeljak'),(3,'Utorak'),(4,'Sreda'),(5,'Četvrtak'),(6,'Petak'),(7,'Subota');
/*!40000 ALTER TABLE `daysinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `SubjectID` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(45) NOT NULL,
  `Year` varchar(45) NOT NULL,
  PRIMARY KEY (`SubjectID`),
  UNIQUE KEY `SubjectID_UNIQUE` (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Informatika','1'),(2,'Matematika','1'),(3,'Programiranje 1','1'),(4,'Engleski jezik 1','1'),(5,'Diskretna matematika','1'),(6,'Osnovi računarske tehnike','1'),(7,'Strukture podataka i algoritmi','1'),(8,'Sociologija','1'),(9,'Objektno orijentisano programiranje','2'),(10,'Verovatnoća i statistika','2'),(11,'Engleski jezik 2','2'),(12,'Menadžment','2'),(13,'Operativni sistemi','2'),(14,'Osnovi zaštite informacija','2'),(15,'Programski jezici','2'),(16,'Internet tehnologije','2'),(17,'Nemački jezik 1','2'),(18,'Španski jezik 1','2'),(19,'Italijanski jezik 1','2'),(20,'Baze podataka','3'),(21,'Računarske mreže','3'),(22,'Osnovi teorije informacija i kodovanja','3'),(23,'Engleski jezik 3','3'),(24,'Informacioni sistemi','3'),(25,'Kriptologija 1','3'),(26,'Nemački jezik 2','3'),(27,'Španski jezik 2','3'),(28,'Italijanski jezik 2','3'),(29,'Multimedija','3'),(30,'Upravljanje projektima','3'),(44,'Zaštita u računarskim mrežama','4'),(45,'Kriptologija 2','4'),(46,'Razvoj aplikativnog softvera','4'),(47,'Sistemi za podršku odlučivanju','4'),(48,'Engleski jezik 4','4'),(49,'Veštačka inteligencija','4'),(50,'Razvoj karijere i poslovnih veština','4'),(51,'Praktikum - Zaštita u IS','4'),(52,'Praktikum - Programski sistemi','4'),(53,'Praktikum - Internet i web tehnologije','4'),(54,'Nemački jezik 3','4'),(55,'Španski jezik 3','4'),(56,'Italijanski jezik 3','4'),(57,'Završni rad','4');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectschedulexref`
--

DROP TABLE IF EXISTS `subjectschedulexref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectschedulexref` (
  `SubjectScheduleID` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `SubjectID` int(32) unsigned NOT NULL,
  `Day` int(10) unsigned NOT NULL,
  `TimeFrom` time NOT NULL,
  `TimeTo` time NOT NULL,
  PRIMARY KEY (`SubjectScheduleID`),
  UNIQUE KEY `SubjectScheduleID_UNIQUE` (`SubjectScheduleID`),
  KEY `ScheduleSubjectID` (`SubjectID`),
  KEY `SSXRefDay` (`Day`),
  CONSTRAINT `ScheduleSubjectID` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SSXRefDay` FOREIGN KEY (`Day`) REFERENCES `daysinfo` (`Day`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectschedulexref`
--

LOCK TABLES `subjectschedulexref` WRITE;
/*!40000 ALTER TABLE `subjectschedulexref` DISABLE KEYS */;
INSERT INTO `subjectschedulexref` VALUES (1,1,2,'12:00:00','13:00:00'),(2,1,3,'16:00:00','17:00:00'),(3,2,4,'10:00:00','13:00:00'),(4,3,2,'11:00:00','14:00:00'),(5,9,3,'12:00:00','17:00:00'),(6,13,6,'14:00:00','16:00:00'),(7,14,6,'12:00:00','14:00:00'),(8,26,6,'14:00:00','16:00:00'),(9,27,6,'15:00:00','18:00:00'),(10,11,2,'12:00:00','14:00:00'),(11,11,1,'16:00:00','17:00:00'),(12,10,4,'12:00:00','14:00:00'),(13,9,2,'10:00:00','12:00:00'),(14,15,2,'10:00:00','12:00:00');
/*!40000 ALTER TABLE `subjectschedulexref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userhistory`
--

DROP TABLE IF EXISTS `userhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userhistory` (
  `UserHistoryID` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` int(32) unsigned NOT NULL,
  `SubjectID` int(32) unsigned NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`UserHistoryID`),
  UNIQUE KEY `UserHistoryID_UNIQUE` (`UserHistoryID`),
  KEY `HistoryUserID` (`UserID`),
  KEY `HistorySubjectID` (`SubjectID`),
  CONSTRAINT `HistorySubjectID` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `HistoryUserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userhistory`
--

LOCK TABLES `userhistory` WRITE;
/*!40000 ALTER TABLE `userhistory` DISABLE KEYS */;
INSERT INTO `userhistory` VALUES (1,1,1,'2011-05-16','00:00:00'),(3,1,1,'2011-05-16','00:00:00'),(7,1,1,'2011-05-16','00:00:00'),(8,3,10,'2011-05-16','00:00:00'),(9,4,10,'2011-05-17','00:00:00'),(10,4,10,'2011-05-17','00:00:00'),(11,4,25,'2011-05-17','00:00:00'),(12,4,25,'2011-05-17','00:00:00'),(13,1,25,'2011-05-17','00:00:00'),(14,1,25,'2011-05-17','00:00:00'),(16,1,14,'2011-05-17','00:00:00'),(17,1,9,'2011-05-17','00:00:00'),(18,1,9,'2011-05-17','00:00:00'),(19,1,9,'2011-05-17','00:00:00'),(20,1,9,'2011-05-17','00:00:00'),(21,1,9,'2011-05-17','00:00:00'),(22,1,9,'2011-05-17','00:00:00'),(23,1,9,'2011-05-17','00:00:00'),(24,1,9,'2011-05-17','00:00:00'),(25,1,9,'2011-05-19','00:00:00'),(26,1,9,'2011-05-20','00:00:00'),(27,1,9,'2011-05-20','00:00:00'),(28,1,9,'2011-05-24','00:00:00'),(29,1,5,'2011-05-25','00:00:00'),(30,1,5,'2011-05-25','00:00:00'),(32,3,10,'2011-12-02','00:00:00'),(33,4,10,'2011-12-02','00:00:00'),(34,1,10,'2011-12-02','00:00:00'),(35,1,10,'2011-12-02','00:00:00'),(36,3,11,'2011-12-02','14:01:42'),(37,3,21,'2011-12-04','15:06:34'),(38,1,9,'2011-12-04','16:09:40'),(39,1,9,'2011-12-05','10:20:25'),(40,1,9,'2011-12-05','10:20:35'),(41,3,12,'2011-12-05','11:09:00'),(42,4,17,'2011-12-05','12:11:15'),(43,1,9,'2011-12-06','12:19:36');
/*!40000 ALTER TABLE `userhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `User` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `IsAdmin` bit(1) NOT NULL DEFAULT b'0',
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `OnYear` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2280/2008','student','\0','Marko','Trajković',2),(3,'2009/202352','student','\0','Nataša','Radlovački',2),(4,'2009/201825','student','\0','Nikola','Vuković',2),(5,'s.adamovic','profesor','','Saša','Adamović',0),(6,'i,franc','profesor','','Igor','Franc',0),(7,'m.veinovic','profesor','','Mladen','Veinović',0),(8,'g.grubor','profesor','','Gojko','Grubor',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_prijava'
--
/*!50003 DROP PROCEDURE IF EXISTS `del_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `del_User`(in inUserID int)
BEGIN

    DELETE FROM users WHERE UserID = inUserID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_allsubjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_allsubjects`()
BEGIN
    SELECT 
    s.SubjectID,
    s.SubjectName,
    s.`Year`    
    FROM subjects AS s;    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_countSpecificStudentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_countSpecificStudentHistory`(
    in inSubjectID int,
    in inUserID int
)
BEGIN

    SELECT DISTINCT
    u.`User`,
    u.FirstName,
    u.LastName,
    s.SubjectName,
    COUNT(DISTINCT uh.`Date`)
    FROM userhistory as uh
    INNER JOIN users as u on u.UserID = uh.UserID
    INNER JOIN subjects as s on s.SubjectID = uh.SubjectID
    WHERE uh.SubjectID = inSubjectID
    AND uh.UserID = inUserID;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_countStudentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_countStudentHistory`(
    in inSubjectID int
)
BEGIN

    SELECT DISTINCT
    u.`User`,
    u.FirstName,
    u.LastName,
    s.SubjectName,
    COUNT(DISTINCT uh.`Date`)
    FROM userhistory as uh
    INNER JOIN users as u on u.UserID = uh.UserID
    INNER JOIN subjects as s on s.SubjectID = uh.SubjectID
    WHERE uh.SubjectID = inSubjectID
    GROUP BY u.`User`;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_specificStudentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_specificStudentHistory`(
    in inSubjectID int,
    in inUserID int
)
BEGIN

    SELECT DISTINCT
    uh.`Date`,
    u.`User`,
    u.FirstName,
    u.LastName,
    s.SubjectName
    FROM userhistory as uh
    INNER JOIN users as u on u.UserID = uh.UserID
    INNER JOIN subjects as s on s.SubjectID = uh.SubjectID
    WHERE uh.SubjectID = inSubjectID
    AND uh.UserID = inUserID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_studentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_studentHistory`(
    in inSubjectID int
)
BEGIN

    SELECT DISTINCT
    uh.`Date`,
    u.`User`,
    u.FirstName,
    u.LastName,
    s.SubjectName
    FROM userhistory AS uh
    INNER JOIN users as u on u.UserID = uh.UserID
    INNER JOIN subjects as s on s.SubjectID = uh.SubjectID
    WHERE uh.SubjectID = inSubjectID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_studentHistoryDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_studentHistoryDate`(
    in inSubjectID int,
    in inDate date
)
BEGIN

    SELECT DISTINCT
    uh.`Date`,
    u.`User`,
    u.FirstName,
    u.LastName,
    s.SubjectName
    FROM userhistory AS uh
    INNER JOIN users as u on u.UserID = uh.UserID
    INNER JOIN subjects as s on s.SubjectID = uh.SubjectID
    WHERE uh.SubjectID = inSubjectID AND uh.`Date` = inDate;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_subjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_subjects`(in inYear int)
BEGIN
SELECT 
    s.SubjectID,
    s.SubjectName,
    s.`Year`    
    FROM subjects AS s
    WHERE (s.Year = -1 OR s.Year = inYear);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_subjectschedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_subjectschedule`(
    in inOnYear int,
    in inUserID int
)
BEGIN

    SELECT
    CURTIME(),
    s.SubjectID,
    s.SubjectName,
    s.`Year`,
    di.`DayName`,
    ssx.TimeFrom,
    ssx.TimeTo
    FROM subjectschedulexref as ssx
    INNER JOIN subjects as s on s.SubjectID = ssx.SubjectID
    INNER JOIN daysinfo as di on di.`Day` = ssx.`Day`
    WHERE ssx.`Day` = DAYOFWEEK(CURDATE())
    AND (CURTIME() BETWEEN ssx.TimeFrom AND ssx.TimeTo)
    AND s.`Year` = inOnYear
    AND s.SubjectID NOT IN (SELECT uh.SubjectID FROM userhistory as uh 
    WHERE (uh.UserID=inUserID AND uh.`Date`=CURDATE()));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_Users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sel_Users`(in inUserID int)
BEGIN

    SELECT 
    u.UserID,
    u.`User`,
    u.`Password`,
    u.IsAdmin,
    u.FirstName,
    u.LastName,
    u.OnYear
    FROM users AS u
    WHERE (inUserID = -1 OR u.UserId = inUserID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_userhistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `set_userhistory`(
    in inUserHistoryID int,
    in inUserID int,
    in inSubjectID int,
    out retval int
)
BEGIN
    IF inUserHistoryID = 0 THEN
    IF EXISTS(SELECT * FROM userhistory as uh WHERE uh.UserID=inUserID
    AND uh.SubjectID=inSubjectID AND uh.`Date`=CURDATE())
    THEN SET retval= -1; 
    
    ELSE
        INSERT INTO userhistory (UserHistoryID, UserID, SubjectID, `Date`, `Time`)
        VALUES (inUserHistoryID, inUserID, inSubjectID, CURDATE(), CURTIME());
        
        SELECT LAST_INSERT_ID() INTO retVal;    
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_studentYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `upd_studentYear`(
    in inUserID int,
    in inOnYear int
)
BEGIN

    UPDATE users 
    SET OnYear = inOnYear
    WHERE UserID = inUserID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_subjectschedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `upd_subjectschedule`(
    in inSubjectScheduleID int,
    in inSubjectID int,
    in inDay int,
    in inTimeFrom time,
    in inTimeTo time,
    out retVal int
)
BEGIN
    
    IF inSubjectScheduleID = 0 
    THEN
    
        INSERT INTO subjectschedulexref (SubjectScheduleID, SubjectID, `Day`, TimeFrom, TimeTo)
        VALUES (inSubjectScheduleID, inSubjectID, inDay, inTimeFrom, inTimeTo);
        
        SELECT LAST_INSERT_ID() INTO retVal;
    
    ELSE
        UPDATE subjectschedulexref 
        SET SubjectScheduleID = inSubjectScheduleID, SubjectID = inSubjectID, `Day` = inDay, TimeFrom = inTimeFrom, TimeTo = inTimeTo
        WHERE SubjectScheduleID = inSubjectScheduleID;
        
        SELECT inSubjectScheduleID INTO retVal;
        
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `upd_User`(
    in inUserID int,
    in inUser varchar(45),
    in inPassword varchar(45),
    in inIsAdmin bit,
    in inFirstName varchar(45),
    in inLastName varchar(45),
    in inOnYear int,
    out retVal int
)
BEGIN

    IF inUserID = 0 
    THEN
    
        INSERT INTO users (`User`, `Password`, IsAdmin, FirstName, LastName, OnYear)
        VALUES (inUser, inPassword, inIsAdmin, inFirstName, inLastName, inOnYear);
        
        SELECT LAST_INSERT_ID() INTO retVal;
    
    ELSE
        UPDATE users 
        SET `User` = inUser, `Password` = inPassword, IsAdmin = inIsAdmin, FirstName = inFirstName, LastName = inLastName, OnYear = inOnYear
        WHERE UserID = inUserID;
        
        SELECT inUserID INTO retVal;
        
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validate_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `validate_login`(
    in inUser varchar(45),
    in inPassword varchar(45)
)
BEGIN

    SELECT 
    u.UserID,
    u.`User`,
    u.`Password`,
    u.IsAdmin,
    u.FirstName,
    u.LastName,
    u.OnYear
    FROM users AS u
    WHERE u.`User` = inUser 
    AND u.`Password` = inPassword;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-12-06 12:40:17
