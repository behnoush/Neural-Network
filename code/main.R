
library("kohonen")

set.seed(7)
pen.som <- som(data = pend.sc, grid = somgrid(4, 4, "rectangular"), rlen = 100,
                   alpha = c(0.05, 0.01), radius = 3, 
                   toroidal = FALSE, keep.data = TRUE)
barplot(table(pen.som$unit.classif, pendigits$V17), main="distribution of digits", ylim=range(c(1:800)), xlab = "digits", ylab="counts")
barplot(table(pendigits$V17, pen.som$unit.classif), main="distribution of clusters", ylim=range(c(1:800)), xlab="clusters", ylab="counts")

pen.som <- som(data = pend.sc, grid = somgrid(5, 5, "rectangular"), rlen = 100,
                   alpha = c(0.05, 0.01), radius = 3, 
                   toroidal = FALSE, keep.data = TRUE)
barplot(table(pen.som$unit.classif, pendigits$V17), main="distribution of digits", ylim=range(c(1:800)),xlab = "digits", ylab="counts")
barplot(table(pendigits$V17, pen.som$unit.classif), main="distribution of clusters", ylim=range(c(1:800)),xlab = "clusters", ylab="counts")

pen.som <- som(data = pend.sc, grid = somgrid(4, 6, "rectangular"), rlen = 100,
                   alpha = c(0.05, 0.01), radius = 3, 
                   toroidal = FALSE, keep.data = TRUE)

pen.som <- som(data = pend.sc, grid = somgrid(15, 1, "rectangular"), rlen = 100,
                   alpha = c(0.05, 0.01), radius = 3, 
                   toroidal = FALSE, keep.data = TRUE)

plot(pen.som, type="mapping", 
     labels = pend.sc.classes, col = pend.sc.classes+1,
     main = "mapping plot")
plot(pen.som, type = "changes") #mean distances at each iteration
plot(pen.som, type = "counts" )
plot(pen.som, type = "quality", main="quality of clusters" )
plot(pen.som, type = "dist.neighbours" )
plot(pen.som, type="codes", main = "weights")
plot(pen.som, type = "property", property = pen.som$codes,
     main = colnames(pen.som$codes)[1])
## Another way to show clustering information
plot(pen.som, type="dist.neighbours", main = "SOM neighbour distances")
## use hierarchical clustering to cluster the codebook vectors
som.hc <- cutree(hclust(dist(pen.som$codes)), 5)
add.cluster.boundaries(pen.som, som.hc)



tab <-table(pendigits$V17, pen.som$unit.classif)
plot(tab[,25], type="b", cex=.6, xlab="digit", ylab="count", main="digits distribution in cluster #25", col="red")