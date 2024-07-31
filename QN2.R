library(RPostgres)
wrds <- dbConnect(Postgres(),
                  host='wrds-pgdata.wharton.upenn.edu',
                  port=9737,
                  dbname='wrds',
                  sslmode='require',
                  user='biaryal')

res<-dbSendQuery(wrds,"select coname, gvkey,year, total_curr, tdc1, age, gender from comp.anncomp
                 where year between '2000' and '2020'
                 and exchange= 'NYSE'
                 and datafmt= 'STD'
                 and consol= 'C' 
                 and indfmt='INDL'")
data<-dbFetch(res, n=-1)
dbClearResult(res)
data
