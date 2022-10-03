library(MASS)
data("mammals")
base = mammals
dim(base)
fix(base)
base = base [-32,]
set.seed(8)

km = kmeans(base, 3)
km

names(km)

km$size #se intenta entender porque esta desblanaceada
names(base)
head(base)
plot(base)
plot(base, phc =19, col = km$cluster)
identify(base$body, base$brain, label = row.names(base))
points(km$centers, phc = 8, cex = 5, col = 1:5)

##################
#calculo dsitancais euclidiana entre datos ejemplo

a=c(3,2)

b=c(6,5)

base2=rbind(a,b)

base2
dist(base2)
#######################

library(caret)
featurePlot(base, y = as.factor(km$cluster), plot = 'boxplot', auto.key = TRUE)
##########################3
names(km)

km$withinss

km$tot.withinss

km$betweenss

km$betweenss+km$tot.withinss

km$totss


#lo mejor?? lo que esta aca abajo
# mayor betweens/totss
# menor tot.withinss/totss

