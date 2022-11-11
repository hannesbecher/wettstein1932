
dat <- read.table("~/temp/wettstein_polypl.csv",
                  sep="\t",
                  header=T
                  )
head(dat)
plot(y ~ x,
     data=dat,
     pch=as.numeric(as.factor(dat$Taxon)),
     type="n",
     log="y")
c<-1
for(i in levels(as.factor(dat$Taxon))){
  lines(dat[dat$Taxon==i,2:3],
        col=c,
        lwd=2)
  c <- c+1
  
  }
legend("bottomright",
       col=1:length( levels(as.factor(dat$Taxon))),
       legend=levels(as.factor(dat$Taxon)),
       lwd=2
       )
