#!/usr/bin/Rscript
library(foreign)

library(RMySQL)
mydb = dbConnect(MySQL(), user='data', password='data', dbname='hrs_mysql_db', host='localhost')

tables<-c("birth", "death", "individual", "indvstatus", "inmigration", "location", "membership", "observation", "outmigration", "pregoutcome", "relationship", "residency", "round", "socialgroup")


for (table in tables) {
  tmp<-read.dbf(paste("dbf_files/", table, ".dbf", sep=''))
  dbWriteTable(mydb , value = tmp, name = table, append = TRUE, row.names = F )
}


