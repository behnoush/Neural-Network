library(FNN)
train <- read.csv("train.csv")
digit<-matrix(as.integer(train[4932,2:785]), nrow = 28, byrow=T )
image(z = digit)