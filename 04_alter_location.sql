ALTER TABLE  location
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE  location
  ADD altitude CHAR(1) default '0',
  ADD latitude CHAR(1) default '0' ,
  ADD longitude CHAR(1) default '0' ,
  ADD accuracy CHAR(1) default '0' ,
  ADD subvillageId VARCHAR(3) ,
  ADD OLD_LOCATIONID VARCHAR(20);

ALTER TABLE location
  ADD UNIQUE INDEX idx_locid (LOCATIONID);

ALTER TABLE location
  ADD UNIQUE INDEX idx_olocid (OLD_LOCATIONID);

UPDATE location set OLD_LOCATIONID=LOCATIONID;

UPDATE location set LOCATIONID=CONCAT(LEFT(LOCATIONID,3),'00',RIGHT(LOCATIONID,4));

#TODO: here you need to assign the lowestLocationId to all your locations, e.g.:
#update location set lowestLocationId='ISE' WHERE OLD_LOCATIONID like "123%";

SELECT id, lowestLocationId , LOCATIONID, FIELDWORKER, 'RUR' LOCATION_TYPE, ACCURACY, ALTITUDE, LONGITUDE, LATITUDE FROM location WHERE processed_by_mirth =0;
