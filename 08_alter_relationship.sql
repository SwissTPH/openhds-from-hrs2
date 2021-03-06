ALTER TABLE relationship
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE relationship ADD INDEX IDX_RELIND (INDIVIDID);
ALTER TABLE relationship ADD INDEX IDX_RELIND2 (INDIVIDID2);

UPDATE relationship set TYPE='2' WHERE TYPE='MRT';

UPDATE relationship set EEVENTTYPE ='NA' WHERE EEVENTTYPE is null;
UPDATE relationship set EEVENTTYPE ='DTH' WHERE EEVENTTYPE ='WID';

UPDATE relationship r, individual i set r.INDIVIDID=i.INDIVIDID where r.INDIVIDID=i.OLD_INDIVIDID;
UPDATE relationship r, individual i set r.INDIVIDID2=i.INDIVIDID where r.INDIVIDID2=i.OLD_INDIVIDID;

SELECT id, str_to_date(DE_DATE,'%Y-%m-%d') DE_DATE, str_to_date(SDATE,'%Y-%m-%d') SDATE, INDIVIDID2, FIELDWORKER, INDIVIDID, TYPE FROM relationship WHERE processed_by_mirth =0 LIMIT 1;
