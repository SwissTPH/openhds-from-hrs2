ALTER TABLE residency
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE residency ADD INDEX idx_resind (INDIVIDID);
ALTER TABLE residency ADD INDEX idx_resloc (LOCATIONID);


UPDATE residency r, individual i set r.INDIVIDID=i.INDIVIDID where r.INDIVIDID=i.OLD_INDIVIDID;

UPDATE residency r, location l set r.LOCATIONID=l.LOCATIONID where r.LOCATIONID=l.OLD_LOCATIONID;
UPDATE residency set EEVENTTYPE='NA' where EEVENTTYPE is null;
UPDATE residency set EEVENTTYPE='OMG' where EEVENTTYPE ='EXT';
UPDATE residency set SEVENTTYPE='IMG' where SEVENTTYPE ='ENT';

SELECT id, str_to_date(DE_DATE,'%Y-%m-%d') DE_DATE, str_to_date(SDATE,'%Y-%m-%d') SDATE, FIELDWORKER, LOCATIONID,
INDIVIDID,SEVENTTYPE,EEVENTTYPE,str_to_date(EDATE,'%Y-%m-%d') EDATE FROM residency WHERE processed_by_mirth =0 order by SDATE asc;
