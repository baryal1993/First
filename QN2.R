library(RPostgres)
wrds <- dbConnect(Postgres(),
                  host='wrds-pgdata.wharton.upenn.edu',
                  port=9737,
                  dbname='wrds',
                  sslmode='require',
                  user='biaryal')

res<-dbSendQuery(wrds,"select coname, gvkey, year, total_curr, tdc1, age, gender 
                 from execcomp.anncomp
                 where year between '2000' and '2020'
                 and exchange= 'NYS'
                 and ceoann= 'CEO'")
data<-dbFetch(res, n=-1)
dbClearResult(res)
data
