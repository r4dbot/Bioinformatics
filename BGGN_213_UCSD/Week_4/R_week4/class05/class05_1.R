plot(1:5,pch=1:5,cex=1:5)

plot( c(1:10)^2, typ="b", lwd=4, lty=3 ) 
plot( c(1:10)^2, typ="b", lwd=4, lty=1 ) 
plot( c(1:10)^2, typ="b", lwd=4, lty=2 ) 
plot( c(1:10)^2, typ="l", lwd=4, lty=1 ) 
plot( c(1:10)^2, typ="p", lwd=4, lty=1 ) 

barplot(VADeaths, beside = TRUE,  horiz=TRUE)


old.par <- par()$mar
par(mar=c(4,11,2,1))
par(mar=old.par)

par( mar=c(2, 10, 10, 1) ) 
 

par( mar=c(2, 10, 1, 1) )
