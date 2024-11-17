CREATE DATABASE  IF NOT EXISTS `nodejs_login` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nodejs_login`;

DROP TABLE IF EXISTS `tqLink`;
CREATE TABLE `tqLink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `answers` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tqLink`
--

LOCK TABLES `tqLink` WRITE;
/*!40000 ALTER TABLE `tqLink` DISABLE KEYS */;
INSERT INTO `tqLink` VALUES (1,1,1,'1,2,3,4');
INSERT INTO `tqLink` VALUES (2,1,2,''); 
INSERT INTO `tqLink` VALUES (3,2,2,'3,4'); 
/*!40000 ALTER TABLE `tqLink` ENABLE KEYS */;
UNLOCK TABLES;