library(readr)
db <- read_csv("~/Downloads/optdigits.tra", 
               col_names = FALSE)
View(db)

dim(db) #La base tiene 3823 registros y 65 varibales



#3)
install.packages("jpeg")
library(jpeg) #cargamos la librería
vector=db[14,] #tomamos la fila 14 por separadovector #visualizamos que la fila sigue siendo un data.frame con títulos decolumnas#visualice en la columna V65 qué número se va a dibuja
vector=vector[-65] #sacamos la columna V65 (variable a predecir – valor5)
vector=as.numeric(vector) #transformamos el data.frame a vectornumérico
vector #visualizamos que la fila ahora es un vector sin títulos decolumnas
vector=vector/16 #transformamos los valores de (1:16) a (0:1)
vector
imagen=array(vector,dim=c(8,8)) #creamos la imagen de 8x8
imagen=t(imagen) #rotamos la imagen
plot(as.raster(imagen))

#ver como cambiar de color, a que numero se vuelven los pixels


#4)

vector_1=db[61,] 
vector_1=vector_1[-65]
vector_1=as.numeric(vector_1) 
vector_1 
vector_1=vector_1/16 
vector_1
imagen_1=array(vector_1,dim=c(8,8)) 
imagen_1=t(imagen_1) 
plot(as.raster(imagen_1))

#5)

names(db)[names(db)=="X65"]="DigitoEscrito"
db$DigitoEscrito=as.factor(db$DigitoEscrito)


#6)
colors()
plot(db$DigitoEscrito, main = "Variables a predecir", col = "sienna4")
# hay una frecuencia similiar entre todas las opcionies de variables

#7)
DigitoEscritorio = summary(db$DigitoEscrito)

as.numeric(DigitoEscritorio)
range(DigitoEscritorio)
boxplot(DigitoEscritorio, horizontal = TRUE)


#CONJUNTOS


set.seed(61244)

particion = createDataPartition(y = db$DigitoEscrito, p = 0.75, list = FALSE)
entreno = db[particion,]
testeo = db[-particion,]



head(entreno[,1:5])
head(entreno[,61:65])
summary(entreno[,1:5])
summary(entreno[,61:65])
head(testeo[,1:5])
head(testeo[,61:65])
summary(testeo[,1:5])
summary(testeo[,61:65])

dim(entreno)
dim(testeo)

table(entreno$DigitoEscrito)
table(teste$DigitoEscrito)


#Arbol de decision
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
library(caret)

arbol = rpart(DigitoEscrito~., entreno, method = "class")

rpart.plot(arbol,extra=1,type=5,cex=0.7)

# la variable que abre el arbol de decision es la 37 y tiene 18 hojas (las conte pero talvez hay una froma mejor)

pred=predict(arbol,testeo,type="class")

head(pred, 8)
head(testeo$DigitoEscrito, 8)

# el 1, 2, 4,5, 6 coinciden el resto no (rechequear)

confusionMatrix(pred, testeo$DigitoEscrito)
#accuracy 75% 

#7)

