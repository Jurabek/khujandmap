/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.21 : Database - khujandmap
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

/*Table structure for table `details` */

DROP TABLE IF EXISTS `details`;

CREATE TABLE `details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `id_marker` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_marker` (`id_marker`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`id_marker`) REFERENCES `markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `details` */

insert  into `details`(`id`,`text`,`id_marker`) values (1,'????? A ???? ???????. ?????? A15 ?? ????????? ????? 2 ???????-?????? ???????? ?? 5 ????? ???? ????? ?????. ????? ?? ??? ??? ???????? A2, A3, A5, A10, A15 ???? ????, ????? ???? ??? ??????. (?????? ????? A. ????????? ???????? A15 ????????? ?????? 2 ??????????????? ?????????? ? 5 ???????? ?????????. ??? ????? ???????? ??????????????? ???????? A2, A3, A5, A10, A15, ??????? ?? ?? ??????.)',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=cp1251;

/*Data for the table `markers` */

insert  into `markers`(`id`,`marker_name`,`address`,`lat`,`lng`,`type`) values (1,'Остановка универмаг','Хиебони Исмоили Сомони',40.284855,69.622375,5),(2,'Банкомат Банк Эсхаты','ул.Чоршанбе',40.285103,69.622078,1),(3,'Кафе Равшан','ул.Чоршанбе',40.284992,69.621437,2),(4,'Звезды Худжанда','Хиебони Исмоили Сомони',40.284679,69.623215,3),(5,'Остановка Такси','ул.Ордзхоникидзе',40.285278,69.621971,4),(6,'Остановка универмаг','Хиебони Исмоили Сомони',40.285969,69.622726,5),(7,'Имон Интернэшанал','ул.Чоршанбе',40.284790,69.620338,6),(8,'Кафе Хони Худжанд','ул.Чоршанбе',40.284527,69.619881,2),(9,'Ректарат ХГУ','ул.Мавлонбеков',40.284111,69.621033,7),(10,'Театр Камоли Худжанди','ул.Фирдавси',40.283390,69.619522,8),(11,'Худжанд Гранд Отель','ул.Чоршанбе',40.284428,69.618279,9),(12,'Тавхид','ул.Фирдавси',40.282806,69.622658,9),(13,'Факультет Информационных технологий','ПИТУТ',40.281715,69.616425,11),(14,'Себзор','ул.Себзор',40.271961,69.626274,10),(15,'ХУДЖАНДСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ ТАДЖИКСКОГО ТЕХНИЧЕСКОГ','Хиебони Исмоили Сомони',40.272209,69.641190,11),(16,'Факультет Инжинерно Экономический','ПИТУТ',40.313919,69.655090,11);

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=cp1251;

/*Data for the table `types` */

insert  into `types`(`id`,`type_name`) values (1,'Банкомат'),(2,'Кафе'),(3,'Парк'),(4,'Остановка такси'),(5,'Остановка'),(6,'Кредитный Банк'),(7,'Университет'),(8,'Театр'),(9,'Гостиница'),(10,'Улица'),(11,'Инситут');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
