ALTER TABLE socialgroup
  ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
  ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
  ADD id INT AUTO_INCREMENT NOT NULL,
  ADD OLD_SOCIALGPID VARCHAR(19),
  ADD PRIMARY KEY (id);

ALTER TABLE socialgroup ADD INDEX idx_sgid (SOCIALGPID);
ALTER TABLE socialgroup ADD INDEX idx_osgid (OLD_SOCIALGPID);
ALTER TABLE socialgroup ADD INDEX idx_headid (HEADID);

UPDATE socialgroup s, individual i set s.HEADID=i.INDIVIDID where s.HEADID=i.OLD_INDIVIDID;

UPDATE socialgroup set OLD_SOCIALGPID=SOCIALGPID;
UPDATE socialgroup set SOCIALGPID=CONCAT(LEFT(SOCIALGPID,3),'00',RIGHT(SOCIALGPID,6));

select id, str_to_date(DE_DATE,'%Y-%m-%d') DE_DATE , SOCIALGPID , FIELDWORKER , NAME, TYPE , HEADID  FROM socialgroup WHERE processed_by_mirth=0 LIMIT 1;
