install.packages('jpeg')

library(jpeg)

x = c(0,0,0,0,0)
x = rep(x, 20)
y = x
z = x

pizarra = cbind(x, y, z)

pizarra

writeJPEG(pizarra, "pizzarra.jpg")
plot(as.raster(pizarra))

# barras ton grises
x=rep(0,100)

y=rep(1,100)

z=c(rep(0.5,50),rep(0.7,50))

pizarra2=cbind(x,y,z)
plot(as.raster(pizarra2))

#Barrita verde

rojo=rep(0,100) #apagado

verde=rep(1,100) #prendido

azul=rep(0,100) #apagado

imagen=array(c(rojo,verde,azul),dim=c(100,1,3))

plot(as.raster(imagen))

#barra violeta

rojo=rep(1,100) 

verde=rep(0,100)

azul=rep(1,100)

imagen=array(c(rojo,verde,azul),dim=c(100,1,3))

plot(as.raster(imagen))


