-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ifad_ecom
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coupon_user_groups`
--

DROP TABLE IF EXISTS `coupon_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_user_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(191) NOT NULL,
  `group_description` text DEFAULT NULL,
  `customer_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_by` varchar(191) DEFAULT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_user_groups_group_name_unique` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_user_groups`
--

LOCK TABLES `coupon_user_groups` WRITE;
/*!40000 ALTER TABLE `coupon_user_groups` DISABLE KEYS */;
INSERT INTO `coupon_user_groups` VALUES (21,'TEST GROUP','test description','[\"2\",\"8\",\"12\",\"13\",\"14\",\"15\",\"16\",\"18\",\"19\",\"23\",\"24\",\"25\",\"28\",\"29\",\"30\",\"31\",\"37\",\"38\",\"39\",\"42\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"56\",\"57\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\",\"82\",\"83\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"94\",\"95\",\"124\",\"125\",\"126\",\"127\",\"128\",\"129\",\"130\",\"131\",\"132\",\"133\",\"134\",\"135\",\"136\",\"137\",\"138\",\"139\",\"140\",\"141\",\"142\",\"143\",\"144\",\"145\",\"146\",\"147\",\"148\",\"149\",\"150\",\"151\",\"152\",\"153\",\"154\",\"155\",\"156\",\"157\",\"158\",\"159\",\"160\",\"161\",\"162\",\"163\",\"164\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\",\"187\",\"188\",\"189\",\"190\",\"191\",\"192\",\"193\",\"194\",\"195\"]','1','Admin','Admin','2024-01-31 07:33:28','2024-02-11 04:10:06'),(24,'api','asvwrv','[\"2\",\"12\",\"14\"]','2','Admin',NULL,'2024-01-31 11:44:12','2024-02-08 05:23:17'),(25,'api2',NULL,'[\"2\",\"8\",\"12\",\"13\",\"14\",\"15\",\"16\",\"18\",\"19\",\"23\",\"24\",\"25\",\"28\",\"29\",\"30\",\"31\",\"37\",\"38\",\"39\",\"42\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"56\",\"57\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\",\"82\",\"83\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"94\",\"95\",\"124\",\"125\",\"126\",\"127\",\"128\",\"129\",\"130\",\"131\",\"132\",\"133\",\"134\",\"135\",\"136\",\"137\",\"138\",\"139\",\"140\",\"141\",\"142\",\"143\",\"144\",\"145\",\"146\",\"147\",\"148\",\"149\",\"150\",\"151\",\"152\",\"153\",\"154\",\"155\",\"156\",\"157\",\"158\",\"159\",\"160\",\"161\",\"162\",\"163\",\"164\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\",\"187\",\"188\",\"189\",\"190\",\"191\",\"192\",\"193\",\"194\",\"195\"]','1','Admin','Admin','2024-02-08 06:37:45','2024-02-11 04:10:45');
/*!40000 ALTER TABLE `coupon_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-13 17:09:29
