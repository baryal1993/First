

library(RPostgres)
wrds <- dbConnect(Postgres(),
                  host='wrds-pgdata.wharton.upenn.edu',
                  port=9737,
                  dbname='wrds',
                  sslmode='require',
                  user='biaryal')

res<-dbSendQuery(wrds,"select cikcode, boardid, annualreportdate, numberdirectors, genderratio, nationalitymix from boardex.boardex_na
                 where fyear between '2000' and '2020'")
data<-dbFetch(res, n=-1)
dbClearResult(res)
data
