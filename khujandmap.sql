/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.16 : Database - khujandmap
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`khujandmap` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `khujandmap`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `idAddress` int(2) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=cp1251;

/*Data for the table `address` */

insert  into `address`(`idAddress`,`address`) values (1,'Хиебони Исмоили Сомони'),(2,'ул.Чоршанбе'),(3,'ул.Ордзхоникидзе'),(4,'Хиебони Исмоили Сомони'),(5,'ул.Мавлонбеков'),(6,'ул.Фирдавси'),(7,'ПИТУТ'),(8,'ул.Себзор');

/*Table structure for table `info` */

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `idInfo` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

/*Data for the table `info` */

insert  into `info`(`idInfo`,`info`) values (1,'kkk');

/*Table structure for table `klat` */

DROP TABLE IF EXISTS `klat`;

CREATE TABLE `klat` (
  `idLat` int(2) NOT NULL AUTO_INCREMENT,
  `lat` float(10,6) NOT NULL,
  PRIMARY KEY (`idLat`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `klat` */

insert  into `klat`(`idLat`,`lat`) values (1,40.284855),(2,40.285103),(3,40.284992),(4,40.284679),(5,40.285278),(6,40.285969),(7,40.284790),(8,40.284527),(9,40.284111),(10,40.283390),(11,40.284428),(12,40.282806),(13,40.281715),(14,40.271961),(15,40.272209),(16,40.313919);

/*Table structure for table `klng` */

DROP TABLE IF EXISTS `klng`;

CREATE TABLE `klng` (
  `idLng` int(2) NOT NULL AUTO_INCREMENT,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`idLng`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `klng` */

insert  into `klng`(`idLng`,`lng`) values (1,69.622375),(2,69.622078),(3,69.621437),(4,69.623215),(5,69.621971),(6,69.622726),(7,69.620338),(8,69.619881),(9,69.621033),(10,69.619522),(11,69.618279),(12,69.622658),(13,69.616425),(14,69.626274),(15,69.641190),(16,69.655090);

/*Table structure for table `markers` */

DROP TABLE IF EXISTS `markers`;

CREATE TABLE `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marker_name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` int(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_markers` (`type`),
  CONSTRAINT `FK_markers` FOREIGN KEY (`type`) REFERENCES `types` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=cp1251;

/*Data for the table `markers` */

insert  into `markers`(`id`,`marker_name`,`address`,`lat`,`lng`,`type`) values (1,'Остановка универмаг','Хиебони Исмоили Сомони',40.284855,69.622375,5),(2,'Банкомат Банк Эсхаты','ул.Чоршанбе',40.285103,69.622078,1),(3,'Кафе Равшан','ул.Чоршанбе',40.284992,69.621437,2),(4,'Звезды Худжанда','Хиебони Исмоили Сомони',40.284679,69.623215,3),(5,'Остановка Такси','ул.Ордзхоникидзе',40.285278,69.621971,4),(6,'Остановка универмаг','Хиебони Исмоили Сомони',40.285969,69.622726,5),(7,'Имон Интернэшанал','ул.Чоршанбе',40.284790,69.620338,6),(8,'Кафе Хони Худжанд','ул.Чоршанбе',40.284527,69.619881,2),(9,'Ректарат ХГУ','ул.Мавлонбеков',40.284111,69.621033,7),(10,'Театр Камоли Худжанди','ул.Фирдавси',40.283390,69.619522,8),(11,'Худжанд Гранд Отель','ул.Чоршанбе',40.284428,69.618279,9),(12,'Тавхид','ул.Фирдавси',40.282806,69.622658,9),(13,'Факультет Информационных технологий','ПИТУТ',40.281715,69.616425,11),(14,'Себзор','ул.Себзор',40.271961,69.626274,10),(15,'ХУДЖАНДСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ ТАДЖИКСКОГО ТЕХНИЧЕСКОГ','Хиебони Исмоили Сомони',40.272209,69.641190,11),(16,'Факультет Инжинерно Экономический','ПИТУТ',40.313919,69.655090,11);

/*Table structure for table `markers1` */

DROP TABLE IF EXISTS `markers1`;

CREATE TABLE `markers1` (
  `idMarker` int(11) NOT NULL AUTO_INCREMENT,
  `idType` int(11) NOT NULL,
  `idName` int(11) NOT NULL,
  `idAddress` int(11) NOT NULL,
  `idLat` int(11) NOT NULL,
  `idLng` int(11) NOT NULL,
  `idInfo` int(11) NOT NULL,
  PRIMARY KEY (`idMarker`),
  KEY `FK_markers1` (`idType`),
  KEY `FK_markers2` (`idLng`),
  KEY `FK_markers3` (`idLat`),
  KEY `FK_markers4` (`idInfo`),
  KEY `FK_markers5` (`idName`),
  KEY `FK_markers6` (`idAddress`),
  CONSTRAINT `FK_markers2` FOREIGN KEY (`idLng`) REFERENCES `klng` (`idLng`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_markers3` FOREIGN KEY (`idLat`) REFERENCES `klat` (`idLat`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_markers4` FOREIGN KEY (`idInfo`) REFERENCES `info` (`idInfo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_markers5` FOREIGN KEY (`idName`) REFERENCES `name` (`idName`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_markers6` FOREIGN KEY (`idAddress`) REFERENCES `address` (`idAddress`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `markers1` */

/*Table structure for table `name` */

DROP TABLE IF EXISTS `name`;

CREATE TABLE `name` (
  `idName` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idName`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=cp1251;

/*Data for the table `name` */

insert  into `name`(`idName`,`name`) values (1,'Остановка универмаг'),(2,'Банкомат Банк Эсхаты'),(3,'Кафе Равшан'),(4,'Звезды Худжанда'),(5,'Остановка Такси'),(6,'Остановка универмаг'),(7,'Имон Интернэшанал'),(8,'Кафе Хони Худжанд'),(9,'Ректарат ХГУ'),(10,'Театр Камоли Худжанди'),(11,'Худжанд Гранд Отель'),(12,'Тавхид'),(13,'Факультет Информационных технологий'),(14,'Себзор'),(15,'ХУДЖАНДСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ ТАДЖИКСКОГО ТЕХНИЧЕСКОГ'),(16,'Факультет Инжинерно Экономический');

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=cp1251;

/*Data for the table `types` */

insert  into `types`(`id`,`type_name`) values (1,'Банкомат'),(2,'Кафе'),(3,'Парк'),(4,'Остановка такси'),(5,'Остановка'),(6,'Кредитный Банк'),(7,'Университет'),(8,'Театр'),(9,'Гостиница'),(10,'Улица'),(11,'Инситут');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
