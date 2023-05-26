CREATE DATABASE  IF NOT EXISTS `multiplex` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `multiplex`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: multiplex
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add multiplex',7,'add_cine'),(26,'Can change multiplex',7,'change_cine'),(27,'Can delete multiplex',7,'delete_cine'),(28,'Can view multiplex',7,'view_cine'),(29,'Can add empleado',8,'add_empleado'),(30,'Can change empleado',8,'change_empleado'),(31,'Can delete empleado',8,'delete_empleado'),(32,'Can view empleado',8,'view_empleado'),(33,'Can add sala',9,'add_sala'),(34,'Can change sala',9,'change_sala'),(35,'Can delete sala',9,'delete_sala'),(36,'Can view sala',9,'view_sala'),(37,'Can add punto agil',10,'add_punto_agil'),(38,'Can change punto agil',10,'change_punto_agil'),(39,'Can delete punto agil',10,'delete_punto_agil'),(40,'Can view punto agil',10,'view_punto_agil'),(41,'Can add pelicula',11,'add_pelicula'),(42,'Can change pelicula',11,'change_pelicula'),(43,'Can delete pelicula',11,'delete_pelicula'),(44,'Can view pelicula',11,'view_pelicula'),(45,'Can add snack',12,'add_snack'),(46,'Can change snack',12,'change_snack'),(47,'Can delete snack',12,'delete_snack'),(48,'Can view snack',12,'view_snack'),(49,'Can add reserva',13,'add_reserva'),(50,'Can change reserva',13,'change_reserva'),(51,'Can delete reserva',13,'delete_reserva'),(52,'Can view reserva',13,'view_reserva'),(53,'Can add venta',14,'add_venta'),(54,'Can change venta',14,'change_venta'),(55,'Can delete venta',14,'delete_venta'),(56,'Can view venta',14,'view_venta'),(57,'Can add venta_snack',15,'add_venta_snack'),(58,'Can change venta_snack',15,'change_venta_snack'),(59,'Can delete venta_snack',15,'delete_venta_snack'),(60,'Can view venta_snack',15,'view_venta_snack'),(61,'Can add usuario',16,'add_usuario'),(62,'Can change usuario',16,'change_usuario'),(63,'Can delete usuario',16,'delete_usuario'),(64,'Can view usuario',16,'view_usuario'),(65,'Can add funcion',17,'add_funcion'),(66,'Can change funcion',17,'change_funcion'),(67,'Can delete funcion',17,'delete_funcion'),(68,'Can view funcion',17,'view_funcion'),(69,'Can add sillas_disponibles',18,'add_sillasdisponibles'),(70,'Can change sillas_disponibles',18,'change_sillasdisponibles'),(71,'Can delete sillas_disponibles',18,'delete_sillasdisponibles'),(72,'Can view sillas_disponibles',18,'view_sillasdisponibles');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$aexNmdE7ZXjrhfj2AihCkr$gAUJU58ldh3nUS2oIiYD2ElQZkNeM5QudpObnnJ7TDw=','2023-05-26 04:32:25.519144',1,'admin','','','anfeliz10@gmail.com',1,1,'2023-05-25 20:40:02.762463'),(2,'pbkdf2_sha256$390000$ECIv0Ec2zd5VzXkgB3mdc8$NqatNP6ljWthid8lD8phPkDDjEdP9mlVcMC8YfY6O9E=','2023-05-26 04:29:17.517554',0,'user1','Paco','Lopez','pacol@correo.com',0,1,'2023-05-25 20:42:59.491867'),(3,'pbkdf2_sha256$390000$j3IyvGimVs8clULeSEmJdV$muMoT//y3FsqsWt4A0Kk5MA97phunR4tj6gUeqbgWlc=','2023-05-26 04:14:13.375768',0,'user2','Sonia','Pulisic','sonialo@prueba.com',0,1,'2023-05-25 20:45:47.231849');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-26 04:09:46.177082','456123','Cristiano Ronaldo',1,'[{\"added\": {}}]',8,1),(2,'2023-05-26 04:09:59.593704','1','Gran mall',1,'[{\"added\": {}}]',10,1),(3,'2023-05-26 04:11:24.716442','1','19:00 - Super Mario Bros. La Película - 1 - Plaza imperial - 1 - Paco',3,'',13,1),(4,'2023-05-26 04:11:59.036265','1','50 - 19:00 - Super Mario Bros. La Película - 1 - Plaza imperial - 1',2,'[{\"changed\": {\"fields\": [\"Num sillas dispo\", \"Sillas dispo\"]}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'cartelera','pelicula'),(12,'comidas','snack'),(5,'contenttypes','contenttype'),(17,'funcion','funcion'),(18,'funcion','sillasdisponibles'),(7,'multiplex_app','cine'),(8,'multiplex_app','empleado'),(10,'multiplex_app','punto_agil'),(9,'multiplex_app','sala'),(13,'reserva','reserva'),(16,'reserva','usuario'),(14,'reserva','venta'),(15,'reserva','venta_snack'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-25 20:38:43.017034'),(2,'auth','0001_initial','2023-05-25 20:38:43.562808'),(3,'admin','0001_initial','2023-05-25 20:38:43.708634'),(4,'admin','0002_logentry_remove_auto_add','2023-05-25 20:38:43.724514'),(5,'admin','0003_logentry_add_action_flag_choices','2023-05-25 20:38:43.740619'),(6,'contenttypes','0002_remove_content_type_name','2023-05-25 20:38:43.865913'),(7,'auth','0002_alter_permission_name_max_length','2023-05-25 20:38:43.936042'),(8,'auth','0003_alter_user_email_max_length','2023-05-25 20:38:43.996294'),(9,'auth','0004_alter_user_username_opts','2023-05-25 20:38:44.011572'),(10,'auth','0005_alter_user_last_login_null','2023-05-25 20:38:44.083755'),(11,'auth','0006_require_contenttypes_0002','2023-05-25 20:38:44.095521'),(12,'auth','0007_alter_validators_add_error_messages','2023-05-25 20:38:44.114014'),(13,'auth','0008_alter_user_username_max_length','2023-05-25 20:38:44.181872'),(14,'auth','0009_alter_user_last_name_max_length','2023-05-25 20:38:44.246980'),(15,'auth','0010_alter_group_name_max_length','2023-05-25 20:38:44.282864'),(16,'auth','0011_update_proxy_permissions','2023-05-25 20:38:44.299530'),(17,'auth','0012_alter_user_first_name_max_length','2023-05-25 20:38:44.361655'),(18,'multiplex_app','0001_initial','2023-05-25 20:38:44.562944'),(19,'cartelera','0001_initial','2023-05-25 20:38:44.698456'),(20,'comidas','0001_initial','2023-05-25 20:38:44.831426'),(21,'funcion','0001_initial','2023-05-25 20:38:45.061703'),(22,'reserva','0001_initial','2023-05-25 20:38:45.517303'),(23,'sessions','0001_initial','2023-05-25 20:38:45.561343');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('439mibo71hquac82bpdbj7k9kwxy2ba1','.eJxVjEEOwiAQRe_C2pCBOkBduu8ZCAyDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-TuIilDj9bjHQg-sO0j3UW5PU6rrMUe6KPGiXU0v8vB7u30EJvXzrmDFFQEtROQJLo1KoHQ3GZkUGGADHIQ9gglY2ZnbZMCfUGl0wgGfx_gDckzdp:1q2P7p:HpPJKl8Gzsb6QJcBkGHF4Hr2oXVqxFvKpbQDVgnxOis','2023-06-09 04:32:25.522790');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `dni` varchar(25) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `cargo` int NOT NULL,
  `fecha_inicio_cont` datetime(6) NOT NULL,
  `tiempo_contratado` bigint NOT NULL,
  `multiplex_id_id` bigint NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `Empleado_multiplex_id_id_74a2d3ef_fk_Multiplex_id` (`multiplex_id_id`),
  CONSTRAINT `Empleado_multiplex_id_id_74a2d3ef_fk_Multiplex_id` FOREIGN KEY (`multiplex_id_id`) REFERENCES `multiplex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('456123','Cristiano Ronaldo','3132775757',2,'2023-05-26 04:09:46.173060',3000000000,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `horario` varchar(12) NOT NULL,
  `fecha` date NOT NULL,
  `multiplex_id_id` bigint NOT NULL,
  `pelicula_id_id` bigint NOT NULL,
  `sala_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Funcion_multiplex_id_id_247b6e83_fk_Multiplex_id` (`multiplex_id_id`),
  KEY `Funcion_pelicula_id_id_e1cf7db6_fk_Pelicula_id` (`pelicula_id_id`),
  KEY `Funcion_sala_id_id_bd2cf654_fk_Sala_id` (`sala_id_id`),
  CONSTRAINT `Funcion_multiplex_id_id_247b6e83_fk_Multiplex_id` FOREIGN KEY (`multiplex_id_id`) REFERENCES `multiplex` (`id`),
  CONSTRAINT `Funcion_pelicula_id_id_e1cf7db6_fk_Pelicula_id` FOREIGN KEY (`pelicula_id_id`) REFERENCES `pelicula` (`id`),
  CONSTRAINT `Funcion_sala_id_id_bd2cf654_fk_Sala_id` FOREIGN KEY (`sala_id_id`) REFERENCES `sala` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (1,'19:00','2023-05-27',1,1,1),(2,'15:00','2023-06-05',3,2,9),(3,'17:00','2023-05-29',2,3,5),(4,'22:00','2023-05-28',3,4,11),(5,'20:00','2023-05-28',1,5,3),(6,'15:00','2023-05-25',2,3,6),(7,'19:00','2023-05-30',3,5,8),(8,'22:00','2023-05-25',2,4,4),(9,'15:00','2023-06-08',1,1,1);
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplex`
--

DROP TABLE IF EXISTS `multiplex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplex` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `salas` int NOT NULL,
  `ciudad` int NOT NULL,
  `direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplex`
--

LOCK TABLES `multiplex` WRITE;
/*!40000 ALTER TABLE `multiplex` DISABLE KEYS */;
INSERT INTO `multiplex` VALUES (1,'Plaza imperial',3,1,'Cra. 104 #148 - 07, Bogotá'),(2,'Titan Plaza',4,1,'Av. Boyacá #80-94, Bogotá'),(3,'Parque la colina',5,1,'Cra. 75 #116-51');
/*!40000 ALTER TABLE `multiplex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplex_pelicula`
--

DROP TABLE IF EXISTS `multiplex_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplex_pelicula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pelicula_id` bigint NOT NULL,
  `cine_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Multiplex_pelicula_pelicula_id_cine_id_8e728282_uniq` (`pelicula_id`,`cine_id`),
  KEY `Multiplex_pelicula_cine_id_066fbefc_fk_Multiplex_id` (`cine_id`),
  CONSTRAINT `Multiplex_pelicula_cine_id_066fbefc_fk_Multiplex_id` FOREIGN KEY (`cine_id`) REFERENCES `multiplex` (`id`),
  CONSTRAINT `Multiplex_pelicula_pelicula_id_c800f827_fk_Pelicula_id` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplex_pelicula`
--

LOCK TABLES `multiplex_pelicula` WRITE;
/*!40000 ALTER TABLE `multiplex_pelicula` DISABLE KEYS */;
INSERT INTO `multiplex_pelicula` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),(12,4,3),(13,5,1),(14,5,2),(15,5,3);
/*!40000 ALTER TABLE `multiplex_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplex_snack`
--

DROP TABLE IF EXISTS `multiplex_snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplex_snack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `snack_id` bigint NOT NULL,
  `cine_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Multiplex_snack_snack_id_cine_id_c911c34d_uniq` (`snack_id`,`cine_id`),
  KEY `Multiplex_snack_cine_id_348ddfdb_fk_Multiplex_id` (`cine_id`),
  CONSTRAINT `Multiplex_snack_cine_id_348ddfdb_fk_Multiplex_id` FOREIGN KEY (`cine_id`) REFERENCES `multiplex` (`id`),
  CONSTRAINT `Multiplex_snack_snack_id_6e320527_fk_Snack_id` FOREIGN KEY (`snack_id`) REFERENCES `snack` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplex_snack`
--

LOCK TABLES `multiplex_snack` WRITE;
/*!40000 ALTER TABLE `multiplex_snack` DISABLE KEYS */;
INSERT INTO `multiplex_snack` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3);
/*!40000 ALTER TABLE `multiplex_snack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `director` varchar(30) NOT NULL,
  `clasificacion` int NOT NULL,
  `lenguaje` int NOT NULL,
  `fecha_estreno` date NOT NULL,
  `puntuacion` int NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Super Mario Bros. La Película','Aaron Horvath',1,2,'2023-04-06',3,'https://i.ibb.co/ZhbWgdk/Mario.jpg'),(2,'Guardianes de la Galaxia Vol 3','James Gunn',2,2,'2023-05-04',3,'https://i.ibb.co/fH0hHNy/GDG.jpg'),(3,'Suzume no Tojimari','Makoto Shinkai',1,3,'2023-04-20',4,'https://i.ibb.co/1J8hbXW/pelicula.jpg'),(4,'Evil Dead: El Despertar','Lee Cronin',3,2,'2023-04-20',2,'https://i.ibb.co/6vPtMqk/Despertar.jpg'),(5,'Rápidos Y Furiosos X','Louis Leterrier',2,2,'2023-05-17',4,'https://i.ibb.co/10R3Cdn/RYF.jpg');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punto_agil`
--

DROP TABLE IF EXISTS `punto_agil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `punto_agil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(12) NOT NULL,
  `empleado_dni_id` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Punto_agil_empleado_dni_id_08912f27_fk_Empleado_dni` (`empleado_dni_id`),
  CONSTRAINT `Punto_agil_empleado_dni_id_08912f27_fk_Empleado_dni` FOREIGN KEY (`empleado_dni_id`) REFERENCES `empleado` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_agil`
--

LOCK TABLES `punto_agil` WRITE;
/*!40000 ALTER TABLE `punto_agil` DISABLE KEYS */;
INSERT INTO `punto_agil` VALUES (1,'Gran mall','456123');
/*!40000 ALTER TABLE `punto_agil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sillas` varchar(25) NOT NULL,
  `estado` int NOT NULL,
  `comida` tinyint(1) NOT NULL,
  `valor` int NOT NULL,
  `funcion_id_id` bigint NOT NULL,
  `usuario_id_id` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Reserva_usuario_id_id_3d6bd4eb_fk_Usuario_dni` (`usuario_id_id`),
  KEY `Reserva_funcion_id_id_925b93c2_fk_Funcion_id` (`funcion_id_id`),
  CONSTRAINT `Reserva_funcion_id_id_925b93c2_fk_Funcion_id` FOREIGN KEY (`funcion_id_id`) REFERENCES `funcion` (`id`),
  CONSTRAINT `Reserva_usuario_id_id_3d6bd4eb_fk_Usuario_dni` FOREIGN KEY (`usuario_id_id`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (2,'45-46',1,0,40000,1,'123456'),(3,'64-65-66-67',1,1,112500,5,'123456'),(4,'34-35-36',2,0,60000,5,'123455'),(5,'65-66-67-64',1,1,125000,3,'123455'),(6,'35-36-37',1,0,60000,4,'123456');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_venta_snack`
--

DROP TABLE IF EXISTS `reserva_venta_snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_venta_snack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `snack_id_id` bigint NOT NULL,
  `venta_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reserva_venta_snack_snack_id_id_a5140734_fk_Snack_id` (`snack_id_id`),
  KEY `reserva_venta_snack_venta_id_id_60f1b0e0_fk_Venta_id` (`venta_id_id`),
  CONSTRAINT `reserva_venta_snack_snack_id_id_a5140734_fk_Snack_id` FOREIGN KEY (`snack_id_id`) REFERENCES `snack` (`id`),
  CONSTRAINT `reserva_venta_snack_venta_id_id_60f1b0e0_fk_Venta_id` FOREIGN KEY (`venta_id_id`) REFERENCES `venta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_venta_snack`
--

LOCK TABLES `reserva_venta_snack` WRITE;
/*!40000 ALTER TABLE `reserva_venta_snack` DISABLE KEYS */;
INSERT INTO `reserva_venta_snack` VALUES (1,1,1,2),(2,1,2,2),(3,1,3,2),(4,3,1,3);
/*!40000 ALTER TABLE `reserva_venta_snack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `tipo` int NOT NULL,
  `multiplex_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sala_multiplex_id_id_5f3647e4_fk_Multiplex_id` (`multiplex_id_id`),
  CONSTRAINT `Sala_multiplex_id_id_5f3647e4_fk_Multiplex_id` FOREIGN KEY (`multiplex_id_id`) REFERENCES `multiplex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,1,1,1),(2,2,1,1),(3,3,3,1),(4,1,2,2),(5,2,3,2),(6,3,3,2),(7,4,2,2),(8,1,2,3),(9,2,1,3),(10,3,1,3),(11,4,1,3),(12,5,1,3);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sillas_disponibles`
--

DROP TABLE IF EXISTS `sillas_disponibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sillas_disponibles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `num_sillas_dispo` int NOT NULL,
  `sillas_dispo` varchar(200) NOT NULL,
  `funcion_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `funcion_id_id` (`funcion_id_id`),
  CONSTRAINT `Sillas_disponibles_funcion_id_id_7b30c8d6_fk_Funcion_id` FOREIGN KEY (`funcion_id_id`) REFERENCES `funcion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sillas_disponibles`
--

LOCK TABLES `sillas_disponibles` WRITE;
/*!40000 ALTER TABLE `sillas_disponibles` DISABLE KEYS */;
INSERT INTO `sillas_disponibles` VALUES (1,48,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-47-48-49-50',1),(2,50,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50',2),(3,66,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50-51-52-53-54-55-56-57-58-59-60-61-62-63-68-69-70',3),(4,47,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-38-39-40-41-42-43-44-45-46-47-48-49-50',4),(5,63,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-37-38-39-40-41-42-43-44-45-46-47-48-49-50-51-52-53-54-55-56-57-58-59-60-61-62-63-68-69-70',5),(6,70,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50-51-52-53-54-55-56-57-58-59-60-61-62-63-64-65-66-67-68-69-70',6),(7,60,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50-51-52-53-54-55-56-57-58-59-60',7),(8,60,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50-51-52-53-54-55-56-57-58-59-60',8),(9,50,'1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50',9);
/*!40000 ALTER TABLE `sillas_disponibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snack`
--

DROP TABLE IF EXISTS `snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `valor` int NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snack`
--

LOCK TABLES `snack` WRITE;
/*!40000 ALTER TABLE `snack` DISABLE KEYS */;
INSERT INTO `snack` VALUES (1,'Crispetas',15000,'https://i.ibb.co/2vDfz44/crispetas.jpg'),(2,'Hot dog',10000,'https://i.ibb.co/x5wRJ1J/hot-dog.jpg'),(3,'Gaseosa',7500,'https://i.ibb.co/TLm1H15/gaseosa.jpg');
/*!40000 ALTER TABLE `snack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `dni` varchar(25) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `edad` int NOT NULL,
  `correo` varchar(254) NOT NULL,
  `puntos` int NOT NULL,
  `dj_user_id` int NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dj_user_id` (`dj_user_id`),
  CONSTRAINT `Usuario_dj_user_id_9e4421e9_fk_auth_user_id` FOREIGN KEY (`dj_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('123455','Sonia','Pulisic',23,'sonialo@prueba.com',0,3),('123456','Paco','Lopez',22,'pacol@correo.com',0,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `valor` int NOT NULL,
  `punto_agil_id_id` bigint NOT NULL,
  `reserva_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Venta_punto_agil_id_id_4f299ea7_fk_Punto_agil_id` (`punto_agil_id_id`),
  KEY `Venta_reserva_id_id_dd0e30f5_fk_Reserva_id` (`reserva_id_id`),
  CONSTRAINT `Venta_punto_agil_id_id_4f299ea7_fk_Punto_agil_id` FOREIGN KEY (`punto_agil_id_id`) REFERENCES `punto_agil` (`id`),
  CONSTRAINT `Venta_reserva_id_id_dd0e30f5_fk_Reserva_id` FOREIGN KEY (`reserva_id_id`) REFERENCES `reserva` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2023-05-25',40000,1,2),(2,'2023-05-25',112500,1,3),(3,'2023-05-25',125000,1,5),(4,'2023-05-25',60000,1,6);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'multiplex'
--

--
-- Dumping routines for database 'multiplex'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26  0:11:44
