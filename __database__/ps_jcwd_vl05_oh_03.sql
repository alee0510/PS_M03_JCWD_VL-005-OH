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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Jakarta'),(2,'BSD'),(3,'Tangerang'),(4,'Makasar'),(5,'Bandung'),(6,'Lombok'),(7,'Semarang'),(8,'Surabaya'),(9,'Bekasi'),(10,'Depok');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'Fullstack Web Development'),(2,'UIUX Designer'),(3,'Fullstack Data Science'),(4,'Digital Marketing');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `programId` int NOT NULL,
  `cityId` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'AFB5ED96-3CBC-E33B-4614-58357D31C497','kayle badman','etiam.imperdiet.dictum@yahoo.couk',3,3,1),(2,'5F7239C0-4429-D86C-A8C1-D294542CC184','Dominic Haney','et.commodo.at@protonmail.couk',3,5,1),(3,'D8BB8474-6E94-CFAF-D6A5-B99213E2252F','Laurel Moon','pede@outlook.edu',2,9,0),(4,'92A5D259-7DAB-0A58-E582-0813477519F0','Edan Santana','risus@google.ca',4,3,1),(5,'46C9E54C-16AC-EE9A-C59C-83658738C5A3','Kalye Man','malesuada.id@protonmail.ca',2,5,1),(6,'C076D8BB-F174-18C4-6BF1-8442BA44BD40','Ivana Dickerson','diam.nunc@yahoo.com',4,9,0),(7,'AC191AD2-85E9-AF74-FB49-16055D1FC0CD','Quin Hernandez','orci.lobortis@aol.ca',1,7,1),(8,'7CB28728-8CAE-B3B7-1394-58BEEBCB36CB','Lael Burton','ridiculus.mus@outlook.org',4,4,0),(9,'FEDC4C7D-19B4-6AE2-59A6-85E8578445AF','Nyssa Bowen','justo@hotmail.com',1,9,1),(10,'6C0C7223-7251-FB65-AC61-1D7BDC941BBF','Elmo Mercer','facilisis.facilisis@yahoo.com',3,3,1),(11,'397C3A56-3F0F-2C75-7BB5-10496BB2F6A3','Brenna Brennan','quisque@aol.net',1,1,1),(12,'22502B82-5DD0-DD98-2549-17CBD79ABA35','Steven Washington','erat.nonummy.ultricies@aol.edu',2,3,1),(13,'933E45B4-458D-BDD5-3748-73E17FEC5262','Ava Daugherty','ut.quam.vel@protonmail.ca',4,1,1),(14,'957CA1E0-44A0-F83A-82C9-D9BD2BCEB167','Tad Ward','curabitur.dictum@outlook.com',4,7,1),(15,'7ED78058-A8B1-B60D-A2DB-36359B7DE8AE','Elijah Hale','tempus.risus@aol.edu',2,2,1),(16,'F5389BB4-0AB3-EF92-E62B-3A3D1DD195E8','Slade Rojas','eget@protonmail.com',4,2,1),(17,'BA6DC659-56CC-B944-3314-41A2D22E7B65','Quintessa Johns','massa.rutrum@icloud.edu',1,5,0),(18,'7953D745-1D8F-75EF-C106-1A2BB019D44E','Tad Hicks','non.leo.vivamus@hotmail.edu',2,7,1),(19,'90220412-1E6C-4A1B-F676-5BD8AD5F9146','Barry Huff','nibh.quisque.nonummy@hotmail.edu',1,6,1),(20,'361D3E7A-9163-494C-3DA5-D351D3DC56D0','Sonya Holman','nunc@hotmail.ca',4,9,1),(21,'281B7E4E-8036-ED1F-7D4A-4B5E1ADF8430','Kieran O\'brien','donec.sollicitudin.adipiscing@protonmail.couk',1,8,1),(22,'DEFC9043-AA02-231C-F686-C8CEF799CE6C','Lev English','purus.ac@icloud.couk',2,6,1),(23,'65BD1980-5C95-65A5-69B4-033D4B6A3093','Cullen Pacheco','et.magna@aol.com',2,5,1),(24,'5DF9CAD9-F684-EA8B-D50E-AA35A3D24A99','Jonas Green','egestas.sed@google.org',1,4,1),(25,'284A3665-4B44-6B4D-4644-C615AD73EBB2','Paki Williams','semper.nam@google.net',3,4,1),(26,'7C693182-3A0A-A4D2-E48E-696B04C39821','Jerry Woodward','cursus.integer.mollis@aol.org',1,9,1),(27,'8238C391-4F05-5943-6E8F-E9A6A92CE4C8','Hedwig Tate','sem@outlook.net',3,9,1),(28,'F863BF96-A11B-A9A5-3D32-8BD4B3B1E7F8','Moses Parks','fusce.dolor.quam@hotmail.edu',1,1,1),(29,'C622BE1E-6CED-ADEB-2639-98A1CC27E517','Shafira Greer','vestibulum.massa@yahoo.couk',4,4,1),(30,'73022A1C-9515-4E35-629D-0729A3492785','Cassandra Cummings','purus.duis@outlook.com',1,7,1),(31,'FB295523-68D9-ED62-BE38-295122D39ACE','Cailin Hays','massa.mauris.vestibulum@icloud.net',1,9,1),(32,'A9B9D2E3-BA15-9D9D-C245-3DFF20D2A07C','Kermit Stephenson','imperdiet.ornare.in@yahoo.org',3,2,1),(33,'B080649B-8A6B-2104-86B4-03B8DD4BB29E','Hayden Page','consectetuer.adipiscing@hotmail.net',2,7,1),(34,'FF31EE42-365C-EAE3-4D87-F9C2308177CF','Faith Glenn','mi.lorem@yahoo.couk',2,3,1),(35,'266DC573-EAB7-30C9-A51F-B75D7CC5898D','Dominic Walker','felis.ullamcorper@aol.org',1,2,1),(36,'9DCEA17C-C2E4-9881-1984-252234486456','Lila Hines','iaculis.aliquet@hotmail.edu',4,1,1),(37,'74C982BF-1513-4EBC-60D2-ED06DEA978D0','Blythe Alford','in.aliquet@hotmail.ca',3,7,1),(38,'DB190CE3-E73B-F3B9-D059-C2E732C2B41C','Connor Atkins','nisi.sem@yahoo.ca',3,3,1),(39,'4D72D7A8-E1E5-29A1-AEFB-DC39A4518953','Hayden Albert','vitae.erat@icloud.com',1,5,1),(40,'0EA28395-4CBB-115C-B046-8F5E17B146D2','Arden Albert','eu@protonmail.com',3,7,1),(41,'A441B8A9-B8E6-6051-A220-4C3E78A9762C','Akeem Crane','et.netus@outlook.com',1,5,1),(42,'346309FA-9B63-57D4-6B0E-8C64887FC049','Ocean Huff','in.scelerisque@protonmail.com',1,2,1),(43,'1124A5DF-1DBC-BED5-8248-B0837A32CC3E','Cecilia Bender','velit.in.aliquet@yahoo.org',4,1,1),(44,'87CECA15-8EE5-42C3-1768-94FAEB7C2C3E','Kennan Lindsay','nam.porttitor@icloud.com',4,5,1),(45,'6DDA9853-1CC1-4B27-BA3F-182A93D6E656','Cameron Pruitt','nunc.ac.mattis@outlook.edu',3,1,1),(46,'63531397-A741-7C0C-9CC2-2C054CD34632','Harrison Wilkerson','velit@outlook.ca',4,2,1),(47,'399D88AA-9E52-BD71-693D-F53C51E10C1F','Violet Sears','lectus.convallis@aol.net',2,9,1),(48,'6F648656-2C98-0457-42D7-F24121E85586','Libby Gamble','cubilia.curae.phasellus@google.edu',3,1,1),(49,'2B7FEC27-F40D-8103-96E3-3C4C2CEF7C2D','Callum Washington','mauris.sit@outlook.couk',3,9,1),(50,'CD411555-80F2-7F0A-1808-3ECB8362916D','Lilah Miller','vel@protonmail.ca',3,3,1),(51,'81D9DBF8-9CDD-1B3B-9B39-76D7B06240BA','Lester Bush','lectus@aol.net',4,7,1),(52,'59379884-F1BE-CDF5-80DC-57CD5ECF494C','Xantha Brewer','egestas.ligula@google.com',4,4,1),(53,'B8A23755-5DFA-C016-9E78-11565B694B19','Zeph Dennis','ullamcorper@yahoo.com',3,3,1),(54,'88F1EAE7-F912-EF44-27DD-45E979EA4C94','Walker Hendricks','amet.risus@icloud.ca',2,3,1),(55,'F355387D-9EF8-7DD1-8524-E9C67FCCD921','Hayfa Jimenez','morbi.accumsan@outlook.com',4,5,1),(56,'9927E9FE-53CA-F906-4CE6-BC7C48A9CED3','Helen Robinson','non.dui.nec@icloud.ca',1,9,1),(57,'F2C2C4E2-01B3-1EB5-7C00-6D945450C7CD','Sonya Roach','velit.cras.lorem@hotmail.ca',4,9,1),(58,'AF428348-28A0-D5B1-1C6A-6E565CE09927','Maisie Hickman','eget.lacus@icloud.com',3,4,1),(59,'BA1F2245-CDBE-757F-6A86-1058B147A177','Freya Cochran','aliquam.nec.enim@google.net',4,3,1),(60,'A222E77B-AADB-690A-E455-395BF5285B38','Reese Carrillo','malesuada.id.erat@hotmail.org',1,3,1),(61,'BC210E35-A42F-47FF-286E-1EEE9AD32C41','Walter Mcdaniel','a.sollicitudin@aol.ca',4,5,1),(62,'8F8AECA9-E352-90E3-1941-3A4E59A96828','Jesse Paul','at.sem@hotmail.edu',3,2,1),(63,'47E649AD-4899-00B2-D4B5-10A1112DCF8F','Byron Newman','dui.suspendisse.ac@icloud.edu',2,8,1),(64,'D9E28DFA-AC96-51DA-767D-1D4113E82698','Jenette Buckner','et@outlook.ca',4,2,1),(65,'A6D03D05-7782-B448-5890-9C642CB62B58','Branden Wolf','libero.lacus@protonmail.couk',2,6,1),(66,'7189E621-5614-2E31-A92B-41E2A5621E33','August Mays','rhoncus.id.mollis@yahoo.couk',3,4,1),(67,'41A9635F-256E-762F-9965-58CD33883D3A','Irma Ferguson','euismod.est@google.couk',3,9,1),(68,'EB1596B3-FAD6-8D8D-01C8-C0BDDBE905A4','Omar Caldwell','lorem.lorem@aol.ca',2,9,0),(69,'426A2332-9DBC-17EB-8AB1-0DC33D1E7E65','Cedric Marquez','aliquam@yahoo.com',1,6,1),(70,'AEC2BD5B-0192-2585-3FF6-786656E15E4C','Fallon Bauer','auctor.odio@google.couk',1,7,1),(71,'F5CDEB94-8369-9DA4-F71E-DDE976FC197D','Harding Houston','et.magnis@aol.net',3,8,1),(72,'5A279F75-6A2D-697B-88E4-7C41EBBAB71E','Illiana Pruitt','fermentum.vel@hotmail.com',1,8,1),(73,'E45CE2F9-ACB1-4B81-832F-5E25059FC759','Gregory Roman','sit.amet@protonmail.com',3,1,1),(74,'471BCC1A-720F-7932-7536-E25BD31C763A','Duncan Fischer','id@yahoo.net',1,8,1),(75,'4EE7478F-836D-4934-769D-4A043F349E56','Darryl Christian','mi@icloud.net',2,7,1),(76,'A522BB23-ED7B-F1A8-8D81-25CE7D6C5263','Roary Park','praesent.eu@hotmail.org',1,5,1),(77,'BE28399B-B03A-19A7-46F4-614123AE0441','Francis Dyer','sed@hotmail.edu',3,7,1),(78,'C7E4D510-9921-D189-097E-01D6E4CEBF58','Ryan Haney','neque.vitae.semper@yahoo.com',3,1,1),(79,'16C6B7B3-D50C-F3C1-B235-E31F9E106DCA','Basia Valenzuela','nec.eleifend@yahoo.org',3,1,1),(80,'8CB561D1-A149-9C85-B284-A1E1574E26A9','Xanthus Weber','vel.est@icloud.ca',3,5,1),(81,'C556B458-D99C-CA2A-5E95-6B0021E35E8C','Carlos Palmer','dui@yahoo.com',3,6,1),(82,'C3FBBC1B-318B-7B33-B698-637A96AF71A2','Riley Sellers','in.faucibus@yahoo.couk',3,9,1),(83,'E312BA1B-CA28-C41C-607F-2D8D3867DAE8','Ignatius Bass','ultricies@yahoo.edu',4,3,1),(84,'CBADEDD5-1302-FBA6-F2E8-DA8C2FDD52B5','Keefe Noble','metus.aliquam.erat@aol.ca',1,5,1),(85,'5B1015FB-76D4-7924-8CC3-15490109C092','Akeem Lee','accumsan@icloud.couk',3,8,1),(86,'332A5B31-CBBE-2CF1-F888-BA22C8C90C4B','Bryar Burks','gravida.nunc.sed@outlook.ca',2,5,1),(87,'75914B58-91CA-71CD-2C9E-E00AA8CE9D38','Richard Scott','eu.eleifend@google.ca',3,7,1),(88,'2E8A4721-7D15-7E0C-09AB-CBB168CA3BBE','Nicholas Middleton','elementum@protonmail.net',2,6,1),(89,'06B32C6E-89DA-B3C0-CA9E-AD58BB9FE869','Judah Downs','mauris.sapien.cursus@hotmail.com',2,3,1),(90,'C40A9ED9-A85A-5A7F-E974-737A25AA8277','Sylvia Hayden','lectus.nullam@aol.org',1,1,1),(91,'86985B71-8C92-A6D9-170D-DC48B4138DD0','Lynn Koch','faucibus.leo@yahoo.couk',4,3,1),(92,'5EDC5B6C-4E16-24B7-1211-C2090E782A64','Elton Harper','lorem.ac@protonmail.couk',2,9,1),(93,'E1D4E744-C64C-74A7-8802-25D49927DF10','Gage Barton','arcu.iaculis@google.org',1,2,1),(94,'7BB41EC6-C165-A135-B337-5C3A7A1D321A','Zane Mcclure','nullam.suscipit.est@google.com',4,1,1),(95,'65BB8EEE-7316-5D17-ECEC-5A4EBCBE3741','Gannon Anthony','iaculis.aliquet.diam@icloud.couk',3,6,1),(96,'42F886CE-0CF4-5A51-58E3-B8E0C99EC067','Basil Mcpherson','egestas@hotmail.ca',3,7,0),(97,'2AA04E57-8B17-A4ED-E4C5-14CB37C01521','Azalia Morin','nunc.sed.orci@protonmail.org',2,5,1),(98,'102BDBBE-5239-DD73-146B-6E2D4991A248','Adrian Saunders','rutrum.non@google.ca',2,3,1),(99,'983031A8-0826-DCEE-8A61-278B4527949C','Wylie Skinner','metus.vitae@aol.com',3,6,1),(100,'61C62ABE-FD4E-C68E-CCFA-CF1DE56866BE','Shoshana Jenkins','integer.id@icloud.org',1,1,1),(101,'6F5F377A-DF9C-43D6-9630-98DA8137FD9C','alexander','alex.ander@gmail.com',3,7,1),(103,'20F0E97E-24EB-4AAC-8EB2-471062DDAEF5','lollipop','lollipop@gmail.com',1,5,1),(104,'ACDC7E4E-7776-4849-9BF0-0DE9B86360C7','firas kun','firas.kun@gmail.com',2,1,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `token` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(125) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'0e98ff76-175c-4951-96b9-ab74f38f87f2','admin123','admin123@gmail.com','$2b$10$9QSX5R7zZqq1XdpHejnire7TpiR5OC5WVo4fm88An3DUuSq0O9wiu','1');
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

-- Dump completed on 2022-04-21 13:42:27
