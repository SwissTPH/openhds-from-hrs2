ALTER TABLE pregoutcome
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE pregoutcome ADD INDEX idx_proind (INDIVIDID);
ALTER TABLE pregoutcome ADD INDEX idx_provis (OBSERVEID);

UPDATE pregoutcome set FATHERID='UNK' where FATHERID='Q';

UPDATE pregoutcome p, individual i set p.INDIVIDID=i.INDIVIDID where p.INDIVIDID=i.OLD_INDIVIDID;
UPDATE pregoutcome p, individual f set p.FATHERID=f.INDIVIDID where p.FATHERID=f.OLD_INDIVIDID;

UPDATE pregoutcome p, observation o set p.OBSERVEID=o.OBSERVEID where p.OBSERVEID=o.OLD_OBSERVEID;

SELECT id, OBSERVEID, INDIVIDID, 1 PARTIAL_DATE,FIELDWORKER,str_to_date(DATE,'%Y-%m-%d') DATE, FATHERID FROM pregoutcome WHERE processed_by_mirth =0 LIMIT 1;


