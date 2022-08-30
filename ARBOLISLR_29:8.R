library(rpart)
library(rpart.plot)
install.packages('ISLR')
library(ISLR)
library(caret)
data(Default)
head(Default)
dim(Default)
fix(Default)
summary(Default$default)


set.seed(8)
particion = createDataPartition(y = Default$default, p = 0.8, list = FALSE)
entreno = Default[particion,]
testeo = Default[-particion,]
dim(entreno)
arbolTarjetas = rpart(default~., entreno, method = "class")
rpart.plot(arbolTarjetas, type = 5, extra =1)
pred = predict(arbolTarjetas, testeo, type = "class")
confusionMatrix(pred, testeo$default ) #predice mal, hay mucho falso negativo 


#FORMULA ENTROPIA

# ENTROPIA (X) = - PROB(X1)*LOG2(X1) - PROB(X2)*LOG2(PROB(X2))



