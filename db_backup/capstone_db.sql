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
-- Table structure for table `class_video`
--

DROP TABLE IF EXISTS `class_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `topic` text NOT NULL,
  `video_link` text NOT NULL,
  `lastModifiedDate` date NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_video`
--

LOCK TABLES `class_video` WRITE;
/*!40000 ALTER TABLE `class_video` DISABLE KEYS */;
INSERT INTO `class_video` VALUES (16,2,'sample topic','https://www.youtube.com/watch?v=F21S9Wpi0y8','2018-02-18',1),(3,6,'lesson 3','https://www.youtube.com/embed/CEu7h86MYoA','2018-02-07',1),(10,8,'Lesson4','https://www.youtube.com/embed/kSwBJXNwJYM','2018-02-13',18),(11,1,'sample','https://www.youtube.com/watch?v=ALSX2Yb3ito235','2018-02-15',1),(15,1,'Updated video sample','https://www.youtube.com/embed/LlXl0sFy8LA','2018-02-17',1),(17,9,'Lesson 1','https://www.youtube.com/embed/8fggElhyTyk','2018-02-19',20);
/*!40000 ALTER TABLE `class_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(15) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `class_description` text,
  `instructor` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `lastModifiedDate` date DEFAULT NULL,
  `base_grade` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'TRI101','Trigonometry','Sample Topic','John Patrick Agduma',1,'2018-02-06',50),(2,'ENG24','English','sample course english','John Patrick Agduma',1,'2018-02-06',40),(9,'AP123','Araling Panlipunan','Sample Topic Descrition','Kirk Donio',20,'2018-02-19',50),(6,'AP3','Araling Panlipunan','','John Patrick Agduma',1,'2018-02-07',50),(7,'AP24','Araling Panlipunan','sample','John Patrick Agduma',1,'2018-02-12',50),(8,'AP27','Araling Panlipunan','sample description','Dustin Hyrell Lim',18,'2018-02-13',50);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
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
  `course_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `lastModifiedDate` date NOT NULL,
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
-- Table structure for table `student_course_enrollment`
--

DROP TABLE IF EXISTS `student_course_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `lastModifiedDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_enrollment`
--

LOCK TABLES `student_course_enrollment` WRITE;
/*!40000 ALTER TABLE `student_course_enrollment` DISABLE KEYS */;
INSERT INTO `student_course_enrollment` VALUES (1,2,1,'approved','2018-02-06'),(2,3,1,'approved','2018-02-06'),(3,4,1,'denied','2018-02-06'),(4,4,2,'approved','2018-02-06'),(5,3,6,'approved','2018-02-09'),(6,19,8,'approved','2018-02-13'),(7,21,9,'approved','2018-02-19');
/*!40000 ALTER TABLE `student_course_enrollment` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `topic` text NOT NULL,
  `video_id` int(11) NOT NULL,
  `summary` text,
  `permalink` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,'Trigonometry',1,'sample sample sample sample','trigonometry'),(2,1,'sample part 2',1,'testing testing','sample_part_2'),(3,1,'sample',1,'qwertyuiop','sample'),(4,2,'asdf',1,'asdsf','asdf'),(5,1,'asasas',1,'sample','asasas'),(6,1,'qwerty',1,'qwert','qwerty'),(7,6,'tesataasasdasg',3,'asdfasfsad','tesataasasdasg'),(8,8,'Lesson4 Sample Topic',10,'Sample Summary','lesson4_sample_topic'),(9,1,'sample testing',11,'sample','sample_testing'),(10,9,'lesson 1 sample topic',17,'sample summary ','lesson_1_sample_topic');
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
  `course_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item`
--

LOCK TABLES `topic_item` WRITE;
/*!40000 ALTER TABLE `topic_item` DISABLE KEYS */;
INSERT INTO `topic_item` VALUES (1,1,1,'20 + 20 =  40?','20__20___40',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,1,'20 + 20 + 20 = ?','20__20__20__',NULL,'30','40','50','60',NULL,NULL,'60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,1,'20 x 20 x 0 = ?','20_x_20_x_0__',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100','400','0','200',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL),(4,2,1,'question1','question1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,1,'question2','question2',NULL,'ans1','ans2','ans3','ans4',NULL,NULL,'ans3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,1,'question3','question3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'answ1','answ2','answ3','answ4','answ5',NULL,'answ1','answ4',NULL,NULL,NULL,NULL),(7,2,1,'question4','question4',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,2,1,'question5','question5',NULL,'answ1','answ2','answ3','answ4',NULL,NULL,'answ4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,2,1,'question6','question6',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,3,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,3,1,'question 2','question_2',NULL,'answ1','answ2','answ3','answ4',NULL,NULL,'answ3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,3,1,'question3','question3',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,3,1,'question4','question4',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,3,1,'qusd','qusd',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,4,2,'asd','asd',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,4,2,'asdf','asdf',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,4,2,'qwer','qwer',NULL,'qewre','qew','qewe',NULL,NULL,NULL,'qew',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,5,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,5,1,'q2','q2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,5,1,'q3','q3',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,6,1,'question1','question1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,6,1,'question2','question2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,6,1,'question3','question3',NULL,'answ1','answ2','answ3',NULL,NULL,NULL,'answ1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,7,6,'Today is friday','today_is_friday',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,7,6,'Tomorrow is saturday (02-10-2018)','tomorrow_is_saturday_02102018',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,8,8,'Si Lapu-lapu ang unang bayani?','si_lapulapu_ang_unang_bayani',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,8,8,'1+1=?','11',NULL,'1','2','3',NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,8,8,'alin sa halimbawa ang hayop','alin_sa_halimbawa_ang_hayop',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aso','pusa','baso','lapis',NULL,NULL,'aso','pusa',NULL,NULL,NULL,NULL),(29,9,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,9,1,'q1','q1',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,9,1,'q3','q3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4',NULL,NULL,'a1','a2',NULL,NULL,NULL,NULL),(32,10,9,'question1','question1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,10,9,'question2','question2',NULL,'answer1','answer2','answer3',NULL,NULL,NULL,'answer1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,10,9,'question3','question3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'answer1','answer2','answer3','answer4','answer5',NULL,'answer1','answer2',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item_answer`
--

LOCK TABLES `topic_item_answer` WRITE;
/*!40000 ALTER TABLE `topic_item_answer` DISABLE KEYS */;
INSERT INTO `topic_item_answer` VALUES (1,21,32,1,NULL,NULL),(2,21,33,NULL,'answer1',NULL),(3,21,34,NULL,NULL,'answer1, answer2');
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
  `userType` varchar(1) NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `lastModifiedDate` date DEFAULT NULL,
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

-- Dump completed on 2018-02-20 20:51:00
