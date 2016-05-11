DROP table if exists `errors`;


CREATE TABLE `errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CHANNEL` varchar(30) DEFAULT NULL,
  `DATA` varchar(1000) DEFAULT NULL,
  `ERROR` varchar(280) DEFAULT NULL,
  `exported` int(1) DEFAULT '0',
  `inserted_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
 `COMMENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
