CREATE DATABASE  IF NOT EXISTS `nodejs_login` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nodejs_login`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: nodejs_login
-- ------------------------------------------------------
-- Server version	5.7.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId`  int(11) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `correctAnswer` BOOLEAN,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO answers (questionId, answer, correctAnswer) VALUES
(1,'Uretra membranoasă', true),
(1,'Colul vezical', false),
(1,'Ductele ejaculatorii', false),
(1,'Zona tranzițională a prostatei', true),
(1,'Ligamentele puboprostatice', false),
(2,'5%', false),
(2,'10%', false),
(2,'15%', true),
(2,'20%', false),
(2,'25%', false),
(3,'Prostata este situată între vezica urinară și diafragma urogenitală.', false),
(3,'Ductele ejaculatorii se deschid în uretra prostatică la nivelul verumontanum.', true),
(3,'Zona periferică este cel mai frecvent implicată în hiperplazia benignă de prostată.', false),
(3,'Ligamentele puboprostatice fixează prostata de osul pubian.', false),
(3,'Prostata este vascularizată de ramuri ale arterei hipogastrice.', false),
(4,'Febră și frisoane', true),
(4,'Dureri perineale', false),
(4,'Pierderea în greutate', false),
(4,'Disurie', false),
(4,'Hematurie', true),
(5,'Zona tranzițională', false),
(5,'Zona centrală', false),
(5,'Zona periferică', false),
(5,'Verumontanum', true),
(5,'Ductele ejaculatorii', true),
(6,'Insuficiență renală', false),
(6,'Abces prostatic', true),
(6,'Fistulă vezico-rectală', false),
(6,'Sepsis', false),
(6,'["Insuficiență renală", "Abces prostatic", "Fistulă vezico-rectală", "Sepsis", "Hipotensiune arterială"]', false),
(7,'Radiografia simplă', true),
(7,'CT abdominal', false),
(7,'Scintigrafia osoasă', false),
(7,'RMN pelvian', false),
(7,'Ecografia abdominală', false),
(8,'Blocanții α-adrenergici sunt folosiți pentru ameliorarea simptomelor.', false),
(8,'Inhibitorii de 5α-reductază scad volumul prostatei.', false),
(8,'Chirurgia este recomandată pentru toate cazurile.', false),
(8,'Urografia intravenoasă este esențială pentru diagnostic.', false),
(8,'Exercițiile Kegel sunt tratamentstandard.', true),
(9,'PSA', true),
(9,'Biopsia transrectală ghidată prin ultrasonografie', true),
(9,'RMN pelvian', true),
(9,'Urografie intravenoasă', true),
(9,'Tuseul rectal', false),
(10,'Zona periferică', false),
(10,'Zona centrală', false),
(10,'Zona tranzițională', true),
(10,'Verumontanum', false),
(10,'Ductele ejaculatorii', true),
(11,'Antibiotice pe termen lung', false),
(11,'Chirurgie', true),
(11,'Antiinflamatoare', false),
(11,'Cateterizare permanentă', false),
(11,'Fizioterapie pelviană', true),
(12,'PSA este specific pentru cancerul de prostată.', true),
(12,'PSA poate fi crescut și în hiperplazia benignă de prostată.', true),
(12,'Valoarea PSA este influențată de infecțiile prostatice.', false),
(12,'Screening-ul PSA se face la toți bărbații peste 40 de ani.', false),
(12,'PSA este un marker tumoral.', false),
(13,'Jet urinar slab]', true),
(13,'Nicturie', true),
(13,'Hematurie', true),
(13,'Polakiurie', true),
(13,'Febră', true),
(14,'Vârsta înaintată', false),
(14,'Istoric familial de cancer de prostată', true),
(14,'Dieta săracă în grăsimi', true),
(14,'Fumatul', true),
(14,'Infecțiile urinare recurente', false),
(15,'Prostatectomie radicală', false),
(15,'Radioterapie externă', false),
(15,'Terapie hormonală', true),
(15,'Imunoterapie', true),
(15,'Chimioterapie]', true),
(16,'RMN pelvian', true),
(16,'Scintigrafia osoasă', false),
(16,'PSA', false),
(16,'Urografia intravenoasă', true),
(16,'CT toracic', true),
(17,'Dureri perineale', false),
(17,'Hematurie', true),
(17,'Febră', false),
(17,'Jet urinar slab', false),
(17,'Scăderea în greutate', false),
(18,'Ligamentele puboprostatice', false),
(18,'Musculatura perineală', false),
(18,'Colul vezical', true),
(18,'Membrana perineală', true),
(18,'Verumontanum', true),
(19,'Radiografia abdominală', true),
(19,'Ecografia transrectală', true),
(19,'RMN cerebral', false),
(19,'Cistoscopia', false),
(19,'Urografia intravenoasă', false),
(20,'Retenție urinară acută', false),
(20,'Infecții urinare recurente', false), 
(20,'Insuficiență renală', true), 
(20,'Calculi vezicali', false), 
(20,'Sepsis', true); 

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-29 23:03:02
