# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.50)
# Database: abundant3_dev
# Generation Time: 2012-03-16 00:35:49 -0400
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table campaigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaigns`;

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `started_on` date DEFAULT NULL,
  `cost_in_cents` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;

INSERT INTO `campaigns` (`id`, `name`, `started_on`, `cost_in_cents`, `created_at`, `updated_at`)
VALUES
	(5,'Bedrock Foundations','2012-03-04',NULL,'2012-03-04 16:38:58','2012-03-04 16:38:58'),
	(6,'Abundant Life Landscaping LLC','2012-03-04',NULL,'2012-03-04 16:39:23','2012-03-04 16:39:23'),
	(7,'Broad Plane Excavation ','2012-03-04',NULL,'2012-03-04 16:39:49','2012-03-04 16:39:49'),
	(8,'Waterloo Structures','2012-03-14',NULL,'2012-03-14 20:36:44','2012-03-14 20:36:44'),
	(9,'White Pine Structures','2012-03-14',NULL,'2012-03-14 20:37:03','2012-03-14 20:37:03'),
	(10,'Spacemakers Sheds','2012-03-14',NULL,'2012-03-14 20:37:18','2012-03-14 20:37:18'),
	(11,'Penn Dutch Structures','2012-03-14',NULL,'2012-03-14 20:37:33','2012-03-14 20:37:33'),
	(12,'Garden Spot Structures','2012-03-14',NULL,'2012-03-14 20:37:48','2012-03-14 20:37:48'),
	(13,'','2012-03-14',NULL,'2012-03-14 20:38:09','2012-03-14 20:38:09'),
	(14,'Riehl Quality','2012-03-15',NULL,'2012-03-15 17:56:35','2012-03-15 17:56:35');

/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contact_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_statuses`;

CREATE TABLE `contact_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contact_statuses` WRITE;
/*!40000 ALTER TABLE `contact_statuses` DISABLE KEYS */;

INSERT INTO `contact_statuses` (`id`, `status_name`, `created_at`, `updated_at`)
VALUES
	(1,'New','2011-03-18 03:35:01','2011-03-18 03:35:01'),
	(2,'Active','2011-03-18 03:35:09','2011-03-18 03:35:09'),
	(3,'Dead','2011-03-18 03:35:16','2011-03-18 03:35:16');

/*!40000 ALTER TABLE `contact_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `phone_work` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_status_id` int(11) NOT NULL DEFAULT '1',
  `shed_company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;

INSERT INTO `contacts` (`id`, `company`, `first_name`, `last_name`, `phone`, `phone_alt`, `address_1`, `address_2`, `city`, `province`, `zip`, `campaign_id`, `created_at`, `updated_at`, `lat`, `lng`, `distance`, `phone_work`, `email`, `contact_status_id`, `shed_company_id`)
VALUES
	(637,'','MARGRET ','CASSLING','302-368-5470','302-743-6357','6 VASSER DR','','NEWARK','DE.',19711,NULL,'2012-02-02 15:02:22','2012-02-02 15:02:22','39.6879139','-75.7747904',22,'','',1,NULL),
	(639,'','CARL','HARPER','610-563-8255','','17 BECK RD ','','COATESVILLE ','PA ',19320,NULL,'2012-02-13 12:37:54','2012-02-13 12:52:47','39.953103','-75.818475',5,'','',3,NULL),
	(640,'','pam','kelch','484-3564879','','1355 telagraph rd','','coatesville','pa',19320,NULL,'2012-02-19 18:41:16','2012-02-20 14:44:03','40.047226','-75.88794',3,'','',3,NULL),
	(641,'','STEVE ','STOLTZFUS','717-278-6238','','5621 MEADVILLE RD','','GAP','PA',17527,NULL,'2012-02-20 14:45:49','2012-02-20 17:06:50','40.0694399','-75.9972826',6,'','SALES@STOLTZFUSEXTERIORS.COM',3,NULL),
	(644,'','FORREST','BERGER','302-764-3329','','17 BEEKMAN RD','','WILMINGTON','DE.',19809,NULL,'2012-02-21 12:17:11','2012-02-22 22:07:15','39.758469','-75.507857',27,'','FSERGER@VERIZON.NET',3,NULL),
	(645,'','JIM','SEARS','717-304-4846','','609 ASPEN LANE','',' LEBANON','PA',17042,NULL,'2012-02-21 17:34:37','2012-03-05 18:00:53','40.245551','-76.42663',32,'','',3,NULL),
	(646,'','CHRIS','LOHAN','267-252-0131','','1752 FORD RD','','BRISTOL ','PA',19007,NULL,'2012-02-21 19:43:07','2012-02-21 19:43:07','40.1151453','-74.9011772',54,'','',1,NULL),
	(648,'','BOB ','BURROUGHS','301-607-8110','','6160 WOODVILLE RD','','MT AIRY','MD',21771,NULL,'2012-02-21 19:53:45','2012-02-21 20:18:59','39.403237','-77.180097',79,'','',3,NULL),
	(649,'','JENNIFER','SMITH','717-333-42667','','645 HAMAKER RD','','MANHEIM','PA',17545,NULL,'2012-02-21 20:21:38','2012-02-21 20:26:13','40.1776988','-76.3865198',27,'','',3,NULL),
	(650,'','LARRY','PETERSON','484-888-8923','610-942-3339','130 WINDYHILL RD','','DOWNINGTOWN','PA',19325,NULL,'2012-02-21 20:29:23','2012-02-21 21:08:23','40.049254','-75.772318',8,'','',3,NULL),
	(651,'','PATRIC','BRADLEY','','610-246-1993','111 WYNDMOOR RD','','SPRINGFIELD','PA ',19046,NULL,'2012-02-21 21:12:01','2012-02-21 21:16:53','39.9302991','-75.3356502',30,'','',3,NULL),
	(652,'','DAN','','','215-478-1776','49 PINEWOOD DRIVE','','LEVITTOWN','PA',NULL,NULL,'2012-02-21 21:19:27','2012-02-21 21:27:24','40.1533457','-74.8261985',58,'','',3,NULL),
	(653,'','MATT','POWERS','610-580-4838','ALISHA...443-928-9888','512 ROLLING GLEN DRIVE','','HORSHAM','PA',19044,NULL,'2012-02-21 21:30:53','2012-02-21 21:34:48','40.191924','-75.176642',41,'','',3,NULL),
	(655,'','MOISES','DELEON','301-807-0189','','','','WOLDORPH','MD',NULL,NULL,'2012-02-22 14:50:47','2012-02-22 14:50:47','38.6343544','-76.9066829',108,'','',1,NULL),
	(656,'','BRIAN','HEISEY','717-592-8248','','493 KIRKHAM','','YORK','PA',17402,NULL,'2012-02-22 15:55:08','2012-02-22 15:55:08','39.979211','-76.627756',38,'','',1,NULL),
	(657,'','KEITH','WALLER','','717-538-1483','841 CHESTNUT ST','','COLUMBIA','PA',17512,NULL,'2012-02-22 16:18:30','2012-03-02 19:24:53','40.039712','-76.496488',31,'','',1,NULL),
	(658,'','HAO','DIEP','4027301341','','7205 KINDLER RD','','COLUMBIA ','MD ',2046,5,'2012-02-29 14:02:36','2012-03-07 14:48:43','39.172726','-76.868354',76,'','',1,NULL),
	(660,'','ALLEN','TRUBAN','','302-442-4503','26 GRADY LANE','','NEWCASTLE','DE',19720,NULL,'2012-02-29 14:58:10','2012-02-29 15:04:04','39.618935','-75.648982',29,'302-656-3017','',3,NULL),
	(661,'spacemakers sheds','','','','','','','gap','pa',NULL,NULL,'2012-02-29 16:08:59','2012-02-29 16:08:59','39.987325','-76.0205073',5,'','',1,NULL),
	(662,'','PHIL ','HOLLAND','','717-571-2790','','','EDDERS','PA',NULL,NULL,'2012-02-29 17:11:05','2012-02-29 17:11:05','40.4917521','-76.8496945',60,'','',1,NULL),
	(663,'','ANDREW ','SCOOP','215-687-0123','','','','HORSHAM','PA',NULL,NULL,'2012-02-29 17:15:29','2012-02-29 17:15:29','40.1784422','-75.1285061',43,'','',1,NULL),
	(664,'','ASHLEY','','410-980-3432','','','','CHURCHTON','MD',NULL,NULL,'2012-02-29 17:18:09','2012-02-29 17:18:09','38.8026161','-76.5369022',89,'','',1,NULL),
	(665,'','JOHN','','443-695-3252','','','','ABERDEEN ','MD',NULL,NULL,'2012-02-29 17:20:43','2012-02-29 17:20:43','39.5095556','-76.1641197',36,'','',1,NULL),
	(666,'','KATHY','MCCLLSKEY','717-330-5903','','15 WINDMILL RD','','CONAWEGO','PA',21918,NULL,'2012-02-29 17:29:14','2012-02-29 17:29:14','39.6919891','-76.1667807',25,'','',1,NULL),
	(667,'','JONATHAN','DERR','410-530 0439','','10 CIRCULE DR','','SHREWSBURY','PA',NULL,NULL,'2012-02-29 17:42:22','2012-02-29 17:57:03','39.77074','-76.677498',43,'','',3,NULL),
	(668,'','KEITH','STOLTZFUS','717-519-9900','','53 HUNTER DR.','','ELIZABETHTOWN ','PA',17022,NULL,'2012-02-29 18:29:30','2012-03-09 21:14:17','40.111263','-76.632487',38,'','',3,NULL),
	(669,'','','','','','144 CHINNICK AVE','','TRENTON','NJ',8619,5,'2012-02-29 18:54:38','2012-03-06 21:51:27','40.240106','-74.7122119',65,'','',1,NULL),
	(670,'','ED','CUPKA','','717-321-5679','131 POPLAR LANE','','MT WOLF','PA',17347,NULL,'2012-02-29 19:45:35','2012-02-29 19:50:32','40.047991','-76.694085',41,'','',3,NULL),
	(671,'','GWEN','CAMP','301-801-5473','','3620 2ND AVE','','EDGE WATER','MD',21037,NULL,'2012-03-01 13:28:28','2012-03-01 13:35:11','38.909986','-76.5198489',82,'','',1,NULL),
	(672,'','KELLY','DIGIAMBERARDINO','610-466-7326','484-883-6067','976 ERICSSON DR','','COATESVILLE','PA',19320,NULL,'2012-03-01 17:35:09','2012-03-01 17:35:09','39.950336','-75.757063',8,'610-925-3440','',1,NULL),
	(673,'','MIKE','CLEIN','609-206-7696','','500 NEWPORT RD','','BRISTOL','PA',19007,NULL,'2012-03-01 18:18:47','2012-03-01 18:18:47','40.1000676','-74.8793873',55,'','',1,NULL),
	(674,'','ROBIN','KALINER','610-455-0469','','1198 CARRIE LANE','','WEST CHESTER','PA',19382,NULL,'2012-03-01 18:39:39','2012-03-01 18:48:58','39.9303664','-75.5537173',19,'','',3,NULL),
	(675,'','LEN','','','','','','MONKTON','PA',NULL,NULL,'2012-03-01 19:20:29','2012-03-09 20:39:32','39.578611','-76.615833',47,'','',1,NULL),
	(676,'maeveco home inprovements','mike','','','','1432 S WHITEFORD RD','','WEST CHESTER','PA',19380,NULL,'2012-03-01 21:25:17','2012-03-02 18:42:45','39.9606643','-75.6054882',16,'610-202-7708','',3,NULL),
	(677,'','BOB','SODA','215-675-3601','','996 MARIAN RD','','WARMINSTER ','PA',18974,NULL,'2012-03-02 20:35:24','2012-03-02 20:35:24','40.2134621','-75.0897879',45,'','',1,NULL),
	(678,'','JENNIFER','HOFFMANN','215-346-2686','215-439-1856','2033 PARKVIEW AVE','','ABINGTON','PA',19001,5,'2012-03-04 21:48:29','2012-03-14 20:22:33','40.134678','-75.111274',43,'','',1,NULL),
	(680,'','MARYANN','PILLOTSON','717-887-9713','','333 BLUE RIDGE DR','','YORK ','PA',17402,5,'2012-03-05 12:26:33','2012-03-06 18:31:06','39.9036479','-76.686231',41,'','',1,NULL),
	(681,'','DOUG ','MYER','717-4718413','','2670 WHITE OAK RD ','','STRAWSBURG','PA',NULL,5,'2012-03-05 12:29:34','2012-03-06 19:57:36','39.9395258','-76.1530847',13,'','',3,NULL),
	(682,'','BILL ','SPRINKLE','717-668-2488','','','','','',NULL,5,'2012-03-05 12:32:08','2012-03-05 12:32:08',NULL,NULL,NULL,'','',1,NULL),
	(683,'','JIM','FORSMAN','302-489-9830','','67 FAWN VALLEY DR','','ELKTON ','MD',21921,5,'2012-03-05 16:14:29','2012-03-05 16:14:29','39.70478','-75.9325',20,'','',1,NULL),
	(684,'','WILL','CRUMP','202-309-1595','','3805 WOODHAVEN LANE','','BOWIE','MD',20715,5,'2012-03-05 18:52:31','2012-03-05 18:52:31','38.988591','-76.752017',83,'','',1,NULL),
	(685,'','CAROL','RIFKIN','410-252-0367','','12015 BOXER HILL RD','','COCKEYSVILLE','MD',21030,5,'2012-03-05 19:56:35','2012-03-05 19:56:35','39.456365','-76.682487',55,'','',1,NULL),
	(687,'','BILL','SPRINKLE','717-668-2488','','1050 OAK VIEW LANE','','HELLAM','PA',17406,5,'2012-03-06 16:53:46','2012-03-06 17:59:41','40.0289223','-76.6189496',37,'','',3,NULL),
	(688,'','JOE ','MAXWELL','410-378-4804','','75 FRANKLIN DR','','PORT DEPOSIT ','MD',21904,5,'2012-03-06 16:55:20','2012-03-06 19:05:06','39.626623','-76.132785',28,'','',1,NULL),
	(689,'','ANTHONY','YU','301-421-9291','703-622-6915','16119 DRAYTON FARM DR','','SPENCERVILLE ','MD',20868,5,'2012-03-06 20:50:27','2012-03-09 01:30:29','39.1203519','-76.97783',83,'','',3,NULL),
	(691,'','BUD','HARDGROVE','443-695-2495','410-458-3986','7915 DALROSE AVE','','ROSEDALE ','MD',21237,5,'2012-03-06 22:19:27','2012-03-06 22:19:27','39.3140659','-76.511239',57,'','',1,NULL),
	(692,'','CURTIS','DELOSREYES','','302-420-1114','107 SUNSHINE LANE','','MIDDLETOWN ','DE. ',19709,5,'2012-03-07 14:03:37','2012-03-07 15:16:39','39.503346','-75.643287',37,'','',3,NULL),
	(693,'','BILL','KANE','410-781-6090','','5737 OAKLAND RD','','ELDERSBURG ','MD',21784,5,'2012-03-07 15:34:44','2012-03-09 21:14:28','39.414664','-76.890963',66,'','wwkane@comcast.net',3,NULL),
	(694,'','MICHEAL','RUYAK','','610-972-0696','1152 wendler cir','','pottstown ','pa',19465,5,'2012-03-07 16:17:31','2012-03-07 16:27:18','40.224597','-75.654143',20,'','mruyak@klinkauamerica.com',3,NULL),
	(696,'','BARBRA ANN','MCGRAIN','410-399-9554','443-797-2928','102 AQUEDUCT COURT','','FORREST HILL ','MD',21050,5,'2012-03-08 22:42:25','2012-03-08 22:59:29','39.5778814','-76.3984537',39,'','',3,NULL),
	(697,'','BRIAN','TUNNELL','410-658-4082','','1749 COLORA RD','','COLORA ','MD',21917,5,'2012-03-09 00:56:22','2012-03-13 20:31:36','39.6507661','-76.1026118',26,'443-206-4080','',3,NULL),
	(698,'','REBECCA','LOVETT','717-371-9925','','2874 FLEETWOOD DR','','LANCASTER','PA',17601,5,'2012-03-09 01:00:35','2012-03-12 15:35:55','40.057346','-76.391937',25,'','',3,NULL),
	(699,'','MIKE ','PLAZIO','856-628-4993','856-275-6908','135 SANFORD RD','','PENNSVILLE','NJ',8070,5,'2012-03-09 01:07:38','2012-03-09 01:19:51','39.641953','-75.54303',31,'','',3,NULL),
	(700,'RIVERVIEW','JIM','SCHINE','','','572 KINGS RD','','YARDLY','PA',19067,5,'2012-03-09 01:20:36','2012-03-12 18:18:25','40.221151','-74.8315211',59,'','',1,NULL),
	(701,'','FRANCES ','','610-383-4456','','','','','',NULL,6,'2012-03-09 01:33:13','2012-03-09 01:33:13',NULL,NULL,NULL,'','',1,NULL),
	(702,'','JOSH','MORE','','352-727-8765','8420 BRADDOCK WAY','','COLUMBIA','MD',21046,5,'2012-03-09 18:40:20','2012-03-09 18:40:20','39.174294','-76.872098',76,'','',1,NULL),
	(703,'','DAVE','SINGER','717-6270872','717-368-2723','35 TROY DR','','LITITZ','PA',17543,5,'2012-03-09 19:29:35','2012-03-09 19:36:20','40.1852405','-76.3262228',25,'','',3,NULL),
	(704,'','RALPH','WILSON','717-792-1810','','1437 SEVEN VALLEYS RD','','YORK','PA',17408,5,'2012-03-09 19:59:16','2012-03-12 15:00:32','39.889722','-76.785822',47,'','',3,NULL),
	(705,'','kathleen','palkon','484-620-0005','','116 valleyview cir','','lincoln university','pa',19352,5,'2012-03-12 13:34:21','2012-03-13 20:32:09','39.790524','-75.924063',14,'','',3,NULL),
	(706,'','BOB','MACZIS','410-239-7382','410-804-0432','4106 HOFFMANVILLE RD','','MILLERS ','MD',21102,5,'2012-03-12 15:19:42','2012-03-12 15:19:42','39.682324','-76.792675',51,'','',1,NULL),
	(707,'','JOE','GASPER','240-314-2485','','14724 JANICE DR','','ROCKVILLE','MD',20853,5,'2012-03-12 15:53:25','2012-03-12 15:53:25','39.097694','-77.099873',89,'','',1,NULL),
	(708,'','JIM','BADGER','','302-743-1599','4521 PICKWICK DR','','WILMINGTON','DE',19808,5,'2012-03-12 16:08:37','2012-03-13 20:31:53','39.728904','-75.661105',23,'','',3,NULL),
	(709,'','JOANN','HANRAHAN','302 691-7058','302-290-6244','606 SWALLOW HOLLOW RD','','WILMINGTON ','DE',19807,5,'2012-03-12 17:37:03','2012-03-12 17:46:21','39.8160568','-75.6164488',20,'','',3,NULL),
	(710,'','BRUCE','BROWN','410-274-3306','','16657 MILLER LANE','','PARKTON ','MD',21120,5,'2012-03-12 18:03:20','2012-03-14 20:54:06','39.582288','-76.680774',50,'','',3,NULL),
	(711,'','PETE','DOUGHERTY','484-614-1278','','12 ROLLING GLEN LANE','','DOWNINGTOWN','PA',19335,5,'2012-03-13 13:32:34','2012-03-13 20:31:59','40.0064958','-75.7032742',10,'','',3,NULL),
	(712,'','JOHN','SILVA','443-538-5750','','2055 CONAN DOYLE WAY','','ELDERSBURG ','MD',21784,5,'2012-03-13 19:51:36','2012-03-13 20:31:13','39.421967','-76.919445',66,'','',3,NULL),
	(713,'','CRYSTAL ','YINGER','','717-332-7372','60 GRIFFITH LANE','','MANCHESTER','PA',17345,5,'2012-03-13 22:24:11','2012-03-13 22:49:40','40.078413','-76.732949',43,'','',3,NULL),
	(714,'','PHIL','BARRETT','','301-512-8016','1006 AVERY PLACE','','UPPERBORO','MD',20774,5,'2012-03-14 15:31:00','2012-03-14 15:31:00','38.8682133','-76.7913558',91,'','',1,NULL),
	(715,'','ANN','STRAW BRIDGE','','484-432-1522','1072 ST MATHEWS RD','','CHESTER SPRINGS','PA',19425,5,'2012-03-14 16:27:19','2012-03-14 16:27:19','40.1162555','-75.6495744',15,'','',1,NULL),
	(716,'','PAM','GARRETY','717-741-1955','','2616 NATALIE DR','','YORK','PA',17402,5,'2012-03-14 19:33:46','2012-03-14 19:33:46','39.907434','-76.69122',41,'','',1,NULL),
	(717,'','DAVE','KUKORLO','717-968-1823','','2565 SUNSET LANE','','YORK','PA',17408,5,'2012-03-14 20:07:28','2012-03-14 20:20:36','39.971113','-76.804717',47,'','',3,NULL),
	(718,'','JACKIE','JACOBSON','','610-975-8041','40 ANDOVER RD','','GLENMOORE','PA',19343,5,'2012-03-14 22:07:35','2012-03-14 22:07:35','40.057586','-75.796234',7,'','',1,NULL),
	(719,'','ED','SALABSKY','717-428-0227','','1769 SEAKS RUN RD','','GLENROCK ','PA',17327,11,'2012-03-15 17:42:36','2012-03-15 17:42:36','39.836177','-76.67903',42,'','',1,NULL),
	(720,'','MIKE','CALDWELL','610-656-0728','','303 BLAKE RD','','OXFORD','PA',19363,14,'2012-03-15 17:57:56','2012-03-15 17:57:56','39.722944','-75.891492',19,'','',1,NULL),
	(721,'','MELANIE','MCKEE','','717-424-3407','3130 KING RICHARD COURT SOUTH','','YORK','PA',17408,11,'2012-03-15 21:26:54','2012-03-15 21:26:54','39.9053771','-76.7946963',47,'','',1,NULL),
	(722,'','HOMESTEAD STRUCTURES','','','','','','HORSHAM','PA',NULL,5,'2012-03-15 21:39:18','2012-03-15 22:52:25','40.1784422','-75.1285061',43,'','',1,NULL);

/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contracts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contracts`;

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_id` int(11) DEFAULT NULL,
  `crew_id` int(11) DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `position_in_day` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;

INSERT INTO `contracts` (`id`, `estimate_id`, `crew_id`, `scheduled_date`, `position_in_day`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL,NULL,'2012-03-16 04:32:11','2012-03-16 04:32:11'),
	(2,2,NULL,NULL,NULL,'2012-03-16 04:32:11','2012-03-16 04:32:11'),
	(3,3,NULL,NULL,NULL,'2012-03-16 04:32:11','2012-03-16 04:32:11'),
	(4,4,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(5,5,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(6,6,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(7,7,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(8,8,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(9,9,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(10,10,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(11,11,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(12,12,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(13,13,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(14,14,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(15,15,NULL,NULL,NULL,'2012-03-16 04:32:12','2012-03-16 04:32:12'),
	(16,16,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(17,17,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(18,18,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(19,19,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(20,20,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(21,21,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(22,22,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(23,23,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(24,24,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(25,25,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(26,26,NULL,NULL,NULL,'2012-03-16 04:32:13','2012-03-16 04:32:13'),
	(27,27,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(28,28,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(29,29,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(30,30,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(31,31,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(32,32,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(33,33,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(34,34,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(35,35,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(36,36,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(37,37,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(38,38,NULL,NULL,NULL,'2012-03-16 04:32:14','2012-03-16 04:32:14'),
	(39,39,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(40,40,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(41,41,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(42,42,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(43,43,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(44,44,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(45,45,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(46,46,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(47,47,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(48,48,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(49,49,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(50,50,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(51,51,NULL,NULL,NULL,'2012-03-16 04:32:15','2012-03-16 04:32:15'),
	(52,52,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(53,53,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(54,54,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(55,55,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(56,56,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(57,57,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(58,58,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(59,59,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(60,60,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(61,61,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(62,62,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(63,63,NULL,NULL,NULL,'2012-03-16 04:32:16','2012-03-16 04:32:16'),
	(64,64,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(65,65,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(66,66,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(67,67,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(68,68,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(69,69,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(70,70,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(71,71,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(72,72,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(73,73,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(74,74,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(75,75,NULL,NULL,NULL,'2012-03-16 04:32:17','2012-03-16 04:32:17'),
	(76,76,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(77,77,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(78,78,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(79,79,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(80,80,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(81,81,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(82,82,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(83,83,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(84,84,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(85,85,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(86,86,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(87,87,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(88,88,NULL,NULL,NULL,'2012-03-16 04:32:18','2012-03-16 04:32:18'),
	(89,89,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(90,90,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(91,91,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(92,92,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(93,93,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(94,94,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(95,95,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(96,96,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(97,97,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(98,98,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(99,99,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(100,100,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(101,101,NULL,NULL,NULL,'2012-03-16 04:32:19','2012-03-16 04:32:19'),
	(102,102,NULL,NULL,NULL,'2012-03-16 04:32:20','2012-03-16 04:32:20'),
	(103,103,NULL,NULL,NULL,'2012-03-16 04:32:20','2012-03-16 04:32:20');

/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table crews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `crews`;

CREATE TABLE `crews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crew_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crew_base_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crew_size` int(11) DEFAULT NULL,
  `velocity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `job_max_per_day` int(11) DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table estimates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estimates`;

CREATE TABLE `estimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `job_type_id` int(11) DEFAULT NULL,
  `flashvars` text COLLATE utf8_unicode_ci,
  `date_of_email_to_client` datetime DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `estimates` WRITE;
/*!40000 ALTER TABLE `estimates` DISABLE KEYS */;

INSERT INTO `estimates` (`id`, `job_id`, `job_type_id`, `flashvars`, `date_of_email_to_client`, `token`, `created_at`, `updated_at`, `sold`)
VALUES
	(1,682,2,'---\ncontact_name: MARGRET  CASSLING\ncontact_address: 6 VASSER DR\ncontact_address2: NEWARK, DE.   19711\ncontact_phone_home: 302-368-5470\ncontact_phone_cell: 302-743-6357\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: ! \'Accessible with machine: wheel by hand\'\njob_price: $1,799.11\nadditional_price: $688.63\njob_total_price: $1,799.11\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'5a046b918ee2bb7c5ffd059136f77ba4','2012-03-16 04:30:28','2012-03-16 04:32:11',1),
	(2,683,2,'---\ncontact_name: CARL HARPER\ncontact_address: ! \'17 BECK RD \'\ncontact_address2: COATESVILLE , PA    19320\ncontact_phone_home: 610-563-8255\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $747.28\nadditional_price: $106.11\njob_total_price: $747.28\njob_width: \'10\'\njob_length: \'10\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'7ad9755757c004858a3d25d20f99d445','2012-03-16 04:30:28','2012-03-16 04:32:11',1),
	(3,684,2,'---\ncontact_name: pam kelch\ncontact_address: 1355 telagraph rd\ncontact_address2: coatesville, pa   19320\ncontact_phone_home: 484-3564879\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $769.75\nadditional_price: $100.00\njob_total_price: $769.75\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'bb4e270b820b5e420de9b9fe5d5953b4','2012-03-16 04:30:29','2012-03-16 04:32:11',1),
	(4,685,1,'---\ncontact_name: pam kelch\ncontact_address: 1355 telagraph rd\ncontact_address2: coatesville, pa   19320\ncontact_phone_home: 484-3564879\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $338.48\nadditional_price: $100.00\njob_total_price: $338.48\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 02/19/2012\n',NULL,'6ab4b477f27d1e876d88042fc87a5267','2012-03-16 04:30:29','2012-03-16 04:32:12',1),
	(5,686,2,'---\ncontact_name: STEVE  STOLTZFUS\ncontact_address: 5621 MEADVILLE RD\ncontact_address2: GAP, PA   17527\ncontact_phone_home: 717-278-6238\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: SALES@STOLTZFUSEXTERIORS.COM\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $984.01\nadditional_price: $45.24\njob_total_price: $984.01\njob_width: \'12\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'bb617f0a4eda82dc153d6f89f69681a5','2012-03-16 04:30:29','2012-03-16 04:32:12',1),
	(6,688,2,'---\ncontact_name: FORREST BERGER\ncontact_address: 17 BEEKMAN RD\ncontact_address2: WILMINGTON, DE.   19809\ncontact_phone_home: 302-764-3329\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: FSERGER@VERIZON.NET\njob_location_abbr: DE\njob_location_phone: (302) 545.7067\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $801.17\nadditional_price: $0\njob_total_price: $801.17\njob_width: \'10\'\njob_length: \'10\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'2239b892d55483e33171f668ba45a451','2012-03-16 04:30:29','2012-03-16 04:32:12',1),
	(7,689,2,'---\ncontact_name: JIM SEARS\ncontact_address: 609 ASPEN LANE\ncontact_address2: ! \' LEBANON, PA   17042\'\ncontact_phone_home: 717-304-4846\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,507.37\nadditional_price: $163.20\njob_total_price: $1,507.37\njob_width: \'14\'\njob_length: \'22\'\njob_inches: \'24\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'d7df0f32c3ebafbc4721dca2ee07ddd7','2012-03-16 04:30:30','2012-03-16 04:32:12',1),
	(8,691,2,'---\ncontact_name: CHRIS LOHAN\ncontact_address: 1752 FORD RD\ncontact_address2: BRISTOL , PA   19007\ncontact_phone_home: 267-252-0131\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,380.21\nadditional_price: $0\njob_total_price: $1,380.21\njob_width: \'12\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'7671a66d4c4bd209d0090e86d79978fd','2012-03-16 04:30:30','2012-03-16 04:32:12',1),
	(9,692,2,'---\ncontact_name: BOB  BURROUGHS\ncontact_address: 6160 WOODVILLE RD\ncontact_address2: MT AIRY, MD   21771\ncontact_phone_home: 301-607-8110\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,650.93\nadditional_price: $0\njob_total_price: $1,650.93\njob_width: \'15\'\njob_length: \'21\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'2bb4362935fb46e5ae16dd29c3dbf2ad','2012-03-16 04:30:30','2012-03-16 04:32:12',1),
	(10,693,2,'---\ncontact_name: JENNIFER SMITH\ncontact_address: 645 HAMAKER RD\ncontact_address2: MANHEIM, PA   17545\ncontact_phone_home: 717-333-42667\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $878.93\nadditional_price: $34.64\njob_total_price: $878.93\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'db9d2fcbe9d793b13f82ebacfe59d4ec','2012-03-16 04:30:31','2012-03-16 04:32:12',1),
	(11,694,2,'---\ncontact_name: LARRY PETERSON\ncontact_address: 130 WINDYHILL RD\ncontact_address2: DOWNINGTOWN, PA   19325\ncontact_phone_home: 484-888-8923\ncontact_phone_cell: 610-942-3339\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,156.95\nadditional_price: $0\njob_total_price: $1,156.95\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'16\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'0d6854abe355733ff47b1d6ce9ac5b66','2012-03-16 04:30:31','2012-03-16 04:32:12',1),
	(12,695,2,'---\ncontact_name: PATRIC BRADLEY\ncontact_address: 111 WYNDMOOR RD\ncontact_address2: SPRINGFIELD, PA    19046\ncontact_phone_home: \'\'\ncontact_phone_cell: 610-246-1993\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $984.59\nadditional_price: $75.36\njob_total_price: $984.59\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'37658c40b0640c59d19e8134d34a4da3','2012-03-16 04:30:31','2012-03-16 04:32:12',1),
	(13,696,2,'---\ncontact_name: ! \'DAN \'\ncontact_address: 49 PINEWOOD DRIVE\ncontact_address2: ! \'LEVITTOWN, PA   \'\ncontact_phone_home: \'\'\ncontact_phone_cell: 215-478-1776\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,181.00\nadditional_price: $0\njob_total_price: $1,181.00\njob_width: \'12\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'7446b137096f7fb229acc933dfa3c695','2012-03-16 04:30:32','2012-03-16 04:32:12',1),
	(14,697,2,'---\ncontact_name: MATT POWERS\ncontact_address: 512 ROLLING GLEN DRIVE\ncontact_address2: HORSHAM, PA   19044\ncontact_phone_home: 610-580-4838\ncontact_phone_cell: ALISHA...443-928-9888\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,148.35\nadditional_price: $60.65\njob_total_price: $1,148.35\njob_width: \'14\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'a3c4e58000136d9ab4d8b1259a8a16e6','2012-03-16 04:30:32','2012-03-16 04:32:12',1),
	(15,698,2,'---\ncontact_name: MOISES DELEON\ncontact_address: \'\'\ncontact_address2: ! \'WOLDORPH, MD   \'\ncontact_phone_home: 301-807-0189\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,230.54\nadditional_price: $0\njob_total_price: $2,230.54\njob_width: \'16\'\njob_length: \'30\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'5a8fcd1402c1112908fe28bb2576cd49','2012-03-16 04:30:32','2012-03-16 04:32:12',1),
	(16,699,2,'---\ncontact_name: BRIAN HEISEY\ncontact_address: 493 KIRKHAM\ncontact_address2: YORK, PA   17402\ncontact_phone_home: 717-592-8248\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $967.41\nadditional_price: $0\njob_total_price: $967.41\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'22f36661646f66a2e2565d979823ad5b','2012-03-16 04:30:45','2012-03-16 04:32:13',1),
	(17,700,2,'---\ncontact_name: KEITH WALLER\ncontact_address: 841 CHESTNUT ST\ncontact_address2: COLUMBIA, PA   17512\ncontact_phone_home: \'\'\ncontact_phone_cell: 717-538-1483\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: ! \"CUT AND REMOVE EXISTING BLACKTOP, HAUL OUT SOIL,      151.00\\r\\n2\'X16\'\n  \\ 6X6 RETAINING WALL                                             392.00\\r\\nDISPOSE\n  OF EXISTING SHED                                                 300.00\"\njob_extras: \'\'\njob_price: $1,198.10\nadditional_price: $22.17\njob_total_price: $1,198.10\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'24\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'27aab00f8d8ed9733d2cbdf6e75797e1','2012-03-16 04:30:45','2012-03-16 04:32:13',1),
	(18,702,2,'---\ncontact_name: HAO DIEP\ncontact_address: 7205 KINDLER RD\ncontact_address2: COLUMBIA , MD    2046\ncontact_phone_home: \'4027301341\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,200.66\nadditional_price: $0\njob_total_price: $1,200.66\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'12\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'44147aa883d413b9954ef3ac57382038','2012-03-16 04:30:45','2012-03-16 04:32:13',1),
	(19,703,2,'---\ncontact_name: ALLEN TRUBAN\ncontact_address: 26 GRADY LANE\ncontact_address2: NEWCASTLE, DE   19720\ncontact_phone_home: \'\'\ncontact_phone_cell: 302-442-4503\ncontact_phone_work: 302-656-3017\ncontact_email: \'\'\njob_location_abbr: DE\njob_location_phone: (302) 545.7067\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,106.04\nadditional_price: $0\njob_total_price: $1,106.04\njob_width: \'12\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'635b41d66788a7c36fb914f7771709ae','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(20,704,1,'---\ncontact_name: ! \' \'\ncontact_address: \'\'\ncontact_address2: ! \'gap, pa   \'\ncontact_phone_home: \'\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $289.70\nadditional_price: $0\njob_total_price: $289.70\njob_width: \'12\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 02/29/2012\n',NULL,'fc20798bbc163608cfd701bf79c36f26','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(21,705,2,'---\ncontact_name: PHIL  HOLLAND\ncontact_address: \'\'\ncontact_address2: ! \'EDDERS, PA   \'\ncontact_phone_home: \'\'\ncontact_phone_cell: 717-571-2790\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,163.23\nadditional_price: $0\njob_total_price: $1,163.23\njob_width: \'14\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'43e0f2945c8ac294e3a284bc29e2d80b','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(22,706,1,'---\ncontact_name: PHIL  HOLLAND\ncontact_address: \'\'\ncontact_address2: ! \'EDDERS, PA   \'\ncontact_phone_home: \'\'\ncontact_phone_cell: 717-571-2790\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $666.22\nadditional_price: $0\njob_total_price: $666.22\njob_width: \'14\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 02/29/2012\n',NULL,'2fa9f2520a50e521f114b61a1e757ef6','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(23,707,2,'---\ncontact_name: ANDREW  SCOOP\ncontact_address: \'\'\ncontact_address2: ! \'HORSHAM, PA   \'\ncontact_phone_home: 215-687-0123\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $998.94\nadditional_price: $38.28\njob_total_price: $998.94\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'59040cd9da78958d7d6f1acfb6827744','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(24,708,2,'---\ncontact_name: ! \'ASHLEY \'\ncontact_address: \'\'\ncontact_address2: ! \'CHURCHTON, MD   \'\ncontact_phone_home: 410-980-3432\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,423.74\nadditional_price: $0\njob_total_price: $1,423.74\njob_width: \'12\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'b2e3e7ea505f966804e5e1bdb265e299','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(25,709,2,'---\ncontact_name: ! \'JOHN \'\ncontact_address: \'\'\ncontact_address2: ! \'ABERDEEN , MD   \'\ncontact_phone_home: 443-695-3252\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,201.74\nadditional_price: $153.46\njob_total_price: $1,201.74\njob_width: \'12\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'15eed685e1af41b2bd391775bccb39e4','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(26,710,2,'---\ncontact_name: KATHY MCCLLSKEY\ncontact_address: 15 WINDMILL RD\ncontact_address2: CONAWEGO, PA   21918\ncontact_phone_home: 717-330-5903\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,293.26\nadditional_price: $0\njob_total_price: $1,293.26\njob_width: \'14\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'38ffde424a21ddcb699def1cfda4a3cf','2012-03-16 04:30:46','2012-03-16 04:32:13',1),
	(27,711,1,'---\ncontact_name: KATHY MCCLLSKEY\ncontact_address: 15 WINDMILL RD\ncontact_address2: CONAWEGO, PA   21918\ncontact_phone_home: 717-330-5903\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $604.60\nadditional_price: $0\njob_total_price: $604.60\njob_width: \'14\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 02/29/2012\n',NULL,'af47503ead2d97dc80312ed656436b88','2012-03-16 04:30:46','2012-03-16 04:32:14',1),
	(28,712,2,'---\ncontact_name: JONATHAN DERR\ncontact_address: 10 CIRCULE DR\ncontact_address2: ! \'SHREWSBURY, PA   \'\ncontact_phone_home: 410-530 0439\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,312.43\nadditional_price: $0\njob_total_price: $1,312.43\njob_width: \'14\'\njob_length: \'20\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'549fe1d018d14310685b7b694e1ac872','2012-03-16 04:30:47','2012-03-16 04:32:14',1),
	(29,713,2,'---\ncontact_name: KEITH STOLTZFUS\ncontact_address: 53 HUNTER DR.\ncontact_address2: ELIZABETHTOWN , PA   17022\ncontact_phone_home: 717-519-9900\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,029.54\nadditional_price: $0\njob_total_price: $2,029.54\njob_width: \'16\'\njob_length: \'24\'\njob_inches: \'18\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'ac76ae473bec7398313635ca9018db21','2012-03-16 04:30:47','2012-03-16 04:32:14',1),
	(30,714,2,'---\ncontact_name: ! \' \'\ncontact_address: 144 CHINNICK AVE\ncontact_address2: TRENTON, NJ   8619\ncontact_phone_home: \'\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,213.01\nadditional_price: $0\njob_total_price: $1,213.01\njob_width: \'12\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'e89fb539e0d01892a8643430a711abba','2012-03-16 04:30:47','2012-03-16 04:32:14',1),
	(31,715,2,'---\ncontact_name: ED CUPKA\ncontact_address: 131 POPLAR LANE\ncontact_address2: MT WOLF, PA   17347\ncontact_phone_home: \'\'\ncontact_phone_cell: 717-321-5679\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $906.94\nadditional_price: $0\njob_total_price: $906.94\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'4cb6263af9da4a39a41fb59f1fbbde10','2012-03-16 04:30:48','2012-03-16 04:32:14',1),
	(32,716,2,'---\ncontact_name: GWEN CAMP\ncontact_address: 3620 2ND AVE\ncontact_address2: EDGE WATER, MD   21037\ncontact_phone_home: 301-801-5473\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,806.26\nadditional_price: $0\njob_total_price: $1,806.26\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'0eaa3ebdd955c11d52f0f9f0b92c2987','2012-03-16 04:30:48','2012-03-16 04:32:14',1),
	(33,717,3,'---\ncontact_name: GWEN CAMP\ncontact_address: 3620 2ND AVE\ncontact_address2: EDGE WATER, MD   21037\ncontact_phone_home: 301-801-5473\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Elite\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,334.26\nadditional_price: $0\njob_total_price: $2,334.26\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Elite\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'eda9d1193bbd5739e4119b803138ea98','2012-03-16 04:30:59','2012-03-16 04:32:14',1),
	(34,718,2,'---\ncontact_name: KELLY DIGIAMBERARDINO\ncontact_address: 976 ERICSSON DR\ncontact_address2: COATESVILLE, PA   19320\ncontact_phone_home: 610-466-7326\ncontact_phone_cell: 484-883-6067\ncontact_phone_work: 610-925-3440\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,126.98\nadditional_price: $69.09\njob_total_price: $1,126.98\njob_width: \'14\'\njob_length: \'20\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'c6d107f35d760655243f31ae8dd0b11a','2012-03-16 04:30:59','2012-03-16 04:32:14',1),
	(35,719,2,'---\ncontact_name: MIKE CLEIN\ncontact_address: 500 NEWPORT RD\ncontact_address2: BRISTOL, PA   19007\ncontact_phone_home: 609-206-7696\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,177.29\nadditional_price: $0\njob_total_price: $1,177.29\njob_width: \'10\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'e04b65f05e4d6bac1ed0ae77893c644e','2012-03-16 04:30:59','2012-03-16 04:32:14',1),
	(36,720,2,'---\ncontact_name: ROBIN KALINER\ncontact_address: 1198 CARRIE LANE\ncontact_address2: WEST CHESTER, PA   19382\ncontact_phone_home: 610-455-0469\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,064.74\nadditional_price: $140.10\njob_total_price: $1,064.74\njob_width: \'12\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'4a73c3df2400cd7c7d1d8f4bdd84025e','2012-03-16 04:31:00','2012-03-16 04:32:14',1),
	(37,721,2,'---\ncontact_name: ! \'LEN \'\ncontact_address: \'\'\ncontact_address2: ! \'MONKTON, PA   \'\ncontact_phone_home: \'\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,198.10\nadditional_price: $0\njob_total_price: $1,198.10\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'2cab6eaa7f4546502620c5ddd8bfdafc','2012-03-16 04:31:00','2012-03-16 04:32:14',1),
	(38,722,2,'---\ncontact_name: ! \'mike \'\ncontact_address: 1432 S WHITEFORD RD\ncontact_address2: WEST CHESTER, PA   19380\ncontact_phone_home: \'\'\ncontact_phone_cell: \'\'\ncontact_phone_work: 610-202-7708\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $902.82\nadditional_price: $0\njob_total_price: $902.82\njob_width: \'12\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'bad2f79e3d7f4f74e896965bffa6063d','2012-03-16 04:31:00','2012-03-16 04:32:14',1),
	(39,723,2,'---\ncontact_name: BOB SODA\ncontact_address: 996 MARIAN RD\ncontact_address2: WARMINSTER , PA   18974\ncontact_phone_home: 215-675-3601\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,277.75\nadditional_price: $0\njob_total_price: $1,277.75\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'164c3e5cac41835cbade69f31c589e85','2012-03-16 04:31:13','2012-03-16 04:32:15',1),
	(40,724,2,'---\ncontact_name: JENNIFER HOFFMANN\ncontact_address: 2033 PARKVIEW AVE\ncontact_address2: ABINGTON, PA   19001\ncontact_phone_home: 215-346-2686\ncontact_phone_cell: 215-439-1856\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,263.20\nadditional_price: $0\njob_total_price: $1,263.20\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'751a60629efcf33a70b1024e45cd98c6','2012-03-16 04:31:13','2012-03-16 04:32:15',1),
	(41,725,3,'---\ncontact_name: JENNIFER HOFFMANN\ncontact_address: 2033 PARKVIEW AVE\ncontact_address2: ABINGTON, PA   19001\ncontact_phone_home: 215-346-2686\ncontact_phone_cell: 215-439-1856\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Elite\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,685.60\nadditional_price: $0\njob_total_price: $1,685.60\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Elite\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'eb9a396c1adf31e240284d7ced6793b6','2012-03-16 04:31:13','2012-03-16 04:32:15',1),
	(42,726,2,'---\ncontact_name: JIM FORSMAN\ncontact_address: 67 FAWN VALLEY DR\ncontact_address2: ELKTON , MD   21921\ncontact_phone_home: 302-489-9830\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,040.59\nadditional_price: $0\njob_total_price: $1,040.59\njob_width: \'12\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'cf7227d8f57fc9239b39bc9ebbe80a67','2012-03-16 04:31:14','2012-03-16 04:32:15',1),
	(43,727,2,'---\ncontact_name: WILL CRUMP\ncontact_address: 3805 WOODHAVEN LANE\ncontact_address2: BOWIE, MD   20715\ncontact_phone_home: 202-309-1595\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,039.92\nadditional_price: $0\njob_total_price: $2,039.92\njob_width: \'12\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'67cafd8215f9a5ff7460dc42e0b89296','2012-03-16 04:31:14','2012-03-16 04:32:15',1),
	(44,728,2,'---\ncontact_name: CAROL RIFKIN\ncontact_address: 12015 BOXER HILL RD\ncontact_address2: COCKEYSVILLE, MD   21030\ncontact_phone_home: 410-252-0367\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,193.22\nadditional_price: $0\njob_total_price: $1,193.22\njob_width: \'14\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'15a587111d1fa6ffe53c08ed2ef8d41f','2012-03-16 04:31:14','2012-03-16 04:32:15',1),
	(45,730,1,'---\ncontact_name: BILL SPRINKLE\ncontact_address: 1050 OAK VIEW LANE\ncontact_address2: HELLAM, PA   17406\ncontact_phone_home: 717-668-2488\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $987.98\nadditional_price: $0\njob_total_price: $987.98\njob_width: \'14\'\njob_length: \'38\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/06/2012\n',NULL,'dfa3c44ec994d05d9de2cbb1b4856b49','2012-03-16 04:31:15','2012-03-16 04:32:15',1),
	(46,731,2,'---\ncontact_name: BILL SPRINKLE\ncontact_address: 1050 OAK VIEW LANE\ncontact_address2: HELLAM, PA   17406\ncontact_phone_home: 717-668-2488\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,024.38\nadditional_price: $0\njob_total_price: $2,024.38\njob_width: \'14\'\njob_length: \'38\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'3b2b6bfd3addea27d020c82248f9cb04','2012-03-16 04:31:15','2012-03-16 04:32:15',1),
	(47,732,2,'---\ncontact_name: MARYANN PILLOTSON\ncontact_address: 333 BLUE RIDGE DR\ncontact_address2: YORK , PA   17402\ncontact_phone_home: 717-887-9713\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $989.23\nadditional_price: $0\njob_total_price: $989.23\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'bbcdce6678c420ea1693b622f8df186e','2012-03-16 04:31:15','2012-03-16 04:32:15',1),
	(48,733,2,'---\ncontact_name: JOE  MAXWELL\ncontact_address: 75 FRANKLIN DR\ncontact_address2: PORT DEPOSIT , MD   21904\ncontact_phone_home: 410-378-4804\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,878.13\nadditional_price: $0\njob_total_price: $1,878.13\njob_width: \'16\'\njob_length: \'22\'\njob_inches: \'36\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'d22e3b9e5948be7ac2c17028a6d0873f','2012-03-16 04:31:15','2012-03-16 04:32:15',1),
	(49,734,1,'---\ncontact_name: JOE  MAXWELL\ncontact_address: 75 FRANKLIN DR\ncontact_address2: PORT DEPOSIT , MD   21904\ncontact_phone_home: 410-378-4804\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $957.80\nadditional_price: $250.00\njob_total_price: $957.80\njob_width: \'6\'\njob_length: \'110\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/06/2012\n',NULL,'a63ae5550b96f07a9b997bbc3010f090','2012-03-16 04:31:16','2012-03-16 04:32:15',1),
	(50,735,2,'---\ncontact_name: JOE  MAXWELL\ncontact_address: 75 FRANKLIN DR\ncontact_address2: PORT DEPOSIT , MD   21904\ncontact_phone_home: 410-378-4804\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,878.13\nadditional_price: $0\njob_total_price: $1,878.13\njob_width: \'16\'\njob_length: \'22\'\njob_inches: \'24\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'f9917602de0a90513ff65eb6a3b251b7','2012-03-16 04:31:16','2012-03-16 04:32:15',1),
	(51,736,2,'---\ncontact_name: JOE  MAXWELL\ncontact_address: 75 FRANKLIN DR\ncontact_address2: PORT DEPOSIT , MD   21904\ncontact_phone_home: 410-378-4804\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,878.13\nadditional_price: $0\njob_total_price: $1,878.13\njob_width: \'16\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'bb306c759aa355e3d986d68f573a6afc','2012-03-16 04:31:16','2012-03-16 04:32:15',1),
	(52,737,2,'---\ncontact_name: DOUG  MYER\ncontact_address: ! \'2670 WHITE OAK RD \'\ncontact_address2: ! \'STRAWSBURG, PA   \'\ncontact_phone_home: 717-4718413\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,391.62\nadditional_price: $87.17\njob_total_price: $1,391.62\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'fa02627a1651518b468e138b975b3cc0','2012-03-16 04:31:27','2012-03-16 04:32:16',1),
	(53,738,1,'---\ncontact_name: DOUG  MYER\ncontact_address: ! \'2670 WHITE OAK RD \'\ncontact_address2: ! \'STRAWSBURG, PA   \'\ncontact_phone_home: 717-4718413\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $329.55\nadditional_price: $0\njob_total_price: $329.55\njob_width: \'12\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/06/2012\n',NULL,'a82bb2aab401ecdfc2e8483c79819285','2012-03-16 04:31:27','2012-03-16 04:32:16',1),
	(54,739,2,'---\ncontact_name: ANTHONY YU\ncontact_address: 16119 DRAYTON FARM DR\ncontact_address2: SPENCERVILLE , MD   20868\ncontact_phone_home: 301-421-9291\ncontact_phone_cell: 703-622-6915\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,337.81\nadditional_price: $0\njob_total_price: $1,337.81\njob_width: \'10\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'8e6cb82801f91241fc7e2cadfc77238c','2012-03-16 04:31:27','2012-03-16 04:32:16',1),
	(55,741,2,'---\ncontact_name: BUD HARDGROVE\ncontact_address: 7915 DALROSE AVE\ncontact_address2: ROSEDALE , MD   21237\ncontact_phone_home: 443-695-2495\ncontact_phone_cell: 410-458-3986\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,447.40\nadditional_price: $0\njob_total_price: $1,447.40\njob_width: \'12\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'70b2f3d3f8d6f0e901082042042f2891','2012-03-16 04:31:28','2012-03-16 04:32:16',1),
	(56,742,2,'---\ncontact_name: CURTIS DELOSREYES\ncontact_address: 107 SUNSHINE LANE\ncontact_address2: MIDDLETOWN , DE.    19709\ncontact_phone_home: \'\'\ncontact_phone_cell: 302-420-1114\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: DE\njob_location_phone: (302) 545.7067\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,079.73\nadditional_price: $0\njob_total_price: $2,079.73\njob_width: \'16\'\njob_length: \'30\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'c9cbb666431c74b1bb29d3299ce5e367','2012-03-16 04:31:28','2012-03-16 04:32:16',1),
	(57,743,1,'---\ncontact_name: CURTIS DELOSREYES\ncontact_address: 107 SUNSHINE LANE\ncontact_address2: MIDDLETOWN , DE.    19709\ncontact_phone_home: \'\'\ncontact_phone_cell: 302-420-1114\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: DE\njob_location_phone: (302) 545.7067\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $885.76\nadditional_price: $0\njob_total_price: $885.76\njob_width: \'16\'\njob_length: \'30\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/07/2012\n',NULL,'b1b353aef86a61717785e2ed3cac6ebd','2012-03-16 04:31:28','2012-03-16 04:32:16',1),
	(58,744,2,'---\ncontact_name: HAO DIEP\ncontact_address: 7205 KINDLER RD\ncontact_address2: COLUMBIA , MD    2046\ncontact_phone_home: \'4027301341\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: ! \"6x6 build up job, place against deck steps, and 4\' from house.\n  12\' side parrallel to house 10\' side parrallel to deck steps,\\r\\n                                careful\n  of existing drain pipe, build over top of it .\"\njob_extras: \'\'\njob_price: $1,558.74\nadditional_price: $67.68\njob_total_price: $1,558.74\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'36\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'b1b60a778c86a4ccfa53b5905350f863','2012-03-16 04:31:28','2012-03-16 04:32:16',1),
	(59,745,2,'---\ncontact_name: BILL KANE\ncontact_address: 5737 OAKLAND RD\ncontact_address2: ELDERSBURG , MD   21784\ncontact_phone_home: 410-781-6090\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: wwkane@comcast.net\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,506.00\nadditional_price: $0\njob_total_price: $1,506.00\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'3b1b9a892d7057cbcb14065b25a9cf22','2012-03-16 04:31:29','2012-03-16 04:32:16',1),
	(60,746,1,'---\ncontact_name: BILL KANE\ncontact_address: 5737 OAKLAND RD\ncontact_address2: ELDERSBURG , MD   21784\ncontact_phone_home: 410-781-6090\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: wwkane@comcast.net\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $945.56\nadditional_price: $0\njob_total_price: $945.56\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/07/2012\n',NULL,'66573913dc41346deead46e7ae58dbea','2012-03-16 04:31:29','2012-03-16 04:32:16',1),
	(61,747,2,'---\ncontact_name: MICHEAL RUYAK\ncontact_address: 1152 wendler cir\ncontact_address2: pottstown , pa   19465\ncontact_phone_home: \'\'\ncontact_phone_cell: 610-972-0696\ncontact_phone_work: \'\'\ncontact_email: mruyak@klinkauamerica.com\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,040.59\nadditional_price: $0\njob_total_price: $1,040.59\njob_width: \'12\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'139bfb0991bd5c31ea9cbfd2e581a115','2012-03-16 04:31:29','2012-03-16 04:32:16',1),
	(62,748,2,'---\ncontact_name: BARBRA ANN MCGRAIN\ncontact_address: 102 AQUEDUCT COURT\ncontact_address2: FORREST HILL , MD   21050\ncontact_phone_home: 410-399-9554\ncontact_phone_cell: 443-797-2928\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: ! \'NO STONE , \'\njob_extras: \'\'\njob_price: $2,753.39\nadditional_price: $352.08\njob_total_price: $2,753.39\njob_width: \'28\'\njob_length: \'28\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'30ef7ca106d1527a0dafe147514bcf75','2012-03-16 04:31:29','2012-03-16 04:32:16',1),
	(63,749,2,'---\ncontact_name: BARBRA ANN MCGRAIN\ncontact_address: 102 AQUEDUCT COURT\ncontact_address2: FORREST HILL , MD   21050\ncontact_phone_home: 410-399-9554\ncontact_phone_cell: 443-797-2928\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,383.79\nadditional_price: $352.08\njob_total_price: $2,383.79\njob_width: \'28\'\njob_length: \'28\'\njob_inches: \'12\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'b608885d4dc39dd118e6f5ea36159e97','2012-03-16 04:31:30','2012-03-16 04:32:16',1),
	(64,750,3,'---\ncontact_name: MIKE  PLAZIO\ncontact_address: 135 SANFORD RD\ncontact_address2: PENNSVILLE, NJ   8070\ncontact_phone_home: 856-628-4993\ncontact_phone_cell: 856-275-6908\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Elite\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,661.74\nadditional_price: $0\njob_total_price: $1,661.74\njob_width: \'12\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Elite\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'bed6cb3b68215a92020cd9f07f2d12f7','2012-03-16 04:31:30','2012-03-16 04:32:17',1),
	(65,751,2,'---\ncontact_name: MIKE  PLAZIO\ncontact_address: 135 SANFORD RD\ncontact_address2: PENNSVILLE, NJ   8070\ncontact_phone_home: 856-628-4993\ncontact_phone_cell: 856-275-6908\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,212.94\nadditional_price: $0\njob_total_price: $1,212.94\njob_width: \'12\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'3560297bf6a4eaf134f51b73ccc41b88','2012-03-16 04:31:41','2012-03-16 04:32:17',1),
	(66,752,2,'---\ncontact_name: ANTHONY YU\ncontact_address: 16119 DRAYTON FARM DR\ncontact_address2: SPENCERVILLE , MD   20868\ncontact_phone_home: 301-421-9291\ncontact_phone_cell: 703-622-6915\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,294.69\nadditional_price: $0\njob_total_price: $1,294.69\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'9419bb6ab8071da4f2b27df7ee659898','2012-03-16 04:31:41','2012-03-16 04:32:17',1),
	(67,753,2,'---\ncontact_name: JOSH MORE\ncontact_address: 8420 BRADDOCK WAY\ncontact_address2: COLUMBIA, MD   21046\ncontact_phone_home: \'\'\ncontact_phone_cell: 352-727-8765\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: ! \"6X6 PRESURE TREATED TIMBER BORDER, GEOTEXTILE FABRIC, EXCAVATION\n  OF SITE, DRAIN PIPE, \\r\\nADDITIONAL 285.00 PR, 12 \'\' SLOPE.      MULCH WILL BE SUPPLIED\n  BY CUSTOMER,\"\njob_extras: \'\'\njob_price: $2,601.98\nadditional_price: $0\njob_total_price: $2,601.98\njob_width: \'25\'\njob_length: \'23\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: SWING SET Foundation\njob_date: 03/16/2012\n',NULL,'43a8c4b3632b42c21a5f3604839269db','2012-03-16 04:31:41','2012-03-16 04:32:17',1),
	(68,754,3,'---\ncontact_name: JOSH MORE\ncontact_address: 8420 BRADDOCK WAY\ncontact_address2: COLUMBIA, MD   21046\ncontact_phone_home: \'\'\ncontact_phone_cell: 352-727-8765\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Elite\njob_quality_alt: ! \"PLASTIC EDGEING , GEOTEXTILE FABRIC, DRAIN PIPE,  EXCAVATION OF\n  SITE, \\r\\nADDITIONAL 285.00 PR. 12\'\' SLOPE. \"\njob_extras: \'\'\njob_price: $2,989.61\nadditional_price: $0\njob_total_price: $2,989.61\njob_width: \'25\'\njob_length: \'23\'\njob_inches: \'\'\njob_kind: Elite\nfoundation_kind: SWING SET Foundation\njob_date: 03/16/2012\n',NULL,'4daa85085956c03a31dc74d423f98f2e','2012-03-16 04:31:42','2012-03-16 04:32:17',1),
	(69,755,2,'---\ncontact_name: DAVE SINGER\ncontact_address: 35 TROY DR\ncontact_address2: LITITZ, PA   17543\ncontact_phone_home: 717-6270872\ncontact_phone_cell: 717-368-2723\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,181.52\nadditional_price: $0\njob_total_price: $1,181.52\njob_width: \'14\'\njob_length: \'20\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'c5d368881aeb3eac3adedd753615a65d','2012-03-16 04:31:42','2012-03-16 04:32:17',1),
	(70,756,2,'---\ncontact_name: RALPH WILSON\ncontact_address: 1437 SEVEN VALLEYS RD\ncontact_address2: YORK, PA   17408\ncontact_phone_home: 717-792-1810\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $989.75\nadditional_price: $0\njob_total_price: $989.75\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'9f4b21d628f4d379ef23c9f6b0e2ad81','2012-03-16 04:31:55','2012-03-16 04:32:17',1),
	(71,757,1,'---\ncontact_name: RALPH WILSON\ncontact_address: 1437 SEVEN VALLEYS RD\ncontact_address2: YORK, PA   17408\ncontact_phone_home: 717-792-1810\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $558.48\nadditional_price: $0\njob_total_price: $558.48\njob_width: \'10\'\njob_length: \'12\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/09/2012\n',NULL,'b9677cb3e13bb12eba3bb526b85ab53e','2012-03-16 04:31:55','2012-03-16 04:32:17',1),
	(72,758,2,'---\ncontact_name: BRIAN TUNNELL\ncontact_address: 1749 COLORA RD\ncontact_address2: COLORA , MD   21917\ncontact_phone_home: 410-658-4082\ncontact_phone_cell: \'\'\ncontact_phone_work: 443-206-4080\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,300.53\nadditional_price: $0\njob_total_price: $1,300.53\njob_width: \'14\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'6908139151d141dc334c3fc147afaf7b','2012-03-16 04:31:55','2012-03-16 04:32:17',1),
	(73,759,1,'---\ncontact_name: BRIAN TUNNELL\ncontact_address: 1749 COLORA RD\ncontact_address2: COLORA , MD   21917\ncontact_phone_home: 410-658-4082\ncontact_phone_cell: \'\'\ncontact_phone_work: 443-206-4080\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $645.48\nadditional_price: $0\njob_total_price: $645.48\njob_width: \'16\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/09/2012\n',NULL,'999cf6dade5c9472f55eb142eb2be4e7','2012-03-16 04:31:55','2012-03-16 04:32:17',1),
	(74,760,3,'---\ncontact_name: BRIAN TUNNELL\ncontact_address: 1749 COLORA RD\ncontact_address2: COLORA , MD   21917\ncontact_phone_home: 410-658-4082\ncontact_phone_cell: \'\'\ncontact_phone_work: 443-206-4080\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Elite\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,114.38\nadditional_price: $0\njob_total_price: $2,114.38\njob_width: \'16\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Elite\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'70d1184b7514cfbd79b4f3b4b57ecd40','2012-03-16 04:31:56','2012-03-16 04:32:17',1),
	(75,761,2,'---\ncontact_name: kathleen palkon\ncontact_address: 116 valleyview cir\ncontact_address2: lincoln university, pa   19352\ncontact_phone_home: 484-620-0005\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,052.29\nadditional_price: $0\njob_total_price: $1,052.29\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'3b27d7ad796ecbbb5bf0e53bf965a2b7','2012-03-16 04:31:56','2012-03-16 04:32:17',1),
	(76,762,2,'---\ncontact_name: REBECCA LOVETT\ncontact_address: 2874 FLEETWOOD DR\ncontact_address2: LANCASTER, PA   17601\ncontact_phone_home: 717-371-9925\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $872.87\nadditional_price: $0\njob_total_price: $872.87\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'f0136d2bb90a00c058fd1034a30db867','2012-03-16 04:31:56','2012-03-16 04:32:18',1),
	(77,763,1,'---\ncontact_name: REBECCA LOVETT\ncontact_address: 2874 FLEETWOOD DR\ncontact_address2: LANCASTER, PA   17601\ncontact_phone_home: 717-371-9925\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $413.76\nadditional_price: $0\njob_total_price: $413.76\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/12/2012\n',NULL,'e527c88e76a8239277c3519a5b24d644','2012-03-16 04:31:56','2012-03-16 04:32:18',1),
	(78,764,2,'---\ncontact_name: BOB MACZIS\ncontact_address: 4106 HOFFMANVILLE RD\ncontact_address2: MILLERS , MD   21102\ncontact_phone_home: 410-239-7382\ncontact_phone_cell: 410-804-0432\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,482.35\nadditional_price: $0\njob_total_price: $1,482.35\njob_width: \'14\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'29847f25d961be72aa2d068829953512','2012-03-16 04:31:57','2012-03-16 04:32:18',1),
	(79,765,2,'---\ncontact_name: BOB MACZIS\ncontact_address: 4106 HOFFMANVILLE RD\ncontact_address2: MILLERS , MD   21102\ncontact_phone_home: 410-239-7382\ncontact_phone_cell: 410-804-0432\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $2,062.80\nadditional_price: $0\njob_total_price: $2,062.80\njob_width: \'18\'\njob_length: \'24\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'bd2fe48f07b0778825c939dd8842629e','2012-03-16 04:31:57','2012-03-16 04:32:18',1),
	(80,766,1,'---\ncontact_name: BOB MACZIS\ncontact_address: 4106 HOFFMANVILLE RD\ncontact_address2: MILLERS , MD   21102\ncontact_phone_home: 410-239-7382\ncontact_phone_cell: 410-804-0432\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $950.91\nadditional_price: $0\njob_total_price: $950.91\njob_width: \'18\'\njob_length: \'24\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/12/2012\n',NULL,'365ab971ccf4193646c47c63c788f147','2012-03-16 04:31:57','2012-03-16 04:32:18',1),
	(81,767,2,'---\ncontact_name: JOE GASPER\ncontact_address: 14724 JANICE DR\ncontact_address2: ROCKVILLE, MD   20853\ncontact_phone_home: 240-314-2485\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,071.00\nadditional_price: $0\njob_total_price: $1,071.00\njob_width: \'10\'\njob_length: \'10\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'5a4846a2c1c4d56acabb9872d5b974b9','2012-03-16 04:31:57','2012-03-16 04:32:18',1),
	(82,768,2,'---\ncontact_name: JIM BADGER\ncontact_address: 4521 PICKWICK DR\ncontact_address2: WILMINGTON, DE   19808\ncontact_phone_home: \'\'\ncontact_phone_cell: 302-743-1599\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: DE\njob_location_phone: (302) 545.7067\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,166.98\nadditional_price: $0\njob_total_price: $1,166.98\njob_width: \'14\'\njob_length: \'20\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'d494fbedda0f3dbf65dc4e7a01c3fe37','2012-03-16 04:31:58','2012-03-16 04:32:18',1),
	(83,769,1,'---\ncontact_name: JIM BADGER\ncontact_address: 4521 PICKWICK DR\ncontact_address2: WILMINGTON, DE   19808\ncontact_phone_home: \'\'\ncontact_phone_cell: 302-743-1599\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: DE\njob_location_phone: (302) 545.7067\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $537.41\nadditional_price: $0\njob_total_price: $537.41\njob_width: \'14\'\njob_length: \'20\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/12/2012\n',NULL,'5e36b777db40a3bca89302b929a73caa','2012-03-16 04:31:58','2012-03-16 04:32:18',1),
	(84,770,2,'---\ncontact_name: JOANN HANRAHAN\ncontact_address: 606 SWALLOW HOLLOW RD\ncontact_address2: WILMINGTON , DE   19807\ncontact_phone_home: 302 691-7058\ncontact_phone_cell: 302-290-6244\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: DE\njob_location_phone: (302) 545.7067\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,132.94\nadditional_price: $0\njob_total_price: $1,132.94\njob_width: \'12\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'70d2a5e099f28ed9338bdef33c49bf07','2012-03-16 04:31:58','2012-03-16 04:32:18',1),
	(85,771,2,'---\ncontact_name: BRUCE BROWN\ncontact_address: 16657 MILLER LANE\ncontact_address2: PARKTON , MD   21120\ncontact_phone_home: 410-274-3306\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,054.69\nadditional_price: $0\njob_total_price: $1,054.69\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'ec3acc2bf6e810069e4973cbee9d50f0','2012-03-16 04:31:59','2012-03-16 04:32:18',1),
	(86,772,2,'---\ncontact_name: JIM SCHINE\ncontact_address: 572 KINGS RD\ncontact_address2: YARDLY, PA   19067\ncontact_phone_home: \'\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,120.14\nadditional_price: $0\njob_total_price: $1,120.14\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'2361f049b9db550ff59548018bf44712','2012-03-16 04:31:59','2012-03-16 04:32:18',1),
	(87,773,1,'---\ncontact_name: JIM SCHINE\ncontact_address: 572 KINGS RD\ncontact_address2: YARDLY, PA   19067\ncontact_phone_home: \'\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $661.04\nadditional_price: $0\njob_total_price: $661.04\njob_width: \'10\'\njob_length: \'14\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/12/2012\n',NULL,'e229b777cb0469ad18769e4a5ac5c3fc','2012-03-16 04:31:59','2012-03-16 04:32:18',1),
	(88,774,2,'---\ncontact_name: PETE DOUGHERTY\ncontact_address: 12 ROLLING GLEN LANE\ncontact_address2: DOWNINGTOWN, PA   19335\ncontact_phone_home: 484-614-1278\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,114.79\nadditional_price: $0\njob_total_price: $1,114.79\njob_width: \'13\'\njob_length: \'23\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'6706aba1cdd59ca6793d4333d769e5a4','2012-03-16 04:32:00','2012-03-16 04:32:18',1),
	(89,776,1,'---\ncontact_name: JOHN SILVA\ncontact_address: 2055 CONAN DOYLE WAY\ncontact_address2: ELDERSBURG , MD   21784\ncontact_phone_home: 443-538-5750\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: md\njob_location_phone: 410-609-6036\njob_quality: Economy\njob_quality_alt: 4\'\' CONCRETE SLAB, 4\'\' STONE, WIRE , 3500 PSI. EXCAVATION.\njob_extras: \'\'\njob_price: $2,250.00\nadditional_price: $1,430.42\njob_total_price: $2,250.00\njob_width: \'12\'\njob_length: \'20\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/13/2012\n',NULL,'b20003ff98cc5f359d8e6094c55d847b','2012-03-16 04:32:00','2012-03-16 04:32:19',1),
	(90,777,2,'---\ncontact_name: CRYSTAL  YINGER\ncontact_address: 60 GRIFFITH LANE\ncontact_address2: MANCHESTER, PA   17345\ncontact_phone_home: \'\'\ncontact_phone_cell: 717-332-7372\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: ! \'Build up timbers: 30\'\'\'\'\'\njob_price: $2,444.01\nadditional_price: $393.38\njob_total_price: $2,444.01\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'30\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'82134f436550c099b4757a2b01f3059e','2012-03-16 04:32:00','2012-03-16 04:32:19',1),
	(91,778,2,'---\ncontact_name: CRYSTAL  YINGER\ncontact_address: 60 GRIFFITH LANE\ncontact_address2: MANCHESTER, PA   17345\ncontact_phone_home: \'\'\ncontact_phone_cell: 717-332-7372\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,522.63\nadditional_price: $0\njob_total_price: $1,522.63\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'9fc46ea1372334057e3b3b039b48c373','2012-03-16 04:32:00','2012-03-16 04:32:19',1),
	(92,779,2,'---\ncontact_name: PHIL BARRETT\ncontact_address: 1006 AVERY PLACE\ncontact_address2: UPPERBORO, MD   20774\ncontact_phone_home: \'\'\ncontact_phone_cell: 301-512-8016\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,556.95\nadditional_price: $0\njob_total_price: $1,556.95\njob_width: \'12\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'1be4fd47c8173af28bd228f006b15d7c','2012-03-16 04:32:09','2012-03-16 04:32:19',1),
	(93,780,1,'---\ncontact_name: PHIL BARRETT\ncontact_address: 1006 AVERY PLACE\ncontact_address2: UPPERBORO, MD   20774\ncontact_phone_home: \'\'\ncontact_phone_cell: 301-512-8016\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: MD\njob_location_phone: (301) 467.0949\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $983.07\nadditional_price: $0\njob_total_price: $983.07\njob_width: \'12\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/14/2012\n',NULL,'77e87b9467f9044ac13abd6e05870746','2012-03-16 04:32:09','2012-03-16 04:32:19',1),
	(94,781,2,'---\ncontact_name: ANN STRAW BRIDGE\ncontact_address: 1072 ST MATHEWS RD\ncontact_address2: CHESTER SPRINGS, PA   19425\ncontact_phone_home: \'\'\ncontact_phone_cell: 484-432-1522\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: ! \'Additional fill dirt needed: 4 LOADS OF FILL ,  STONE AND DRAIN PIPE\n  BEHING WALL.\\nBuild up timbers: 6X6 TIMBER WALL, DEADMAN BRACING, 10\'\'\'\' GALVANIZED  SPIKES,\n  1/2\'\'\'\'X2\'\' REBAR, \'\njob_price: $3,030.15\nadditional_price: $500.00\njob_total_price: $3,030.15\njob_width: \'18\'\njob_length: \'32\'\njob_inches: \'52\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'be8e8a6ac29dcd1541fb760075b18c23','2012-03-16 04:32:09','2012-03-16 04:32:19',1),
	(95,782,2,'---\ncontact_name: PAM GARRETY\ncontact_address: 2616 NATALIE DR\ncontact_address2: YORK, PA   17402\ncontact_phone_home: 717-741-1955\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,224.21\nadditional_price: $0\njob_total_price: $1,224.21\njob_width: \'10\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'56f7b5b2be15f4d2d9f8b2c1c3a001f3','2012-03-16 04:32:10','2012-03-16 04:32:19',1),
	(96,783,2,'---\ncontact_name: DAVE KUKORLO\ncontact_address: 2565 SUNSET LANE\ncontact_address2: YORK, PA   17408\ncontact_phone_home: 717-968-1823\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,551.72\nadditional_price: $0\njob_total_price: $1,551.72\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'f9f854ac6e1e26d078be7d9e9d0196a2','2012-03-16 04:32:10','2012-03-16 04:32:19',1),
	(97,784,2,'---\ncontact_name: JACKIE JACOBSON\ncontact_address: 40 ANDOVER RD\ncontact_address2: GLENMOORE, PA   19343\ncontact_phone_home: \'\'\ncontact_phone_cell: 610-975-8041\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,001.38\nadditional_price: $0\njob_total_price: $1,001.38\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'4fa646177216c01b5ec357802af01800','2012-03-16 04:32:10','2012-03-16 04:32:19',1),
	(98,785,1,'---\ncontact_name: JACKIE JACOBSON\ncontact_address: 40 ANDOVER RD\ncontact_address2: GLENMOORE, PA   19343\ncontact_phone_home: \'\'\ncontact_phone_cell: 610-975-8041\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $322.58\nadditional_price: $0\njob_total_price: $322.58\njob_width: \'12\'\njob_length: \'16\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/14/2012\n',NULL,'ad657ff035080f27589216cb5c3d29e1','2012-03-16 04:32:10','2012-03-16 04:32:19',1),
	(99,786,2,'---\ncontact_name: ED SALABSKY\ncontact_address: 1769 SEAKS RUN RD\ncontact_address2: GLENROCK , PA   17327\ncontact_phone_home: 717-428-0227\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,515.35\nadditional_price: $0\njob_total_price: $1,515.35\njob_width: \'14\'\njob_length: \'26\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'661aaeab5d3fd8dc92836aa6390ed2dc','2012-03-16 04:32:11','2012-03-16 04:32:19',1),
	(100,787,2,'---\ncontact_name: MIKE CALDWELL\ncontact_address: 303 BLAKE RD\ncontact_address2: OXFORD, PA   19363\ncontact_phone_home: 610-656-0728\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,125.67\nadditional_price: $0\njob_total_price: $1,125.67\njob_width: \'12\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'513c536aaf4983d7a34d55eafb79fe39','2012-03-16 04:32:11','2012-03-16 04:32:19',1),
	(101,788,1,'---\ncontact_name: MIKE CALDWELL\ncontact_address: 303 BLAKE RD\ncontact_address2: OXFORD, PA   19363\ncontact_phone_home: 610-656-0728\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 484-712-8828\njob_quality: Economy\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $496.10\nadditional_price: $0\njob_total_price: $496.10\njob_width: \'12\'\njob_length: \'22\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/15/2012\n',NULL,'1cf209c7fdba5f3432dbdff12d3a8748','2012-03-16 04:32:11','2012-03-16 04:32:19',1),
	(102,789,2,'---\ncontact_name: MELANIE MCKEE\ncontact_address: 3130 KING RICHARD COURT SOUTH\ncontact_address2: YORK, PA   17408\ncontact_phone_home: \'\'\ncontact_phone_cell: 717-424-3407\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 717-587-7062\njob_quality: Standard\njob_quality_alt: \'\'\njob_extras: \'\'\njob_price: $1,341.52\nadditional_price: $0\njob_total_price: $1,341.52\njob_width: \'14\'\njob_length: \'20\'\njob_inches: \'\'\njob_kind: Standard\nfoundation_kind: Shed Foundation\njob_date: 03/16/2012\n',NULL,'b913fa1c30f83e67b687a46a404cf794','2012-03-16 04:32:11','2012-03-16 04:32:20',1),
	(103,790,1,'---\ncontact_name: ! \'HOMESTEAD STRUCTURES \'\ncontact_address: \'\'\ncontact_address2: ! \'HORSHAM, PA   \'\ncontact_phone_home: \'\'\ncontact_phone_cell: \'\'\ncontact_phone_work: \'\'\ncontact_email: \'\'\njob_location_abbr: PA\njob_location_phone: 215-839-3904\njob_quality: Economy\njob_quality_alt: ! \"(6)16\'\'X36\'\' CONCRETE PIERS, SONA TUBE FORMS, REBAR,\\r\\n14X18\n  SLAB      3500 PSI. 4\'\' STONE , REBAR EVERY 2\' SQUARE, 6\'\' CONCRETE SLAB.\\r\\nEXCAVATION\n  OF SITE.\"\njob_extras: \'\'\njob_price: $2,890.01\nadditional_price: $2,228.53\njob_total_price: $2,890.01\njob_width: \'14\'\njob_length: \'18\'\njob_inches: \'\'\njob_kind: Economy\nfoundation_kind: Shed Foundation\njob_date: 03/15/2012\n',NULL,'4590a664144f092e8727ee75c62db53b','2012-03-16 04:32:11','2012-03-16 04:32:20',1);

/*!40000 ALTER TABLE `estimates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table foundations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `foundations`;

CREATE TABLE `foundations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `foundations` WRITE;
/*!40000 ALTER TABLE `foundations` DISABLE KEYS */;

INSERT INTO `foundations` (`id`, `kind`, `created_at`, `updated_at`, `position`)
VALUES
	(1,'Shed','2009-07-06 07:25:48','2009-07-06 07:25:48',1),
	(2,'Gazebo','2009-07-06 07:25:55','2009-07-06 07:25:55',2),
	(3,'Pool','2009-07-06 07:26:01','2009-07-06 07:26:01',3),
	(4,'CABANA','2010-07-22 20:04:11','2010-07-22 20:04:11',NULL),
	(5,'SWING SET','2010-07-22 20:18:14','2010-07-22 20:18:14',NULL),
	(6,'HORSE BARN','2010-07-22 20:18:45','2010-07-22 20:18:45',NULL);

/*!40000 ALTER TABLE `foundations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_types`;

CREATE TABLE `job_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `job_types` WRITE;
/*!40000 ALTER TABLE `job_types` DISABLE KEYS */;

INSERT INTO `job_types` (`id`, `kind`, `created_at`, `updated_at`)
VALUES
	(1,'Economy','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,'Standard','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,'Elite','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `job_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `originally_scheduled_at` datetime DEFAULT NULL,
  `current_scheduled_at` datetime DEFAULT NULL,
  `duration_in_minutes` int(11) DEFAULT NULL,
  `price_in_cents` int(11) DEFAULT NULL,
  `material_cost_in_cents` int(11) DEFAULT NULL,
  `labor_cost_in_cents` int(11) DEFAULT NULL,
  `foundation_id` int(11) DEFAULT NULL,
  `pad_size_id` int(11) DEFAULT NULL,
  `door_placement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `off_level_amount_in_inches` int(11) DEFAULT NULL,
  `truck_id` int(11) DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `additional_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `depth` decimal(10,0) DEFAULT NULL,
  `shed_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessible_with_machine` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_fill_dirt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `build_up_timbers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timber_wall` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `economy_or_elite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `border_sixbysix` tinyint(1) DEFAULT '0',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `crew_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `job_type_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`id`, `description`, `originally_scheduled_at`, `current_scheduled_at`, `duration_in_minutes`, `price_in_cents`, `material_cost_in_cents`, `labor_cost_in_cents`, `foundation_id`, `pad_size_id`, `door_placement`, `off_level_amount_in_inches`, `truck_id`, `address_1`, `address_2`, `city`, `province`, `zip`, `contact_id`, `created_at`, `updated_at`, `lat`, `lng`, `distance`, `width`, `length`, `additional_price`, `depth`, `shed_company`, `accessible_with_machine`, `additional_fill_dirt`, `build_up_timbers`, `timber_wall`, `economy_or_elite`, `border_sixbysix`, `discount`, `crew_name`, `rig_name`, `location_id`, `job_type_id`)
VALUES
	(682,'',NULL,NULL,NULL,151750,32397,37800,1,NULL,'',NULL,NULL,'6 VASSER DR','','NEWARK','DE.',19711,637,'2012-02-02 15:13:33','2012-03-16 04:30:28','39.6879139','-75.7747904',22,14,18,688.63,NULL,NULL,'wheel by hand','','','','Standard',0,0.00,'','',5,2),
	(683,'',NULL,NULL,NULL,57128,16255,22909,1,NULL,'',NULL,NULL,'17 BECK RD ','','COATESVILLE ','PA ',19320,639,'2012-02-13 12:39:12','2012-03-16 04:30:28','39.953103','-75.818475',5,10,10,106.11,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(684,'',NULL,NULL,NULL,57614,18575,21745,1,NULL,'',NULL,NULL,'1355 telagraph rd','','coatesville','pa',19320,640,'2012-02-19 18:41:43','2012-03-16 04:30:29','40.047226','-75.88794',3,10,12,100.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(685,'',NULL,NULL,NULL,32015,6666,11745,1,NULL,'',NULL,NULL,'1355 telagraph rd','','coatesville','pa',19320,640,'2012-02-19 18:46:49','2012-02-19 18:47:08','40.047226','-75.88794',3,10,12,100.00,NULL,NULL,'','','','','Economy',0,0.00,'','',5,1),
	(686,'',NULL,NULL,NULL,72000,28966,28490,1,NULL,'',NULL,NULL,'5621 MEADVILLE RD','','GAP','PA',17527,641,'2012-02-20 14:46:37','2012-03-16 04:30:29','40.0694399','-75.9972826',6,12,18,45.24,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(688,'',NULL,NULL,NULL,62517,16255,35709,1,NULL,'',NULL,NULL,'17 BEEKMAN RD','','WILMINGTON','DE.',19809,644,'2012-02-21 12:17:32','2012-03-16 04:30:29','39.758469','-75.507857',27,10,10,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',2,2),
	(689,'',NULL,NULL,NULL,150736,66948,48618,1,NULL,'',24,NULL,'609 ASPEN LANE','',' LEBANON','PA',17042,645,'2012-02-21 17:35:39','2012-03-16 04:30:30','40.245551','-76.42663',32,14,22,163.20,NULL,NULL,'','','','','Standard',0,0.00,'','',6,2),
	(691,'',NULL,NULL,NULL,108101,34162,56418,1,NULL,'',NULL,NULL,'1752 FORD RD','','BRISTOL ','PA',19007,646,'2012-02-21 19:43:30','2012-03-16 04:30:30','40.1151453','-74.9011772',54,12,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(692,'',NULL,NULL,NULL,133413,38635,75963,1,NULL,'',NULL,NULL,'6160 WOODVILLE RD','','MT AIRY','MD',21771,648,'2012-02-21 19:56:02','2012-03-16 04:30:30','39.403237','-77.180097',79,15,21,0.00,NULL,NULL,'','','','','Standard',0,40.40,'','',7,2),
	(693,'',NULL,NULL,NULL,68533,18575,35709,1,NULL,'',NULL,NULL,'645 HAMAKER RD','','MANHEIM','PA',17545,649,'2012-02-21 20:22:54','2012-03-16 04:30:31','40.1776988','-76.3865198',27,10,12,34.64,NULL,NULL,'','','','','Standard',0,0.00,'','',6,2),
	(694,'',NULL,NULL,NULL,103961,65233,34654,1,NULL,'',16,NULL,'130 WINDYHILL RD','','DOWNINGTOWN','PA',19335,650,'2012-02-21 20:47:18','2012-03-16 04:30:31','40.049254','-75.772318',8,14,26,0.00,NULL,NULL,'','','','','Standard',0,111.13,'','',5,2),
	(695,'',NULL,NULL,NULL,77339,20895,37454,1,NULL,'',NULL,NULL,'111 WYNDMOOR RD','','SPRINGFIELD','PA ',19046,651,'2012-02-21 21:12:43','2012-03-16 04:30:31','39.9302991','-75.3356502',30,10,14,75.36,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(696,'',NULL,NULL,NULL,91700,28966,58745,1,NULL,'',NULL,NULL,'49 PINEWOOD DRIVE','','LEVITTOWN','PA',NULL,652,'2012-02-21 21:23:31','2012-03-16 04:30:32','40.1533457','-74.8261985',58,12,18,0.00,NULL,NULL,'','','','','Standard',0,135.95,'','',1,2),
	(697,'',NULL,NULL,NULL,90194,26646,43854,1,NULL,'',NULL,NULL,'512 ROLLING GLEN DRIVE','','HORSHAM','PA',19044,653,'2012-02-21 21:31:46','2012-03-16 04:30:32','40.191924','-75.176642',41,14,14,60.65,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(698,'',NULL,NULL,NULL,162334,63948,102836,1,NULL,'',NULL,NULL,'','','WOLDORPH','MD',NULL,655,'2012-02-22 14:51:29','2012-03-16 04:24:47','38.6343544','-76.9066829',108,16,30,0.00,NULL,NULL,'','','','','Standard',0,365.55,'','',3,2),
	(699,'',NULL,NULL,NULL,75621,20895,42109,1,NULL,'',NULL,NULL,'493 KIRKHAM','','YORK','PA',17402,656,'2012-02-22 15:55:49','2012-03-16 04:30:45','39.978735','-76.627775',38,10,14,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(700,'CUT AND REMOVE EXISTING BLACKTOP, HAUL OUT SOIL,      151.00\r\n2\'X16\'  6X6 RETAINING WALL                                             392.00\r\nDISPOSE OF EXISTING SHED                                                 300.00',NULL,NULL,NULL,119810,57997,43036,1,NULL,'',24,NULL,'841 CHESTNUT ST','','COLUMBIA','PA',17512,657,'2012-02-22 16:18:59','2012-03-16 04:30:45','40.039712','-76.496488',31,14,18,22.17,NULL,NULL,'','','','','Standard',0,0.00,'','',6,2),
	(702,'',NULL,NULL,NULL,110385,27375,64218,1,NULL,'',12,NULL,'7205 KINDLER RD','','COLUMBIA ','MD ',2046,658,'2012-02-29 14:03:20','2012-03-16 04:30:45','39.172726','-76.868354',76,10,12,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',3,2),
	(703,'',NULL,NULL,NULL,84204,28966,41872,1,NULL,'',NULL,NULL,'26 GRADY LANE','','NEWCASTLE','DE',19720,660,'2012-02-29 14:58:37','2012-03-16 04:30:46','39.618935','-75.648982',29,12,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',2,2),
	(704,'',NULL,NULL,NULL,26403,9333,12909,1,NULL,'',NULL,NULL,'','','gap','pa',NULL,661,'2012-02-29 16:09:42','2012-02-29 16:09:42','39.987325','-76.0205073',5,12,14,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',5,1),
	(705,'',NULL,NULL,NULL,89922,29522,59909,1,NULL,'',NULL,NULL,'','','EDDERS','PA',NULL,662,'2012-02-29 17:12:03','2012-03-16 04:24:49','40.4917521','-76.8496945',60,14,16,0.00,NULL,NULL,'','','','','Standard',0,174.38,'','',6,2),
	(706,'',NULL,NULL,NULL,63200,12444,47409,1,NULL,'',NULL,NULL,'','','EDDERS','PA',NULL,662,'2012-02-29 17:13:38','2012-02-29 17:14:13','40.4917521','-76.8496945',60,14,16,0.00,NULL,NULL,'','','','','Economy',0,97.50,'','',6,1),
	(707,'',NULL,NULL,NULL,80533,18575,45018,1,NULL,'',NULL,NULL,'','','HORSHAM','PA',NULL,663,'2012-02-29 17:16:15','2012-03-16 04:24:49','40.1784422','-75.1285061',43,10,12,38.28,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(708,'',NULL,NULL,NULL,117734,26368,71781,1,NULL,'',NULL,NULL,'','','CHURCHTON','MD',NULL,664,'2012-02-29 17:19:00','2012-03-16 04:24:49','38.8026161','-76.5369022',89,12,16,0.00,NULL,NULL,'','','','','Standard',0,9.99,'','',7,2),
	(709,'',NULL,NULL,NULL,95533,26368,40945,1,NULL,'',NULL,NULL,'','','ABERDEEN ','MD',NULL,665,'2012-02-29 17:21:03','2012-03-16 04:24:49','39.5095556','-76.1641197',36,12,16,153.46,NULL,NULL,'','','','','Standard',0,0.00,'','',7,2),
	(710,'',NULL,NULL,NULL,97645,38148,44545,1,NULL,'',NULL,NULL,'15 WINDMILL RD','','CONAWEGO','PA',21918,666,'2012-02-29 17:29:55','2012-03-16 04:30:46','39.6919891','-76.1667807',25,14,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(711,'',NULL,NULL,NULL,55754,17111,29545,1,NULL,'',NULL,NULL,'15 WINDMILL RD','','CONAWEGO','PA',21918,666,'2012-02-29 17:33:41','2012-02-29 17:33:41','39.6919891','-76.1667807',25,14,22,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',5,1),
	(712,'',NULL,NULL,NULL,101323,35273,50018,1,NULL,'',NULL,NULL,'10 CIRCULE DR','','SHREWSBURY','PA',NULL,667,'2012-02-29 17:42:44','2012-03-16 04:30:47','39.77074','-76.677498',43,14,20,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(713,'',NULL,NULL,NULL,185354,109288,52109,1,NULL,'',18,NULL,'53 HUNTER DR.','','ELIZABETHTOWN ','PA',17022,668,'2012-02-29 18:30:03','2012-03-16 04:30:47','40.111263','-76.632487',38,16,24,0.00,NULL,NULL,'','','','','Standard',1,0.00,'','',4,2),
	(714,'',NULL,NULL,NULL,98420,23771,57818,1,NULL,'',NULL,NULL,'144 CHINNICK AVE','','TRENTON','NJ',8619,669,'2012-02-29 18:55:00','2012-03-16 04:30:47','40.240106','-74.7122119',65,12,14,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(715,'',NULL,NULL,NULL,71334,18575,43854,1,NULL,'',NULL,NULL,'131 POPLAR LANE','','MT WOLF','PA',17347,670,'2012-02-29 19:46:12','2012-03-16 04:30:48','40.047991','-76.694085',41,10,12,0.00,NULL,NULL,'','','','','Standard',0,39.17,'','',4,2),
	(716,'',NULL,NULL,NULL,145426,43900,77709,1,NULL,'',NULL,NULL,'3620 2ND AVE','','EDGE WATER','MD',21037,671,'2012-03-01 13:35:31','2012-03-16 04:30:48','38.909986','-76.5198489',82,14,26,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',3,2),
	(717,'',NULL,NULL,NULL,198226,91900,77709,1,NULL,'',NULL,NULL,'3620 2ND AVE','','EDGE WATER','MD',21037,671,'2012-03-01 13:37:01','2012-03-16 04:30:59','38.90976','-76.519134',82,14,26,0.00,NULL,NULL,'','','','','Elite',0,0.00,'','',3,3),
	(718,'',NULL,NULL,NULL,82777,35273,29654,1,NULL,'',NULL,NULL,'976 ERICSSON DR','','COATESVILLE','PA',19320,672,'2012-03-01 17:35:44','2012-03-16 04:30:59','39.950336','-75.757063',8,14,20,69.09,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(719,'',NULL,NULL,NULL,93089,25535,52000,1,NULL,'',NULL,NULL,'500 NEWPORT RD','','BRISTOL','PA',19007,673,'2012-03-01 18:19:18','2012-03-16 04:30:59','40.1000676','-74.8793873',55,10,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(720,'',NULL,NULL,NULL,81833,26368,31054,1,NULL,'',NULL,NULL,'1198 CARRIE LANE','','WEST CHESTER','PA',19382,674,'2012-03-01 18:40:08','2012-03-16 04:31:00','39.9303664','-75.5537173',19,12,16,140.10,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(721,'',NULL,NULL,NULL,91650,32397,52345,1,NULL,'',NULL,NULL,'','','MONKTON','PA',NULL,675,'2012-03-01 19:20:58','2012-03-16 04:24:52','39.578611','-76.615833',47,14,18,0.00,NULL,NULL,'','','','','Standard',0,94.19,'','',5,2),
	(722,'',NULL,NULL,NULL,65642,26368,29309,1,NULL,'',NULL,NULL,'1432 S WHITEFORD RD','','WEST CHESTER','PA',19380,676,'2012-03-01 21:29:56','2012-03-16 04:31:00','39.9606643','-75.6054882',16,12,16,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(723,'',NULL,NULL,NULL,99614,32397,51181,1,NULL,'',NULL,NULL,'996 MARIAN RD','','WARMINSTER ','PA',18974,677,'2012-03-02 20:36:01','2012-03-16 04:31:13','40.2134621','-75.0897879',45,14,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(724,'',NULL,NULL,NULL,98160,32397,50018,1,NULL,'',NULL,NULL,'2033 PARKVIEW AVE','','ABINGTON','PA',19001,678,'2012-03-04 21:49:22','2012-03-16 04:31:13','40.134678','-75.111274',43,14,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(725,'',NULL,NULL,NULL,140400,70797,50018,1,NULL,'',NULL,NULL,'2033 PARKVIEW AVE','','ABINGTON','PA',19001,678,'2012-03-04 21:51:17','2012-03-16 04:31:13','40.134678','-75.111274',43,14,18,0.00,NULL,NULL,'','','','','Elite',0,0.00,'','',1,3),
	(726,'',NULL,NULL,NULL,77658,28966,36636,1,NULL,'',NULL,NULL,'67 FAWN VALLEY DR','','ELKTON ','MD',21921,683,'2012-03-05 16:15:03','2012-03-16 04:31:14','39.70478','-75.9325',20,12,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',7,2),
	(727,'',NULL,NULL,NULL,144152,47762,73290,1,NULL,'',NULL,NULL,'3805 WOODHAVEN LANE','','BOWIE','MD',20715,684,'2012-03-05 18:53:29','2012-03-16 04:31:14','38.988591','-76.752017',83,12,22,0.00,NULL,NULL,'','','','','Standard',1,0.00,'','',3,2),
	(728,'',NULL,NULL,NULL,92922,29522,57000,1,NULL,'',NULL,NULL,'12015 BOXER HILL RD','','COCKEYSVILLE','MD',21030,685,'2012-03-05 19:57:13','2012-03-16 04:31:14','39.456365','-76.682487',55,14,16,0.00,NULL,NULL,'','','','','Standard',0,108.02,'','',7,2),
	(730,'',NULL,NULL,NULL,84420,29555,41527,1,NULL,'',NULL,NULL,'1050 OAK VIEW LANE','','HELLAM','PA',17406,687,'2012-03-06 17:38:06','2012-03-06 17:38:55','40.0289223','-76.6189496',37,14,38,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',4,1),
	(731,'',NULL,NULL,NULL,156677,61153,71527,1,NULL,'',NULL,NULL,'1050 OAK VIEW LANE','','HELLAM','PA',17406,687,'2012-03-06 17:40:28','2012-03-16 04:31:15','40.0289223','-76.6189496',37,14,38,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(732,'',NULL,NULL,NULL,77803,20895,43854,1,NULL,'',NULL,NULL,'333 BLUE RIDGE DR','','YORK ','PA',17402,680,'2012-03-06 18:31:30','2012-03-16 04:31:15','39.9036479','-76.686231',41,10,14,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(733,'',NULL,NULL,NULL,221252,148535,46290,1,NULL,'',36,NULL,'75 FRANKLIN DR','','PORT DEPOSIT ','MD',21904,688,'2012-03-06 19:05:41','2012-03-16 04:31:15','39.626623','-76.132785',28,16,22,0.00,NULL,NULL,'','','','','Standard',1,0.00,'','',7,2),
	(734,'',NULL,NULL,NULL,110696,36666,36290,1,NULL,'',NULL,NULL,'75 FRANKLIN DR','','PORT DEPOSIT ','MD',21904,688,'2012-03-06 19:10:18','2012-03-06 19:12:58','39.626623','-76.132785',28,6,110,250.00,NULL,NULL,'','','','','Economy',0,0.00,'','',7,1),
	(735,'',NULL,NULL,NULL,187812,118135,46290,1,NULL,'',24,NULL,'75 FRANKLIN DR','','PORT DEPOSIT ','MD',21904,688,'2012-03-06 19:26:56','2012-03-16 04:31:16','39.626623','-76.132785',28,16,22,0.00,NULL,NULL,'','','','','Standard',1,0.00,'','',7,2),
	(736,'',NULL,NULL,NULL,120932,57335,46290,1,NULL,'',NULL,NULL,'75 FRANKLIN DR','','PORT DEPOSIT ','MD',21904,688,'2012-03-06 19:31:53','2012-03-16 04:31:16','39.626623','-76.132785',28,16,22,0.00,NULL,NULL,'','','','','Standard',1,0.00,'','',7,2),
	(737,'',NULL,NULL,NULL,103961,43900,37563,1,NULL,'',NULL,NULL,'2670 WHITE OAK RD ','','STRAWSBURG','PA',NULL,681,'2012-03-06 19:44:54','2012-03-16 04:25:17','39.9395258','-76.1530847',13,14,26,87.17,NULL,NULL,'','','','','Standard',0,0.00,'','',6,2),
	(738,'',NULL,NULL,NULL,30754,8000,17563,1,NULL,'',NULL,NULL,'2670 WHITE OAK RD ','','STRAWSBURG','PA',NULL,681,'2012-03-06 19:48:37','2012-03-06 19:48:37','39.9395258','-76.1530847',13,12,12,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',6,1),
	(739,'',NULL,NULL,NULL,110900,23215,68290,1,NULL,'',NULL,NULL,'16119 DRAYTON FARM DR','','SPENCERVILLE ','MD',20868,689,'2012-03-06 20:52:19','2012-03-16 04:31:27','39.1203519','-76.97783',83,10,16,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',3,2),
	(741,'',NULL,NULL,NULL,95460,37568,53163,1,NULL,'',NULL,NULL,'7915 DALROSE AVE','','ROSEDALE ','MD',21237,691,'2012-03-06 22:21:27','2012-03-16 04:31:28','39.3140659','-76.511239',57,12,16,0.00,NULL,NULL,'','','','','Standard',1,123.20,'','',7,2),
	(742,'',NULL,NULL,NULL,147252,63948,61527,1,NULL,'',NULL,NULL,'107 SUNSHINE LANE','','MIDDLETOWN ','DE. ',19709,692,'2012-03-07 14:04:29','2012-03-16 04:31:28','39.503346','-75.643287',37,16,30,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',2,2),
	(743,'',NULL,NULL,NULL,81242,26666,41527,1,NULL,'',NULL,NULL,'107 SUNSHINE LANE','','MIDDLETOWN ','DE. ',19709,692,'2012-03-07 14:05:11','2012-03-07 14:05:11','39.503346','-75.643287',37,16,30,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',2,1),
	(744,'6x6 build up job, place against deck steps, and 4\' from house. 12\' side parrallel to house 10\' side parrallel to deck steps,\r\n                                careful of existing drain pipe, build over top of it .',NULL,NULL,NULL,175233,80175,64218,1,NULL,'',36,NULL,'7205 KINDLER RD','','COLUMBIA ','MD ',2046,658,'2012-03-07 14:36:22','2012-03-16 04:31:28','39.172726','-76.868354',76,10,12,67.68,NULL,NULL,'','','','','Standard',1,0.00,'','',3,2),
	(745,'',NULL,NULL,NULL,115400,43900,68400,1,NULL,'',NULL,NULL,'5737 OAKLAND RD','','ELDERSBURG ','MD',21784,693,'2012-03-07 15:35:28','2012-03-16 04:31:29','39.414664','-76.890963',66,14,26,0.00,NULL,NULL,'','','','','Standard',0,183.90,'','',7,2),
	(746,'',NULL,NULL,NULL,88994,20222,53400,1,NULL,'',NULL,NULL,'5737 OAKLAND RD','','ELDERSBURG ','MD',21784,693,'2012-03-07 15:39:40','2012-03-07 15:39:40','39.414664','-76.890963',66,14,26,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',7,1),
	(747,'',NULL,NULL,NULL,77658,28966,36636,1,NULL,'',NULL,NULL,'1152 wendler cir','','pottstown','pa',19465,694,'2012-03-07 16:21:58','2012-03-16 04:31:29','40.224597','-75.654143',20,12,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(748,'NO STONE , ',NULL,NULL,NULL,176778,102915,22690,1,NULL,'',NULL,NULL,'102 AQUEDUCT COURT','','FORREST HILL ','MD',21050,696,'2012-03-08 22:42:56','2012-03-16 04:31:29','39.5778814','-76.3984537',39,28,28,352.08,NULL,NULL,'','','','','Standard',1,0.00,'','',7,2),
	(749,'',NULL,NULL,NULL,201418,125315,22690,1,NULL,'',12,NULL,'102 AQUEDUCT COURT','','FORREST HILL ','MD',21050,696,'2012-03-08 22:45:47','2012-03-16 04:31:30','39.5778814','-76.3984537',39,28,28,352.08,NULL,NULL,'','','','','Standard',0,0.00,'','',7,2),
	(750,'',NULL,NULL,NULL,136253,74962,43036,1,NULL,'',NULL,NULL,'135 SANFORD RD','','PENNSVILLE','NJ',8070,699,'2012-03-09 01:08:01','2012-03-16 04:31:30','39.641953','-75.54303',31,12,22,0.00,NULL,NULL,'','','','','Elite',0,0.00,'','',1,3),
	(751,'',NULL,NULL,NULL,91373,34162,43036,1,NULL,'',NULL,NULL,'135 SANFORD RD','','PENNSVILLE','NJ',8070,699,'2012-03-09 01:09:44','2012-03-16 04:25:29','39.641953','-75.54303',31,12,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(752,'',NULL,NULL,NULL,108348,20895,68290,1,NULL,'',NULL,NULL,'16119 DRAYTON FARM DR','','SPENCERVILLE ','MD',20868,689,'2012-03-09 01:24:24','2012-03-16 04:31:41','39.1203519','-76.97783',83,10,14,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',3,2),
	(753,'6X6 PRESURE TREATED TIMBER BORDER, GEOTEXTILE FABRIC, EXCAVATION OF SITE, DRAIN PIPE, \r\nADDITIONAL 285.00 PR, 12 \'\' SLOPE.      MULCH WILL BE SUPPLIED BY CUSTOMER,',NULL,NULL,NULL,196837,71877,94218,5,NULL,'',NULL,NULL,'8420 BRADDOCK WAY','','COLUMBIA','MD',21046,702,'2012-03-09 18:40:51','2012-03-16 04:31:41','39.174294','-76.872098',76,25,23,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',3,2),
	(754,'PLASTIC EDGEING , GEOTEXTILE FABRIC, DRAIN PIPE,  EXCAVATION OF SITE, \r\nADDITIONAL 285.00 PR. 12\'\' SLOPE. ',NULL,NULL,NULL,235600,129477,94218,5,NULL,'',NULL,NULL,'8420 BRADDOCK WAY','','COLUMBIA','MD',21046,702,'2012-03-09 18:44:16','2012-03-16 04:31:42','39.174294','-76.872098',76,25,23,0.00,NULL,NULL,'','','','','Elite',0,245.97,'','',3,3),
	(755,'',NULL,NULL,NULL,88232,35273,39545,1,NULL,'',NULL,NULL,'35 TROY DR','','LITITZ','PA',17543,703,'2012-03-09 19:30:04','2012-03-16 04:31:42','40.1852405','-76.3262228',25,14,20,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',6,2),
	(756,'',NULL,NULL,NULL,79614,18575,47345,1,NULL,'',NULL,NULL,'1437 SEVEN VALLEYS RD','','YORK','PA',17408,704,'2012-03-09 19:59:33','2012-03-16 04:31:55','39.889722','-76.785822',47,10,12,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(757,'',NULL,NULL,NULL,55848,8333,37345,1,NULL,'',NULL,NULL,'1437 SEVEN VALLEYS RD','','YORK','PA',17408,704,'2012-03-09 20:03:32','2012-03-09 20:03:32','39.889722','-76.785822',47,10,12,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',4,1),
	(758,'',NULL,NULL,NULL,98372,38148,45127,1,NULL,'',NULL,NULL,'1749 COLORA RD','','COLORA ','MD',21917,697,'2012-03-09 20:47:40','2012-03-16 04:31:55','39.6507661','-76.1026118',26,14,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',7,2),
	(759,'',NULL,NULL,NULL,64547,24444,30127,1,NULL,'',NULL,NULL,'1749 COLORA RD','','COLORA ','MD',21917,697,'2012-03-09 20:50:23','2012-03-09 20:50:23','39.6507661','-76.1026118',26,16,22,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',7,1),
	(760,'',NULL,NULL,NULL,161278,95335,45127,1,NULL,'',NULL,NULL,'1749 COLORA RD','','COLORA ','MD',21917,697,'2012-03-09 20:50:49','2012-03-16 04:31:56','39.6507661','-76.1026118',26,16,22,0.00,NULL,NULL,'','','','','Elite',0,0.00,'','',5,3),
	(761,'',NULL,NULL,NULL,77069,32397,33145,1,NULL,'',NULL,NULL,'116 valleyview cir','','lincoln university','pa',19352,705,'2012-03-12 13:34:48','2012-03-16 04:31:56','39.790524','-75.924063',14,14,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(762,'',NULL,NULL,NULL,66166,20895,34545,1,NULL,'',NULL,NULL,'2874 FLEETWOOD DR','','LANCASTER','PA',17601,698,'2012-03-12 14:21:30','2012-03-16 04:31:56','40.057346','-76.391937',25,10,14,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',6,2),
	(763,'',NULL,NULL,NULL,41376,9722,24545,1,NULL,'',NULL,NULL,'2874 FLEETWOOD DR','','LANCASTER','PA',17601,698,'2012-03-12 14:24:41','2012-03-12 14:24:41','40.057346','-76.391937',25,10,14,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',6,1),
	(764,'',NULL,NULL,NULL,116554,38148,59672,1,NULL,'',NULL,NULL,'4106 HOFFMANVILLE RD','','MILLERS ','MD',21102,706,'2012-03-12 15:20:06','2012-03-16 04:31:57','39.682324','-76.792675',51,14,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',7,2),
	(765,'',NULL,NULL,NULL,150839,57953,69672,1,NULL,'',NULL,NULL,'4106 HOFFMANVILLE RD','','MILLERS ','MD',21102,706,'2012-03-12 15:22:32','2012-03-16 04:31:57','39.682324','-76.792675',51,18,24,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',7,2),
	(766,'',NULL,NULL,NULL,95090,30000,49672,1,NULL,'',NULL,NULL,'4106 HOFFMANVILLE RD','','MILLERS ','MD',21102,706,'2012-03-12 15:23:30','2012-03-12 15:23:30','39.682324','-76.792675',51,18,24,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',7,1),
	(767,'',NULL,NULL,NULL,89500,16255,71781,1,NULL,'',NULL,NULL,'14724 JANICE DR','','ROCKVILLE','MD',20853,707,'2012-03-12 15:53:50','2012-03-16 04:31:57','39.097694','-77.099873',89,10,10,0.00,NULL,NULL,'','','','','Standard',0,181.08,'','',3,2),
	(768,'',NULL,NULL,NULL,86777,35273,38381,1,NULL,'',NULL,NULL,'4521 PICKWICK DR','','WILMINGTON','DE',19808,708,'2012-03-12 16:09:01','2012-03-16 04:31:58','39.728904','-75.661105',23,14,20,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',2,2),
	(769,'',NULL,NULL,NULL,53741,19444,25881,1,NULL,'',NULL,NULL,'4521 PICKWICK DR','','WILMINGTON','DE',19808,708,'2012-03-12 16:09:51','2012-03-12 16:09:51','39.728904','-75.661105',23,14,20,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',2,1),
	(770,'',NULL,NULL,NULL,83373,34162,36636,1,NULL,'',NULL,NULL,'606 SWALLOW HOLLOW RD','','WILMINGTON ','DE',19807,709,'2012-03-12 17:37:32','2012-03-16 04:31:58','39.8160568','-75.6164488',20,12,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',2,2),
	(771,'',NULL,NULL,NULL,84348,20895,49090,1,NULL,'',NULL,NULL,'16657 MILLER LANE','','PARKTON ','MD',21120,710,'2012-03-12 18:03:42','2012-03-16 04:31:59','39.582288','-76.680774',50,10,14,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',7,2),
	(772,'',NULL,NULL,NULL,90894,20895,54327,1,NULL,'',NULL,NULL,'572 KINGS RD','','YARDLY','PA',19067,700,'2012-03-12 18:19:20','2012-03-16 04:31:59','40.221151','-74.8315211',59,10,14,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',1,2),
	(773,'',NULL,NULL,NULL,66103,9722,44327,1,NULL,'',NULL,NULL,'572 KINGS RD','','YARDLY','PA',19067,700,'2012-03-12 18:21:06','2012-03-12 18:21:06','40.221151','-74.8315211',59,10,14,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',1,1),
	(774,'',NULL,NULL,NULL,79799,37523,30818,1,NULL,'',NULL,NULL,'12 ROLLING GLEN LANE','','DOWNINGTOWN','PA',19335,711,'2012-03-13 13:32:55','2012-03-16 04:32:00','40.0064958','-75.7032742',10,13,23,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(776,'4\'\' CONCRETE SLAB, 4\'\' STONE, WIRE , 3500 PSI. EXCAVATION.',NULL,NULL,NULL,225000,16666,50900,1,NULL,'',NULL,NULL,'2055 CONAN DOYLE WAY','','ELDERSBURG ','MD',21784,712,'2012-03-13 19:57:31','2012-03-13 20:14:26','39.421967','-76.919445',66,12,20,1430.42,NULL,NULL,'','','','','Economy',0,0.00,'','',7,1),
	(777,'',NULL,NULL,NULL,262000,139900,55018,1,NULL,'',30,NULL,'60 GRIFFITH LANE','','MANCHESTER','PA',17345,713,'2012-03-13 22:24:30','2012-03-16 04:32:00','40.078413','-76.732949',43,14,26,393.38,NULL,NULL,'','','30\'\'','','Standard',1,0.00,'','',4,2),
	(778,'',NULL,NULL,NULL,117062,43900,55018,1,NULL,'',NULL,NULL,'60 GRIFFITH LANE','','MANCHESTER','PA',17345,713,'2012-03-13 22:41:44','2012-03-16 04:32:00','40.078413','-76.732949',43,14,26,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(779,'',NULL,NULL,NULL,129295,28966,77945,1,NULL,'',NULL,NULL,'1006 AVERY PLACE','','UPPERBORO','MD',20774,714,'2012-03-14 15:31:23','2012-03-16 04:32:09','38.875955','-76.813413',91,12,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',3,2),
	(780,'',NULL,NULL,NULL,98306,15000,65445,1,NULL,'',NULL,NULL,'1006 AVERY PLACE','','UPPERBORO','MD',20774,714,'2012-03-14 15:34:57','2012-03-14 15:34:57','38.8682133','-76.7913558',91,12,18,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',3,1),
	(781,'',NULL,NULL,NULL,405681,256611,58727,1,NULL,'',52,NULL,'1072 ST MATHEWS RD','','CHESTER SPRINGS','PA',19425,715,'2012-03-14 16:31:09','2012-03-16 04:32:09','40.1162555','-75.6495744',15,18,32,500.00,NULL,NULL,'','4 LOADS OF FILL ,  STONE AND DRAIN PIPE BEHING WALL.','6X6 TIMBER WALL, DEADMAN BRACING, 10\'\' GALVANIZED  SPIKES, 1/2\'\'X2\' REBAR, ','','Standard',1,0.00,'','',5,2),
	(782,'',NULL,NULL,NULL,94261,30175,48854,1,NULL,'',NULL,NULL,'2616 NATALIE DR','','YORK','PA',17402,716,'2012-03-14 19:34:08','2012-03-16 04:32:10','39.907434','-76.69122',41,10,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(783,'',NULL,NULL,NULL,119971,43900,57345,1,NULL,'',NULL,NULL,'2565 SUNSET LANE','','YORK','PA',17408,717,'2012-03-14 20:08:09','2012-03-16 04:32:10','39.971113','-76.804717',47,14,26,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(784,'',NULL,NULL,NULL,71978,32397,29072,1,NULL,'',NULL,NULL,'40 ANDOVER RD','','GLENMOORE','PA',19343,718,'2012-03-14 22:07:53','2012-03-16 04:32:10','40.057586','-75.796234',7,14,18,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(785,'',NULL,NULL,NULL,32257,13333,14072,1,NULL,'',NULL,NULL,'40 ANDOVER RD','','GLENMOORE','PA',19343,718,'2012-03-14 22:14:01','2012-03-14 22:14:01','40.057586','-75.796234',7,12,16,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',5,1),
	(786,'',NULL,NULL,NULL,116335,43900,54436,1,NULL,'',NULL,NULL,'1769 SEAKS RUN RD','','GLENROCK ','PA',17327,719,'2012-03-15 17:43:50','2012-03-16 04:32:10','39.836177','-76.67903',42,14,26,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(787,'',NULL,NULL,NULL,82646,34162,36054,1,NULL,'',NULL,NULL,'303 BLAKE RD','','OXFORD','PA',19363,720,'2012-03-15 17:58:17','2012-03-16 04:32:11','39.722944','-75.891492',19,12,22,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',5,2),
	(788,'',NULL,NULL,NULL,49609,18333,23554,1,NULL,'',NULL,NULL,'303 BLAKE RD','','OXFORD','PA',19363,720,'2012-03-15 17:59:27','2012-03-15 17:59:27','39.722944','-75.891492',19,12,22,0.00,NULL,NULL,'','','','','Economy',0,0.00,'','',5,1),
	(789,'',NULL,NULL,NULL,104232,35273,52345,1,NULL,'',NULL,NULL,'3130 KING RICHARD COURT SOUTH','','YORK','PA',17408,721,'2012-03-15 21:27:21','2012-03-16 04:32:11','39.9053771','-76.7946963',47,14,20,0.00,NULL,NULL,'','','','','Standard',0,0.00,'','',4,2),
	(790,'(6)16\'\'X36\'\' CONCRETE PIERS, SONA TUBE FORMS, REBAR,\r\n14X18 SLAB      3500 PSI. 4\'\' STONE , REBAR EVERY 2\' SQUARE, 6\'\' CONCRETE SLAB.\r\nEXCAVATION OF SITE.',NULL,NULL,NULL,289000,17500,37518,1,NULL,'',NULL,NULL,'','','HORSHAM','PA',NULL,722,'2012-03-15 21:40:14','2012-03-15 22:48:22','40.1784422','-75.1285061',43,14,18,2228.53,NULL,NULL,'','','','','Economy',0,0.00,'','',1,1);

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;

INSERT INTO `locations` (`id`, `name`, `phone`, `abbreviation`, `created_at`, `updated_at`)
VALUES
	(1,'Philadelphia','215-839-3904','PA','2011-03-22 14:45:13','2012-01-27 13:28:37'),
	(2,'Delaware','(302) 545.7067','DE','2011-03-22 14:45:34','2011-03-22 14:45:34'),
	(3,'Burtonsville','(301) 467.0949','MD','2011-03-22 14:45:58','2012-01-27 13:32:38'),
	(4,'Glenrock ','717-587-7062','PA','2011-03-23 13:38:09','2011-03-23 13:39:40'),
	(5,'Coatesville ','484-712-8828','PA','2011-03-23 13:49:34','2012-01-27 13:31:38'),
	(6,'New Holland','717-587-7062','PA','2011-03-23 17:15:26','2011-03-23 17:15:26'),
	(7,'Baltimore ','410-609-6036','md','2012-01-27 13:30:58','2012-01-27 13:31:20');

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table next_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `next_actions`;

CREATE TABLE `next_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requires_phone_call` tinyint(1) DEFAULT NULL,
  `on_hold` tinyint(1) DEFAULT NULL,
  `requires_visit` tinyint(1) DEFAULT NULL,
  `requires_research` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `next_actions` WRITE;
/*!40000 ALTER TABLE `next_actions` DISABLE KEYS */;

INSERT INTO `next_actions` (`id`, `name`, `requires_phone_call`, `on_hold`, `requires_visit`, `requires_research`, `created_at`, `updated_at`, `position`)
VALUES
	(1,'Call back',1,0,0,0,'2009-07-06 07:30:47','2012-02-13 12:58:04',1),
	(2,'They will call',1,0,0,0,'2009-07-06 13:13:52','2012-02-13 12:57:45',NULL),
	(3,'They will call to schedule',1,0,0,0,'2009-07-06 13:14:15','2009-07-06 13:14:15',NULL),
	(4,'Call back to schedule',1,0,0,0,'2009-07-06 13:14:38','2012-02-13 12:57:56',NULL),
	(5,'Lost Sale',0,0,0,0,'2009-07-06 13:14:48','2012-02-13 12:58:12',NULL),
	(7,'Sold',0,0,0,0,'2011-01-26 04:00:01','2012-02-13 12:55:13',NULL);

/*!40000 ALTER TABLE `next_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pad_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pad_jobs`;

CREATE TABLE `pad_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `foundation_id` int(11) DEFAULT NULL,
  `pad_size_id` int(11) DEFAULT NULL,
  `door_placement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `off_level_amount_in_inches` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pad_sizes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pad_sizes`;

CREATE TABLE `pad_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `price_in_cents` int(11) DEFAULT NULL,
  `material_cost_in_cents` int(11) DEFAULT NULL,
  `labor_cost_in_cents` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `pad_sizes` WRITE;
/*!40000 ALTER TABLE `pad_sizes` DISABLE KEYS */;

INSERT INTO `pad_sizes` (`id`, `length`, `width`, `price_in_cents`, `material_cost_in_cents`, `labor_cost_in_cents`, `created_at`, `updated_at`, `position`)
VALUES
	(3,8,8,24000,NULL,NULL,'2010-02-05 17:47:22','2010-02-05 17:48:13',NULL),
	(5,10,8,30000,NULL,NULL,'2010-02-05 17:47:49','2010-02-05 17:48:56',NULL),
	(7,12,8,36000,NULL,NULL,'2010-02-05 17:49:48','2010-02-05 17:49:48',NULL),
	(9,14,8,42000,NULL,NULL,'2010-02-05 17:52:53','2010-02-05 17:52:53',NULL),
	(10,16,8,48000,NULL,NULL,'2010-02-05 17:53:14','2010-02-05 17:53:14',NULL),
	(11,10,10,35000,NULL,NULL,'2010-02-05 17:53:31','2010-02-05 17:53:31',NULL),
	(12,12,10,45000,NULL,NULL,'2010-02-05 17:53:46','2010-02-05 17:53:46',NULL),
	(13,14,10,45500,NULL,NULL,'2010-02-05 17:54:05','2010-02-05 17:54:05',NULL),
	(14,16,10,52000,NULL,NULL,'2010-02-05 17:54:21','2010-02-05 17:54:21',NULL),
	(15,18,10,54000,NULL,NULL,'2010-02-05 17:54:38','2010-02-05 17:54:38',NULL),
	(16,20,10,55000,NULL,NULL,'2010-02-05 17:54:53','2010-02-05 17:54:53',NULL),
	(17,22,10,60500,NULL,NULL,'2010-02-05 17:55:06','2010-02-05 17:55:06',NULL),
	(18,24,10,66000,NULL,NULL,'2010-02-05 17:55:19','2010-02-05 17:55:19',NULL),
	(19,26,10,71500,NULL,NULL,'2010-02-05 17:55:31','2010-02-05 17:55:31',NULL),
	(20,12,12,46800,NULL,NULL,'2010-02-05 17:55:45','2010-02-05 17:55:45',NULL),
	(21,14,12,50400,NULL,NULL,'2010-02-05 17:55:58','2010-02-05 17:55:58',NULL),
	(22,16,12,57700,NULL,NULL,'2010-02-05 17:56:08','2010-02-05 17:56:08',NULL),
	(23,18,12,59400,NULL,NULL,'2010-02-05 17:56:31','2010-02-05 17:56:31',NULL),
	(24,20,12,66000,NULL,NULL,'2010-02-05 17:57:04','2010-02-05 17:57:04',NULL),
	(25,22,12,72600,NULL,NULL,'2010-02-05 17:57:16','2010-02-05 17:57:16',NULL),
	(26,24,12,72000,NULL,NULL,'2010-02-05 17:57:30','2010-02-05 17:57:30',NULL),
	(27,26,12,78000,NULL,NULL,'2010-02-05 17:57:44','2010-02-05 17:57:44',NULL),
	(28,28,12,84000,NULL,NULL,'2010-02-05 17:58:02','2010-02-05 17:58:02',NULL),
	(29,30,12,90000,NULL,NULL,'2010-02-05 17:58:14','2010-02-05 17:58:14',NULL),
	(30,32,12,96000,NULL,NULL,'2010-02-05 17:58:29','2010-02-05 17:58:29',NULL),
	(31,14,14,53900,NULL,NULL,'2010-02-05 17:58:43','2010-02-05 17:58:43',NULL),
	(32,16,14,61600,NULL,NULL,'2010-02-05 17:58:56','2010-02-05 17:58:56',NULL),
	(33,18,14,69300,NULL,NULL,'2010-02-05 17:59:08','2010-02-05 17:59:08',NULL),
	(34,20,14,70000,NULL,NULL,'2010-02-05 17:59:23','2010-02-05 17:59:23',NULL),
	(35,22,14,77000,NULL,NULL,'2010-02-05 17:59:35','2010-02-05 17:59:35',NULL),
	(36,24,14,84000,NULL,NULL,'2010-02-05 17:59:48','2010-02-05 17:59:48',NULL),
	(37,26,14,91000,NULL,NULL,'2010-02-05 18:00:01','2010-02-05 18:00:01',NULL),
	(38,28,14,88200,NULL,NULL,'2010-02-05 18:00:14','2010-02-05 18:00:14',NULL),
	(39,30,14,94500,NULL,NULL,'2010-02-05 18:00:28','2010-02-05 18:00:28',NULL),
	(40,32,14,100800,NULL,NULL,'2010-02-05 18:00:42','2010-02-05 18:00:42',NULL),
	(41,34,14,107100,NULL,NULL,'2010-02-05 18:00:55','2010-02-05 18:00:55',NULL),
	(42,36,14,113400,NULL,NULL,'2010-02-05 18:01:14','2010-02-05 18:01:14',NULL),
	(43,38,14,119700,NULL,NULL,'2010-02-05 18:01:27','2010-02-05 18:01:27',NULL),
	(44,40,14,126000,NULL,NULL,'2010-02-05 18:01:38','2010-02-05 18:01:38',NULL),
	(45,18,16,72000,NULL,NULL,'2010-02-05 18:01:57','2010-02-05 18:01:57',NULL),
	(46,20,16,80000,NULL,NULL,'2010-02-05 18:02:10','2010-02-05 18:02:10',NULL),
	(47,22,16,88000,NULL,NULL,'2010-02-05 18:02:29','2010-02-05 18:02:29',NULL),
	(48,24,16,96000,NULL,NULL,'2010-02-05 18:02:38','2010-02-05 18:02:38',NULL),
	(49,26,16,93600,NULL,NULL,'2010-02-05 18:02:52','2010-02-05 18:02:52',NULL),
	(50,28,16,100800,NULL,NULL,'2010-02-05 18:03:05','2010-02-05 18:03:05',NULL),
	(51,30,16,108000,NULL,NULL,'2010-02-05 18:03:17','2010-02-05 18:03:17',NULL),
	(52,32,16,115200,NULL,NULL,'2010-02-05 18:03:29','2010-02-05 18:03:29',NULL),
	(53,34,16,112400,NULL,NULL,'2010-02-05 18:03:41','2010-02-05 18:03:41',NULL),
	(54,36,16,129600,NULL,NULL,'2010-02-05 18:03:54','2010-02-05 18:03:54',NULL),
	(55,38,16,136800,NULL,NULL,'2010-02-05 18:04:06','2010-02-05 18:04:06',NULL),
	(56,40,16,144000,NULL,NULL,'2010-02-05 18:04:23','2010-02-05 18:04:23',NULL),
	(57,42,16,151200,NULL,NULL,'2010-02-05 18:04:35','2010-02-05 18:04:35',NULL),
	(58,44,16,158400,NULL,NULL,'2010-02-05 18:04:52','2010-02-05 18:04:52',NULL),
	(59,46,16,165600,NULL,NULL,'2010-02-05 18:05:04','2010-02-05 18:05:04',NULL),
	(60,48,16,172800,NULL,NULL,'2010-02-05 18:05:16','2010-02-05 18:05:16',NULL),
	(63,24,24,NULL,NULL,NULL,'2011-03-07 23:07:22','2011-03-07 23:07:22',NULL),
	(64,24,24,NULL,NULL,NULL,'2011-03-07 23:07:36','2011-03-07 23:07:36',NULL);

/*!40000 ALTER TABLE `pad_sizes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rock_pad_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rock_pad_variables`;

CREATE TABLE `rock_pad_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rock_pad_variables` WRITE;
/*!40000 ALTER TABLE `rock_pad_variables` DISABLE KEYS */;

INSERT INTO `rock_pad_variables` (`id`, `key`, `value`, `created_at`, `updated_at`, `description`)
VALUES
	(1,'laborers',2.00,'2010-08-09 18:37:34','2010-08-09 18:42:16','Number of laborers required'),
	(2,'laborer_rate',50.00,'2010-08-09 18:37:47','2011-03-19 02:57:52','Rate per laborer (dollars)'),
	(3,'gas_cost',5.00,'2010-08-09 18:37:59','2011-03-19 03:04:40','Cost of gas per gallon (dollars)'),
	(4,'truck_cost_per_mile',3.00,'2010-08-09 18:38:08','2011-04-01 10:24:53','Cost of truck per mile (dollars)'),
	(5,'truck_mileage_per_gallon',5.00,'2010-08-09 18:38:21','2011-03-22 14:43:50','MPG of truck (in mpg)'),
	(6,'board_cost_per_foot',2.00,'2010-08-09 18:38:35','2011-02-24 19:26:14','Cost per foot of boards under 16 (in dollars)'),
	(7,'board_cost_per_foot_gt_16',3.00,'2010-08-09 18:38:47','2011-02-24 19:26:41','Cost of boards over 16 (in dollars)'),
	(8,'rock_per_ton',25.00,'2010-08-09 18:38:59','2012-03-09 15:45:18','Cost of rock per ton (in dollars)'),
	(9,'trex_price_per_foot',6.00,'2010-08-09 18:39:16','2011-04-01 10:24:06','Cost of trex per foot (dollars)'),
	(10,'weed_fabric_per_roll',365.00,'2010-08-09 18:39:37','2010-08-09 18:48:34','Cost per roll ( in dollars )'),
	(11,'rebar_piece',1.00,'2010-08-09 18:39:48','2010-08-09 18:44:21','Cost per piece of rebar ( in dollars )'),
	(12,'weed_fabric_width',12.00,'2010-08-09 18:40:00','2010-08-09 18:44:39','Width of the weed fabric roll (in feet)'),
	(13,'weed_fabric_length',300.00,'2010-08-09 18:40:13','2010-08-09 18:44:52','Length of the weed fabric roll ( in feet )'),
	(14,'spacing_for_rebar',8.00,'2010-08-09 18:40:26','2010-08-09 18:45:05','Feet of space between rebar pieces ( in feet )'),
	(15,'square_footage_per_ton',36.00,'2010-08-09 18:40:42','2011-01-26 04:56:43','Square footage per ton of rock ( in sqft ) 6\'\' thick'),
	(16,'speed_for_hour_calculation',55.00,'2010-08-09 18:40:55','2011-01-26 04:55:14','Average speed of travel ( in MPH )'),
	(19,'labor_cost_markup',25.00,'2010-08-09 18:41:41','2011-03-23 11:57:51','in percentage'),
	(20,'material_cost_markup',10.00,'2010-08-09 18:41:55','2011-03-23 11:29:28','in percentage'),
	(21,'board_cost_per_foot_6x6',4.00,'2011-02-18 10:41:17','2011-02-24 19:27:29','This is the 6x6 border board cost per foot'),
	(22,'hours_300_to_400',3.00,'2011-03-22 14:54:33','2011-03-22 14:54:33','Number of hours it takes a crew to build a 300 to 399 sqft pad'),
	(23,'hours_200_to_300',2.50,'2011-03-22 14:55:11','2011-03-22 14:55:11','Number of hours it takes a crew to build a 200 to 299 sqft pad'),
	(24,'hours_less_than_200',2.00,'2011-03-22 14:55:53','2011-03-23 11:11:15','Number of hours it takes a crew to build up to a 200 sqft pad'),
	(25,'hours_400_to_500',4.00,'2012-03-08 16:51:48','2012-03-08 16:51:48','hours for 400 to 500 sqft'),
	(26,'hours_500_to_600',5.00,'2012-03-08 16:52:32','2012-03-08 16:52:32','Hours for when the sqft is between 500 and 600 sqft.');

/*!40000 ALTER TABLE `rock_pad_variables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`),
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20090617175316'),
	('20090617175431'),
	('20090617175437'),
	('20090617175445'),
	('20090617175452'),
	('20090617175459'),
	('20090617175505'),
	('20090617175512'),
	('20090617175756'),
	('20090617175948'),
	('20090619000849'),
	('20090706102005'),
	('20090706102029'),
	('20090706110029'),
	('20090706132344'),
	('20090706145946'),
	('20090706165021'),
	('20100421022908'),
	('20100421025643'),
	('20100421030841'),
	('20100421031033'),
	('20100610193520'),
	('20100610193521'),
	('20100614111020'),
	('20100614121146'),
	('20100614121704'),
	('20100809154356'),
	('20100809160008'),
	('20110218103602'),
	('20110218110051'),
	('20110310160622'),
	('20110317171213'),
	('20110322140334'),
	('20110322141207'),
	('20110322141748'),
	('20110322144013'),
	('20120221192505'),
	('20120302155718'),
	('20120305184940'),
	('20120306191331'),
	('20120306191720'),
	('20120308203746'),
	('20120309172419'),
	('20120313200246'),
	('20120313200439'),
	('20120313210504'),
	('20120313210700'),
	('20120315180649'),
	('20120315182850'),
	('20120315183106'),
	('20120315185030'),
	('20120315185120'),
	('20120315185519'),
	('20120315190717'),
	('20120316031506'),
	('20120316043428');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `statuses`;

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `next_action_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `assigned_by` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `followup_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;

INSERT INTO `statuses` (`id`, `job_id`, `next_action_id`, `notes`, `assigned_by`, `assigned_to`, `created_at`, `updated_at`, `done`, `contact_id`, `followup_date`)
VALUES
	(6,NULL,1,'',2,1,'2010-04-23 18:28:42','2010-04-23 18:28:42',NULL,NULL,NULL),
	(7,NULL,1,'I called him',1,1,'2010-06-14 11:08:06','2010-06-14 11:08:06',NULL,NULL,NULL),
	(10,NULL,3,'something',2,1,'2010-07-22 19:41:21','2010-07-22 19:41:21',NULL,10,NULL),
	(11,NULL,3,'something',2,1,'2010-07-22 19:41:31','2010-07-22 19:41:31',NULL,10,NULL),
	(45,NULL,3,'IN APR.',2,2,'2011-02-04 17:43:21','2011-02-04 17:43:21',NULL,24,NULL),
	(82,NULL,3,'demo existing shed 500.00  3/4/11  call to poss schedule . ',2,2,'2011-03-04 02:15:03','2011-03-04 02:15:03',NULL,51,NULL),
	(86,NULL,4,'call back to schedule. 3/15/11',2,2,'2011-03-04 02:31:23','2011-03-04 02:31:23',NULL,52,NULL),
	(89,NULL,4,'mar 15 11 to poss schedule.',2,2,'2011-03-04 02:40:42','2011-03-04 02:40:42',NULL,53,NULL),
	(92,NULL,1,'to needs estimate  3/5/11',2,2,'2011-03-04 02:50:12','2011-03-04 02:50:12',NULL,54,NULL),
	(271,NULL,3,'POSS ON FRIDAY',2,2,'2011-05-10 13:40:46','2011-05-10 13:40:46',NULL,242,NULL),
	(312,NULL,2,'GARDEN SHEDS',2,2,'2011-05-19 15:12:39','2011-05-19 15:12:39',NULL,277,NULL),
	(732,682,NULL,'Created new Estimate',2,2,'2012-02-02 15:13:33','2012-02-02 15:13:33',1,NULL,NULL),
	(733,682,7,'',2,2,'2012-02-02 15:42:42','2012-02-02 15:42:42',NULL,637,NULL),
	(734,682,1,'call her back at 8am to discuss whether or not she wants to go forward',2,2,'2012-02-02 16:41:28','2012-02-02 17:10:47',1,637,NULL),
	(735,683,NULL,'Created new Estimate',2,2,'2012-02-13 12:39:12','2012-02-13 12:39:12',1,NULL,NULL),
	(736,683,7,'MOVE EXISTING SHED ONTO NEW SITE. ADDITIONAL COST   175.00',2,2,'2012-02-13 12:41:14','2012-02-13 12:41:14',NULL,639,NULL),
	(737,684,NULL,'Created new Estimate',2,2,'2012-02-19 18:41:43','2012-02-19 18:41:43',1,NULL,NULL),
	(738,685,NULL,'Created new Estimate',2,2,'2012-02-19 18:46:49','2012-02-19 18:46:49',1,NULL,NULL),
	(739,686,NULL,'Created new Estimate',2,2,'2012-02-20 14:46:37','2012-02-20 14:46:37',1,NULL,NULL),
	(742,688,NULL,'Created new Estimate',2,2,'2012-02-21 12:17:32','2012-02-21 12:17:32',1,NULL,NULL),
	(743,688,3,'CALL TO SCHEDULE ON THUR. 23 RD \r\nMOVE SHED OFF SITE, HAD PROBLEM WITH WATER IN THAT AREA. ',2,2,'2012-02-21 12:22:47','2012-03-05 19:14:43',1,644,NULL),
	(744,688,4,'',2,2,'2012-02-21 16:30:07','2012-02-29 18:04:26',1,644,NULL),
	(745,688,4,'',2,2,'2012-02-21 16:35:30','2012-02-29 18:04:31',1,644,NULL),
	(746,689,NULL,'Created new Estimate',2,2,'2012-02-21 17:35:39','2012-02-21 17:35:39',1,NULL,NULL),
	(750,691,NULL,'Created new Estimate',2,2,'2012-02-21 19:43:30','2012-02-21 19:43:30',1,NULL,NULL),
	(751,691,4,'',2,2,'2012-02-21 19:44:54','2012-03-05 20:58:34',1,646,NULL),
	(752,692,NULL,'Created new Estimate',2,2,'2012-02-21 19:56:02','2012-02-21 19:56:02',1,NULL,NULL),
	(753,693,NULL,'Created new Estimate',2,2,'2012-02-21 20:22:54','2012-02-21 20:22:54',1,NULL,NULL),
	(754,694,NULL,'Created new Estimate',2,2,'2012-02-21 20:47:18','2012-02-21 20:47:18',1,NULL,NULL),
	(755,695,NULL,'Created new Estimate',2,2,'2012-02-21 21:12:43','2012-02-21 21:12:43',1,NULL,NULL),
	(756,696,NULL,'Created new Estimate',2,2,'2012-02-21 21:23:31','2012-02-21 21:23:31',1,NULL,NULL),
	(757,697,NULL,'Created new Estimate',2,2,'2012-02-21 21:31:46','2012-02-21 21:31:46',1,NULL,NULL),
	(758,698,NULL,'Created new Estimate',2,2,'2012-02-22 14:51:29','2012-02-22 14:51:29',1,NULL,NULL),
	(759,699,NULL,'Created new Estimate',2,2,'2012-02-22 15:55:49','2012-02-22 15:55:49',1,NULL,NULL),
	(760,699,4,'',2,2,'2012-02-22 15:57:44','2012-03-05 20:39:42',1,656,'2012-03-30 14:55:00'),
	(761,700,NULL,'Created new Estimate',2,2,'2012-02-22 16:18:59','2012-02-22 16:18:59',1,NULL,NULL),
	(762,700,2,'',2,2,'2012-02-22 16:23:36','2012-03-05 20:49:50',1,657,'2012-02-22 16:18:00'),
	(765,688,3,'schedule for next wk due to a death in the family',2,2,'2012-02-29 13:55:25','2012-03-05 19:14:14',1,644,'2012-02-29 13:54:00'),
	(766,702,NULL,'Created new Estimate',2,2,'2012-02-29 14:03:20','2012-02-29 14:03:20',1,NULL,NULL),
	(767,NULL,1,'WAITING TO HERE BACK',2,2,'2012-02-29 14:45:02','2012-02-29 14:45:02',NULL,659,'2012-02-29 14:43:00'),
	(768,NULL,1,'CALLED ON WED.',2,2,'2012-02-29 14:47:53','2012-02-29 14:47:53',NULL,659,'2012-03-01 14:45:00'),
	(769,703,NULL,'Created new Estimate',2,2,'2012-02-29 14:58:37','2012-02-29 14:58:37',1,NULL,NULL),
	(770,NULL,4,'',2,2,'2012-02-29 16:09:22','2012-03-06 20:31:51',1,661,'2012-02-29 16:09:00'),
	(771,704,NULL,'Created new Estimate',2,2,'2012-02-29 16:09:42','2012-02-29 16:09:42',1,NULL,NULL),
	(772,704,4,'check back with merv.',2,2,'2012-02-29 17:09:36','2012-03-09 20:38:38',1,661,'2012-03-09 16:09:00'),
	(773,705,NULL,'Created new Estimate',2,2,'2012-02-29 17:12:03','2012-02-29 17:12:03',1,NULL,NULL),
	(774,705,3,'',2,2,'2012-02-29 17:12:30','2012-03-05 20:42:11',1,662,'2012-03-17 16:12:00'),
	(775,706,NULL,'Created new Estimate',2,2,'2012-02-29 17:13:38','2012-02-29 17:13:38',1,NULL,NULL),
	(776,NULL,3,'',2,2,'2012-02-29 17:16:00','2012-03-06 18:02:41',1,663,'2012-03-20 16:15:00'),
	(777,707,NULL,'Created new Estimate',2,2,'2012-02-29 17:16:15','2012-02-29 17:16:15',1,NULL,NULL),
	(778,707,3,'',2,2,'2012-02-29 17:17:11','2012-03-05 20:40:59',1,663,'2012-03-20 16:16:00'),
	(779,NULL,3,'',2,2,'2012-02-29 17:18:44','2012-02-29 17:18:44',NULL,664,'2012-03-23 16:18:00'),
	(780,708,NULL,'Created new Estimate',2,2,'2012-02-29 17:19:00','2012-02-29 17:19:00',1,NULL,NULL),
	(781,709,NULL,'Created new Estimate',2,2,'2012-02-29 17:21:03','2012-02-29 17:21:03',1,NULL,NULL),
	(782,709,4,'',2,2,'2012-02-29 17:22:18','2012-03-05 20:50:59',1,665,'2012-03-01 17:21:00'),
	(783,710,NULL,'Created new Estimate',2,2,'2012-02-29 17:29:55','2012-02-29 17:29:55',1,NULL,NULL),
	(784,710,4,'',2,2,'2012-02-29 17:33:14','2012-03-05 20:49:23',1,666,'2012-03-02 17:29:00'),
	(785,711,NULL,'Created new Estimate',2,2,'2012-02-29 17:33:41','2012-02-29 17:33:41',1,NULL,NULL),
	(786,712,NULL,'Created new Estimate',2,2,'2012-02-29 17:42:44','2012-02-29 17:42:44',1,NULL,NULL),
	(787,709,3,'CALL BACK MID MARCH',2,2,'2012-02-29 18:06:31','2012-03-06 17:19:44',1,665,'2012-03-09 18:05:00'),
	(788,713,NULL,'Created new Estimate',2,2,'2012-02-29 18:30:03','2012-02-29 18:30:03',1,NULL,NULL),
	(789,714,NULL,'Created new Estimate',2,2,'2012-02-29 18:55:00','2012-02-29 18:55:00',1,NULL,NULL),
	(790,715,NULL,'Created new Estimate',2,2,'2012-02-29 19:46:12','2012-02-29 19:46:12',1,NULL,NULL),
	(791,716,NULL,'Created new Estimate',2,2,'2012-03-01 13:35:31','2012-03-01 13:35:31',1,NULL,NULL),
	(792,717,NULL,'Created new Estimate',2,2,'2012-03-01 13:37:01','2012-03-01 13:37:01',1,NULL,NULL),
	(793,718,NULL,'Created new Estimate',2,2,'2012-03-01 17:35:44','2012-03-01 17:35:44',1,NULL,NULL),
	(794,719,NULL,'Created new Estimate',2,2,'2012-03-01 18:19:18','2012-03-01 18:19:18',1,NULL,NULL),
	(795,719,4,'13\'X25\' AREA 3\'\' STONE,  12\' WIDE FABRIC,               455.00',2,2,'2012-03-01 18:30:15','2012-03-01 18:30:15',NULL,673,'2012-03-05 18:19:00'),
	(796,720,NULL,'Created new Estimate',2,2,'2012-03-01 18:40:08','2012-03-01 18:40:08',1,NULL,NULL),
	(797,721,NULL,'Created new Estimate',2,2,'2012-03-01 19:20:58','2012-03-01 19:20:58',1,NULL,NULL),
	(798,721,4,'',2,2,'2012-03-01 19:25:21','2012-03-05 20:43:21',1,675,'2012-03-09 19:24:00'),
	(799,722,NULL,'Created new Estimate',2,2,'2012-03-01 21:29:56','2012-03-01 21:29:56',1,NULL,NULL),
	(800,723,NULL,'Created new Estimate',2,2,'2012-03-02 20:36:01','2012-03-02 20:36:01',1,NULL,NULL),
	(801,723,4,'GETTING PERMIT , CALL BACK ON MAR 30TH',2,2,'2012-03-02 20:39:23','2012-03-02 20:39:23',NULL,677,'2012-03-30 19:36:00'),
	(802,724,NULL,'Created new Estimate',2,2,'2012-03-04 21:49:22','2012-03-04 21:49:22',1,NULL,NULL),
	(803,725,NULL,'Created new Estimate',2,2,'2012-03-04 21:51:17','2012-03-04 21:51:17',1,NULL,NULL),
	(804,725,4,'CALL BACK TO SCHEDULE WED, MAR 7',2,2,'2012-03-04 21:53:54','2012-03-09 20:15:40',1,678,'2012-03-07 21:53:00'),
	(805,NULL,1,'swingset base , from waterloo',2,2,'2012-03-05 12:18:31','2012-03-05 12:18:31',NULL,679,'2012-03-05 12:17:00'),
	(806,NULL,3,'CALL WITH QUOTE, FOR PAD AND TAKING OUT OLD SHED',2,2,'2012-03-05 12:27:29','2012-03-06 19:35:11',1,680,'2012-03-05 12:26:00'),
	(807,NULL,4,'HAD HIM ON THE SCHEDULE, BUT DUE TO HOSPITAL WASNT ABLE TO PRSURE NOW READY.',2,2,'2012-03-05 12:31:14','2012-03-06 20:12:09',1,681,'2012-03-05 12:30:00'),
	(808,NULL,4,'',2,2,'2012-03-05 12:33:13','2012-03-06 18:01:06',1,681,'2012-03-05 12:33:00'),
	(809,NULL,1,'',2,2,'2012-03-05 15:21:27','2012-03-05 15:21:27',NULL,679,'2012-03-05 15:20:00'),
	(810,726,NULL,'Created new Estimate',2,2,'2012-03-05 16:15:03','2012-03-05 16:15:03',1,NULL,NULL),
	(811,689,7,'',2,2,'2012-03-05 18:00:28','2012-03-05 18:00:28',NULL,645,'2012-03-05 17:58:00'),
	(812,727,NULL,'Created new Estimate',2,2,'2012-03-05 18:53:29','2012-03-05 18:53:29',1,NULL,NULL),
	(813,727,4,'WAITING ON PERMIT',2,2,'2012-03-05 19:04:29','2012-03-06 17:20:03',1,684,'2012-03-30 17:53:00'),
	(814,728,NULL,'Created new Estimate',2,2,'2012-03-05 19:57:13','2012-03-05 19:57:13',1,NULL,NULL),
	(815,699,3,'CALL BACK MAR. 30TH',2,2,'2012-03-05 20:38:51','2012-03-05 20:38:51',NULL,656,'2012-03-30 19:38:00'),
	(816,707,4,'CALL BACK TO POSS. SCHEDULE, MAR 20TH',2,2,'2012-03-05 20:40:42','2012-03-05 20:40:42',NULL,663,'2012-03-20 19:39:00'),
	(817,706,4,'CALL TO POSS, SCHEDULE MAR. 17',2,2,'2012-03-05 20:41:59','2012-03-05 21:03:14',1,662,'2012-03-17 19:41:00'),
	(818,721,4,'CALL BACK TO POSS SCHEDULE ON MAR 9TH',2,2,'2012-03-05 20:43:01','2012-03-09 20:40:25',1,675,'2012-03-09 20:42:00'),
	(820,711,3,'LOOKING AT SITE ON MAR 6',2,2,'2012-03-05 20:48:15','2012-03-06 20:31:15',1,666,'2012-03-06 20:47:00'),
	(821,711,3,'LOOKING AT SITE MAR 6',2,2,'2012-03-05 20:49:11','2012-03-05 20:49:30',1,666,'2012-03-05 20:48:00'),
	(822,709,3,'CALL TO POSS SCHEDULE MAR 9',2,2,'2012-03-05 20:50:34','2012-03-13 21:05:14',1,665,'2012-03-09 20:49:00'),
	(823,727,4,'WAITING ON PERMIT , CALL BACK ON MAR 30TH',2,2,'2012-03-05 20:52:07','2012-03-05 20:52:07',NULL,684,'2012-03-30 19:51:00'),
	(824,691,4,'SELLING A FEW MOWERS 1ST. CHECK BACK MAR 30TH',2,2,'2012-03-05 20:57:16','2012-03-05 20:57:16',NULL,646,'2012-03-30 19:52:00'),
	(826,706,4,'CALL BACK TO POSS SCHEDULE MAR 17',2,2,'2012-03-05 21:02:55','2012-03-05 21:02:55',NULL,662,'2012-03-17 20:02:00'),
	(827,700,4,'LOOKED AT JOB , POSS SCHEDULE ON MAR 9',2,2,'2012-03-05 21:14:51','2012-03-05 21:14:51',NULL,657,'2012-03-09 21:13:00'),
	(829,NULL,1,'',2,2,'2012-03-06 17:18:48','2012-03-06 18:00:48',1,688,'2012-03-06 17:18:00'),
	(830,NULL,4,'',2,2,'2012-03-06 17:21:30','2012-03-06 18:00:58',1,688,'2012-03-06 17:21:00'),
	(831,730,NULL,'Created new Estimate',2,2,'2012-03-06 17:38:06','2012-03-06 17:38:06',1,NULL,NULL),
	(832,731,NULL,'Created new Estimate',2,2,'2012-03-06 17:40:28','2012-03-06 17:40:28',1,NULL,NULL),
	(833,NULL,1,'',2,2,'2012-03-06 18:00:18','2012-03-06 18:10:45',1,688,'2012-03-06 17:59:00'),
	(834,NULL,1,'CALL FOR DETAILS',2,2,'2012-03-06 18:09:31','2012-03-06 19:34:55',1,688,'2012-03-06 18:08:00'),
	(835,732,NULL,'Created new Estimate',2,2,'2012-03-06 18:31:31','2012-03-06 18:31:31',1,NULL,NULL),
	(836,732,4,'WAITING TILL AFTER TAXES,  POSS SCHEDULE  APR 27\r\nDISPOSAL OF EXISTING 8X12 SHED    200.00',2,2,'2012-03-06 18:40:18','2012-03-06 18:40:18',NULL,680,'2012-04-27 17:31:00'),
	(837,733,NULL,'Created new Estimate',2,2,'2012-03-06 19:05:41','2012-03-06 19:05:41',1,NULL,NULL),
	(838,734,NULL,'Created new Estimate',2,2,'2012-03-06 19:10:18','2012-03-06 19:10:18',1,NULL,NULL),
	(839,735,NULL,'Created new Estimate',2,2,'2012-03-06 19:26:56','2012-03-06 19:26:56',1,NULL,NULL),
	(840,736,NULL,'Created new Estimate',2,2,'2012-03-06 19:31:53','2012-03-06 19:31:53',1,NULL,NULL),
	(841,736,4,'CHECKING WITH TOWNSHIP, CALL MAR 8TH \r\nDRIVEWAY , AND PAD',2,2,'2012-03-06 19:34:26','2012-03-13 21:04:47',1,688,'2012-03-08 19:33:00'),
	(842,737,NULL,'Created new Estimate',2,2,'2012-03-06 19:44:54','2012-03-06 19:44:54',1,NULL,NULL),
	(843,738,NULL,'Created new Estimate',2,2,'2012-03-06 19:48:37','2012-03-06 19:48:37',1,NULL,NULL),
	(844,719,4,'call back mar 9th ',2,2,'2012-03-06 20:30:42','2012-03-09 20:28:53',1,673,'2012-03-09 20:28:00'),
	(845,739,NULL,'Created new Estimate',2,2,'2012-03-06 20:52:19','2012-03-06 20:52:19',1,NULL,NULL),
	(846,739,4,'TALKING TO WIFE, CALL TO SCHEDULE MAR 7',2,2,'2012-03-06 20:54:55','2012-03-09 01:30:38',1,689,'2012-03-07 20:52:00'),
	(848,741,NULL,'Created new Estimate',2,2,'2012-03-06 22:21:27','2012-03-06 22:21:27',1,NULL,NULL),
	(849,741,4,'TAKING DOWN EXISTING SHED ,  POSS SCHEDULE MAR 16',2,2,'2012-03-06 22:23:41','2012-03-06 22:23:41',NULL,691,'2012-03-16 21:21:00'),
	(850,741,4,'6X6 TIMBER BORDER',2,2,'2012-03-06 22:25:53','2012-03-07 14:56:00',1,691,'2012-03-06 22:25:00'),
	(851,736,4,'6X6 BORDER',2,2,'2012-03-06 22:31:00','2012-03-06 22:31:00',NULL,688,'2012-03-08 22:27:00'),
	(852,742,NULL,'Created new Estimate',2,2,'2012-03-07 14:04:29','2012-03-07 14:04:29',1,NULL,NULL),
	(853,743,NULL,'Created new Estimate',2,2,'2012-03-07 14:05:11','2012-03-07 14:05:11',1,NULL,NULL),
	(854,744,NULL,'Created new Estimate',2,2,'2012-03-07 14:36:22','2012-03-07 14:36:22',1,NULL,NULL),
	(855,744,4,'10x12 build up job, 3 men 6hr ,getting permit on wed 14  poss. schedule  on the 16',2,3,'2012-03-07 14:51:36','2012-03-07 14:51:36',NULL,658,'2012-03-16 13:49:00'),
	(856,741,4,'6x6 border, poss.sched mar16',2,2,'2012-03-07 14:55:40','2012-03-07 14:55:40',NULL,691,'2012-03-16 13:54:00'),
	(857,745,NULL,'Created new Estimate',2,2,'2012-03-07 15:35:28','2012-03-07 15:35:28',1,NULL,NULL),
	(858,746,NULL,'Created new Estimate',2,2,'2012-03-07 15:39:40','2012-03-07 15:39:40',1,NULL,NULL),
	(859,746,4,'conferming with wife, schedule on mar 7 or 8',2,2,'2012-03-07 15:50:16','2012-03-09 20:19:24',1,693,'2012-03-08 15:39:00'),
	(860,747,NULL,'Created new Estimate',2,2,'2012-03-07 16:21:58','2012-03-07 16:21:58',1,NULL,NULL),
	(861,748,NULL,'Created new Estimate',2,2,'2012-03-08 22:42:56','2012-03-08 22:42:56',1,NULL,NULL),
	(862,749,NULL,'Created new Estimate',2,2,'2012-03-08 22:45:47','2012-03-08 22:45:47',1,NULL,NULL),
	(863,NULL,1,'NEEDS A PRICE ON A 16X21 PAD',2,2,'2012-03-09 00:57:35','2012-03-12 14:34:58',1,697,'2012-03-10 00:56:00'),
	(864,NULL,1,'NEEDS PRICE ON PAD  MAR 9',2,2,'2012-03-09 01:01:13','2012-03-12 14:35:40',1,698,'2012-03-10 01:00:00'),
	(865,750,NULL,'Created new Estimate',2,2,'2012-03-09 01:08:01','2012-03-09 01:08:01',1,NULL,NULL),
	(866,751,NULL,'Created new Estimate',2,2,'2012-03-09 01:09:44','2012-03-09 01:09:44',1,NULL,NULL),
	(867,NULL,1,'CALL BACK NEEDS PRICE 10X14 PAD  MAR 9',2,2,'2012-03-09 01:21:17','2012-03-12 18:26:09',1,700,'2012-03-10 01:20:00'),
	(868,752,NULL,'Created new Estimate',2,2,'2012-03-09 01:24:24','2012-03-09 01:24:24',1,NULL,NULL),
	(869,NULL,1,'NEEDS LANDSCAPING DONE, MAR 9',2,2,'2012-03-09 01:33:39','2012-03-13 21:05:38',1,701,'2012-03-10 01:33:00'),
	(870,725,3,'call back on monday poss schedule ',2,2,'2012-03-09 16:20:31','2012-03-09 20:15:55',1,678,'2012-03-12 14:45:00'),
	(871,753,NULL,'Created new Estimate',2,2,'2012-03-09 18:40:51','2012-03-09 18:40:51',1,NULL,NULL),
	(872,754,NULL,'Created new Estimate',2,2,'2012-03-09 18:44:16','2012-03-09 18:44:16',1,NULL,NULL),
	(873,753,4,'CHECKING WITH WIFE   MAR 12',2,2,'2012-03-09 19:04:13','2012-03-09 19:04:13',NULL,702,'2012-03-12 18:03:00'),
	(874,755,NULL,'Created new Estimate',2,2,'2012-03-09 19:30:04','2012-03-09 19:30:04',1,NULL,NULL),
	(875,756,NULL,'Created new Estimate',2,2,'2012-03-09 19:59:33','2012-03-09 19:59:33',1,NULL,NULL),
	(876,757,NULL,'Created new Estimate',2,2,'2012-03-09 20:03:32','2012-03-09 20:03:32',1,NULL,NULL),
	(877,757,3,'THEY WILL CALL TO SCHEDULE, SOMETIME IN MAR. COMPARING BETWEEN MORNING STAR AND PENN DUTCH.',2,2,'2012-03-09 20:07:14','2012-03-12 15:01:41',1,704,'2012-03-16 19:03:00'),
	(878,719,4,'TOUCHED BASE ON THE 9  ,  CALL BACK AGAIN ON MAR 12',2,2,'2012-03-09 20:12:25','2012-03-09 20:12:25',NULL,673,'2012-03-12 19:10:00'),
	(879,725,3,'CALLED 2ND TIME , CALL BACK MAR 12',2,2,'2012-03-09 20:15:23','2012-03-09 20:15:23',NULL,678,'2012-03-12 19:12:00'),
	(880,746,3,'CALLED 2 TIME, CALL BACK MAR 12',2,2,'2012-03-09 20:18:51','2012-03-12 18:08:22',1,693,'2012-03-12 19:17:00'),
	(881,736,3,'CALLED 2 TIME, CALL BACK MAR 12 ',2,2,'2012-03-09 20:22:37','2012-03-13 21:04:56',1,688,'2012-03-12 19:20:00'),
	(882,704,3,'CUSTOMER STILL DECIDING .  CHECK BACK  ON MAR 16',2,2,'2012-03-09 20:38:00','2012-03-09 20:38:00',NULL,661,'2012-03-16 19:37:00'),
	(883,721,3,'DON T HAVE HIS PHONE #',2,2,'2012-03-09 20:40:05','2012-03-13 21:05:02',1,675,'2012-03-09 20:39:00'),
	(884,758,NULL,'Created new Estimate',2,2,'2012-03-09 20:47:40','2012-03-09 20:47:40',1,NULL,NULL),
	(885,759,NULL,'Created new Estimate',2,2,'2012-03-09 20:50:23','2012-03-09 20:50:23',1,NULL,NULL),
	(886,760,NULL,'Created new Estimate',2,2,'2012-03-09 20:50:49','2012-03-09 20:50:49',1,NULL,NULL),
	(887,760,4,'CHECKING WITH WIFE , CALL TO POSS SCHEDULE MAR 12',2,2,'2012-03-09 20:58:01','2012-03-12 14:34:50',1,697,'2012-03-12 19:50:00'),
	(888,761,NULL,'Created new Estimate',2,2,'2012-03-12 13:34:48','2012-03-12 13:34:48',1,NULL,NULL),
	(889,761,4,'looking at job, on  tue 13 ',2,2,'2012-03-12 13:47:39','2012-03-13 20:59:07',1,705,'2012-03-13 13:34:00'),
	(890,761,4,'looking at job, on  tue 13 ',2,2,'2012-03-12 13:47:43','2012-03-12 18:14:47',1,705,'2012-03-13 13:34:00'),
	(891,762,NULL,'Created new Estimate',2,2,'2012-03-12 14:21:30','2012-03-12 14:21:30',1,NULL,NULL),
	(892,763,NULL,'Created new Estimate',2,2,'2012-03-12 14:24:41','2012-03-12 14:24:41',1,NULL,NULL),
	(893,764,NULL,'Created new Estimate',2,2,'2012-03-12 15:20:06','2012-03-12 15:20:06',1,NULL,NULL),
	(894,765,NULL,'Created new Estimate',2,2,'2012-03-12 15:22:32','2012-03-12 15:22:32',1,NULL,NULL),
	(895,766,NULL,'Created new Estimate',2,2,'2012-03-12 15:23:30','2012-03-12 15:23:30',1,NULL,NULL),
	(896,766,4,'DOG RUN 18X24     3\'\' 2 A STONE 250 LESS,     CHECK BACK MAR 21 ',2,2,'2012-03-12 15:30:02','2012-03-12 15:30:02',NULL,706,'2012-03-21 15:23:00'),
	(897,767,NULL,'Created new Estimate',2,2,'2012-03-12 15:53:50','2012-03-12 15:53:50',1,NULL,NULL),
	(898,767,4,'CLOSE TO TREES , SCHEDULE FOR MAR 19?',2,2,'2012-03-12 15:57:37','2012-03-12 15:57:37',NULL,707,'2012-03-19 15:53:00'),
	(899,768,NULL,'Created new Estimate',2,2,'2012-03-12 16:09:01','2012-03-12 16:09:01',1,NULL,NULL),
	(900,769,NULL,'Created new Estimate',2,2,'2012-03-12 16:09:51','2012-03-12 16:09:51',1,NULL,NULL),
	(901,770,NULL,'Created new Estimate',2,2,'2012-03-12 17:37:32','2012-03-12 17:37:32',1,NULL,NULL),
	(902,771,NULL,'Created new Estimate',2,2,'2012-03-12 18:03:42','2012-03-12 18:03:42',1,NULL,NULL),
	(903,771,4,'CHECKING WITH WIFE , HE S GOT ABOUT A 14\'\' SLOPE , SCH.WED. MAR 14 FOR MAR 20TH',2,2,'2012-03-12 18:07:33','2012-03-14 20:53:39',1,710,'2012-03-13 18:03:00'),
	(904,772,NULL,'Created new Estimate',2,2,'2012-03-12 18:19:20','2012-03-12 18:19:20',1,NULL,NULL),
	(905,773,NULL,'Created new Estimate',2,2,'2012-03-12 18:21:06','2012-03-12 18:21:06',1,NULL,NULL),
	(906,773,3,'ELMER CONFERMING WITH CUSTOMER   CALL BACK  FRI 16',2,2,'2012-03-12 18:25:37','2012-03-12 18:25:37',NULL,700,'2012-03-16 18:21:00'),
	(907,774,NULL,'Created new Estimate',2,2,'2012-03-13 13:32:55','2012-03-13 13:32:55',1,NULL,NULL),
	(908,774,4,'CHECKING OUT OTHER PRICES, CALL BACK MAR 23',2,2,'2012-03-13 13:34:54','2012-03-13 13:34:54',NULL,711,'2012-03-23 13:32:00'),
	(910,776,NULL,'Created new Estimate',2,2,'2012-03-13 19:57:31','2012-03-13 19:57:31',1,NULL,NULL),
	(911,736,3,'CALLED LEFT A MESSAGE 3RD TIME , CALL BACK  MAR 16',2,2,'2012-03-13 21:04:23','2012-03-13 21:04:23',NULL,688,'2012-03-13 21:02:00'),
	(912,777,NULL,'Created new Estimate',2,2,'2012-03-13 22:24:30','2012-03-13 22:24:30',1,NULL,NULL),
	(913,778,NULL,'Created new Estimate',2,2,'2012-03-13 22:41:44','2012-03-13 22:41:44',1,NULL,NULL),
	(914,779,NULL,'Created new Estimate',2,2,'2012-03-14 15:31:23','2012-03-14 15:31:23',1,NULL,NULL),
	(915,780,NULL,'Created new Estimate',2,2,'2012-03-14 15:34:57','2012-03-14 15:34:57',1,NULL,NULL),
	(916,780,4,'A LITTLE PRICEY CHECKING WITH WIFE. CALL BACK FRI MAR 16',2,2,'2012-03-14 15:37:33','2012-03-14 15:37:33',NULL,714,'2012-03-16 15:34:00'),
	(917,781,NULL,'Created new Estimate',2,2,'2012-03-14 16:31:09','2012-03-14 16:31:09',1,NULL,NULL),
	(918,782,NULL,'Created new Estimate',2,2,'2012-03-14 19:34:08','2012-03-14 19:34:08',1,NULL,NULL),
	(919,782,4,'ORDERING SHED TOMORROW WILL CALL TO SCH. CALL BACK FRI MAR  16',2,2,'2012-03-14 19:37:54','2012-03-14 19:37:54',NULL,716,'2012-03-15 19:34:00'),
	(920,783,NULL,'Created new Estimate',2,2,'2012-03-14 20:08:09','2012-03-14 20:08:09',1,NULL,NULL),
	(921,725,1,'ready to schedule! mar 15',2,2,'2012-03-14 20:55:52','2012-03-14 20:55:52',NULL,678,'2012-03-15 20:55:00'),
	(922,784,NULL,'Created new Estimate',2,2,'2012-03-14 22:07:53','2012-03-14 22:07:53',1,NULL,NULL),
	(923,785,NULL,'Created new Estimate',2,2,'2012-03-14 22:14:01','2012-03-14 22:14:01',1,NULL,NULL),
	(924,786,NULL,'Created new Estimate',2,2,'2012-03-15 17:43:50','2012-03-15 17:43:50',1,NULL,NULL),
	(925,786,4,'DISPOSE OF EXISTING SHED 500.00 , CALL BACK MAR 23',2,2,'2012-03-15 17:51:02','2012-03-15 17:51:02',NULL,719,'2012-03-16 17:43:00'),
	(926,787,NULL,'Created new Estimate',2,2,'2012-03-15 17:58:17','2012-03-15 17:58:17',1,NULL,NULL),
	(927,788,NULL,'Created new Estimate',2,2,'2012-03-15 17:59:27','2012-03-15 17:59:27',1,NULL,NULL),
	(928,788,4,'CHECK BACK APRI    SOMETIME, ',2,2,'2012-03-15 18:01:17','2012-03-15 18:01:17',NULL,720,'2012-04-23 17:59:00'),
	(929,789,NULL,'Created new Estimate',2,2,'2012-03-15 21:27:21','2012-03-15 21:27:21',1,NULL,NULL),
	(930,789,4,'GETTING IT THROUGH H.O.A FIRST, CALL BACK MAR 30TH',2,2,'2012-03-15 21:32:17','2012-03-15 21:32:17',NULL,721,'2012-03-30 21:27:00'),
	(931,790,NULL,'Created new Estimate',2,2,'2012-03-15 21:40:14','2012-03-15 21:40:14',1,NULL,NULL);

/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table trucks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trucks`;

CREATE TABLE `trucks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `crew_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `trucks` WRITE;
/*!40000 ALTER TABLE `trucks` DISABLE KEYS */;

INSERT INTO `trucks` (`id`, `name`, `phone`, `color`, `created_at`, `updated_at`, `crew_id`)
VALUES
	(1,'little jr.','','','2011-01-06 14:46:58','2011-01-06 14:46:58',NULL);

/*!40000 ALTER TABLE `trucks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`)
VALUES
	(1,'Kevin Hopkins','kevin@wearefound.com','$2a$10$6/WOR5GSlP1uGtNTtJQ8MuzYz.YWHOwvrFwdMRCpRwFIKs4cfbfM2',NULL,NULL,NULL,4,'2012-03-08 18:54:36','2012-03-06 18:32:34','127.0.0.1','127.0.0.1','2012-03-02 18:01:37','2012-03-08 18:54:36'),
	(2,'Eli Stoltzfus','stoltzfus@abundantscapes.com','$2a$10$9KyrkF/YIgfmUvFob8ooNezi7Xz5cKBoMu7Ke03XWbG/YbnBvu7D6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-02 18:04:06','2012-03-02 18:04:06'),
	(3,'Wilmer Stoltzfus','wilmer@abundantscapes.com','$2a$10$98bDs/711ZJ5.zqIrZxUz.n7coPUqtc8Wf2ZhTpDkLH9UzlUlH8jC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-02 18:02:48','2012-03-02 18:03:14');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
