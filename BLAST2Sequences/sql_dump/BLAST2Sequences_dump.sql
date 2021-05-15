-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gspreng2
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `short_title` varchar(250) DEFAULT NULL,
  `sequence_one` varchar(250) NOT NULL,
  `sequence_two` varchar(250) NOT NULL,
  PRIMARY KEY (`query_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'DQ821936.1 x DQ821936.1','DQ821936.1 Bos indicus x Bos taurus lactoferrin (lactoferrin)','DQ821936.1 Bos indicus x Bos taurus lactoferrin (lactoferrin) gene,'),(2,'DQ821936.1 x AJ005203.1','DQ821936.1 Bos indicus x Bos taurus lactoferrin (lactoferrin)','AJ005203.1 Bubalus arnee bubalis mRNA for lactoferrin'),(3,'AJ005203.1 x AJ005203.1','AJ005203.1 Bubalus arnee bubalis mRNA for lactoferrin','AJ005203.1 Bubalus arnee bubalis mRNA for lactoferrin');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_id` int(11) NOT NULL,
  `query` varchar(250) NOT NULL,
  `matches` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `score` varchar(50) NOT NULL,
  `identities` varchar(50) NOT NULL,
  `strand` varchar(50) NOT NULL,
  UNIQUE KEY `row_id` (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,1,'58  tctaggaaccagcagacctcgggagaggggaggagggaggctggggcgcttataggacca 117\n','           ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n','58  tctaggaaccagcagacctcgggagaggggaggagggaggctggggcgcttataggacca 117\n',' 468 bits (236), Expect = e-137','236/236 (100%)','Plus / Plus'),(2,1,'118 cagggcggggcaaacctcgtgaggtcaccgagcactggataaagggacgcagaacgagcg 177\n','           ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n','118 cagggcggggcaaacctcgtgaggtcaccgagcactggataaagggacgcagaacgagcg 177\n','','',''),(3,2,'210 caggaccccagccatgaagctcttcgtccccgccctgctgtcccttggagcccttgg 266\n','           ||||||| ||| |||||||||||||||||||||||||||||||||||||||||||||\n','1   caggacctcagacatgaagctcttcgtccccgccctgctgtcccttggagcccttgg 57\n','97.6 bits (49), Expect = 3e-24','55/57 (96%)','Plus / Plus'),(4,2,'66  ccagcagacct 76\n','           |||||||||||\n','441 ccagcagacct 431\n','22.3 bits (11), Expect = 0.13','11/11 (100%)','Plus / Minus'),(5,3,'1    caggacctcagacatgaagctcttcgtccccgccctgctgtcccttggagcccttggact 60\n','            ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n','1    caggacctcagacatgaagctcttcgtccccgccctgctgtcccttggagcccttggact 60\n','4532 bits (2286), Expect = 0.0','2300/2307 (99%)','Plus / Plus'),(6,3,'61   gtgtctggctgccccgaggaaaaacgttcgatggtgtaccatctcccaacccgagtggct 120\n','            ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n','61   gtgtctggctgccccgaggaaaaacgttcgatggtgtaccatctcccaacccgagtggct 120\n','','','');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-15 17:50:53
