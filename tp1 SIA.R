#ejercicio 2


# el dataset tiene 45 variables; 27 attributes are non-numeric and nominal.
#                               15 attributes are boolean and take the values (NO SI).
#                               3 attributes are numeric and take natural numbers.

# 4)


library(readr)
base <- read_csv("~/Downloads/sponge.data", col_names = FALSE)
View(base)

dim(base)

# la base tiene 75 regiistros

#5)

tail(base[,37:45], 5)

#6) 
names(base)[names(base)=="X40"]="ColordelaEsponja"
names(base)[names(base)=="X43"]="AlojaCangrejo"


head(base[,37:45])

head(base)

#7)

base$ColordelaEsponja[base$ColordelaEsponja=="?"]="ROJO"
base$ColordelaEsponja[base$ColordelaEsponja=="OTROS"]="GRIS"

head(base[,37:45])

#8)

base$ColordelaEsponja=factor(base$ColordelaEsponja)
base$AlojaCangrejo=factor(base$AlojaCangrejo)

summary(base$ColordelaEsponja)
summary(base$AlojaCangrejo)

#9)

plot(base$ColordelaEsponja,main="Color de las esponjas", col = c("yellow", 'blue', "gray", "red"))




# CONJUNTOS

install.packages("caret")

library(caret)

set.seed(61244)
particion=createDataPartition(y=base$ColordelaEsponja,p=0.75,list=FALSE)

# warning massage: 
#In createDataPartition(y = base$ColordelaEsponja, p = 0.75, list = FALSE) :
# Some classes have a single record ( AZUL_O_ANARANJADO_INTENSOS ) and these will be selected for the sample

entreno=base[particion,]
testeo=base[-particion,]


entreno
testeo

table(base$ColordelaEsponja)
table(entreno$ColordelaEsponja) # quedo el 75% --> 76 * 0,75 = 58
table(testeo$ColordelaEsponja)  # quedo el 25% --> 18


