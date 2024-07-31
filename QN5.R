library(RPostgres)
wrds <- dbConnect(Postgres(),
                  host='wrds-pgdata.wharton.upenn.edu',
                  port=9737,
                  dbname='wrds',
                  sslmode='require',
                  user='biaryal')

res<-dbSendQuery(wrds,"select coname, gvkey,INDFMT, fyear, revt,ni, at, dltt, teq from comp.funda
select coname, gvkey,year, total_curr, tdc1, age, gender from comp.anncomp

select cikcode, boardid, annualreportdate, numberdirectors, genderratio, nationalitymix from boardex.boardex_na

                 where year between '2000' and '2020'
                 and exchange= 'NYSE'
                 and datafmt= 'STD'
                 and consol= 'C'")
data<-dbFetch(res, n=-1)
dbClearResult(res)
data

