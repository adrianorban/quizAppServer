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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(300) NOT NULL DEFAULT 'quesion',
  `options` varchar(1000) NOT NULL,
  `correctAnswer` varchar(10) NOT NULL,
  `category` varchar(50) NOT NULL,
  `difficulty` int(11) NOT NULL DEFAULT 5,
  `explanation` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO questions (question, options, correctAnswer, category, difficulty, explanation) VALUES
('Care dintre următoarele structuri este localizată distal de uretra prostatică?', '["Uretra membranoasă", "Colul vezical", "Ductele ejaculatorii", "Zona tranzițională a prostatei", "Ligamentele puboprostatice"]', '1', 'Anestezie', 5, 'Uretra membranoasă, care este împrejmuită de sfincterul urinar extern, este localizată distal de uretra prostatică.'),
('Ce procent din volumul ejaculatului este reprezentat de secrețiile glandei prostatice?', '["5%", "10%", "15%", "20%", "25%"]', '4', 'Anestezie', 3, 'Secrețiile glandei prostatice reprezintă aproximativ 20% din volumul ejaculatului normal, oferind substanțe nutritive necesare pentru motilitatea și funcția normală a spermatozoizilor.'),
('Care dintre următoarele afirmații despre anatomia prostatei sunt corecte?', '["Prostata este situată între vezica urinară și diafragma urogenitală.", "Ductele ejaculatorii se deschid în uretra prostatică la nivelul verumontanum.", "Zona periferică este cel mai frecvent implicată în hiperplazia benignă de prostată.", "Ligamentele puboprostatice fixează prostata de osul pubian.", "Prostata este vascularizată de ramuri ale arterei hipogastrice."]', '1, 2, 4, 5', 'Urologie', 5, 'Prostata este situată între vezica urinară și diafragma urogenitală, iar ductele ejaculatorii se deschid în uretra prostatică la nivelul verumontanum. Vascularizația prostatei provine din arterele vezicale inferioare și rectale medii.'),
('Care dintre următoarele simptome sunt specifice prostatitei acute?', '["Febră și frisoane", "Dureri perineale", "Hematurie", "Pierderea în greutate", "Disurie"]', '1, 2, 5', 'Cardiologie', 5, 'Prostatita acută este caracterizată prin febră, frisoane, dureri perineale și disurie. Hematuria și pierderea în greutate nu sunt simptome specifice prostatitei acute.'),
('Care zonă a prostatei este implicată în majoritatea cazurilor de cancer de prostată?', '["Zona tranzițională", "Zona centrală", "Zona periferică", "Verumontanum", "Ductele ejaculatorii"]', '3', 'Urologie', 4, 'Zona periferică a glandei prostatice reprezintă originea a aproximativ 90% dintre cazurile de cancer de prostată.'),
('Ce complicație este frecventă în cazul netratării prostatitei acute?', '["Insuficiență renală", "Abces prostatic", "Fistulă vezico-rectală", "Sepsis", "Hipotensiune arterială"]', '2, 4', 'Cardiologie', 5, 'Prostatita acută netratată poate duce la formarea unui abces prostatic și la sepsis.'),
('Ce test imagistic este cel mai sensibil pentru detectarea metastazelor osoase în cancerul de prostată?', '["Radiografia simplă", "CT abdominal", "Scintigrafia osoasă", "RMN pelvian", "Ecografia abdominală"]', '3', 'Anestezie', 4, 'Scintigrafia osoasă este cea mai sensibilă metodă pentru detectarea metastazelor osoase în cancerul de prostată.'),
('Care dintre următoarele afirmații despre tratamentul HBP sunt corecte?', '["Blocanții α-adrenergici sunt folosiți pentru ameliorarea simptomelor.", "Inhibitorii de 5α-reductază scad volumul prostatei.", "Chirurgia este recomandată pentru toate cazurile.", "Urografia intravenoasă este esențială pentru diagnostic.", "Exercițiile Kegel sunt tratament standard."]', '1, 2', 'Urologie', 4, 'Blocanții α-adrenergici sunt utilizați pentru ameliorarea simptomelor, iar inhibitorii de 5α-reductază scad volumul prostatei. Chirurgia nu este recomandată pentru toate cazurile, iar urografia intravenoasă nu este esențială pentru diagnostic.'),
('Care dintre următoarele metode sunt utilizate pentru diagnosticarea cancerului de prostată?', '["PSA", "Biopsia transrectală ghidată prin ultrasonografie", "RMN pelvian", "Urografie intravenoasă", "Tuseul rectal"]', '1, 2, 5', 'Urologie', 4, 'PSA, biopsia transrectală ghidată prin ultrasonografie și tuseul rectal sunt metode importante pentru diagnosticarea cancerului de prostată.'),
('Ce zonă a prostatei este implicată în hiperplazia benignă de prostată (HBP)?', '["Zona periferică", "Zona centrală", "Zona tranzițională", "Verumontanum", "Ductele ejaculatorii"]', '3', 'Urologie', 3, 'Zona tranzițională este cea mai frecvent implicată în hiperplazia benignă de prostată.'),
('Ce tratament este indicat pentru prostatita cronică?', '["Antibiotice pe termen lung", "Chirurgie", "Antiinflamatoare", "Cateterizare permanentă", "Fizioterapie pelviană"]', '1, 3, 5', 'Cardiologie', 4, 'Tratamentul pentru prostatita cronică include antibiotice pe termen lung, antiinflamatoare și fizioterapie pelviană. Chirurgia și cateterizarea permanentă nu sunt tratamente standard.'),
('Care dintre următoarele afirmații despre PSA sunt corecte?', '["PSA este specific pentru cancerul de prostată.", "PSA poate fi crescut și în hiperplazia benignă de prostată.", "Valoarea PSA este influențată de infecțiile prostatice.", "Screening-ul PSA se face la toți bărbații peste 40 de ani.", "PSA este un marker tumoral."]', '2, 3, 5', 'Urologie', 4, 'PSA poate fi crescut și în alte afecțiuni decât cancerul, precum hiperplazia benignă de prostată și infecțiile. PSA este un marker tumoral, dar nu este specific doar pentru cancerul de prostată.'),
('Care dintre următoarele simptome indică o obstrucție urinară inferioară în HBP?', '["Jet urinar slab", "Nicturie", "Hematurie", "Polakiurie", "Febră"]', '1, 2, 4', 'Cardiologie', 3, 'Jetul urinar slab, nicturia și polakiuria sunt simptome clasice ale obstrucției urinare inferioare în HBP. Hematuria și febra nu sunt simptome tipice.'),
('Ce factor de risc major este asociat cu cancerul de prostată?', '["Vârsta înaintată", "Istoric familial de cancer de prostată", "Dieta săracă în grăsimi", "Fumatul", "Infecțiile urinare recurente"]', '1, 2', 'Anestezie', 3, 'Vârsta înaintată și istoricul familial sunt cei mai importanți factori de risc pentru cancerul de prostată. Dieta, fumatul și infecțiile urinare nu au o legătură clară.'),
('Ce terapie este considerată standard pentru cancerul de prostată localizat?', '["Prostatectomie radicală", "Radioterapie externă", "Terapie hormonală", "Imunoterapie", "Chimioterapie"]', '1, 2', 'Urologie', 5, 'Prostatectomia radicală și radioterapia externă sunt tratamente standard pentru cancerul de prostată localizat. Terapia hormonală și chimioterapia sunt folosite pentru cazurile avansate.'),
('Care dintre următoarele metode sunt utilizate pentru evaluarea stadiului cancerului de prostată?', '["RMN pelvian", "Scintigrafia osoasă", "PSA", "Urografia intravenoasă", "CT toracic"]', '1, 2, 3', 'Urologie', 4, 'RMN-ul pelvian, scintigrafia osoasă și PSA sunt utilizate pentru evaluarea stadiului cancerului de prostată. Urografia intravenoasă și CT-ul toracic nu sunt metode standard.'),
('Ce simptom este cel mai frecvent întâlnit în prostatita cronică?', '["Dureri perineale", "Hematurie", "Febră", "Jet urinar slab", "Scăderea în greutate"]', '1', 'Cardiologie', 3, 'Durerile perineale sunt cele mai frecvente simptome ale prostatitei cronice. Hematuria, febra și scăderea în greutate nu sunt simptome tipice.'),
('Care dintre următoarele structuri nu face parte din sistemul de susținere al prostatei?', '["Ligamentele puboprostatice", "Musculatura perineală", "Colul vezical", "Membrana perineală", "Verumontanum"]', '5', 'Urologie', 4, 'Verumontanum nu face parte din sistemul de susținere al prostatei. Ligamentele puboprostatice, musculatura perineală și colul vezical sunt structuri de susținere.'),
('Ce investigație este utilă pentru evaluarea unui abces prostatic?', '["Radiografia abdominală", "Ecografia transrectală", "RMN cerebral", "Cistoscopia", "Urografia intravenoasă"]', '2', 'Urologie', 4, 'Ecografia transrectală este cea mai utilă investigație pentru evaluarea unui abces prostatic. Radiografia abdominală, RMN-ul cerebral și urografia intravenoasă nu sunt adecvate.'),
('Care dintre următoarele sunt complicații ale HBP netratate?', '["Retenție urinară acută", "Infecții urinare recurente", "Insuficiență renală", "Calculi vezicali", "Sepsis"]', '1, 2, 3, 4', 'Urologie', 4, 'Complicațiile HBP netratate includ retenția urinară acută, infecțiile urinare recurente, insuficiența renală și calculii vezicali. Sepsisul nu este o complicație comună.'); 
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
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

