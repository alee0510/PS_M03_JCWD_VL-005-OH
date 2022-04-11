CREATE DATABASE  IF NOT EXISTS `ps_jcwd_vl05_oh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ps_jcwd_vl05_oh`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ps_jcwd_vl05_oh
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `program` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'61057C27-B1B8-D5D4-BC23-80637AE1E61D','Wylie Avery','integer.aliquam.adipiscing@google.org','Digital Marketing','Special Capital Region of Jakarta'),(2,'66E7D324-93C7-C78C-A8D6-C28EF63B596C','Reed Rogers','amet@hotmail.couk','Fullstack Web Development','Special Region of Yogyakarta'),(3,'89B945ED-B412-8D91-DEB5-0A2AC2D6C03B','Vaughan Goff','nec.tellus@icloud.com','Fullstack Web Development','West Nusa Tenggara'),(4,'B672BC8B-7448-46C9-8C3C-1D9DFD39C20D','Hiroko Bolton','cras.pellentesque@google.net','Data Science','Bangka Belitung Islands'),(5,'B73334CC-4453-D955-B41C-357C5A30F16B','Jenette Martinez','enim@icloud.edu','Data Science','Riau'),(6,'844C3A16-0993-2BE2-FAB5-3716B68E99CE','Ferdinand Doyle','adipiscing.mauris.molestie@icloud.couk','UI/UX Designer','West Java'),(7,'6E353A64-9CC7-381C-D8BC-F1B4374CED25','Cara Goodman','semper@google.ca','Data Science','South Sulawesi'),(8,'9B6DB951-8A60-E242-3B5A-56073B61B8F8','Nathan Sims','quam@protonmail.ca','UI/UX Designer','Gorontalo'),(9,'82746B3B-F532-7E7D-64EC-E29D45E93E14','Teagan Herman','consectetuer@aol.edu','Digital Marketing','East Kalimantan'),(10,'6099AEB9-9957-8178-B46B-04F7BD9D4C26','Brenna Robinson','blandit.enim.consequat@google.net','Fullstack Web Development','East Kalimantan'),(11,'98E6A758-AD70-ABA5-0DED-EE96BB847075','Palmer Peck','etiam.gravida@yahoo.ca','Fullstack Web Development','East Kalimantan'),(12,'B22193B9-669B-147C-12EC-E44AD2A8FA8A','Dacey Whitaker','et.netus@protonmail.edu','Digital Marketing','West Java'),(13,'93EE7453-9D06-C44B-ED8D-98749DC88DBA','Hedley Singleton','turpis.non@protonmail.ca','UI/UX Designer','Central Sulawesi'),(14,'2E5EA143-DAC1-73E7-7821-2033B8EE6878','Len Hawkins','aliquam.adipiscing@protonmail.com','Fullstack Web Development','Papua'),(15,'6A31EA3E-043A-C16C-C3F5-B7F322B5D5F3','Brennan Garrett','duis.gravida@icloud.edu','UI/UX Designer','South Sumatra'),(16,'427A92E1-28F5-BF23-3C2A-23C2A9EE429E','Seth Roberts','maecenas.iaculis.aliquet@outlook.org','Fullstack Web Development','Central Sulawesi'),(17,'85E2946B-8FBF-EF5D-2BD6-0A7C3CAE6827','Octavius Lawrence','luctus.sit@icloud.ca','Fullstack Web Development','South Kalimantan'),(18,'43A72275-7050-A9AA-2F43-7FCECBFB1488','Damian Stokes','auctor.velit@outlook.org','Data Science','North Kalimantan'),(19,'BD2B238B-C4DD-E20D-AAC4-33FDE608E79C','Alice Humphrey','neque@icloud.com','UI/UX Designer','Bengkulu'),(20,'4D295D74-D9D6-59DC-A806-99E38F564A14','Germaine Boone','dictum.magna.ut@google.net','Fullstack Web Development','Aceh'),(21,'AEF66A1B-D26D-8ABC-87A9-46F86887D3D1','Rafael Burgess','natoque@aol.org','Data Science','South Sumatra'),(22,'23DF309E-EC48-C92B-9945-1A9615B4E757','John Sanchez','ac.fermentum@hotmail.ca','Fullstack Web Development','South Kalimantan'),(23,'A33E2BD3-4375-29FD-1AAE-268611B55D97','Geraldine Mcpherson','diam@icloud.ca','Digital Marketing','East Kalimantan'),(24,'FE795B89-4219-3E48-3EE8-5B61B3A41214','Whoopi Chapman','egestas.aliquam@outlook.net','Data Science','Special Region of Yogyakarta'),(25,'E663A109-0F9B-AAC1-AD6B-318583538B99','Alvin Merrill','erat.sed.nunc@google.ca','Fullstack Web Development','West Java'),(26,'7AAFE426-E9A9-4EDD-2B99-842E39D49C21','Louis Guy','gravida.nunc.sed@aol.couk','Data Science','Gorontalo'),(27,'86F24603-65CD-0E1A-8514-C556DC7947CD','Carissa Stuart','neque@icloud.com','Digital Marketing','East Java'),(28,'6F8ACEE7-2448-ED60-C131-CE85643693F8','Adam Brennan','cras@hotmail.ca','Data Science','West Papua'),(29,'1FAF2DB8-A345-4B75-A1C9-C33E69FF412C','Lydia Duke','quis.massa@aol.edu','Fullstack Web Development','East Nusa Tenggara'),(30,'2578826C-1466-13C7-81A4-2C9522B4069D','Timothy Barber','ut.eros@protonmail.couk','Digital Marketing','Special Region of Yogyakarta'),(31,'769D4893-DCB9-C5C3-765B-B37A2FF46646','Tanya Salas','quisque@icloud.org','Digital Marketing','West Kalimantan'),(32,'FDC2CC25-B0F6-3412-7B33-42ECACBD4AEA','Cherokee Armstrong','taciti.sociosqu.ad@hotmail.edu','Data Science','Bali'),(33,'C1E8E264-B429-0C61-EB32-3A441C291848','Cathleen Morse','nulla.eu.neque@yahoo.ca','UI/UX Designer','East Kalimantan'),(34,'09743441-9DDD-0D81-3672-B7BA483E77F1','Quon Rich','maecenas.mi@protonmail.couk','Digital Marketing','Special Region of Yogyakarta'),(35,'E7872C65-CDD3-0E6E-DACC-8EB4AE31693A','Maggy Durham','a.purus@google.com','Data Science','West Papua'),(36,'BEB866DC-1B17-5D64-6A98-A698E4644B4F','Ronan Donovan','dolor.quam@icloud.couk','Fullstack Web Development','Central Sulawesi'),(37,'19B42492-BC3E-A4BE-BDF9-7EB2046F97B9','Dacey Miranda','condimentum@hotmail.net','Fullstack Web Development','Central Sulawesi'),(38,'B5C60435-8AB2-9212-E727-621C2527A79D','Martin Rios','eu.nulla@protonmail.edu','UI/UX Designer','Central Sulawesi'),(39,'DAC679DE-B87B-2647-27A9-E68105C3EA62','Emily Hinton','curabitur.sed@yahoo.edu','Digital Marketing','East Kalimantan'),(40,'5A24E352-7634-1532-76F2-DDE226C9BE34','Abraham Pennington','gravida.sagittis.duis@protonmail.com','Fullstack Web Development','Riau'),(41,'77BBE687-3B07-331A-6A89-7C166A883DEE','Arthur Payne','neque@google.org','UI/UX Designer','North Sumatra'),(42,'4B5EC472-CE48-3BAE-F651-E34676C67937','Kimberly Doyle','dapibus@outlook.com','Digital Marketing','Bengkulu'),(43,'1CA4B3BB-3645-8FEC-01EF-80C808652115','Sean Terrell','elit.sed.consequat@protonmail.net','Data Science','South Kalimantan'),(44,'59C902B3-6B65-21B2-3AD9-7014754E32D4','Adena Clayton','nibh.lacinia@yahoo.edu','UI/UX Designer','Papua'),(45,'FDA71CE8-870C-49E2-74B1-8D8F6EF47AB8','Bernard Hunt','accumsan.convallis@aol.net','Fullstack Web Development','Riau Islands'),(46,'93A1A4DA-6E93-853F-FC42-12E5418F8C66','Merritt Doyle','risus.a@hotmail.org','UI/UX Designer','Riau'),(47,'7B0D6DA1-75EF-48BB-44E9-3A5B86B4E49E','Steven Joyner','tincidunt.vehicula.risus@google.ca','Fullstack Web Development','South Kalimantan'),(48,'6888FCD5-49F3-ACC9-E31E-E233A8F75C27','Jenette Dennis','eu@outlook.couk','UI/UX Designer','West Sumatra'),(49,'CD482632-2D49-3A49-6152-2D6554B73ECC','Driscoll Bernard','lobortis.ultrices.vivamus@hotmail.net','UI/UX Designer','West Papua'),(50,'B5A4B4E5-F8BE-2BE3-8E98-4A0D127AEAF3','Shana Meyer','iaculis@hotmail.couk','UI/UX Designer','South Sulawesi');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-11 14:21:03
