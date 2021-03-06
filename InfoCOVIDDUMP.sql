-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: COVID Predictor
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table CASES
--

DROP TABLE IF EXISTS CASES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE CASES (
  CASE_NO int NOT NULL,
  STATE_NAME varchar(45) DEFAULT NULL,
  PRIMARY KEY (CASE_NO), 
  foreign key (STATE_NAME) REFERENCES STATES(STATE_NAME)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table CASES
--

LOCK TABLES CASES WRITE;
/*!40000 ALTER TABLE CASES DISABLE KEYS */;
INSERT INTO CASES VALUES (1234,'WA'),(1937,'VT'),(2342,'MA'),(2352,'ME'),(2463,'OR'),(2532,'AR'),(3425,'OK'),(3453,'WY'),(3463,'IA'),(4534,'RI '),(4564,'MN'),(5343,'HI'),(5937,'ME'),(6754,'CA'),(7435,'TN'),(8974,'DE'),(9025,'WY'),(9625,'NH'),(10980,'AK'),(14031,'HI'),(16370,'DC'),(20081,'WV'),(22821,'MT'),(23093,'DE'),(27691,'RI'),(31978,'ND'),(33269,'SD'),(36788,'NM'),(39532,'OR'),(53092,'ID'),(58068,'NE'),(62830,'CT'),(70268,'KS'),(85279,'CO'),(87607,'KY'),(90261,'NV'),(94394,'UT'),(98201,'WA'),(99066,'AR'),(107299,'OK'),(107335,'IA'),(110006,'MS'),(122812,'MN'),(135657,'MD'),(143660,'MA'),(147582,'IN'),(158955,'MO'),(161105,'MI'),(163990,'SC'),(165676,'VA'),(166186,'WI'),(172626,'AL'),(175781,'LA'),(181787,'OH'),(186754,'PA'),(219647,'NJ'),(228744,'TN'),(231149,'AZ'),(246028,'NC'),(340558,'GA'),(347631,'IL'),(484281,'NY'),(755020,'FL'),(854006,'TX'),(875692,'CA');
/*!40000 ALTER TABLE CASES ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table COVID_SEVERITY
--

DROP TABLE IF EXISTS COVID_SEVERITY;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE COVID_SEVERITY (
  COVID_SEVERITY varchar(45) NOT NULL,
  CASE_NO int NOT NULL,
  DEATH_NO int NOT NULL,
  PRIMARY KEY (COVID_SEVERITY),
  FOREIGN KEY (DEATH_NO) REFERENCES DEATHS(DEATH_NO), 
  FOREIGN KEY (CASE_NO) REFERENCES CASES(CASE_NO) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table COVID_SEVERITY
--

LOCK TABLES COVID_SEVERITY WRITE;
/*!40000 ALTER TABLE COVID_SEVERITY DISABLE KEYS */;
INSERT INTO COVID_SEVERITY VALUES ('Mild', 4732,155896),('Severe', 168754, 256408),('Medium', 57890, 398670);
/*!40000 ALTER TABLE COVID_SEVERITY ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table DEATHS
--

DROP TABLE IF EXISTS DEATHS;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE DEATHS (
  DEATH_NO int NOT NULL,
  PRIMARY KEY (DEATH_NO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table DEATHS
--

LOCK TABLES DEATHS WRITE;
/*!40000 ALTER TABLE DEATHS DISABLE KEYS */;
INSERT INTO DEATHS VALUES (9),(10),(11),(13),(15),(17),(22),(23),(27),(28),(29),(30),(34),(37),(38),(40),(41),(42),(43),(45),(49),(53),(56),(57),(58),(60),(66),(67),(68),(71),(72),(73),(74),(75),(80),(91),(107),(109),(124),(127),(141),(171),(183);
/*!40000 ALTER TABLE DEATHS ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table GLOBAL_POP
--

DROP TABLE IF EXISTS GLOBAL_POP;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE GLOBAL_POP (
  GLOBALPOP_NO int NOT NULL,
  HEALTH_ISSUES int DEFAULT NULL,
  DEATH_NO int NOT NULL,
  CASE_NO int NOT NULL,
  PRIMARY KEY (GLOBALPOP_NO),
  FOREIGN KEY (DEATH_NO) REFERENCES DEATHS(DEATH_NO), 
  FOREIGN KEY (CASE_NO) REFERENCES CASES(CASE_NO) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table GLOBAL_POP
--

LOCK TABLES GLOBAL_POP WRITE;
/*!40000 ALTER TABLE GLOBAL_POP DISABLE KEYS */;
/*!40000 ALTER TABLE GLOBAL_POP ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table GLOBAL_POP_has_PRE_EXISITING
--

DROP TABLE IF EXISTS GLOBAL_POP_has_PRE_EXISITING;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE GLOBAL_POP_has_PRE_EXISITING (
	HEALTH_ISSUES int DEFAULT NULL,
DEATH_NO int NOT NULL,
  FOREIGN KEY (HEALTH_ISSUES) REFERENCES PREEXISITING(HEALTH_ISSUES), 
  FOREIGN KEY (DEATH_NO) REFERENCES DEATHS(DEATH_NO) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table GLOBAL_POP_has_PRE_EXISITING
--

LOCK TABLES GLOBAL_POP_has_PRE_EXISITING WRITE;
/*!40000 ALTER TABLE GLOBAL_POP_has_PRE_EXISITING DISABLE KEYS */;
/*!40000 ALTER TABLE GLOBAL_POP_has_PRE_EXISITING ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table HOSPITALS
--

DROP TABLE IF EXISTS HOSPITALS;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE HOSPITALS (
  HOSPITAL_ID int NOT NULL,
  HOSPITAL_NAME varchar(45) NOT NULL,
  STATE_NAME varchar(45) NOT NULL,
  CASE_NO int NOT NULL,
  PRIMARY KEY (HOSPITAL_ID),
  FOREIGN KEY (STATE_NAME) REFERENCES STATES (STATE_NAME),
  FOREIGN KEY (CASE_NO) REFERENCES CASES (CASE_NO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table HOSPITALS
--

LOCK TABLES HOSPITALS WRITE;
/*!40000 ALTER TABLE HOSPITALS DISABLE KEYS */;
INSERT INTO HOSPITALS VALUES (1,'ZUNI COMPREHENSIVE COMMUNITY HEALTH CENTER','RI',3414),(2,'ZAMBARANO MEMORIAL HOSPITAL','LA',2278),(3,'ZACHARY - AMG SPECIALTY HOSPITAL','AZ',2356),(4,'YUMA REHABILITATION HOSPITAL','AZ',3126),(5,'YUMA REGIONAL MEDICAL CENTER','CO',3597),(6,'YUMA DISTRICT HOSPITAL','GA',3493),(7,'YOUTH VILLAGES - INNER HARBOUR CAMPUS','ME',2583),(8,'YORK HOSPITAL','PA',2701),(9,'YORK HOSPITAL','NE',3312),(10,'YORK GENERAL HOSPITAL','TX',3010),(11,'YOAKUM COUNTY HOSPITAL','TX',3781),(12,'YOAKUM COMMUNITY HOSPITAL','AZ',3387),(13,'YAVAPAI REGIONAL MEDICAL CENTER - EAST','AZ',3168),(14,'YAVAPAI REGIONAL MEDICAL CENTER','MS',3864),(15,'YALOBUSHA GENERAL HOSPITAL','CT',2341),(16,'YALE-NEW HAVEN HOSPITAL SAINT RAPHAEL CAMPUS','CT',3315),(17,'YALE-NEW HAVEN HOSPITAL','NC',2617),(18,'YADKIN VALLEY COMMUNITY HOSPITAL','VA',3076),(19,'WYTHE COUNTY COMMUNITY HOSPITAL','WY',5478),(20,'WYOMING STATE HOSPITAL','WY',1896),(1231,'ZUNI COMPREHENSIVE COMMUNITY HEALTH CENTER','RI',3414),(1358,'YALOBUSHA GENERAL HOSPITAL','CT',2341),(1373,'ZAMBARANO MEMORIAL HOSPITAL','LA',2278),(1465,'YUMA REGIONAL MEDICAL CENTER','CO',3597),(1512,'YUMA REHABILITATION HOSPITAL','AZ',3126),(1523,'YAVAPAI REGIONAL MEDICAL CENTER - EAST','AZ',3168),(1532,'ZACHARY - AMG SPECIALTY HOSPITAL','AZ',2356),(2111,'YUMA REHABILITATION HOSPITAL','AZ',3126),(2244,'YADKIN VALLEY COMMUNITY HOSPITAL','VA',3076),(2452,'YADKIN VALLEY COMMUNITY HOSPITAL','VA',3076),(2528,'ZUNI COMPREHENSIVE COMMUNITY HEALTH CENTER','RI',3414),(2857,'YORK HOSPITAL','PA',2701),(3122,'YOUTH VILLAGES - INNER HARBOUR CAMPUS','ME',2583),(3233,'YAVAPAI REGIONAL MEDICAL CENTER','MS',3864),(3373,'YORK HOSPITAL','NE',3312),(3374,'ZACHARY - AMG SPECIALTY HOSPITAL','AZ',2356),(3453,'WYTHE COUNTY COMMUNITY HOSPITAL','WY',5478),(3456,'YALOBUSHA GENERAL HOSPITAL','CT',2341),(4522,'ZAMBARANO MEMORIAL HOSPITAL','LA',2278),(4536,'YUMA REGIONAL MEDICAL CENTER','CO',3597),(4574,'YUMA DISTRICT HOSPITAL','GA',3493),(4634,'YALE-NEW HAVEN HOSPITAL','NC',2617),(4966,'YOAKUM COUNTY HOSPITAL','TX',3781),(5519,'YUMA DISTRICT HOSPITAL','GA',3493),(5595,'YALE-NEW HAVEN HOSPITAL','NC',2617),(5684,'YORK HOSPITAL','PA',2701),(5747,'YOUTH VILLAGES - INNER HARBOUR CAMPUS','ME',2583),(5989,'YALE-NEW HAVEN HOSPITAL SAINT RAPHAEL CAMPUS','CT',3315),(6345,'YALE-NEW HAVEN HOSPITAL SAINT RAPHAEL CAMPUS','CT',3315),(6534,'YOAKUM COMMUNITY HOSPITAL','AZ',3387),(6850,'YAVAPAI REGIONAL MEDICAL CENTER - EAST','AZ',3168),(7055,'WYTHE COUNTY COMMUNITY HOSPITAL','WY',5478),(7345,'YAVAPAI REGIONAL MEDICAL CENTER','MS',3864),(8208,'WYOMING STATE HOSPITAL','WY',1896),(8534,'YOAKUM COMMUNITY HOSPITAL','AZ',3387),(8568,'YORK GENERAL HOSPITAL','TX',3010),(8880,'YORK GENERAL HOSPITAL','TX',3010);
/*!40000 ALTER TABLE HOSPITALS ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table HOSPITALS_has_CASES
--

DROP TABLE IF EXISTS HOSPITALS_has_CASES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE HOSPITALS_has_CASES (
HOSPITAL_ID int NOT NULL,
CASE_NO int NOT NULL,
  FOREIGN KEY (HOSPITAL_ID) REFERENCES HOSPITALS (HOSPITAL_ID),
  FOREIGN KEY (CASE_NO) REFERENCES CASES (CASE_NO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table HOSPITALS_has_CASES
--

LOCK TABLES HOSPITALS_has_CASES WRITE;
/*!40000 ALTER TABLE HOSPITALS_has_CASES DISABLE KEYS */;
/*!40000 ALTER TABLE HOSPITALS_has_CASES ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table NATIONAL_POPULATION
--

DROP TABLE IF EXISTS NATIONAL_POPULATION;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE NATIONAL_POPULATION (
  POPULATION int NOT NULL,
  STATE_NAME varchar(45) NOT NULL,
  HEALTH_ISSUES int NOT NULL, 
  PRIMARY KEY (POPULATION),
  FOREIGN KEY (STATE_NAME) REFERENCES STATES (STATE_NAME),
  FOREIGN KEY (HEALTH_ISSUES) REFERENCES PRE_EXISITING (HEALTH_ISSUES)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table NATIONAL_POPULATION
--

LOCK TABLES NATIONAL_POPULATION WRITE;
/*!40000 ALTER TABLE NATIONAL_POPULATION DISABLE KEYS */;
/*!40000 ALTER TABLE NATIONAL_POPULATION ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table PATIENTS
--

DROP TABLE IF EXISTS PATIENTS;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE PATIENTS (
  PATIENT_ID int NOT NULL,
  PATIENT_SEX varchar(45) DEFAULT NULL,
  PATIENT_DOB datetime DEFAULT NULL,
  PATIENT_RACE varchar(45) DEFAULT NULL,
  HEALTH_ISSUES int NOT NULL, 
  COVID_SEVERITY varchar(45) NOT NULL, 
  STATE_NAME varchar(45) NOT NULL,
  PRIMARY KEY (PATIENT_ID),
  FOREIGN KEY (STATE_NAME) REFERENCES STATES (STATE_NAME),
  FOREIGN KEY (HEALTH_ISSUES) REFERENCES PRE_EXISITING (HEALTH_ISSUES),
  FOREIGN KEY (COVID_SEVERITY) REFERENCES COVID_SEVERITY (COVID_SEVERITY)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table PATIENTS
--

LOCK TABLES PATIENTS WRITE;
/*!40000 ALTER TABLE PATIENTS DISABLE KEYS */;
INSERT INTO PATIENTS VALUES (1,'Female','1986-01-15 00:00:00','Comanche','2','SEVERE','TX'),(2,'Male','1964-02-16 00:00:00','White','1','MEDIUM','OR'),(3,'Male','1974-12-30 00:00:00','White','0','MILD','MO'),(4,'Male','1981-02-28 00:00:00','Alaska Native','1','MEDIUM','NE'),(5,'Female','1999-03-23 00:00:00','Japanese','2','SEVERE','VA'),(6,'Male','1942-08-27 00:00:00','Laotian','2','SEVERE','CA'),(7,'Male','1987-01-24 00:00:00','Sioux','2','SEVERE','GA'),(8,'Male','1975-11-23 00:00:00','Chamorro','0','MILD','CA'),(9,'Male','1987-08-08 00:00:00','Cree','1','MEDIUM','IN'),(10,'Female','1942-04-23 00:00:00','Vietnamese','0','MILD','OR'),(11,'Female','1949-11-24 00:00:00','Alaska Native','2','SEVERE','MI'),(12,'Female','1954-05-15 00:00:00','Potawatomi','0','MILD','OH'),(13,'Male','1974-10-23 00:00:00','Honduran','2','SEVERE','WA'),(14,'Female','1998-01-12 00:00:00','Polynesian','3','SEVERE','UT'),(15,'Male','1980-06-21 00:00:00','Tohono O\'Odham','3','SEVERE','IL'),(16,'Male','1948-09-06 00:00:00','Polynesian','1','MEDIUM','MA'),(17,'Male','1978-10-21 00:00:00','Iroquois','1','MEDIUM','WA'),(18,'Female','1999-01-04 00:00:00','Salvadoran','1','MEDIUM','WI'),(19,'Male','1963-02-04 00:00:00','Choctaw','3','SEVERE','TX'),(20,'Male','1965-07-18 00:00:00','Alaska Native','1','MEDIUM','MT'),(21,'Female','1974-06-03 00:00:00','Venezuelan','1','MEDIUM','WA'),(22,'Male','1967-08-22 00:00:00','Yaqui','0','MILD','MN'),(23,'Female','1998-05-18 00:00:00','South American','3','SEVERE','NY'),(24,'Female','1990-09-17 00:00:00','Delaware','2','SEVERE','FL'),(25,'Male','1946-01-27 00:00:00','Peruvian','3','SEVERE','VA'),(26,'Female','1955-07-09 00:00:00','Asian Indian','0','MILD','MD'),(27,'Female','1944-03-09 00:00:00','Blackfeet','1','MEDIUM','AL'),(28,'Male','1963-11-26 00:00:00','Thai','3','SEVERE','GA'),(29,'Female','1982-09-05 00:00:00','Taiwanese','1','MEDIUM','NY'),(30,'Male','1942-07-09 00:00:00','Eskimo','1','MEDIUM','TX'),(31,'Male','1961-08-20 00:00:00','Hmong','3','SEVERE','LA'),(32,'Female','1974-01-29 00:00:00','Lumbee','3','SEVERE','MN'),(33,'Female','1974-11-21 00:00:00','Cherokee','1','MEDIUM','NY'),(34,'Male','1994-03-03 00:00:00','Cree','2','SEVERE','CA'),(35,'Female','1954-07-10 00:00:00','Blackfeet','1','MEDIUM','IN'),(36,'Male','1994-07-20 00:00:00','South American','0','MILD','TX'),(37,'Male','1993-10-20 00:00:00','Cuban','0','MILD','NC'),(38,'Female','1975-05-24 00:00:00','Tohono O\'Odham','2','SEVERE','NY'),(39,'Male','1959-01-10 00:00:00','Potawatomi','2','SEVERE','IA'),(40,'Male','1974-04-17 00:00:00','Thai','2','SEVERE','DE'),(41,'Female','1992-06-23 00:00:00','Ecuadorian','0','MILD','CA'),(42,'Female','1947-07-25 00:00:00','South American','2','SEVERE','MS'),(43,'Female','1975-12-29 00:00:00','Chickasaw','2','SEVERE','TN'),(44,'Male','1963-07-24 00:00:00','Ecuadorian','1','MEDIUM','MO'),(45,'Female','1967-02-17 00:00:00','Panamanian','2','SEVERE','CA'),(46,'Male','1976-09-30 00:00:00','White','2','SEVERE','MA'),(47,'Male','1981-06-28 00:00:00','Potawatomi','2','SEVERE','ID'),(48,'Female','1940-11-14 00:00:00','Cuban','1','MEDIUM','CA'),(49,'Female','1981-12-25 00:00:00','Shoshone','1','MEDIUM','KY'),(50,'Female','1967-09-04 00:00:00','Pueblo','2','SEVERE','LA'),(100,NULL,NULL,NULL,NULL,NULL,'WA'),(233,NULL,NULL,NULL,NULL,NULL,'AZ'),(234,NULL,NULL,NULL,NULL,NULL,'AZ'),(235,NULL,NULL,NULL,NULL,NULL,'AZ'),(236,NULL,NULL,NULL,NULL,NULL,'AZ');
/*!40000 ALTER TABLE PATIENTS ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENTS_has_PRE-EXISITING`
--

DROP TABLE IF EXISTS PATIENTS_has_PRE_EXISITING;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE PATIENTS_has_PRE_EXISITING (
PATIENT_ID int NOT NULL,
HEALTH_ISSUES int NOT NULL,
 FOREIGN KEY (HEALTH_ISSUES) REFERENCES PRE_EXISTING (HEALTH_ISSUES),
 FOREIGN KEY (PATIENT_ID) REFERENCES PATIENTS (PATIENT_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table PATIENTS_has_PRE_EXISITING
--

LOCK TABLES PATIENTS_has_PRE_EXISITING WRITE;
/*!40000 ALTER TABLE PATIENTS_has_PRE_EXISITING DISABLE KEYS */;
/*!40000 ALTER TABLE PATIENTS_has_PRE_EXISITING ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table PRE_EXISITING
--

DROP TABLE IF EXISTS PRE_EXISITING;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE PRE_EXISITING (
  HEALTH_ISSUES int NOT NULL,
  PRIMARY KEY (HEALTH_ISSUES)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table PRE-EXISITING
--

LOCK TABLES PRE_EXISITING WRITE;
/*!40000 ALTER TABLE PRE_EXISITING DISABLE KEYS */;
INSERT INTO PRE_EXISITING VALUES (0),(1),(2),(3);
/*!40000 ALTER TABLE PRE_EXISITING ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table SAFETY POLICIES
--

DROP TABLE IF EXISTS SAFETY_POLICIES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE SAFETY_POLICIES (
  POLICY_TYPE varchar(45) NOT NULL,
  STATE_NAME varchar(45) NOT NULL,
  PRIMARY KEY (POLICY_TYPE),
  FOREIGN KEY (STATE_NAME) REFERENCES STATES (STATE_NAME)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table SAFETY POLICIES
--

LOCK TABLES SAFETY_POLICIES WRITE;
/*!40000 ALTER TABLE SAFETY_POLICIES DISABLE KEYS */;
/*!40000 ALTER TABLE SAFETY_POLICIES ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table STATES`=
--

DROP TABLE IF EXISTS STATES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE STATES (
  STATE_NAME varchar(45) NOT NULL,
  STATE_POPULATION int DEFAULT NULL,
  CASE_NO int NOT NULL, 
  DEATH_NO int NOT NULL, 
  PRIMARY KEY (STATE_NAME),
  FOREIGN KEY (CASE_NO) REFERENCES CASES (CASE_NO),
  FOREIGN KEY (DEATH_NO) REFERENCES DEATHS(DEATH_NO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table STATES
--

LOCK TABLES STATES WRITE;
/*!40000 ALTER TABLE STATES DISABLE KEYS */;
INSERT INTO STATES VALUES ('AK',731545,10980,26279),('AL',4903185,172626,22899),('AR',7278717,99066,28004),('AZ',55641,231149,29172),('CA',3017825,875692,24156),('CO',39512223,85279,25180),('CT',5758736,62830,15106),('DC',973764,16370,26929),('DE',3565287,23093,24911),('FL',705749,755020,23760),('GA',21477737,340558,23295),('HI',10617423,14031,33004),('IA',12671821,107335,34050),('ID',165718,53092,21927),('IL',1415872,347631,26588),('IN',1787065,147582,20082),('KS',6732219,70268,20361),('KY',3155070,87607,26208),('LA',2913314,175781,26690),('MA',1344212,143660,22543),('MD',4648794,135657,29640),('ME',4467673,5937,26218),('MI',6045680,161105,33587),('MN',6949503,122812,33658),('MO',5639632,158955,21259),('MS',9986857,110006,25552),('MT',2976149,22821,19000),('NC',2096829,246028,27321),('ND',19453561,31978,17488),('NE',6137428,58068,19423),('NH',1934408,9625,18495),('NJ',3080156,219647,23062),('NM',1359711,36788,24904),('NV',1068778,90261,28398),('NY',8882190,484281,28680),('OH',10488084,181787,31038),('OK',762062,107299,32969),('OR',55194,39532,29211),('PA',11689100,186754,21793),('RI',3956971,27691,20832),('SC',4217737,163990,28919),('SD',12801989,33269,21836),('TN',3193694,228744,26826),('TX',1059361,854006,23837),('UT',5148714,94394,31533),('VA',6833174,165676,19397),('VT',884659,1937,22232),('WA',28995881,98201,27284),('WI',3205958,166186,23463),('WV',104914,20081,20217),('WY',623989,9025,24465);
/*!40000 ALTER TABLE STATES ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'COVID Predictor'
--

--
-- Dumping routines for database 'COVID Predictor'
--
/*!50003 DROP PROCEDURE IF EXISTS GetHospital */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER= CURRENT_USER PROCEDURE GetHospital(IN PATIENT_ID INT, IN STATE_NAME VARCHAR(45) )
BEGIN
INSERT INTO PATIENTS (PATIENT_ID, STATE_NAME)
VALUE (PATIENT_ID, STATE_NAME);	
SELECT DISTINCT H.HOSPITAL_NAME, H.STATE_NAME, H.CASE_NO	
FROM PATIENTS AS P JOIN HOSPITALS AS H
	ON P.STATE_NAME = H.STATE_NAME	
    WHERE P.STATE_NAME = STATE_NAME
    ORDER BY H.CASE_NO ASC; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-07 14:15:38
