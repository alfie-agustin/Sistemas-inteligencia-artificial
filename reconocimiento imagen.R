imagen=readJPEG("C:/Users/agustin/Desktop/ITBA/SIA/cangrejo.jpg")

#2 grupos centroides

rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
set.seed(123)
km=kmeans(base,2)
#Reconstruir la imagen segmentada
segmR=rojo
segmV=verde
segmA=azul
segmR[km$cluster==1]=km$center[1,1]
segmV[km$cluster==1]=km$center[1,2]
segmA[km$cluster==1]=km$center[1,3]
segmR[km$cluster==2]=km$center[2,1]
segmV[km$cluster==2]=km$center[2,2]
segmA[km$cluster==2]=km$center[2,3]
segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada2g.jpg")

#3 grupos de cemtroides
imagen=readJPEG("C:/Users/agustin/Desktop/ITBA/SIA/cangrejo.jpg")
rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
set.seed(123)
km=kmeans(base,3)

segmR=rojo
segmV=verde
segmA=azul
segmR[km$cluster==1]=km$center[1,1]
segmV[km$cluster==1]=km$center[1,2]
segmA[km$cluster==1]=km$center[1,3]

segmR[km$cluster==2]=km$center[2,1]
segmV[km$cluster==2]=km$center[2,2]
segmA[km$cluster==2]=km$center[2,3]

segmR[km$cluster==3]=km$center[3,1]
segmV[km$cluster==3]=km$center[3,2]
segmA[km$cluster==3]=km$center[3,3]

segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada3g.jpg")

#segmentado 3 grupos de colores

rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
set.seed(123)
km=kmeans(base,3)

segmR=rojo
segmV=verde
segmA=azul
segmR[km$cluster==1]=1
segmV[km$cluster==1]=0
segmA[km$cluster==1]=0

segmR[km$cluster==2]=0
segmV[km$cluster==2]=1
segmA[km$cluster==2]=0

segmR[km$cluster==3]=0
segmV[km$cluster==3]=0
segmA[km$cluster==3]=1

segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada3g.jpg")



# si comentas distintas partes del cangrejo cambia el color, lo resaltado y a veces el color orignial de a partws
