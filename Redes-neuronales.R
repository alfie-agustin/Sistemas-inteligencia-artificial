#Redes Neuronales

####################################################################################

#red porcentajes


install.packages("NeuralNetTools")

library(nnet)
library(NeuralNetTools)

#crear una red neuronal para calcular el 10%

monto = c(200, 300, 550, 700)
porecentaje = c(20, 30, 55, 70)

bd = data.frame(monto, porecentaje)
bd

set.seed(7)

red = nnet(porecentaje ~ monto, bd, size = 0, maxit = 10000, linout = TRUE, skip = T)
#maxit = iteraciones
#nnet necesita size > 0, pero si se quiere size = 0 hay que poner skip = True sino no se pone el skip
# en la vida real no se usa skip
#linout = true es solo para regresion, si es calsificacion es False

caso = data.frame(monto = 200)
caso2= data.frame(monto = 652)
caso3= data.frame(monto = 65.2)
caso4= data.frame(monto = -65.2)


predict(red, caso) #da bien
predict(red, caso2) #da bien
predict(red, caso3) #da bien
predict(red, caso4) #da bien

plotnet(red)

####################################################################################


#red de cangrejos

library(caret)
library(MASS)
data(crabs)
crabs$index = NULL
crabs$sex = NULL
set.seed(123)
part = createDataPartition(crabs$sp, p = 0.7, list = F)
entreno = crabs[part,]
testeo = crabs[-part,]


#Arbol
library(rpart)
library(rpart.plot)
arbol = rpart(sp ~.,entreno, method = 'class')
pred = predict(arbol, testeo, type = 'class')
confusionMatrix(pred, testeo$sp)


#red
set.seed(123)
red2 = nnet(sp ~., entreno, size = 10, maxit = 10000)
predred = predict(red2, testeo, type = 'class')
dim(testeo)

confusionMatrix(factor(predred), testeo$sp)
plotnet(red2, max_sp = T)
