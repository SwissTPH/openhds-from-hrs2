ALTER TABLE individual
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE individual
 ADD FIRSTNAME VARCHAR(50),
 ADD MIDDLENAME VARCHAR(50) ,
 ADD LASTNAME VARCHAR(50) ,
 ADD approximate INT(1) DEFAULT 1;

update individual SET
 FIRSTNAME = SUBSTRING_INDEX(name, ' ', 1)
  ,MIDDLENAME = case when locate(" ",Ltrim(SUBSTRING(name, length(SUBSTRING_INDEX(name,'\ ', 1))+1)))=0 
then ''
else SUBSTRING_INDEX(Ltrim(SUBSTRING(name, length(SUBSTRING_INDEX(name,'\ ', 1))+1)), ' ', 1) end
  ,LASTNAME = case when locate(" ",Ltrim(SUBSTRING(name, length(SUBSTRING_INDEX(name,'\ ', 1))+1)))=0  
then Ltrim(SUBSTRING(name, length(SUBSTRING_INDEX(name,'\ ', 1))+1))
else SUBSTRING_INDEX(Ltrim(SUBSTRING(name, length(SUBSTRING_INDEX(name,'\ ', 1))+1)), ' ', -1) end;
 
update individual set LASTNAME='UNKNOWN' where length(LASTNAME) =0;

UPDATE individual SET MotherID='UNK' where MotherID='Q';
UPDATE individual SET FatherID='UNK' where FatherID ='Q';
UPDATE individual SET MotherID='UNK' where MotherID is null;
UPDATE individual SET FatherID ='UNK' where FatherID is null;


ALTER TABLE individual ADD INDEX idx_individid (INDIVIDID);

UPDATE individual set INDIVIDID=CONCAT(LEFT(INDIVIDID,3),'00',RIGHT(INDIVIDID,7)) ;

UPDATE individual set MOTHERID=CONCAT(LEFT(MOTHERID,3),'00',RIGHT(MOTHERID,7)) where length(MOTHERID)>6;

UPDATE individual set FATHERID=CONCAT(LEFT(FATHERID,3),'00',RIGHT(FATHERID,7)) where length(FATHERID)>6;


SELECT id, str_to_date(BIRTH_DATE,'%Y-%m-%d') BIRTH_DATE, FIRSTNAME,MIDDLENAME, MOTHERID, INDIVIDID,  GENDER, FIELDWORKER, LASTNAME, approximate, FATHERID 
FROM individual WHERE processed_by_mirth=0 order by BIRTH_DATE ASC;
