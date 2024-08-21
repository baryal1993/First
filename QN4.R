

library(RPostgres)
wrds <- dbConnect(Postgres(),
                  host='wrds-pgdata.wharton.upenn.edu',
                  port=9737,
                  dbname='wrds',
                  sslmode='require',
                  user='biaryal')

res<-dbSendQuery(wrds,"select cikcode, boardid, annualreportdate, numberdirectors, genderratio, nationalitymix 
                  from boardex.na_wrds_org_summary
                 where annualreportdate between '2000-01-01' and '2020-12-31' ")
data1<-dbFetch(res, n=-1)
dbClearResult(res)
data1
