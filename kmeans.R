mtcars


dim(mtcars)


#kmeans --> aprendizaje no supuervisado, clustering

set.seed(123)

km = kmeans(mtcars, 5)

names(km)

km$size # --> cantidad de rregistros por grupo

km$cluster

nueva = data.frame(mtcars, km$cluster)

write.table(nueva, 'autos.csv', sep = ',')

km$centers #--> centroides, hay un centroide por grupo y se usa para explicar los grupos


attach(mtcars) #para no especificar en los graficos que se usa la base seleccionada, no se actualiza instantaneamente, hay que attachar las ultimas version

plot(mpg, wt)

#filtar elementos grupo 1


names(km)
km$cluster
mtcars[km$cluster ==1,]

#centroide del grupo 1


km$centers #categorizacion base
apply(mtcars[km$cluster ==1, ], 2, mean) #centroide de cada variable

plot(mpg, wt, pch = 19, col = km$cluster)


points(km$centers[,c("mpg","wt")],pch=8,cex=5,col=1:5)

library(caret)
xyplot(wt~mpg,mtcars,groups=km$cluster,auto.key=T,pch=19)

boxplot(mtcars$mpg~km$cluster) #ayuda a caracterizar a los clsuters

featurePlot(mtcars,y=as.factor(km$cluster),plot="boxplot",auto.key=TRUE) #convine normalizar para ver mejor

featurePlot(mtcars,y=as.factor(km$cluster),plot="pairs",auto.key=TRUE)

