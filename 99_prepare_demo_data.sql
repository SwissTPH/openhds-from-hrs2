use openhds;
SELECT "CAUTION: this will truncate all tables in your openhds database, and update data in your hrs_mysql_db. If you really want to delete your data, remove line two in 99_prepare_demo_data.sql to proceed.";
#Remove this line to run the script;
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE AsyncTask;
TRUNCATE TABLE adultvpm;
TRUNCATE TABLE classExtension;
TRUNCATE TABLE death;
TRUNCATE TABLE demrates;
TRUNCATE TABLE extension;
TRUNCATE TABLE fieldworker;
TRUNCATE TABLE form;
TRUNCATE TABLE individual;
TRUNCATE TABLE inmigration;
TRUNCATE TABLE location;
TRUNCATE TABLE locationhierarchy;
TRUNCATE TABLE locationhierarchylevel;
TRUNCATE TABLE membership;
TRUNCATE TABLE neonatalvpm;
TRUNCATE TABLE note;
TRUNCATE TABLE outcome;
TRUNCATE TABLE outmigration;
TRUNCATE TABLE postneonatalvpm;
TRUNCATE TABLE pregnancyobservation;
TRUNCATE TABLE pregnancyoutcome;
TRUNCATE TABLE pregnancyoutcome_outcome;
TRUNCATE TABLE privilege;
TRUNCATE TABLE relationship;
TRUNCATE TABLE residency;
TRUNCATE TABLE role;
TRUNCATE TABLE role_privileges;
TRUNCATE TABLE round;
TRUNCATE TABLE socialgroup;
TRUNCATE TABLE user;
TRUNCATE TABLE user_roles;
TRUNCATE TABLE vaccination;
TRUNCATE TABLE visit;
TRUNCATE TABLE whitelist;

INSERT INTO `fieldworker` (`uuid`, `deleted`, `insertDate`, `voidDate`, `voidReason`, `extId`, `firstName`, `lastName`, `passwordHash`, `insertBy_uuid`, `voidBy_uuid`) VALUES
('ff808181547ae7c701547b78c1150012', 0, '2016-05-04', NULL, NULL, 'FWAD1', 'Admin', 'Data', '$2a$08$m/k/u4739d6wplA3hBpRE..lu7eTzl9nyAsXDKIQUW6NaWaUyxE5m', 'ff8081815462747d01546276bc260000', NULL);
INSERT INTO `fieldworker` VALUES ('UnknownFieldWorker',0,NULL,NULL,NULL,'UNK','Unknown','FieldWorker','invalid-password-hash',NULL,NULL);

INSERT INTO `individual` VALUES ('Unknown Individual',0,'2009-12-19',NULL,NULL,'PENDING',NULL,'1900-12-19',NULL,'UNK','Unknown','MALE','UNKNOWN',NULL,NULL,'User 1',NULL,'UnknownFieldWorker',NULL,NULL);
INSERT INTO `locationhierarchy` VALUES ('hierarchy1','SUI','Switzerland','hierarchyLevelId1','hierarchy_root'),('hierarchy2','NWS','NW','hierarchyLevelId2','hierarchy1'),('hierarchy3','BSL','Basel','hierarchyLevelId3','hierarchy2'),('hierarchy4','BSS','Basel-Stadt','hierarchyLevelId4','hierarchy3'),('hierarchy5_1','ISE','Iselin','hierarchyLevelId5','hierarchy4'),('hierarchy5_2','GTH','Gotthelf','hierarchyLevelId5','hierarchy4'),('hierarchy5_3','BCL','Bachletten','hierarchyLevelId5','hierarchy4'),('hierarchy5_4','GND','Gundeldingen','hierarchyLevelId5','hierarchy4'),('hierarchy_root','HIERARCHY_ROOT','',NULL,NULL);

INSERT INTO `locationhierarchylevel` VALUES ('hierarchyLevelId1',1,'Country'),('hierarchyLevelId2',2,'Region'),('hierarchyLevelId3',3,'District'),('hierarchyLevelId4',4,'Village'),('hierarchyLevelId5',5,'Subvillage');

INSERT INTO `privilege` VALUES ('PRIVILEGE1','CREATE_ENTITY'),('PRIVILEGE10','ACCESS_REPORTS'),('PRIVILEGE11','ACESSS_UTILITY_ROUTINES'),('PRIVILEGE12','ACESSS_CONFIGURATION'),('PRIVILEGE2','EDIT_ENTITY'),('PRIVILEGE3','DELETE_ENTITY'),('PRIVILEGE4','VIEW_ENTITY'),('PRIVILEGE5','CREATE_USER'),('PRIVILEGE6','DELETE_USER'),('PRIVILEGE7','ACCESS_BASELINE'),('PRIVILEGE8','ACCESS_UPDATE'),('PRIVILEGE9','ACCESS_AMENDMENT_FORMS');

INSERT INTO `role` VALUES ('ROLE1',0,NULL,NULL,NULL,'Administrator of OpenHDS','ADMINISTRATOR',NULL,NULL),('ROLE2',0,NULL,NULL,NULL,'Data Clerk of OpenHDS','DATA CLERK',NULL,NULL),('ROLE3',0,NULL,NULL,NULL,'Data Manager of OpenHDS','DATA MANAGER',NULL,NULL);
INSERT INTO `role_privileges` VALUES ('ROLE1','PRIVILEGE1'),('ROLE1','PRIVILEGE10'),('ROLE1','PRIVILEGE11'),('ROLE1','PRIVILEGE12'),('ROLE1','PRIVILEGE2'),('ROLE1','PRIVILEGE3'),('ROLE1','PRIVILEGE4'),('ROLE2','PRIVILEGE4'),('ROLE1','PRIVILEGE5'),('ROLE1','PRIVILEGE6'),('ROLE1','PRIVILEGE7'),('ROLE1','PRIVILEGE8'),('ROLE1','PRIVILEGE9');

INSERT INTO `user` VALUES ('ff8081815462747d01546276bc260000',0,'','Data',NULL,1462956801466,'Data','data','D6269297BDC64C540E04C09C9916C37E','data'),('User 1',0,'Administrator User','FirstName','Administrator',1461940806783,'LastName','test','3125A98D0E3564B4E15D940F7CEDDC1A','admin');
INSERT INTO `user_roles` VALUES ('ff8081815462747d01546276bc260000','ROLE1'),('User 1','ROLE1'),('ff8081815462747d01546276bc260000','ROLE2'),('ff8081815462747d01546276bc260000','ROLE3');
INSERT INTO `whitelist` VALUES ('LOCALHOST1','127.0.0.1'),('LOCALHOST2','localhost');

SET FOREIGN_KEY_CHECKS=1;

use hrs_mysql_db;
UPDATE location SET lowestLocationId='ISE' LIMIT 190;
UPDATE location SET lowestLocationId='GTH' WHERE lowestLocationId IS NULL LIMIT 190;
UPDATE location SET lowestLocationId='BCL' WHERE lowestLocationId IS NULL LIMIT 190;
UPDATE location SET lowestLocationId='GND' WHERE lowestLocationId IS NULL;
