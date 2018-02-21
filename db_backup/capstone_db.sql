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
  `instructor` varchar(50) NOT NULL,
  `year_level` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_date` date DEFAULT NULL,
  `base_grade` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,0,'TRI101','John Patrick Agduma','','',1,'2018-02-06',50),(2,0,'ENG24','John Patrick Agduma','','',1,'2018-02-06',40),(9,0,'AP123','Kirk Donio','','',20,'2018-02-19',50),(6,0,'AP3','John Patrick Agduma','','',1,'2018-02-07',50),(7,0,'AP24','John Patrick Agduma','','',1,'2018-02-12',50),(8,0,'AP27','Dustin Hyrell Lim','','',18,'2018-02-13',50),(10,0,'IT1','John Patrick Agduma','Grade 4','Apple',1,'2018-02-20',50);
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class_enrollment`
--

LOCK TABLES `student_class_enrollment` WRITE;
/*!40000 ALTER TABLE `student_class_enrollment` DISABLE KEYS */;
INSERT INTO `student_class_enrollment` VALUES (1,2,1,'approved','2018-02-06'),(2,3,1,'approved','2018-02-06'),(3,4,1,'denied','2018-02-06'),(4,4,2,'approved','2018-02-06'),(5,3,6,'approved','2018-02-09'),(6,19,8,'approved','2018-02-13'),(7,21,9,'approved','2018-02-19'),(8,19,4,NULL,'2018-02-21');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classes`
--

LOCK TABLES `student_classes` WRITE;
/*!40000 ALTER TABLE `student_classes` DISABLE KEYS */;
INSERT INTO `student_classes` VALUES (1,2,1,1,'2018-02-06'),(2,3,1,1,'2018-02-06'),(3,4,1,1,'2018-02-06'),(4,4,2,1,'2018-02-07'),(5,3,6,1,'2018-02-09'),(6,19,8,1,'2018-02-13'),(7,21,9,1,'2018-02-19'),(8,19,9,1,'2018-02-19');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (4,'Fil1','Filipino 1','Sample Description for Filipino 1',22),(5,'dum1','dummy subject 1','dummy',22),(6,'dum2','dummy subject 2','dummy',22),(7,'dum3','dummy subject 3','dummy',22),(8,'dum4','dummy subject 4','dummy',22);
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_videos`
--

LOCK TABLES `subject_videos` WRITE;
/*!40000 ALTER TABLE `subject_videos` DISABLE KEYS */;
INSERT INTO `subject_videos` VALUES (16,2,'sample topic','https://www.youtube.com/watch?v=F21S9Wpi0y8','2018-02-18',1),(3,6,'lesson 3','https://www.youtube.com/embed/CEu7h86MYoA','2018-02-07',1),(10,8,'Lesson4','https://www.youtube.com/embed/kSwBJXNwJYM','2018-02-13',18),(11,1,'sample','https://www.youtube.com/watch?v=ALSX2Yb3ito235','2018-02-15',1),(15,1,'Updated video sample','https://www.youtube.com/embed/LlXl0sFy8LA','2018-02-17',1),(17,9,'Lesson 1','https://www.youtube.com/embed/8fggElhyTyk','2018-02-19',20),(18,4,'Lesson 5','https://www.youtube.com/embed/rW1hZjJwPRc','2018-02-21',22);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,4,'',18,'sample summary',''),(2,4,'',18,'sample summary',''),(3,4,'',18,'sample','');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item`
--

LOCK TABLES `topic_item` WRITE;
/*!40000 ALTER TABLE `topic_item` DISABLE KEYS */;
INSERT INTO `topic_item` VALUES (1,2,4,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,4,'q2','q2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,2,4,'q3','q3',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,4,'q4','q4',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,4,'q5','q5',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,4,'q6','q6',NULL,'a1','a2','a3','a4',NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,4,'q7','q7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4','a5',NULL,'a1','a2',NULL,NULL,NULL,NULL),(8,3,4,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Patrick','Agduma','jpagduma','21232f297a57a5a743894a0e4a801fc3','patrickagduma@gmail.com','T',1,'2018-02-06'),(2,'Niko Jay','Mateo','njmateo','21232f297a57a5a743894a0e4a801fc3','nikomateo@gmail.com','S',1,'2018-02-06'),(3,'Rachelle Anne','Itutud','raitutud','21232f297a57a5a743894a0e4a801fc3','reanne@gmail.com','S',1,'2018-02-06'),(4,'Alfonso Louis','Alfonso','alalfonso','21232f297a57a5a743894a0e4a801fc3','alfonso@gmail.com','S',1,'2018-02-06'),(17,'Rodel','Marcha','rmarcha','4ca7c5c27c2314eecc71f67501abb724','','S',1,'2018-02-07'),(18,'Dustin Hyrell','Lim','Dlim','21232f297a57a5a743894a0e4a801fc3','dlim@gmail.com','T',1,'2018-02-13'),(19,'Sean','Mallonga','SMallonga','21232f297a57a5a743894a0e4a801fc3','smallonga@gmail.com','S',1,'2018-02-13'),(20,'Kirk','Donio','kdonio','21232f297a57a5a743894a0e4a801fc3','donio@gmail.com','T',1,'2018-02-19'),(21,'Alfonso Louis','Alfonso','ALalfonso','21232f297a57a5a743894a0e4a801fc3','alfonso@gmail.com','S',1,'2018-02-19'),(22,'administrator','administrator','administrator','200ceb26807d6bf99fd6f4f0d1ca54d4','','A',1,'2018-02-19');
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

-- Dump completed on 2018-02-21 20:56:14
