-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: containers-us-west-21.railway.app    Database: railway
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idcat` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES ('car','carniceria'),('pas','pasteleria'),('pin','pintxos'),('rac','raciones');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` varchar(50) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `idcat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcat_idx` (`idcat`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'CAJA TRUFAS NEGRAS //  TRUFA BELTZAK (1/2 kg) ','12€','','pas'),(2,'TRUFAS BLANCAS  // TRUFA ZURIAK  (1/2 kg) ','12€','','pas'),(3,'CAJA TRUFAS MEZCLADAS  // TRUFA MIXTOAK (1/2 kg)','12€','','pas'),(4,'TXIRLORAS VARIOS CHOCOLATES // TXOKOLATE ASKOTARIKO TXIRLORAK','4.50€','','pas'),(5,'TEJAS BICOLOR (NATURAL Y CHOCOLATE) //  BI KOLORETAKO TEILAK (NATURALA ETA TXOKOLATEZKOA)','4.50€','','pas'),(6,'PALMERA GIGANTE (1,9 kg)  //  PALMERA ERRALDOIA (1,9 kg)','25€','','pas'),(7,'MACARRONES  //  MAKARROIAK','6€','','pas'),(8,'San Marcos  //  SAN MARCOS','12€ (750gr)','','pas'),(9,'Sacher de frambuesa  //  MUGURDI-SAKHERRA','12€ (750gr)','','pas'),(10,'Maskota  //  MASKOTA','12€ (750gr)','','pas'),(11,'Mousse Naranja  //  MOUSSE LARANJA','12€ (750gr)','','pas'),(12,'Mil hojas de crema y nata  //  KREMA ETA ESNEGAINEKO MILA HOSTO','18€/kg','','pas'),(13,'Tarta de queso 1,500 - 1,800k aprox  //  GAZTA-TARTA 1,500 - 1,800k aprox','18€/kg','carniceria/pechugas','pas'),(14,'PASTAS DE TÉ  //  TE PASTAK','3.50€ (250 GR)','','pas'),(15,'TXIRLORAS  //  TXIRLORAK','3.50€ (250 GR)','','pas'),(16,'MORENITOS  //  MORENITOAK','3.50€ (250 GR)','','pas'),(17,'ROSQUILLAS CASERAS //  ETXEKO ERROSKILLAK','3.50€ (250 GR)','','pas'),(19,'HARINADAS  //  IRINEZTATUAK','3.50€ (250 GR)','','pas'),(20,'NEVADITOS  //  ELURTETXOAK','3.50€ (250 GR)','','pas'),(21,'TEJAS (150gr)  //  TEILAK (150gr)','','','pas'),(22,'PERRUNILLAS  //  PERRUNILLAK',' 3.50€','','pas'),(23,'TEJAS 2 TEXTURAS  //  2 TESTURATAKO TEILAK','4.50€','','pas'),(24,'TXIRLORAS MIX CHOCOLATE  //  TXOKOLATE MIX. TXIRLORAK','4.50€','','pas'),(25,'HUESITOS SAN ESPEDITO  //  SAN ESPEDITOREN HEZURTXOAK','3.50€','','pas'),(26,'San Marcos  //  San Marcos','1,70€','','pas'),(27,'Mousse de limón  //  Limoi-moussea','1,70€','','pas'),(28,'Mousse de naranja  //  Laranja-moussea','1,70€','','pas'),(29,'Maskota  //  Maskota','1,70€','','pas'),(30,'Mousse de chocolate  //  Txokolatezko moussea','1,70€','','pas'),(31,'Escocesa  //  Escocesa','1,70€','','pas'),(32,'Sacher de frambuesa  //  Mugurdi-sakherra','1,70€','','pas'),(33,'Trufa y nata con crocanti  //  Boilurra eta esnegaina krokantiarekin','1,70€','','pas'),(34,'Tarta Santiago  //  Santiago tarta','1,70€','','pas'),(35,'Pastel Vasco  //  Euskal pastela','1,70€','','pas'),(36,'Pastel de coco  //  Koko-pastela','1,70€','','pas'),(37,'Pastel de arroz  //  Arroz-pastela','1,70€','','pas'),(38,'Pastel de manzana  //  Sagar-pastela','1,70€','','pas'),(39,'Bizcocho de limón VEGANO  //  Limoizko bizkotxoa VEGANO','1,70€','','pas'),(40,'Brownie VEGANO  //  Brownie VEGANO','1,70€','','pas'),(41,'Guiso de ternera / Guisar - Picar (Zancarrón)  //  Txahal-gisatua (Zankarroia)','9.40 €/Kg','','car'),(42,'Guiso de ternera (Aguja)  //  Txahal-gisatua (Lepoaldea)','7.80€/kg','','car'),(43,'Filete de 1ºB  //  1.B xerra','8.90€/kg','','car'),(44,'Picado mixto  //  Haragi-txikitu mixtoa','6.90€/kg','','car'),(45,'Picado de ternera (básico)  //  Txahal haragi-txikitu (oinarrizko)','7.20€/kg','','car'),(46,'Lomo fresco Duroc  //  Duroc solomo freskoa','8,20€/kg','','car'),(47,'Cabezada  Duroc Filetes frescos  //  Duroc burualdeko xerrak','7.50€/kg','','car'),(48,'Lomo adobado Duroc  //  Etxeko Duroc solomo ontzutua','8.20€/kg','','car'),(49,'Carrilleras ibéricas  //  Gurditegi iberikoak','14.90€/kg','','car'),(50,'Alas de pollo(blanco)  //  Oilasko Hegalak (zuria)','3.10€/kg','','car'),(51,'Alas de pollo (amarillo)  //  Oilasko Hegalak (horia)','4.10€/Kg','','car'),(52,'Pechugas de pollo (blanco)  //  Oilasko Bularkiak (zuria)','7.30€/kg','','car'),(53,'Pechugas de pollo (amarillo)  //  Oilasko Bularkiak (horia)','8.30€/kg','','car'),(54,'Pinchos de pollo al curry  //  Oilasko-pintxoak curry-an','8.50€/Kg','','car'),(55,'Paleta ibérica 100gr  //   Iberiar besoa 100gr','4.50/U','','car'),(56,'Chorizo ibérico bellota 100 gr  //  Ezkur iberiar txorizoa 100gr','2.70€/U','','car'),(57,'Salchichón ibérico de bellota 100gr  //  Ezkur iberiar saltxitxoia 100gr ','2.70€/U','','car'),(58,'Lomo ibérico 100gr  //  Iberiar solomoa 100gr  ','4.50€/U','','car'),(59,'Ensaladilla rusa  //  Errusiar entzaladilla','4€','','rac'),(60,'Pimientos rellenos de bacalao  //  Piperrak bakailaoz beteta ','6€ (4 Uds)','','rac'),(61,'Pimientos rellenos de txipirón  //   Piperrak txipiroiz  beteta ','6 € (4 UDS.)','','rac'),(62,'Pimientos rellenos de carne  //   Piperrak haragiz  beteta ','6€ (4 UDS.)','','rac'),(63,'Lasaña Rossini  //  Rossini Lasagna','5€','','rac'),(64,'Canelones de carne al gratén  //  Haragi -kaneloi gratinatuak','4€ (4 UDS.)','','rac'),(65,'Puding de cabracho  //  Itsaskabra-budina','5€ (2 UDS.)','','rac'),(66,'Croquetas (jamón, bacalao, txipirones…)  //  Kroketak (urdaiazpiko, bakailao,txipiroiak...)','8.50€ (12 UDS.)','','rac'),(67,'Mejillones rellenos  //  Muskuilu beteak','4.50€ (6 UDS)','','rac'),(68,'Sopa de pescado  //  Arrain-zopa','5€','','rac'),(69,'Cajita de pinchos individual  //  Banako pintxo-kutxa','8.50€','','pin'),(70,'Bandeja bocadillos bonito con piparras  //  Hegaluze eta piparrekin ogitarteko-erretilua','24€','','pin'),(71,'Bandeja bocadillos ibéricos  //  Iberiar ogitarteko-erretilua','24€','','pin'),(72,'Bandeja de sandwiches de nocilla  //  Nocilla  sandwich-erretilua','18€','','pin'),(73,'Bandeja de surtido de sandwiches  //  Askotariko sandwich-erretilua','18€','','pin'),(74,'Bandeja de croissants vegetales  //  Croissant begetal-erretilua','24€','','pin'),(75,'Bandeja de surtido de croquetas  //  Askotariko kroketa-erretilua','18€','','pin'),(76,'Tortilla de patata  // Patata tortilla','12.€','','pin'),(77,'Tortilla de jamón y queso  //  Urdaiazpiko eta gazta tortilla','15€','','pin'),(78,'Tortilla vegetal  //  Tortilla Begetala','15€','','pin'),(79,'Tortilla en pinchos  //  Tortilla pintxotan','2€','','pin');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `mail_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (5,'admin','admin','admin@admin.com','admin'),(6,'admin2','administrador','admin@correo.com','123456789'),(7,'','','','');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-24 12:02:48
