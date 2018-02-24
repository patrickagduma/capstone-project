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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,1,'AAA',1,'5','Apple',22,'2018-02-22',50),(2,2,'AAB',1,'2','Banana',1,'2018-02-22',50),(3,3,'AAC',1,'4','Cherries',1,'2018-02-23',50),(4,2,'BBB',23,'1','Axe',23,'2018-02-23',50),(5,1,'BBA',23,'3','Box',22,'2018-02-23',50),(6,3,'BBC',23,'2','Cart',23,'2018-02-23',50);
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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class_enrollment`
--

LOCK TABLES `student_class_enrollment` WRITE;
/*!40000 ALTER TABLE `student_class_enrollment` DISABLE KEYS */;
INSERT INTO `student_class_enrollment` VALUES (53,3,6,NULL,'2018-02-24'),(54,2,4,'approved','2018-02-24'),(55,2,5,'approved','2018-02-24'),(56,2,6,NULL,'2018-02-24'),(49,19,3,'approved','2018-02-24'),(47,19,2,'approved','2018-02-24'),(45,19,1,'approved','2018-02-24'),(41,2,2,'approved','2018-02-24'),(43,2,1,'approved','2018-02-24'),(39,2,3,NULL,'2018-02-24'),(37,3,2,'approved','2018-02-24'),(35,3,1,'approved','2018-02-24'),(51,3,4,NULL,'2018-02-24'),(52,3,5,NULL,'2018-02-24'),(33,3,3,'approved','2018-02-24');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classes`
--

LOCK TABLES `student_classes` WRITE;
/*!40000 ALTER TABLE `student_classes` DISABLE KEYS */;
INSERT INTO `student_classes` VALUES (39,3,2,1,'2018-02-24'),(40,19,1,1,'2018-02-24'),(41,3,3,1,'2018-02-24'),(42,19,2,1,'2018-02-24'),(43,2,2,1,'2018-02-24'),(44,2,1,1,'2018-02-24'),(45,19,3,1,'2018-02-24'),(46,2,4,1,'2018-02-24'),(47,2,5,1,'2018-02-24'),(48,3,1,1,'2018-02-24');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'ENG101','English','sample description english',22),(2,'FIL101','Filipino','sample description filipino',22),(3,'MATH101','Mathematics','sample description mathematics',22);
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_videos`
--

LOCK TABLES `subject_videos` WRITE;
/*!40000 ALTER TABLE `subject_videos` DISABLE KEYS */;
INSERT INTO `subject_videos` VALUES (1,1,'English: Lesson 1','https://www.youtube.com/embed/dU4dmIeDIes','2018-02-22',1),(2,1,'English: Lesson 2','https://www.youtube.com/embed/fwe7yK5Axk8','2018-02-23',1),(3,1,'English: Lesson 3','https://www.youtube.com/embed/JUE5cZuknaA','2018-02-23',1),(4,1,'English: Lesson 4','https://www.youtube.com/embed/jpTKe_g7shQ','2018-02-23',1),(5,1,'English: Lesson 5','https://www.youtube.com/embed/u-zzmCiNfUY','2018-02-23',1),(6,1,'English: Lesson 6','https://www.youtube.com/embed/ErLZBszCgDs','2018-02-23',1),(7,2,'Filipino: Lesson 1','https://www.youtube.com/embed/Lj1PF7L2Lss','2018-02-23',1),(8,3,'Mathematics: Lesson 1','https://www.youtube.com/embed/4k3mbOfhtXI','2018-02-23',22);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (101,1,'',1,'sample summary English',''),(102,1,'',2,'sample summary for lesson 2','englisheng101'),(103,1,'',3,'sample summary english for lesson 3','englisheng101'),(104,1,'',4,'sample summary english for lesson 4',''),(105,1,'English(ENG101)',5,'sample summary english for lesson 5','englisheng101'),(106,1,'English: Lesson 6',6,'sample summary english for lesson 6','english_lesson_6'),(107,2,'Filipino: Lesson 1',7,'sample summary filipino lesson 1','filipino_lesson_1'),(108,3,'Mathematics: Lesson 1',8,'sample summary mathematics for lesson 1','mathematics_lesson_1');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item`
--

LOCK TABLES `topic_item` WRITE;
/*!40000 ALTER TABLE `topic_item` DISABLE KEYS */;
INSERT INTO `topic_item` VALUES (1,101,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,101,1,'q2','q2',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,101,1,'q3','q3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4',NULL,NULL,'a1','a2',NULL,NULL,NULL,NULL),(4,102,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,102,1,'q2','q2',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,102,1,'q3','q3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4',NULL,NULL,'a1','a2',NULL,NULL,NULL,NULL),(7,103,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,103,1,'q1','q1',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,103,1,'q3','q3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4','a5',NULL,'a1','a2',NULL,NULL,NULL,NULL),(10,104,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,104,1,'q2','q2',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,104,1,'q3','q3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4',NULL,NULL,'a1','a2',NULL,NULL,NULL,NULL),(13,105,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,106,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,107,2,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,107,2,'q2','q2',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,107,2,'q3','q3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4',NULL,NULL,'a1','a2',NULL,NULL,NULL,NULL),(18,108,3,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,108,3,'q2','q2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,108,3,'q3','q3',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,108,3,'q4','q4',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,108,3,'q5','q5',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,108,3,'Q6','q6',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,108,3,'q7','q7',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,108,3,'q8','q8',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,108,3,'q9','q9',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,108,3,'q10','q10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,108,3,'q11','q11',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,108,3,'q12','q12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4',NULL,NULL,'a1','a2',NULL,NULL,NULL,NULL);
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
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item_answer`
--

LOCK TABLES `topic_item_answer` WRITE;
/*!40000 ALTER TABLE `topic_item_answer` DISABLE KEYS */;
INSERT INTO `topic_item_answer` VALUES (18,3,1,1,NULL,NULL,'2018-02-24 01:52:33'),(19,3,2,NULL,'a1',NULL,'2018-02-24 01:52:33'),(20,3,3,NULL,NULL,'a1, a2','2018-02-24 01:52:33'),(21,3,15,1,NULL,NULL,'2018-02-24 15:22:32'),(22,3,16,NULL,'a1',NULL,'2018-02-24 15:22:32'),(23,3,17,NULL,NULL,'a1, a2','2018-02-24 15:22:32'),(24,3,4,1,NULL,NULL,'2018-02-24 15:22:47'),(25,3,5,NULL,'a2',NULL,'2018-02-24 15:22:47'),(26,3,6,NULL,NULL,'a2, a3','2018-02-24 15:22:47'),(27,2,1,1,NULL,NULL,'2018-02-24 15:27:21'),(28,2,2,NULL,'a3',NULL,'2018-02-24 15:27:21'),(29,2,3,NULL,NULL,'a1, a2','2018-02-24 15:27:21'),(30,2,15,0,NULL,NULL,'2018-02-24 15:27:36'),(31,2,16,NULL,'a1',NULL,'2018-02-24 15:27:36'),(32,2,17,NULL,NULL,'a1, a2','2018-02-24 15:27:36'),(33,2,4,0,NULL,NULL,'2018-02-24 15:28:54'),(34,2,5,NULL,'a1',NULL,'2018-02-24 15:28:54'),(35,2,6,NULL,NULL,'a1, a2','2018-02-24 15:28:54'),(36,2,7,1,NULL,NULL,'2018-02-24 17:45:41'),(37,2,8,NULL,'a3',NULL,'2018-02-24 17:45:41'),(38,2,9,NULL,NULL,'a1, a2','2018-02-24 17:45:41'),(39,2,10,1,NULL,NULL,'2018-02-24 17:46:03'),(40,2,11,NULL,'a1',NULL,'2018-02-24 17:46:03'),(41,2,12,NULL,NULL,'a1, a3','2018-02-24 17:46:03'),(42,2,13,0,NULL,NULL,'2018-02-24 17:46:20'),(43,3,7,0,NULL,NULL,'2018-02-24 17:49:08'),(44,3,8,NULL,'a2',NULL,'2018-02-24 17:49:08'),(45,3,9,NULL,NULL,'a1, a2','2018-02-24 17:49:09'),(46,3,10,1,NULL,NULL,'2018-02-24 17:49:20'),(47,3,11,NULL,'a1',NULL,'2018-02-24 17:49:20'),(48,3,12,NULL,NULL,'a1, a2','2018-02-24 17:49:20'),(49,3,13,1,NULL,NULL,'2018-02-24 17:49:30');
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
INSERT INTO `users` VALUES (1,'John Patrick','Agduma','jpagduma','21232f297a57a5a743894a0e4a801fc3','patrickagduma@gmail.com','T',1,'2018-02-06'),(2,'Niko Jay','Mateo','njmateo','21232f297a57a5a743894a0e4a801fc3','nikomateo@gmail.com','S',1,'2018-02-06'),(3,'Rachelle Anne','Itutud','raitutud','21232f297a57a5a743894a0e4a801fc3','reanne@gmail.com','S',1,'2018-02-06'),(4,'Alfonso Louis','Alfonso','alalfonso','21232f297a57a5a743894a0e4a801fc3','alfonso@gmail.com','S',1,'2018-02-06'),(17,'Rodel','Marcha','rmarcha','4ca7c5c27c2314eecc71f67501abb724','','S',1,'2018-02-07'),(18,'Dustin Hyrell','Lim','Dlim','21232f297a57a5a743894a0e4a801fc3','dlim@gmail.com','T',1,'2018-02-13'),(19,'Sean','Mallonga','SMallonga','21232f297a57a5a743894a0e4a801fc3','smallonga@gmail.com','S',1,'2018-02-13'),(20,'Kirk','Donio','kdonio','21232f297a57a5a743894a0e4a801fc3','donio@gmail.com','T',1,'2018-02-19'),(22,'administrator','administrator','administrator','200ceb26807d6bf99fd6f4f0d1ca54d4','','A',1,'2018-02-19'),(23,'Danlord','Mabano','dmabano','21232f297a57a5a743894a0e4a801fc3','dmabano@gmail.com','T',1,'2018-02-22'),(24,'Roshan','Glen','rglen','21232f297a57a5a743894a0e4a801fc3','rglen@gmail.com','S',1,'2018-02-22');
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

-- Dump completed on 2018-02-24 18:13:48
