-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: capstone_db
-- ------------------------------------------------------
-- Server version	5.7.19

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,1,'AAA',1,'3','Apple',22,'2018-02-22',50),(2,2,'AAB',1,'2','banana',1,'2018-02-22',50);
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class_enrollment`
--

LOCK TABLES `student_class_enrollment` WRITE;
/*!40000 ALTER TABLE `student_class_enrollment` DISABLE KEYS */;
INSERT INTO `student_class_enrollment` VALUES (4,3,1,'approved','2018-02-22'),(3,3,2,'approved','2018-02-22'),(5,2,2,'approved','2018-02-22'),(6,2,1,'approved','2018-02-22'),(7,19,2,'approved','2018-02-22'),(8,19,1,'approved','2018-02-22'),(9,17,1,NULL,'2018-02-23'),(10,25,1,NULL,'2018-02-23');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classes`
--

LOCK TABLES `student_classes` WRITE;
/*!40000 ALTER TABLE `student_classes` DISABLE KEYS */;
INSERT INTO `student_classes` VALUES (3,3,2,1,'2018-02-22'),(4,3,1,1,'2018-02-22'),(5,2,1,1,'2018-02-22'),(6,19,1,1,'2018-02-22'),(7,2,2,1,'2018-02-22'),(8,19,2,1,'2018-02-22'),(9,24,1,1,'2018-02-23');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_videos`
--

LOCK TABLES `subject_videos` WRITE;
/*!40000 ALTER TABLE `subject_videos` DISABLE KEYS */;
INSERT INTO `subject_videos` VALUES (1,1,'English: Lesson 1','https://www.youtube.com/embed/dU4dmIeDIes','2018-02-22',1),(2,1,'Linking Verbs','https://www.youtube.com/embed/KWlGzhXIeQ8','2018-02-23',22),(3,1,'synonyms','https://www.youtube.com/embed/CoxPQ4kpkb4','2018-02-23',22);
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
INSERT INTO `topic` VALUES (1,1,'Bilateration Verbs',1,'sample summary English',''),(2,1,'Linking Verbs',2,'A linking verb is a verb that joins the subject of a sentence to the complement. It is sometimes called a copula or a copular verb. Linking verbs do just that, \"link\" the action verb to what the action is. Here are some examples of linking verbs: The sky is blue.','linking_verbs'),(3,1,'synonyms',3,'A synonym is a word or phrase that means exactly or nearly the same as another word or phrase in the same language. Words that are synonyms are said to be synonymous, and the state of being a synonym is called synonymy.','synonyms');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_item`
--

LOCK TABLES `topic_item` WRITE;
/*!40000 ALTER TABLE `topic_item` DISABLE KEYS */;
INSERT INTO `topic_item` VALUES (1,1,1,'q1','q1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,1,'q2','q2',NULL,'a1','a2','a3',NULL,NULL,NULL,'a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,1,'q3','q3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a1','a2','a3','a4',NULL,NULL,'a1','a2',NULL,NULL,NULL,NULL),(4,2,1,'A linking verb is a verb that joins the subject of a sentence to the complement.','a_linking_verb_is_a_verb_that_joins_the_subject_of_a_sentence_to_the_complement',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,1,'Linking verb is a word or phrase naming an attribute, added to or grammatically related to a noun to modify or describe it.','linking_verb_is_a_word_or_phrase_naming_an_attribute_added_to_or_grammatically_related_to_a_noun_to_modify_or_describe_it',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,1,'Linking verbs do just that, ___the action verb to what the action is.','linking_verbs_do_just_that____the_action_verb_to_what_the_action_is',NULL,'Emphasize','Negate','Elaborate','Conjugate','Copulate','Link','Link',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,1,'Identify which among the examples below have linking verbs:','identify_which_among_the_examples_below_have_linking_verbs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'The sky is blue.','In the schools are enclosed rooms.','Vacation','Marshall Law','The Finger is long',NULL,'The sky is blue.','In the schools are enclosed rooms.','The Finger is long',NULL,NULL,NULL),(8,3,1,'is a word that is the opposite meaning of another. It comes from the Greek words â€œantiâ€ for opposite and â€œonymâ€ for name. Since language is complex, people may at times, disagree on what words are truly opposite in meaning to other words.','is_a_word_that_is_the_opposite_meaning_of_another_it_comes_from_the_greek_words_anti_for_opposite_and_onym_for_name_since_language_is_complex_people_may_at_times_disagree_on_what_words_are_truly_opposite_in_meaning_to_other_words',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,3,1,'Select which are examples of synonyms','select_which_are_examples_of_synonyms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'buy and purchase','Likely and unlikely','big and large','quickly and speedily','on and upon',NULL,'buy and purchase','big and large','quickly and speedily','on and upon',NULL,NULL),(10,3,1,'Is this statement true \"Synonyms are defined with respect to certain senses of words: pupil as the aperture in the iris of the eye is not synonymous with student.\"?','is_this_statement_true_synonyms_are_defined_with_respect_to_certain_senses_of_words_pupil_as_the_aperture_in_the_iris_of_the_eye_is_not_synonymous_with_student',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,3,1,'Is the statement \"A thesaurus lists similar or related words; these are often, but not always, synonyms.\" true?','is_the_statement_a_thesaurus_lists_similar_or_related_words_these_are_often_but_not_always_synonyms_true',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,3,1,'synonyms have a relationship where there is no middle ground. There are only two possibilities, either one or the other.\r\nRead more at http://examples.yourdictionary.com/examples-of-antonyms.html#opkD4000YIj5PvvZ.99','synonyms_have_a_relationship_where_there_is_no_middle_ground_there_are_only_two_possibilities_either_one_or_the_otherread_more_at_httpexamplesyourdictionarycomexamplesofantonymshtmlopkd4000yij5pvvz99',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `topic_item_answer` VALUES (1,3,1,1,NULL,NULL),(2,3,2,NULL,'a1',NULL),(3,3,3,NULL,NULL,'a1, a2');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Patrick','Agduma','jpagduma','21232f297a57a5a743894a0e4a801fc3','patrickagduma@gmail.com','T',1,'2018-02-06'),(2,'Niko Jay','Mateo','njmateo','21232f297a57a5a743894a0e4a801fc3','nikomateo@gmail.com','S',1,'2018-02-06'),(3,'Rachelle Anne','Itutud','raitutud','21232f297a57a5a743894a0e4a801fc3','reanne@gmail.com','S',1,'2018-02-06'),(4,'Alfonso Louis','Alfonso','alalfonso','21232f297a57a5a743894a0e4a801fc3','alfonso@gmail.com','S',1,'2018-02-06'),(17,'Rodel','Marcha','rmarcha','21232f297a57a5a743894a0e4a801fc3','','S',1,'2018-02-07'),(18,'Dustin Hyrell','Lim','Dlim','21232f297a57a5a743894a0e4a801fc3','dlim@gmail.com','T',1,'2018-02-13'),(19,'Sean','Mallonga','SMallonga','21232f297a57a5a743894a0e4a801fc3','smallonga@gmail.com','S',1,'2018-02-13'),(20,'Kirk','Donio','kdonio','21232f297a57a5a743894a0e4a801fc3','donio@gmail.com','T',1,'2018-02-19'),(21,'Alfonso Louis','Alfonso','ALalfonso','21232f297a57a5a743894a0e4a801fc3','alfonso@gmail.com','S',1,'2018-02-19'),(22,'administrator','administrator','administrator','200ceb26807d6bf99fd6f4f0d1ca54d4','','A',1,'2018-02-19'),(23,'Danlord','Mabano','dmabano','21232f297a57a5a743894a0e4a801fc3','dmabano@gmail.com','T',1,'2018-02-22'),(24,'Roshan','Glen','rglen','21232f297a57a5a743894a0e4a801fc3','rglen@gmail.com','S',1,'2018-02-22'),(25,'Tioryso','Dimalata','tdimalata','21232f297a57a5a743894a0e4a801fc3','','S',1,'2018-02-23');
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

-- Dump completed on 2018-02-24  0:00:13
