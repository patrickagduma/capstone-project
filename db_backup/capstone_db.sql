-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone_db
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `code` varchar(15) NOT NULL,
  `instructor_id` int(50) NOT NULL,
  `year_level` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_date` date DEFAULT NULL,
  `base_grade` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (11,9,'KF-101',1,'4','Talakitok',22,'2018-02-22',40),(12,9,'Drunken Fist',20,'5','Pasang-awa',22,'2018-02-22',50),(13,9,'Lubricant 2',18,'3','Hampas-lupa',22,'2018-02-22',60),(14,5,'DUM1-101',18,'1','AAA',22,'2018-02-22',50),(15,5,'DUM1-102',1,'1','AAB',22,'2018-02-22',40),(16,5,'DUM-103',20,'1','AAC',22,'2018-02-22',55),(17,6,'DUM2-201',18,'2','BAA',22,'2018-02-22',40),(18,6,'DUM2-202',1,'2','BAB',22,'2018-02-22',40),(19,6,'DUM2-203',20,'2','BAC',22,'2018-02-22',50),(20,7,'DUM3-301',1,'3','CAA',22,'2018-02-22',50),(21,7,'DUM3-302',20,'3','CAB',22,'2018-02-22',60),(22,7,'DUM3-303',18,'3','CAC',22,'2018-02-22',70),(23,8,'DUM4-401',20,'4','DAA',22,'2018-02-22',30),(24,8,'DUM4-402',18,'4','DAB',22,'2018-02-22',40),(25,8,'DUM4-403',1,'4','DAC',22,'2018-02-22',60),(26,4,'apple101',1,'4','apple',1,'2018-02-22',50),(27,5,'dummy101',1,'5','dummy',1,'2018-02-22',40),(28,9,'kung123',1,'2','kung',1,'2018-02-22',50),(29,10,'orange101',23,'5','5',22,'2018-02-22',50);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_class_enrollment`
--

DROP TABLE IF EXISTS `student_class_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_class_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `last_modified_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class_enrollment`
--

LOCK TABLES `student_class_enrollment` WRITE;
/*!40000 ALTER TABLE `student_class_enrollment` DISABLE KEYS */;
INSERT INTO `student_class_enrollment` VALUES (13,2,11,'approved','2018-02-22'),(14,2,17,'approved','2018-02-22'),(15,2,15,'approved','2018-02-22'),(16,2,24,'denied','2018-02-22'),(17,3,27,'denied','2018-02-22'),(18,19,13,'approved','2018-02-22'),(19,2,26,'approved','2018-02-22'),(20,24,29,'approved','2018-02-22');
/*!40000 ALTER TABLE `student_class_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_classes`
--

DROP TABLE IF EXISTS `student_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `last_modified_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classes`
--

LOCK TABLES `student_classes` WRITE;
/*!40000 ALTER TABLE `student_classes` DISABLE KEYS */;
INSERT INTO `student_classes` VALUES (11,2,11,1,'2018-02-22'),(12,2,17,1,'2018-02-22'),(13,2,15,1,'2018-02-22'),(14,19,13,1,'2018-02-22'),(15,2,4,1,'2018-02-22'),(16,24,10,1,'2018-02-22');
/*!40000 ALTER TABLE `student_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (4,'Fil1','Filipino 1','Sample Description for Filipino 1',22),(5,'dum1','dummy subject 1','dummy',22),(6,'dum2','dummy subject 2','dummy',22),(7,'dum3','dummy subject 3','dummy',22),(8,'dum4','dummy subject 4','dummy',22),(9,'MA1KF','Kung Fu','Introduction to Martial Arts with Kung Fu',22),(10,'theo101','theology','sample theology',22);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_videos`
--

DROP TABLE IF EXISTS `subject_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `topic` text NOT NULL,
  `video_link` text NOT NULL,
  `last_modified_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_videos`
--

LOCK TABLES `subject_videos` WRITE;
/*!40000 ALTER TABLE `subject_videos` DISABLE KEYS */;
INSERT INTO `subject_videos` VALUES (16,2,'sample topic','https://www.youtube.com/watch?v=F21S9Wpi0y8','2018-02-18',1),(3,6,'lesson 3','https://www.youtube.com/embed/CEu7h86MYoA','2018-02-07',1),(10,8,'Lesson4','https://www.youtube.com/embed/kSwBJXNwJYM','2018-02-13',18),(11,1,'sample','https://www.youtube.com/watch?v=ALSX2Yb3ito235','2018-02-15',1),(15,1,'Updated video sample','https://www.youtube.com/embed/LlXl0sFy8LA','2018-02-17',1),(17,9,'Lesson 1','https://www.youtube.com/embed/8fggElhyTyk','2018-02-19',20),(18,4,'Lesson 5','https://www.youtube.com/embed/rW1hZjJwPRc','2018-02-21',22),(19,29,'theo Lesson 1','https://www.youtube.com/embed/5Hif1aWsruY','2018-02-22',23);
/*!40000 ALTER TABLE `subject_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `topic` text NOT NULL,
  `video_id` int(11) NOT NULL,
  `summary` text,
  `permalink` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (4,9,'',17,'sample','');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_item`
--

DROP TABLE IF EXISTS `topic_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `permalink` text NOT NULL,
  `boolean_answer` tinyint(1) DEFAULT NULL,
  `single_choice_1` varchar(250) DEFAULT NULL,
  `single_choice_2` varchar(250) DEFAULT NULL,
  `single_choice_3` varchar(250) DEFAULT NULL,
  `single_choice_4` varchar(250) DEFAULT NULL,
  `single_choice_5` varchar(250) DEFAULT NULL,
  `single_choice_6` varchar(250) DEFAULT NULL,
  `single_answer` varchar(250) DEFAULT NULL,
  `multi_choice_1` varchar(250) DEFAULT NULL,
  `multi_choice_2` varchar(250) DEFAULT NULL,
  `multi_choice_3` varchar(250) DEFAULT NULL,
  `multi_choice_4` varchar(250) DEFAULT NULL,
  `multi_choice_5` varchar(250) DEFAULT NULL,
  `multi_choice_6` varchar(250) DEFAULT NULL,
  `multi_answer_1` varchar(250) DEFAULT NULL,
  `multi_answer_2` varchar(250) DEFAULT NULL,
  `multi_answer_3` varchar(250) DEFAULT NULL,
  `multi_answer_4` varchar(250) DEFAULT NULL,
  `multi_answer_5` varchar(250) DEFAULT NULL,
  `multi_answer_6` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item`
--

LOCK TABLES `topic_item` WRITE;
/*!40000 ALTER TABLE `topic_item` DISABLE KEYS */;
INSERT INTO `topic_item` VALUES (9,4,9,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,4,9,'q2','q2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,4,9,'q3','q3',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `topic_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_item_answer`
--

DROP TABLE IF EXISTS `topic_item_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_item_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `topic_item_id` int(11) NOT NULL,
  `banswer` int(1) DEFAULT NULL,
  `sanswer` varchar(250) DEFAULT NULL,
  `manswers` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item_answer`
--

LOCK TABLES `topic_item_answer` WRITE;
/*!40000 ALTER TABLE `topic_item_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_item_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `user_type` varchar(1) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `last_modified_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Patrick','Agduma','jpagduma','21232f297a57a5a743894a0e4a801fc3','patrickagduma@gmail.com','T',1,'2018-02-06'),(2,'Niko Jay','Mateo','njmateo','21232f297a57a5a743894a0e4a801fc3','nikomateo@gmail.com','S',1,'2018-02-06'),(3,'Rachelle Anne','Itutud','raitutud','21232f297a57a5a743894a0e4a801fc3','reanne@gmail.com','S',1,'2018-02-06'),(4,'Alfonso Louis','Alfonso','alalfonso','21232f297a57a5a743894a0e4a801fc3','alfonso@gmail.com','S',1,'2018-02-06'),(17,'Rodel','Marcha','rmarcha','4ca7c5c27c2314eecc71f67501abb724','','S',1,'2018-02-07'),(18,'Dustin Hyrell','Lim','Dlim','21232f297a57a5a743894a0e4a801fc3','dlim@gmail.com','T',1,'2018-02-13'),(19,'Sean','Mallonga','SMallonga','21232f297a57a5a743894a0e4a801fc3','smallonga@gmail.com','S',1,'2018-02-13'),(20,'Kirk','Donio','kdonio','21232f297a57a5a743894a0e4a801fc3','donio@gmail.com','T',1,'2018-02-19'),(21,'Alfonso Louis','Alfonso','ALalfonso','21232f297a57a5a743894a0e4a801fc3','alfonso@gmail.com','S',1,'2018-02-19'),(22,'administrator','administrator','administrator','200ceb26807d6bf99fd6f4f0d1ca54d4','','A',1,'2018-02-19'),(23,'Danlord','Mabano','dmabano','21232f297a57a5a743894a0e4a801fc3','dmabano@gmail.com','T',1,'2018-02-22'),(24,'Roshan','Glen','rglen','21232f297a57a5a743894a0e4a801fc3','rglen@gmail.com','S',1,'2018-02-22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-22 15:33:54
