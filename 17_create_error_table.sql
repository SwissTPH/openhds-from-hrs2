DROP table if exists `errors`;
CREATE TABLE `errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CHANNEL` varchar(30) DEFAULT NULL,
  `DATA` varchar(500) DEFAULT NULL,
  `ERROR` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;





