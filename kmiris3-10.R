set.seed(123)

iris


base = iris

base$Species = NULL

km = kmeans(base, 3)

km$size
km$cluster
km$centers

attach(base)
plot(Petal.Length,Petal.Width,pch=19,col=km$cluster)
points(km$centers[,c("Petal.Length","Petal.Width")],pch=8,col=1:3,cex=5)

plot(Petal.Length,Petal.Width,col="white")
text(Petal.Length,Petal.Width,label=km$cluster,col=km$cluster)
points(km$centers[,c("Petal.Length","Petal.Width")],pch=8,col=1:3,cex=5)

km$withinss

sumawit = 39.82097+ 23.87947 +15.15100
sumawit

sum(km$withinss)
km$tot.withinss


km$betweenss+km$tot.withinss
km$totss


km #between/total = porcentaje separacion entre grupos queremos que sea el maximo


