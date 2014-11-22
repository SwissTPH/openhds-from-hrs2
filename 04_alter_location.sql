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
  ADD subvillageId VARCHAR(3);

ALTER TABLE location
  ADD UNIQUE INDEX idx_locid (LOCATIONID);

UPDATE location set LOCATIONID=CONCAT(LEFT(LOCATIONID,3),'00',RIGHT(LOCATIONID,4));

update location set subvillageId='ISE' LIMIT 190;
update location set subvillageId='GTH' WHERE subvillageId IS NULL LIMIT 190;
update location set subvillageId='BCL' WHERE subvillageId IS NULL LIMIT 190;
update location set subvillageId='GND' WHERE subvillageId IS NULL LIMIT 192 ;

SELECT id, subvillageId , LOCATIONID, FIELDWORKER, 'RUR' LOCATION_TYPE, ACCURACY, ALTITUDE, LONGITUDE, LATITUDE FROM location WHERE processed_by_mirth =0;