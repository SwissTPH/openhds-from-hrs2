ALTER TABLE inmigration
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE inmigration ADD INDEX idx_imgind (INDIVIDID);
ALTER TABLE inmigration ADD INDEX idx_imgvis (OBSERVEID);

ALTER TABLE inmigration CHANGE IMGREASON REASON VARCHAR(99);


update inmigration set REASON='OTHER' where REASON='6';

UPDATE inmigration m, individual i set m.INDIVIDID=i.INDIVIDID where m.INDIVIDID=i.OLD_INDIVIDID;
UPDATE inmigration m, observation o set m.OBSERVEID=o.OBSERVEID where m.OBSERVEID=o.OLD_OBSERVEID;



SELECT id, REASON, str_to_date(DATE,'%Y-%m-%d') DATE, INDIVIDID, REGION_NAM MOVED_FROM , OBSERVEID, INTERNAL, LOCATIONID, FIELDWORKER 
FROM inmigration where processed_by_mirth=0;




