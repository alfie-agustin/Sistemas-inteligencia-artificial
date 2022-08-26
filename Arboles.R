library(MASS)
library(rpart)
library(caret)
install.packages("rpart.plot")
library(rpart.plot)


base = crabs

base

dim(crabs)
summary(crabs$sp)

set.seed(8)

particion=createDataPartition(y=crabs$sp,p=0.8,list=FALSE)

entreno=crabs[particion,]

testeo=crabs[-particion,]


summary(crabs$sp)
summary(entreno$sp)
summary(testeo$sp)

cangrejo=crabs[35,]
entreno["35",] 
arbol=rpart(sp~FL+RW+CL+CW+BD,entreno,method="class")
rpart.plot(arbol,extra=1,type=5)

pred=predict(arbol,cangrejo,type="class") #

CangrejoNuevo = data.frame(FL=17,RW=15,CL=40,CW=25,BD=11) 
predict(arbol,CangrejoNuevo,type="class")


predtesteo = predict(arbol, testeo, type = "class")

testeo 
predtesteo 

confusionMatrix(predtesteo, testeo$sp) 
