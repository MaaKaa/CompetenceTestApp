-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: competencetest
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `competenceTests`
--

DROP TABLE IF EXISTS `competenceTests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competenceTests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `organisation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbh3ros795x7p3n8mn1rht9ba` (`organisation_id`),
  CONSTRAINT `FKsbh3ros795x7p3n8mn1rht9ba` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competenceTests`
--

LOCK TABLES `competenceTests` WRITE;
/*!40000 ALTER TABLE `competenceTests` DISABLE KEYS */;
INSERT INTO `competenceTests` VALUES (1,'2019-06-07 21:59:33','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','CharityRun67287zVJrc','Charity Run',1),(2,'2019-06-07 22:03:04','Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.','Cookingworkshopsforchildren42waIALHLX','Cooking workshops for children',2),(3,'2019-06-07 22:06:04','Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. ','CodingworkshopsforgirlsmuX5uuC7MF','Coding workshops for girls',1),(4,'2019-06-07 22:07:33','At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ','OfficeworksweIu5bHAGn','Office works',2);
/*!40000 ALTER TABLE `competenceTests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldsOfActivity`
--

DROP TABLE IF EXISTS `fieldsOfActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldsOfActivity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldsOfActivity`
--

LOCK TABLES `fieldsOfActivity` WRITE;
/*!40000 ALTER TABLE `fieldsOfActivity` DISABLE KEYS */;
INSERT INTO `fieldsOfActivity` VALUES (1,'environment'),(2,'education'),(3,'health');
/*!40000 ALTER TABLE `fieldsOfActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jdhueb87fr1uyncvg1igly2bw` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES (1,'Warsaw','Poland','Lorem ipsum dolor sit amet.','demo@fundacja.com','Demo Foundation','$2a$10$2ReXBYVAOK25PvtgsscAG.5Nbvec.GVkjKsrP5uf6zAO4M9HYdcN2','http://demofoundation.org'),(2,'Radom','Poland','Lorem ipsum dolor sit amet.','demo@association.org','Demo Association','$2a$10$Rk7UwTZ6Dg.4IOUUEUZL/.wJsre.00kSlxSQTFwwz31xwQRcGqH4O','http://association.org');
/*!40000 ALTER TABLE `organisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisations_fieldsOfActivity`
--

DROP TABLE IF EXISTS `organisations_fieldsOfActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisations_fieldsOfActivity` (
  `organisations_id` bigint(20) NOT NULL,
  `fieldsOfActivity_id` bigint(20) NOT NULL,
  KEY `FK2esxm10phrc8istnccjwx5ktl` (`fieldsOfActivity_id`),
  KEY `FKmbytpc9w7nh4xeq4nek4lmhat` (`organisations_id`),
  CONSTRAINT `FK2esxm10phrc8istnccjwx5ktl` FOREIGN KEY (`fieldsOfActivity_id`) REFERENCES `fieldsOfActivity` (`id`),
  CONSTRAINT `FKmbytpc9w7nh4xeq4nek4lmhat` FOREIGN KEY (`organisations_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations_fieldsOfActivity`
--

LOCK TABLES `organisations_fieldsOfActivity` WRITE;
/*!40000 ALTER TABLE `organisations_fieldsOfActivity` DISABLE KEYS */;
INSERT INTO `organisations_fieldsOfActivity` VALUES (1,1),(1,2),(1,3),(2,1),(2,2);
/*!40000 ALTER TABLE `organisations_fieldsOfActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solutions`
--

DROP TABLE IF EXISTS `solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solutions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `autonomy` int(11) NOT NULL,
  `challenge` varchar(500) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `communicationQ1` int(11) NOT NULL,
  `communicationQ2` int(11) NOT NULL,
  `communicationQ3` int(11) NOT NULL,
  `communicationQ4` int(11) NOT NULL,
  `communicationQ5` int(11) NOT NULL,
  `communicationQ6` int(11) NOT NULL,
  `communicationResult` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `flexibilityQ1` int(11) NOT NULL,
  `flexibilityQ2` int(11) NOT NULL,
  `flexibilityQ3` int(11) NOT NULL,
  `flexibilityResult` varchar(255) DEFAULT NULL,
  `lessonLearned` varchar(500) NOT NULL,
  `resultRoleAndAutonomy` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `task` varchar(500) NOT NULL,
  `teamWorkQ1` int(11) NOT NULL,
  `teamWorkQ2` int(11) NOT NULL,
  `teamWorkQ3` int(11) NOT NULL,
  `teamWorkQ4` int(11) NOT NULL,
  `teamWorkQ5` int(11) NOT NULL,
  `teamWorkResult` varchar(255) DEFAULT NULL,
  `competenceTest_id` bigint(20) DEFAULT NULL,
  `volunteer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhnvfvicdaabxt9rph4imrarno` (`competenceTest_id`),
  KEY `FKbob8vdidl4pt0p4co42264ofr` (`volunteer_id`),
  CONSTRAINT `FKbob8vdidl4pt0p4co42264ofr` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`id`),
  CONSTRAINT `FKhnvfvicdaabxt9rph4imrarno` FOREIGN KEY (`competenceTest_id`) REFERENCES `competenceTests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
INSERT INTO `solutions` VALUES (1,4,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ','',3,3,3,3,3,3,'Excellent','2019-06-07 22:14:13',3,3,3,'Excellent','At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ','Expert',4,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ',3,3,3,3,3,'Excellent',1,1),(2,3,'emporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.','',2,2,2,2,2,2,'Plain','2019-06-07 22:16:18',2,2,2,'Plain','emporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.','Accomplished',3,'emporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.',2,2,2,2,2,'Plain',1,2);
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `temporaryPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_golxtxk6l1pw0e5eq3tidntj7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
INSERT INTO `volunteers` VALUES (1,NULL,NULL,NULL,'kacprowicz.marzena@gmail.com',NULL,'Marzena','$2a$10$SOXgA2f9AAK8MZTy85iP8OEi.BhnmD30AMW3KHih5u1oWe5998kom','6tzJHBUr'),(2,NULL,NULL,NULL,'uptodot@gmail.com',NULL,'Marcin','$2a$10$Y1Bn1JbJ2dStAHoMjKgpr.P.xRSlHw3JdqIWTbbsHuNEf8OYHUmQ.','Vftrf9aa');
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers_competenceTests`
--

DROP TABLE IF EXISTS `volunteers_competenceTests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteers_competenceTests` (
  `volunteers_id` bigint(20) NOT NULL,
  `competenceTests_id` bigint(20) NOT NULL,
  KEY `FKiwcwnoug8sdir7vd0swwxlhs6` (`competenceTests_id`),
  KEY `FKjgbh27i1jnmt693x3190yjge8` (`volunteers_id`),
  CONSTRAINT `FKiwcwnoug8sdir7vd0swwxlhs6` FOREIGN KEY (`competenceTests_id`) REFERENCES `competenceTests` (`id`),
  CONSTRAINT `FKjgbh27i1jnmt693x3190yjge8` FOREIGN KEY (`volunteers_id`) REFERENCES `volunteers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers_competenceTests`
--

LOCK TABLES `volunteers_competenceTests` WRITE;
/*!40000 ALTER TABLE `volunteers_competenceTests` DISABLE KEYS */;
INSERT INTO `volunteers_competenceTests` VALUES (1,1),(1,3),(1,2),(2,1),(2,4);
/*!40000 ALTER TABLE `volunteers_competenceTests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-07 22:22:36
