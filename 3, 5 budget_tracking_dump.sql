-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: budget_tracking
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_types` (
  `id` int unsigned NOT NULL,
  `account_type` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (1,'cash'),(2,'current bank'),(3,'savings bank'),(4,'broker'),(5,'non-cash');
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL,
  `account_name` varchar(225) NOT NULL,
  `currency_id` int unsigned NOT NULL,
  `account_type_id` int unsigned NOT NULL,
  `date_opened` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_currency_idx` (`currency_id`),
  KEY `fk_account_type_idx` (`account_type_id`),
  CONSTRAINT `fk_account_type` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `fk_currency` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'petty cash',1,1,'2015-01-01 00:00:00',NULL),(2,'current Sber',1,2,'2019-07-01 00:00:00',NULL),(3,'current VTB',1,2,'2018-01-10 00:00:00',NULL),(4,'savings Sber',1,3,'2019-07-01 00:00:00',NULL),(5,'broker Sber (RUB)',1,4,'2020-03-30 00:00:00',NULL),(6,'broker Sber (USD)',2,4,'2020-03-30 00:00:00',NULL),(7,'cash USD',2,1,'2015-01-01 00:00:00',NULL),(8,'cash EUR',3,1,'2015-01-01 00:00:00',NULL),(9,'clearing',1,5,'2015-01-01 00:00:00','tracking of common expences'),(10,'gifts',1,5,'2015-01-01 00:00:00','gift certificates');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int unsigned NOT NULL,
  `attachment` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,''),(2,''),(3,'');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL,
  `category_name` varchar(225) NOT NULL,
  `category_note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'housing',NULL),(2,'food',NULL),(3,'hygiene',NULL),(4,'fitness',NULL),(5,'transport',NULL),(6,'pets',NULL),(7,'entertainment',NULL),(8,'clothes',NULL),(9,'education',NULL),(10,'securities','for brokerage account'),(11,'cash back',NULL),(12,'salary',NULL),(13,'bonus',NULL),(14,'interest',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL,
  `currency_name` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'RUB'),(2,'USD'),(3,'EUR');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `last_week_expense`
--

DROP TABLE IF EXISTS `last_week_expense`;
/*!50001 DROP VIEW IF EXISTS `last_week_expense`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `last_week_expense` AS SELECT 
 1 AS `category`,
 1 AS `purchase`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `last_weekl_expense`
--

DROP TABLE IF EXISTS `last_weekl_expense`;
/*!50001 DROP VIEW IF EXISTS `last_weekl_expense`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `last_weekl_expense` AS SELECT 
 1 AS `type`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `last_year_biggest`
--

DROP TABLE IF EXISTS `last_year_biggest`;
/*!50001 DROP VIEW IF EXISTS `last_year_biggest`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `last_year_biggest` AS SELECT 
 1 AS `category`,
 1 AS `purchase`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payees`
--

DROP TABLE IF EXISTS `payees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payees` (
  `id` int unsigned NOT NULL,
  `payee_name` varchar(225) NOT NULL,
  `payee_note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payees`
--

LOCK TABLES `payees` WRITE;
/*!40000 ALTER TABLE `payees` DISABLE KEYS */;
INSERT INTO `payees` VALUES (1,'landlady','landlord or landlady'),(2,'XFit',NULL),(3,'Ozon','for tracking if Ozon premium was worth it'),(4,'Steam',NULL),(5,'Tui','for tracking travel cost'),(6,'tax authorities',NULL);
/*!40000 ALTER TABLE `payees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payers`
--

DROP TABLE IF EXISTS `payers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payers` (
  `id` int unsigned NOT NULL,
  `payer_name` varchar(225) NOT NULL,
  `payer_note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payers`
--

LOCK TABLES `payers` WRITE;
/*!40000 ALTER TABLE `payers` DISABLE KEYS */;
INSERT INTO `payers` VALUES (1,'current employer','salary, bonus'),(2,'previous employer','salary, bonus'),(3,'Sber','cash back, interest'),(4,'VTB','cash back'),(5,'SkyEng','for lessons'),(6,'Etsy','sporadic income');
/*!40000 ALTER TABLE `payers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int unsigned NOT NULL,
  `project_name` varchar(225) NOT NULL,
  `project_note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'flat renovation',NULL),(2,'vacation',NULL),(3,'trip to SPb',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id` int unsigned NOT NULL,
  `subcategory_name` varchar(225) NOT NULL,
  `parent_category_id` int unsigned NOT NULL,
  `subcategory_note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_idx` (`parent_category_id`),
  CONSTRAINT `fk_category1` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'groceries',2,NULL),(2,'veggies',2,'fruit, veggies, nuts'),(3,'restaurants',2,'restaurants, take-out'),(4,'mortgage',1,NULL),(5,'utilities',1,'water, electricity, garbage removal'),(6,'gym',4,NULL),(7,'swimming',4,NULL),(8,'fitness clothes',4,NULL),(9,'taxi',5,NULL),(10,'metro',5,NULL),(11,'games',7,NULL),(12,'movies',7,NULL),(13,'shoes',8,NULL),(14,'office clothes',8,NULL),(15,'other clothes',8,NULL),(16,'bonds',10,NULL),(17,'stocks',10,NULL),(18,'options',10,NULL);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_statuses`
--

DROP TABLE IF EXISTS `transaction_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_statuses` (
  `id` int unsigned NOT NULL,
  `transaction_status_name` varchar(225) NOT NULL,
  `affects_current_balance` tinyint NOT NULL DEFAULT '1' COMMENT '1 = TRUE, 0 = FALSE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_statuses`
--

LOCK TABLES `transaction_statuses` WRITE;
/*!40000 ALTER TABLE `transaction_statuses` DISABLE KEYS */;
INSERT INTO `transaction_statuses` VALUES (1,'unreconciled',1),(2,'reconciled',1),(3,'void',0);
/*!40000 ALTER TABLE `transaction_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type` (
  `id` int unsigned NOT NULL,
  `transaction_type_name` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'expence'),(2,'income'),(3,'transfer'),(4,'buy securities'),(5,'sell securities'),(6,'dividend'),(7,'coupon yield'),(8,'other');
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(16,2) NOT NULL,
  `category_id` int unsigned NOT NULL,
  `subcategory_id` int unsigned DEFAULT NULL,
  `currency_id` int unsigned DEFAULT NULL,
  `project_id` int unsigned DEFAULT NULL,
  `from_account_id` int unsigned NOT NULL,
  `transaction_type_id` int unsigned NOT NULL,
  `to_account_id` int unsigned DEFAULT NULL,
  `payer_id` int unsigned DEFAULT NULL,
  `payee_id` int unsigned DEFAULT NULL,
  `status_id` int unsigned NOT NULL,
  `attachment_id` int unsigned DEFAULT NULL,
  `note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_idx` (`category_id`),
  KEY `fk_subcategory_idx` (`subcategory_id`),
  KEY `fk_transaction_type_idx` (`transaction_type_id`),
  KEY `fk_currencies_idx` (`currency_id`),
  KEY `fk_project_idx` (`project_id`),
  KEY `fk_from_account_idx` (`from_account_id`),
  KEY `fk_to_account_idx` (`to_account_id`),
  KEY `fk_payer_idx` (`payer_id`),
  KEY `fk_payee_idx` (`payee_id`),
  KEY `fk_status_idx` (`status_id`),
  KEY `fk_attachment_idx` (`attachment_id`),
  CONSTRAINT `fk_attachment` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_currencies` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `fk_from_account` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `fk_payee` FOREIGN KEY (`payee_id`) REFERENCES `payees` (`id`),
  CONSTRAINT `fk_payer` FOREIGN KEY (`payer_id`) REFERENCES `payers` (`id`),
  CONSTRAINT `fk_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `transaction_statuses` (`id`),
  CONSTRAINT `fk_subcategories` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`),
  CONSTRAINT `fk_to_account` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `fk_transaction_type` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'2021-12-01 00:00:00',500.00,2,1,1,NULL,1,1,NULL,NULL,NULL,2,1,'salmon'),(2,'2021-12-01 00:00:00',300.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'strawberries'),(3,'2021-12-02 00:00:00',-342.00,11,NULL,1,NULL,2,2,NULL,3,NULL,2,2,NULL),(4,'2021-12-02 00:00:00',-165.00,14,NULL,1,NULL,2,2,NULL,3,NULL,2,2,NULL),(5,'2021-12-03 00:00:00',30000.00,1,4,1,NULL,2,1,NULL,NULL,1,2,NULL,NULL),(6,'2021-12-04 00:00:00',20000.00,4,6,1,NULL,3,1,NULL,NULL,2,2,NULL,'12 months membership'),(7,'2021-12-05 00:00:00',326.19,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'MSFT'),(8,'2021-12-07 00:00:00',-334.92,10,16,2,NULL,6,5,NULL,NULL,NULL,2,NULL,'MSFT'),(9,'2021-12-07 00:00:00',-15000.00,1,4,2,NULL,9,2,NULL,NULL,NULL,2,NULL,NULL),(10,'2021-12-08 00:00:00',-50000.00,12,NULL,1,NULL,1,2,NULL,1,NULL,2,NULL,NULL),(11,'2021-12-11 00:00:00',250.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'tomatoes'),(12,'2021-12-11 00:00:00',120.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'cucumbers'),(13,'2021-12-11 00:00:00',100.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'potatoes'),(14,'2021-12-11 00:00:00',25.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'dill'),(15,'2021-12-11 00:00:00',30.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'apples'),(16,'2021-12-11 00:00:00',30.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'onions'),(17,'2021-12-11 00:00:00',35.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'carrots'),(18,'2022-01-01 00:00:00',200.00,2,1,1,NULL,1,1,NULL,NULL,NULL,2,1,'ground meat'),(19,'2021-12-13 00:00:00',12.33,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'NYCB'),(20,'2021-12-13 00:00:00',6.00,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'NOK'),(21,'2021-12-13 00:00:00',54.98,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'PFE'),(22,'2021-12-13 00:00:00',20850.00,10,16,1,NULL,5,4,NULL,NULL,NULL,2,NULL,'GMKN'),(23,'2021-12-13 00:00:00',122.83,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'IBM'),(24,'2021-12-15 00:00:00',-21296.00,10,16,1,NULL,5,5,NULL,NULL,NULL,2,NULL,'GMKN'),(25,'2022-01-01 00:00:00',350.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'tomatoes'),(26,'2022-01-03 00:00:00',-247.00,11,NULL,1,NULL,2,2,NULL,3,NULL,2,2,NULL),(27,'2022-01-03 00:00:00',-127.00,14,NULL,1,NULL,2,2,NULL,3,NULL,2,2,NULL),(28,'2022-01-03 00:00:00',30000.00,1,4,1,NULL,2,1,NULL,NULL,1,2,NULL,NULL),(29,'2022-01-03 00:00:00',338.14,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'MSFT'),(30,'2022-01-04 00:00:00',-328.69,10,16,2,NULL,6,5,NULL,NULL,NULL,2,NULL,'MSFT'),(31,'2022-01-03 00:00:00',-15000.00,1,4,2,NULL,9,2,NULL,NULL,NULL,2,NULL,NULL),(32,'2022-01-03 00:00:00',-50000.00,12,NULL,1,NULL,1,2,NULL,1,NULL,2,NULL,NULL),(33,'2022-01-05 00:00:00',250.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'tomatoes'),(34,'2022-01-05 00:00:00',520.00,2,2,2,NULL,1,1,NULL,NULL,NULL,2,NULL,'salmon'),(35,'2022-01-05 00:00:00',100.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'potatoes'),(36,'2022-01-05 00:00:00',25.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'dill'),(37,'2022-01-05 00:00:00',30.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'apples'),(38,'2022-01-05 00:00:00',30.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'onions'),(39,'2022-01-05 00:00:00',35.00,2,2,1,NULL,1,1,NULL,NULL,NULL,2,NULL,'carrots'),(40,'2022-01-06 00:00:00',12.47,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'NYCB'),(41,'2022-01-06 00:00:00',6.30,10,16,2,NULL,6,4,NULL,NULL,NULL,2,NULL,'NOK');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `weekly_expense`
--

DROP TABLE IF EXISTS `weekly_expense`;
/*!50001 DROP VIEW IF EXISTS `weekly_expense`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `weekly_expense` AS SELECT 
 1 AS `type`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `last_week_expense`
--

/*!50001 DROP VIEW IF EXISTS `last_week_expense`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_week_expense` AS with `last_year` as (select `transactions`.`id` AS `id`,`transactions`.`category_id` AS `category_id`,`transactions`.`amount` AS `amount`,`transactions`.`note` AS `note` from `transactions` where ((`transactions`.`transaction_date` >= (curdate() + interval -(1) year)) and (`transactions`.`note` is not null) and ((`transactions`.`transaction_type_id` = 1) or (`transactions`.`transaction_type_id` = 4))) order by `transactions`.`amount` desc limit 10) select `categories`.`category_name` AS `category`,`last_year`.`note` AS `purchase`,`last_year`.`amount` AS `amount` from (`last_year` join `categories` on((`last_year`.`category_id` = `categories`.`id`))) order by `last_year`.`amount` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_weekl_expense`
--

/*!50001 DROP VIEW IF EXISTS `last_weekl_expense`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_weekl_expense` AS with `last_week` as (select `transactions`.`transaction_type_id` AS `type_id`,sum(`transactions`.`amount`) AS `amount` from `transactions` where (`transactions`.`transaction_date` >= (curdate() + interval -(7) day)) group by `type_id`) select `transaction_type`.`transaction_type_name` AS `type`,`last_week`.`amount` AS `amount` from (`last_week` join `transaction_type` on((`last_week`.`type_id` = `transaction_type`.`id`))) order by `last_week`.`amount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_year_biggest`
--

/*!50001 DROP VIEW IF EXISTS `last_year_biggest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_year_biggest` AS with `last_year` as (select `transactions`.`id` AS `id`,`transactions`.`category_id` AS `category_id`,`transactions`.`amount` AS `amount`,`transactions`.`note` AS `note` from `transactions` where ((`transactions`.`transaction_date` >= (curdate() + interval -(1) year)) and (`transactions`.`note` is not null) and ((`transactions`.`transaction_type_id` = 1) or (`transactions`.`transaction_type_id` = 4))) order by `transactions`.`amount` desc limit 10) select `categories`.`category_name` AS `category`,`last_year`.`note` AS `purchase`,`last_year`.`amount` AS `amount` from (`last_year` join `categories` on((`last_year`.`category_id` = `categories`.`id`))) order by `last_year`.`amount` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `weekly_expense`
--

/*!50001 DROP VIEW IF EXISTS `weekly_expense`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `weekly_expense` AS with `last_week` as (select `transactions`.`transaction_type_id` AS `type_id`,sum(`transactions`.`amount`) AS `amount` from `transactions` where (`transactions`.`transaction_date` >= (curdate() + interval -(7) day)) group by `type_id`) select `transaction_type`.`transaction_type_name` AS `type`,`last_week`.`amount` AS `amount` from (`last_week` join `transaction_type` on((`last_week`.`type_id` = `transaction_type`.`id`))) order by `last_week`.`amount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07 19:06:07
