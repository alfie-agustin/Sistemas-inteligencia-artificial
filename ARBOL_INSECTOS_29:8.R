library(mlbench)
library(caret)
library(rpart)
library(rpart.plot)
install.packages("mlbench")
data(Zoo)
dim(Zoo)
Zoo
Zoo = Zoo[-30,]

#Creamos arbol de decision para determinar las reglas 
#dato --> como el arbol es dependiente de train y test, despues vamos a ver bosques
Zoo$legs = factor(Zoo$legs) #para llevarla a categorica

summary(Zoo$legs)

Zoo[Zoo$legs == 5, ] # creacion filtro

set.seed(8)
particion = createDataPartition(y = Zoo$legs, p = 0.8, list = F)
entreno1 = Zoo[particion,]
testeo1 = Zoo[-particion,]
Arbol = rpart(legs~., entreno1, method = "class") #el metodo class es por claisificacion
rpart.plot(Arbol, type = 5, extra =1)
pred1 = predict(Arbol, testeo1, type = "class")
confusionMatrix(pred1, testeo1$legs) #hay que pasar a factor 
