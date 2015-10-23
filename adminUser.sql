-- Default "admin" user with password: "l3tm31n".

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'admin','admin',0,'9d3ebb53437c7e639a2a94d505d9a449d59b7212','PUBLIC',NULL,NULL,'admin@example.com',NULL,NULL,'Special Admin User','Admin','Joanne','Admin','f6fdffe48c908deb0f4c3bd36c032e72',NULL,NULL,NULL,NULL,NULL,NULL,2,'images/admin/',NULL,NULL,0,NULL,'2015-10-23 14:48:00',NULL,NULL,'2015-10-23 14:41:49','3',NULL,NULL);
UNLOCK TABLES;
