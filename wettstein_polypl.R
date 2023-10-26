
dat <- read.table("~/git_repos/wettstein1932//wettstein_polypl.csv",
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


dat2 <- dat[!(dat$Taxon %in% c("PiHy", "PhHy")),]


head(dat2)
lm01 <- lm(y ~ x + Taxon,
           data=dat2)
summary(lm01)
par(mfrow=c(2,2))
par(mfrow=c(1,1))
plot(lm01)
lm02 <- lm(log(y) ~ x + Taxon,
           data=dat2)
summary(lm02)
plot(lm02)

lm03 <- lm(log(y) ~ x * Taxon,
           data=dat2)
summary(lm03)
plot(lm03)
table(dat2$Taxon)

plot(y~x,
     log="y",
     data=dat2,
     col=factor(dat2$Taxon))
dat2[which.max(dat2$y),]
dat2 <- dat2[-which.max(dat2$y),]
plot(y~x,
     log="y",
     data=dat2,
     col=factor(dat2$Taxon))
