library(RPostgres)
wrds <- dbConnect(Postgres(),
                  host='wrds-pgdata.wharton.upenn.edu',
                  port=9737,
                  dbname='wrds',
                  sslmode='require',
                  user='biaryal')

res<-dbSendQuery(wrds,"select a.conm, a.gvkey, a.INDFMT, a.fyear, a.revt, a.ni, a.at, a.dltt, a.teq,
            b.coname, b.gvkey, b.year, b.total_curr, b.tdc1, b.age, b.gender 
            from comp.funda a join execcomp.anncomp b
            on a.conm = b.coname
            and a.gvkey = b.gvkey
            and a.fyear = b.year
            where year between '2000' and '2020'
            and exchange= 'NYS'
            and datafmt= 'STD'
            and consol= 'C'
            and a.indfmt= 'INDL'")
data<-dbFetch(res, n=-1)
dbClearResult(res)
data
