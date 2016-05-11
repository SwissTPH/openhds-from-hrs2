ALTER TABLE  round
ADD FIELDWORKER VARCHAR(6) DEFAULT 'FWAD1',
ADD processed_by_mirth VARCHAR(1) DEFAULT '0',
ADD id INT AUTO_INCREMENT NOT NULL,
ADD PRIMARY KEY (id);

select id, ROUND_NUM, str_to_date(START_DATE,'%Y-%m-%d') START_DATE, str_to_date(END_DATE,'%Y-%m-%d') END_DATE, REMARKS  FROM round where processed_by_mirth=0 LIMIT 1;

