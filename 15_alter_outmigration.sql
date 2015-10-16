ALTER TABLE outmigration
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE outmigration ADD INDEX idx_omgind (INDIVIDID);
ALTER TABLE outmigration ADD INDEX idx_omgvis (OBSERVEID);

UPDATE outmigration o, individual i set o.INDIVIDID=i.INDIVIDID where o.INDIVIDID=i.OLD_INDIVIDID;
UPDATE outmigration m, observation o set m.OBSERVEID=o.OBSERVEID where m.OBSERVEID=o.OLD_OBSERVEID;

ALTER TABLE outmigration CHANGE OUTMGREASO REASON VARCHAR(99);


SELECT id, OBSERVEID, REGION_NAM, FIELDWORKER, str_to_date(DATE,'%Y-%m-%d') DATE, REASON, INDIVIDID FROM outmigration WHERE processed_by_mirth =0;



