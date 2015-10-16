ALTER TABLE indvstatus
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD PRIMARY KEY (id);

ALTER TABLE indvstatus ADD INDEX IDX_POBIND (INDIVIDID);

UPDATE indvstatus s, individual i set s.INDIVIDID=i.INDIVIDID where s.INDIVIDID=i.OLD_INDIVIDID;
UPDATE indvstatus s, observation o set s.OBSERVEID=o.OBSERVEID where s.OBSERVEID=o.OLD_OBSERVEID; 

SELECT id, OBSERVEID,DATE_ADD(str_to_date(DATE,'%Y-%m-%d'), INTERVAL 9- CAST(PREG_MONTH AS SIGNED) MONTH) EXPECTED_DELIVERY_DATE, FIELDWORKER,str_to_date(DATE,'%Y-%m-%d') DATE, INDIVIDID 
FROM indvstatus WHERE processed_by_mirth =0;

