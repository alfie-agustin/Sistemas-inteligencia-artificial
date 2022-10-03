library(jpeg)



imagen = readJPEG('C:\\Users\\agustin\\Desktop\\ITBA\\SIA\\pinguino.jpeg')


plot(as.raster(imagen))

imagen


rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
set.seed(123)
km=kmeans(base,7)
#Reconstruir la imagen segmentada
segmR=rojo
segmV=verde
segmA=azul



#segmR[km$cluster==1]=1
#segmV[km$cluster==1]=0
#segmA[km$cluster==1]=0

#segmR[km$cluster==2]=1
#segmV[km$cluster==2]=1
#segmA[km$cluster==2]=0

#segmR[km$cluster==3]=0
#segmV[km$cluster==3]=1
#segmA[km$cluster==3]=1



#segmR[km$cluster==4]=0
#segmV[km$cluster==4]=0
#segmA[km$cluster==4]=1

segmR[km$cluster==5]=1
segmV[km$cluster==5]=0
segmA[km$cluster==5]=1

#segmR[km$cluster==6]=1
#segmV[km$cluster==6]=0
#segmA[km$cluster==6]=1


#segmR[km$cluster==7]=1
#segmV[km$cluster==7]=1
#segmA[km$cluster==7]=1

segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
