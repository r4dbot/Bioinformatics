#text1
r <- read.delim("test1.txt", sep = ",")

#text2
p<- read.csv("test2.txt",sep="$")

#text3
q<- read.table("test3.txt")

z<-data.table::fread("test1.txt")
x<-data.table::fread("test2.txt") #failed
y<-data.table::fread("test3.txt")

save(p,q,r,x,y,z, file = "test_save.RData")

rescale <- function(x) {
  rng <-range(x)
  (x - rng[1]) / (rng[2] - rng[1])
}



rescale <- function(x, na.rm=TRUE, plot=FALSE) {
  if(na.rm) {
    rng <-range(x, na.rm=TRUE)
  } else {
    rng <-range(x)
  }
  print("Hello")
  answer <- (x - rng[1]) / (rng[2] - rng[1])
  return(answer)
  print("is it me you are looking for?")
  if(plot) { 
    plot(answer, typ="b", lwd=4) 
  }
  print("I can see it in ...")
}

rescale(c(1,10,"string"))



## anaysis code

library(bio3d)
s1 <- read.pdb("4AKE") # kinase with drug
s2 <- read.pdb("1AKE") # kinase no drug
s3 <- read.pdb("1E4Y") # kinase with drug
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s1, chain="A", elety="CA")
s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b
plotb3(s1.b, sse=s1.chainA, typ="p", ylab="Bfactor") 
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor") 
plotb3(s3.b, sse=s3.chainA, typ="s", ylab="Bfactor")


#plot_pdb <- function()

both_na <- function(x, y) {
  sum( is.na(x) & is.na(y) )
}

x <- c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)

both_na(x, y2)

both_na2 <- function(x, y) {
  if(length(x) != length(y)) {
    stop("Input x and y should be the same length")
  }
  sum( is.na(x) & is.na(y) )
}

both_na2(x, y2)

both_na3 <- function(x, y) {
  if(length(x) != length(y)) {
    stop("Input x and y should be vectors of the same length")
  }
  
  na.in.both <- ( is.na(x) & is.na(y) )
  na.number <- sum(na.in.both)
  na.which <- which(na.in.both)
  message("Found ", na.number, " NA's at position(s):", 
          paste(na.which, collapse=", ") ) 
  
  return( list(number=na.number, which=na.which) )
}

both_na3(x, y1)


# Write a function grade() to determine an overall 
# grade from a vector of student homework 
# assignment scores dropping the lowest single 
# alignment score.


# student 1
s_1 <- c(100, 100, 100, 100, 100, 100, 100, 90)
# student 2
s_2 <- c(100, NA, 90, 90, 90, 90, 97, 80)

grade<- function(x,y){
  
  
}


