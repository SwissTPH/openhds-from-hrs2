ALTER TABLE membership
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE membership ADD INDEX IDX_MEMIND (INDIVIDID);
ALTER TABLE membership ADD INDEX IDX_RELSGP (SOCIALGPID);


UPDATE membership set RLTN_HEAD='1' WHERE RLTN_HEAD IN ('HD','ONE');
UPDATE membership set RLTN_HEAD='2' WHERE RLTN_HEAD='WIF';
UPDATE membership set RLTN_HEAD='3' WHERE RLTN_HEAD='CHD';
UPDATE membership set RLTN_HEAD='4' WHERE RLTN_HEAD IN ('BRO','SIS');
UPDATE membership set RLTN_HEAD='5' WHERE RLTN_HEAD='PAR';
UPDATE membership set RLTN_HEAD='7' WHERE RLTN_HEAD='OTH';
UPDATE membership set RLTN_HEAD='8' WHERE RLTN_HEAD='GDP';
UPDATE membership set RLTN_HEAD='8' WHERE RLTN_HEAD='OT';
UPDATE membership set RLTN_HEAD='9' WHERE RLTN_HEAD='UNK';


UPDATE membership set EEVENTTYPE='OMG' WHERE EEVENTTYPE ='EXT';
UPDATE membership set EEVENTTYPE='NA' WHERE EEVENTTYPE IS NULL;

UPDATE membership set SEVENTTYPE='IMG' WHERE SEVENTTYPE ='ENT';

UPDATE membership m, socialgroup s set m.SOCIALGPID=s.SOCIALGPID where m.SOCIALGPID=s.OLD_SOCIALGPID;
UPDATE membership m, individual i set m.INDIVIDID=i.INDIVIDID where m.INDIVIDID=i.OLD_INDIVIDID;


SELECT id, str_to_date(DE_DATE,'%Y-%m-%d') DE_DATE, str_to_date(SDATE,'%Y-%m-%d') SDATE, FIELDWORKER, SOCIALGPID, RLTN_HEAD, INDIVIDID,SEVENTTYPE,EEVENTTYPE,str_to_date(EDATE,'%Y-%m-%d') EDATE 
FROM membership WHERE processed_by_mirth =0 order by SDATE asc;
